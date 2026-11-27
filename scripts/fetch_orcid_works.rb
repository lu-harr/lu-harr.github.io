#!/usr/bin/env ruby

require "json"
require "fileutils"
require "net/http"
require "time"
require "uri"

orcid_id = "0000-0002-0590-1444"
equal_contribution_doi = "10.1371/journal.pgph.0004717"
surname_particles = %w[al ap da das de del della den der di dos du la le van von].freeze
client_id = ENV["ORCID_CLIENT_ID"]
client_secret = ENV["ORCID_CLIENT_SECRET"]
abort "Set ORCID_CLIENT_ID and ORCID_CLIENT_SECRET as GitHub Actions secrets." if client_id.to_s.empty? || client_secret.to_s.empty?

token_uri = URI("https://orcid.org/oauth/token")
token_request = Net::HTTP::Post.new(token_uri)
token_request["Accept"] = "application/json"
token_request["Content-Type"] = "application/x-www-form-urlencoded"
token_request["User-Agent"] = "lu-harr.github.io ORCID publications importer"
token_request.body = URI.encode_www_form(
  "client_id" => client_id,
  "client_secret" => client_secret,
  "grant_type" => "client_credentials",
  "scope" => "/read-public"
)

token_response = Net::HTTP.start(token_uri.host, token_uri.port, use_ssl: true, open_timeout: 10, read_timeout: 30) do |http|
  http.request(token_request)
end
abort "ORCID token request returned HTTP #{token_response.code}: #{token_response.message}" unless token_response.is_a?(Net::HTTPSuccess)
access_token = JSON.parse(token_response.body).fetch("access_token")

uri = URI("https://pub.orcid.org/v3.0/#{orcid_id}/works")
request = Net::HTTP::Get.new(uri)
request["Accept"] = "application/json"
request["Authorization"] = "Bearer #{access_token}"
request["User-Agent"] = "lu-harr.github.io ORCID publications importer"

response = Net::HTTP.start(uri.host, uri.port, use_ssl: true, open_timeout: 10, read_timeout: 30) do |http|
  http.request(request)
end
abort "ORCID works request returned HTTP #{response.code}: #{response.message}" unless response.is_a?(Net::HTTPSuccess)

payload = JSON.parse(response.body)
abort "ORCID response did not contain a work list." unless payload.key?("group")
groups = payload.fetch("group")
selected_works = groups.filter_map do |group|
  work_summaries = group.fetch("work-summary", [])
  summary = work_summaries.max_by { |item| item.dig("publication-date", "year", "value").to_i }
  next unless summary

  title = summary.dig("title", "title", "value")
  next if title.nil? || title.empty?

  date = summary["publication-date"] || {}
  year = date.dig("year", "value")
  doi = summary.dig("external-ids", "external-id")&.find do |external_id|
    external_id["external-id-type"] == "doi"
  end&.dig("external-id-value")
  doi = doi&.downcase
  url = summary.dig("url", "value")
  url = "https://doi.org/#{doi}" if (url.nil? || url.empty?) && doi && !doi.empty?
  month = date.dig("month", "value").to_i
  day = date.dig("day", "value").to_i
  sort_date = year ? format("%04d-%02d-%02d", year.to_i, month, day) : "0000-00-00"

  {
    "title" => title,
    "year" => year,
    "sort_date" => sort_date,
    "type" => summary["type"],
    "journal" => summary.dig("journal-title", "value"),
    "doi" => doi,
    "url" => url,
    "put_code" => summary["put-code"]
  }.compact
end

works = selected_works.map do |summary|
  detail_uri = URI("https://pub.orcid.org/v3.0/#{orcid_id}/work/#{summary.fetch("put_code")}")
  detail_request = Net::HTTP::Get.new(detail_uri)
  detail_request["Accept"] = "application/json"
  detail_request["Authorization"] = "Bearer #{access_token}"
  detail_request["User-Agent"] = "lu-harr.github.io ORCID publications importer"

  detail_response = Net::HTTP.start(detail_uri.host, detail_uri.port, use_ssl: true, open_timeout: 10, read_timeout: 30) do |http|
    http.request(detail_request)
  end
  abort "ORCID work #{summary.fetch("put_code")} returned HTTP #{detail_response.code}: #{detail_response.message}" unless detail_response.is_a?(Net::HTTPSuccess)

  detail = JSON.parse(detail_response.body)
  authors = detail.dig("contributors", "contributor").to_a.filter_map do |contributor|
    credit_name = contributor.dig("credit-name", "value")
    next if credit_name.nil? || credit_name.empty?

    orcid_uri = contributor.dig("contributor-orcid", "uri").to_s
    is_self = orcid_uri.end_with?(orcid_id) || credit_name.match?(/\bLucinda\b.*\bHarrison\b|\bHarrison\b.*\bLucinda\b/i)
    is_group = credit_name.match?(/\b(study group|consortium|collaboration|working group|network)\b/i)
    if is_group
      initials = credit_name
    else
      if credit_name.include?(",")
        surname, given_names_text = credit_name.split(",", 2).map(&:strip)
        given_names = given_names_text.split(/\s+/)
      else
        parts = credit_name.strip.split(/\s+/)
        surname_start = parts.length - 1
        while surname_start > 1 && surname_particles.include?(parts[surname_start - 1].downcase)
          surname_start -= 1
        end
        surname = parts[surname_start..].join(" ")
        given_names = parts[0...surname_start]
      end
      initials = given_names.empty? ? credit_name : "#{given_names.map { |part| part.scan(/[[:alpha:]]/).first }.compact.join(" ")} #{surname}"
    end

    is_gupta = initials.match?(/\bGupta\b/i)
    equal_contribution = summary["doi"] == equal_contribution_doi && (is_self || is_gupta)
    { "name" => initials, "is_self" => is_self, "equal_contribution" => equal_contribution }
  end

  preprint = summary["type"].to_s.match?(/preprint/i) || summary["journal"].to_s.match?(/medrxiv|biorxiv|arxiv|preprint/i)
  first_author = authors.first&.fetch("is_self", false) || false
  first_author = true if summary["doi"] == equal_contribution_doi
  summary.merge("authors" => authors, "first_author" => first_author, "preprint" => preprint)
end

FileUtils.mkdir_p("_data")
File.write("_data/orcid_works.json", JSON.pretty_generate(works) + "\n")
puts "Fetched #{works.length} public works from ORCID."
