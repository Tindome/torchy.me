---
layout: post
title: "Enquire.js ou comment optimiser les media queries"
date: 2014-07-18
disqus_comments: true
social_share: true
categories: javascript
description: Les media queries ont la fâcheuse tendance à alourdir nos pages web, voici une solution efficace.
published: true
---


<p class="lead">
J'ai une page qui utilise impress.js pour présenter des éléments. Je n'ai qu'un soucis, si la zone d'affichage est trop petite (en hauteur), je dois revoir chacun de mes "slide" et changer les polices...<br />
Pour corriger cela je suis passé par les media queries. Mais je me heurte à un nouveau probleme, le code de ma page s'est lourdement allongé ; en effet, je dois désormais prendre en compte
les 3 navigateurs et les mobiles.
Il faudrait ne charger que les css utiles à l'affichage de la page. J'ai trouvé la solution un peu par hasard : <a title="Aller sur le site de Enquire" href="http://wicky.nillia.ms/enquire.js">enquire.js</a>
</p>



## Intégrer le code javascript dans la page

Pour charger dynamiquement le CSS, je vais utiliser [yesnope][3]

{% highlight html %}
...
<script src="/assets/vendor/enquire/js/enquire.min.js" type="text/javascript"></script>
<script src="/assets/vendor/requireJS/js/require.min.js" type="text/javascript"></script>
<script src="/assets/vendor/yepnope/js/yepnope.min.js" type="text/javascript"></script>
....
{% endhighlight %}

<div class="doc-callout doc-callout-warning">
Attention, vraissemblablement si on utilise <a title="Aller sur le site de RequireJS" href="http://requirejs.org">RequireJs</a>
et <a title="Aller sur le site de Enquire" href="http://wicky.nillia.ms/enquire.js">enquire</a> il faut penser à charger <a title="Aller sur le site de Enquire" href="http://wicky.nillia.ms/enquire.js">enquire</a> avant <a title="Aller sur le site de RequireJS" href="http://requirejs.org">RequireJs</a>
 sinon <a title="Aller sur le site de Enquire" href="http://wicky.nillia.ms/enquire.js">enquire</a> renvoie une erreur
</div>

## Ajouter le code javascript


{% highlight html %}
<script type="text/javascript">
enquire.register("screen and (min-height:650px)", function() {
  yepnope.injectCss("/assets/css/slide_h650px.css", function () {
    console.log("css injected!"); /* debug */
    }, {}, 5000);
});
</script>
{% endhighlight %}

## Conclusion

Si votre écran à une hauteur minimum de 650px la feuille de style va s'ajouter aux styles de la page, on peut faire des choses plus complexes encore, je vous laisse consulter le site de l'auteur [enquire.js][2] pour en savoir plus


[1]: http://requirejs.org  "Aller sur le site de RequireJS"
[2]: http://wicky.nillia.ms/enquire.js "Aller sur le site de Enquire"
[3]: http://yepnopejs.com/ "Aller sur le site de yesnope"
