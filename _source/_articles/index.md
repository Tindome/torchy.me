---
layout: page
fb_comments: 3
title: Liste des Articles
---

[//]: # "Comment never show"
<!--- Comment for HTML -->

<small>*l'ordre des articles n'est pas respecté*</small>

- Pas d'articles pour le moment

{% for articles in site.data['page_collections']['articles'].pages %}
a
<li>{{articles.title}}<a href="{{articles.url}}" class="pull-right" data-toggle="tooltip" data-placement="left" title="" data-original-title="{{articles.url}}">visit</a></li>
{% endfor %}
a
{{site.data['page_collections']}}
