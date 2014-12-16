---
layout: post
title: "Astuce Jekyll image dépendantes du contexte"
categories: jekyll atuces
date: 2014-07-17
disqus_comments: true
social_share: true
published: true
---

<p class="lead">
Comment éviter de dupliquer du code pour afficher une image différente en fonction des contenus des billets, articles...
</p>

Plus je l'utilise et plus j'aime [jekyll][1]
J'avais besoin sur ce blog de mettre une icono différente pour accéder sur chaque page à un repertoire github, cependant le texte sur le logo devait changer :

  * si c'était un tutoriel je voulais mettre le tuto Github
  * si c'était un projet je voulais mettre le projet Github

J'ai commencé par créer mes deux images et les nommer avec un prefix différent

 * tuto-github.gif : ![image pour le tutoriel]({{site.url}}/assets/img/tuto-github.gif)
 * proj-github.gif : ![image pour le projet]({{site.url}}/assets/img/proj-github.gif)

j'ai ensuite créé un fichier gogithub.plug.html qui contient le code pour afficher l'image qui me convenait, puis j'ai ajouté deux paramètres
   * link : pour le lien
   * prefix : pour le prefix de l'image à utiliser
{% highlight html %}
<!-- gogithub_plug.html -->
<style>
  #gogithub {
  position: relative;
  right: -58px;
  top: -185px;
  margin: 0;
  padding: 0;
  z-index: 2;
  float: right;
  }
</style>
<a href="{{include.link}}" target="_blank" id="gogithub">
  ![](/assets/img/{% raw %}{{include.prefix}}{% endraw %}-github.gif)
</a>
<!-- /gogithub_plug.html -->
{% endhighlight %}

il ne vous reste plus qu'à intégrer dans votre article ou votre gabarit le code suivant

{% highlight html %}
...
{% raw %}
{% include gogithub_plug.html prefix="proj" link="https://github.com/Tindome/sage30_bi " %}
{% endraw %}
....
{% endhighlight %}

<div class="doc-callout doc-callout-info">
Astuce : <br/>
j'ai pris l'habitude de mettre un commentaire au début et à la fin de chacun de mes gabarits sur jekyll ç'est utile quand vous avez des gabarits en cascades (gabarits qui appelent d'autres gabarits) pour débugger
</div>


[1]: http://jekyllrb.com/  "Aller sur le site web de jekyll"
