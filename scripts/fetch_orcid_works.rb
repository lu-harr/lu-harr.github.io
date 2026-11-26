#!/usr/bin/env ruby

require "json"
require "fileutils"
require "net/http"
require "time"
require "uri"

orcid_id = "0000-0002-0590-1444"
uri = URI("https://pub.orcid.org/v3.0/#{orcid_id}/works")
request = Net::HTTP::Get.new(uri)
request["Accept"] = "application/json"
request["User-Agent"] = "lu-harr.github.io ORCID publications importer"

response = Net::HTTP.start(uri.host, uri.port, use_ssl: true, open_timeout: 10, read_timeout: 30) do |http|
  http.request(request)
end
abort "ORCID API returned HTTP #{response.code}: #{response.message}" unless response.is_a?(Net::HTTPSuccess)

payload = JSON.parse(response.body)
abort "ORCID response did not contain a work list." unless payload.key?("group")
groups = payload.fetch("group")
works = groups.filter_map do |group|
  summaries = group.fetch("work-summary", [])
  summary = summaries.max_by { |item| item.dig("publication-date", "year", "value").to_i }
  next unless summary

  title = summary.dig("title", "title", "value")
  next if title.nil? || title.empty?

  date = summary["publication-date"] || {}
  year = date.dig("year", "value")
  doi = summary.dig("external-ids", "external-id")&.find do |external_id|
    external_id["external-id-type"] == "doi"
  end&.dig("external-id-value")
  url = summary.dig("url", "value")
  url = "https://doi.org/#{doi}" if (url.nil? || url.empty?) && doi && !doi.empty?

  {
    "title" => title,
    "year" => year,
    "type" => summary["type"],
    "journal" => summary.dig("journal-title", "value"),
    "url" => url,
    "put_code" => summary["put-code"]
  }.compact
end

FileUtils.mkdir_p("_data")
File.write("_data/orcid_works.json", JSON.pretty_generate(works) + "\n")
puts "Fetched #{works.length} public works from ORCID."
