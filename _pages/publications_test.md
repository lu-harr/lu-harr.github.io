---
permalink: /publications_test/
title: Publications (ORCID test)
toc: true
---

This page lists public works from [my ORCID record](https://orcid.org/0000-0002-0590-1444). The list is refreshed when the site is built.

{% assign works = site.data.orcid_works %}
{% if works and works.size > 0 %}

{% assign sorted_works = works | sort: "year" | reverse %}
{% assign last_year = "" %}
{% for work in sorted_works %}
  {% assign year = work.year | default: "Date unknown" %}
  {% if year != last_year %}
    {% unless forloop.first %}</ul>{% endunless %}

## {{ year }}

<ul>
    {% assign last_year = year %}
  {% endif %}
  <li>
    {% if work.url %}<a href="{{ work.url | escape }}">{{ work.title | escape }}</a>{% else %}{{ work.title | escape }}{% endif %}
    {% if work.authors and work.authors.size > 0 %}<br>
      {% for author in work.authors limit:10 %}{% if author.is_self %}<strong>{{ author.name | escape }}</strong>{% else %}{{ author.name | escape }}{% endif %}{% unless forloop.last %}, {% endunless %}{% endfor %}{% if work.authors.size > 10 %}, et al.{% endif %}
    {% endif %}
    {% if work.year %} ({{ work.year }}){% endif %}{% if work.journal %}. <em>{{ work.journal | escape }}</em>{% endif %}{% if work.type %}.{% endif %}
  </li>
{% endfor %}
</ul>

{% else %}

No ORCID works are available in the site data yet. The ORCID fetch runs during the GitHub Pages build.

{% endif %}
