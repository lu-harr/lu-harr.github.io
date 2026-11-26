---
permalink: /publications_test/
title: Publications
toc: true
publication_links:
  "10.64898/2026.03.03.26347488":
    - label: Companion RShiny app
      url: https://iddo-marcse-models.share.connect.posit.cloud
  "10.1371/journal.pgph.0004717":
    - label: Companion RShiny app
      url: https://iddo.shinyapps.io/pf_drug_resistance/
  "10.1098/rsos.230641":
    - label: Companion Shiny app
      url: http://lucyharrison.shinyapps.io/pk_multicrit_shiny/
  "10.1371/journal.pntd.0011570":
    - label: Companion interactive dashboard
      url: https://019f600f-482a-3ea7-f415-6f5bcf66d6ce.share.connect.posit.cloud/
---

{% assign works = site.data.orcid_works %}
{% if works and works.size > 0 %}

{% assign first_author_works = works | where: "first_author", true | sort: "sort_date" | reverse %}
{% assign other_works = works | where: "first_author", false | sort: "sort_date" | reverse %}

{% if first_author_works.size > 0 %}
## First-author publications

{% include orcid_publication_list.html works=first_author_works %}
{% endif %}

{% if other_works.size > 0 %}
## Other publications

{% include orcid_publication_list.html works=other_works %}
{% endif %}

{% else %}

No ORCID works are available in the site data yet. The ORCID fetch runs during the GitHub Pages build.

{% endif %}
