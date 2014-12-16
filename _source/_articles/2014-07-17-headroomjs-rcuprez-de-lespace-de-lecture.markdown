---
layout: post
title: "Headroom.js récupérez de l'espace de lecture"
date: "2014-07-17"
disqus_comments: true
social_share: true
categories: javascript
published: true
article:
  written_on: 2014-07-17
  updated_on:
---


<p class="lead">
Le bandeau haut c'est bien en terme de navigation mais c'est de la place de perdue pour la lecture d'une page.
</p>

Que faire, plusieurs solutions s'offrent à nous (pour plus d'information je vous renvoie à la newsletter de [Smashing Magazine](http://www.smashingmagazine.com/smashing-newsletter-issue-113/#a1) de ce mois)
 , j'ai personnellement choisi d'utiliser [headroom.js][1] qui me semblait la plus simple à mettre en oeuvre.

Les informations qui vont suivre sont données dans le contexte suivant

* Utilisation de [Jekyll][2]
* Utilisation de [Bootstrap][3]

## Dans mon fichier html de gabarit général

Pour être certain que notre fichier de script headroom.min.js soit bien chargé avant de lancer le traitement, on va créer une sorte d'include en javascript.<br />
J'ai commencé par essayer avec [RequireJS][4] mais mon usage était bien plus simple que celui prévu pour [RequireJS][4], aussi je suis parti des éléments trouvé sur les deux pages qui suivent

* [source](https://stackoverflow.com/questions/950087/how-to-include-a-javascript-file-in-another-javascript-file)
* [source](http://sametmax.com/include-require-import-en-javascript/)

<div class="doc-callout doc-callout-info">
J'aime bien utiliser les include de Jekyll donc personnellement j'ai crée un include rien que pour ce bout de code, ce qui me permet en outre de créer un ensemble de composant pour mes sites web
</div>

{% highlight html %}
<script type="text/javascript">
function loadScript(url, callback){
    // Adding the script tag to the head as suggested before
    var head = document.getElementsByTagName('head')[0];
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = url;

    // Then bind the event to the callback function.
    // There are several events for cross browser compatibility.
    script.onreadystatechange = callback;
    script.onload = callback;

    // Fire the loading
    head.appendChild(script);}
</script>
{% endhighlight %}

##Dans mon fichier html de gabarit de menu haut
on retrouve les élements suivants : le code html de la barre de navigation, et la partie de code javascript
 qui va charger la librairie javascript headroom.min.js ainsi que la fonction a lancer dès que le code sera executé


{% highlight html %}
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation" id="nav">
  <div class="container">
    <div class="navbar-header">

    ....
    </div>
  </div>  
</div>

<script type="text/javascript">
var headroom_start = function() {
  // grab an element
  var myElement = document.querySelector("#nav");
  // construct an instance of Headroom, passing the element
  var headroom  = new Headroom(myElement);
  // initialise
  headroom.init();
}

loadScript("/assets/vendor/headroom/headroom.min.js", headroom_start);
{% endhighlight %}

##Dans un fichier CSS
{% highlight css %}
<style>
.headroom {
  transition: transform 200ms linear;
}
.headroom--pinned {
    transform: translateY(0%);
}
.headroom--unpinned {
    transform: translateY(-100%);
}
</style>
{% endhighlight %}

##En conclusion
Voilà c'est fini <br />
N'hésitez pas à aller faire un tour sur le site [headroom.js][1], vous y trouverez un espace de demo pour essayer d'autre transitions

[1]: http://wicky.nillia.ms/headroom.js/ "Aller sur le site web headroom.js"
[2]: http://jekyllrb.com/  "Aller sur le site web de jekyll"
[3]: http://getbootstrap.com "Aller sur le site de Bootstrap"
[4]: http://requirejs.org  "Aller sur le site de RequireJS"
