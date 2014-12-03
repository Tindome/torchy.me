---
layout: tutorial
title: "Jekyll Premiers pas"
date: 2014-07-16
tags: []
categorie: jekyll, tutorial
comments: false
published: true
categories:
  - jekyll
summary:
  Cleanly handling unpublished posts on a Jekyll blog
---



{% include gogithub_plug.html prefix="tuto" link="https://github.com/Tindome/jekyll_1" %}

<p class="lead">
Les premiers pas sous jekyll sont toujours difficiles, il existe beaucoup de tutoriaux mais souvent en anglais.<br />j'ai voulu ajouter le mien en français et sous windows en essayant au maximum de garder les choses simples.
</p>

##Introduction

Vous le savez un site html est un ensemble de page dans un format de type texte. Ce texte est formaté à l'aide d'élement entre les caractères < et >.

Ce texte sera ensuite interpreté par une application tel votre navigateur pour afficher le contenu mis en forme.
Dans un site nous avons des parties plus ou moins statiques, que vous recopiez au travers de toute vos pages par exemple le bandeau haut, le pied de page. En fait bien souvent vous vous rendez compte qu'une page web
contient un grand nombre d'élément récurrents.
Ce qui serait intéressant ce serait un système qui permette à partir de gabarits et d'un ensemble de règles d'effectuer cet assemblage.

C'est ce qu'on appelle communément un générateur de site statique.


##Présentation
[Jekyll][1] est un générateur de site statique qui fonctionne sous [ruby][3] sachez qu' il en existe d'autres que ce soit en Ruby ou dans d'autre langages (je vous renvoie par exemple vers [docpad][2] si vous préférez le javascript
  via un serveur Node.js),

<h3 id="installation">Installation</h3>
Comme [jekyll][1] fonctionne sous [ruby][3], il nous faut au préalable l'installer. Je suis sous windows, je peux donc passer par [rubyinstaller](http://rubyinstaller.org/downloads/)
ou encore l'excellent installateur de package dont j'ai parlé dans un autre article : [chocolatey]({{site.url}}/post/)
Ouvrez une fenêtre DOS et taper

<kbd>c\:>cinst ruby</kbd>

puis installer le gem jekyll (note on peut également passer par chocolatey via c:\choco gem install), toujours dans notre fenêtre DOS taper

<kbd>c\:>gem install jekyll</kbd>

il nous reste à créer une structure nous permettant de travailler. Personnellement je préfère la créer à la main

* répertoire \_source qui contiendra tous les éléments du site avant traitement par [jekyll][1]
* répertoire \_deploy qui contiendra tous les éléments du site après traitement par [jekyll][1]
* fichier \_config.yml à la racine du site, qui contiendra les directives de configuration générales
* répertoire \_layout sous le répertoire \_source qui contiendra nos différents gabarits de page
* répertoire \_posts sous le répertoire \_source qui contiendra nos différents billets
* répertoire assets sous le répertoire \_source qui contiendra les différents élements qui ne sont pas à traiter par [jekyll][1]

à présent nous allons ajouter deux lignes au fichier de configuration, (\_config.yml)

{% highlight yaml %}
source:      ./_source
destination: ./_deploy
{% endhighlight %}


<div class="doc-callout doc-callout-warning">
Le fichier est très sensible à l'encodage
Si vous utilisez l'encodage UTF-8, soyez certain de ne pas ajouter de BOM àvotre fichier<br />
De plus évitez d'utiliser les tabulation dans ce fichier, privilégiez les espaces
</div>

##Test
Avant de clore cette section, je vous propose un petit test, créer le fichier /\_source/index.html
contenant les lignes suivantes
{% highlight html %}
<html>
<head></head>
<body>A new jekyll site is born</body>
</html>
{% endhighlight %}

Lancez le seveur local (qui lance églament la copmilation du site c'est à dire son assemblage), via la commande DOS.

<kbd>
c:\jekyll serve
</kbd>

<div class="doc-callout doc-callout-info">
Pour ceux que le serveur intrigue, je précise.
On pourrait être tenté de faire un fichier ouvrir dans le navigateur ; mais sans serveur, la page web que l'on afficherait dans le navigateur,
serait interpétée et affichée mais certains éléments ne fonctionneraient pas comme les pages css liées relativement par exemple.
</div>

Rendez vous à l'url 127.0.0.1:4000/index.html pour voir apparaitre la page avec le contenu "A new jekyll site is born"


##En résumé
Nous avons appris dans cette section

* à installer Ruby,
* à installer Jekyll,
* à créer notre architecture de travail

##A suivre
Comment démarrer son projet


[1]: http://jekyllrb.com/  "Aller sur le site web de jekyll"
[2]: hhttp://docpad.org    "Aller sur le site web de docpad"
[3]: http://ruby.org       "Aller sur le site web de ruby"


<script type="text/javascript">
<!--
jQuery(document).ready(function(){
	//Shadowbox.init();
	//prettyPrint();
	jQuery('.bs-docs-sidenav').affix({
		offset: {
			top: 150,
			bottom: 270
		}
	});
	jQuery('a[href*=#]').click(function (e) {
		var hash = jQuery(this).attr('href');
		e.preventDefault();
		var dest = 0;
		if (jQuery(this.hash).offset().top > (jQuery(document).height() - jQuery(window).height())){
			dest = jQuery(document).height() - jQuery(window).height();
		}else{
			dest = jQuery(this.hash).offset().top;
		}
		jQuery('html,body').animate({scrollTop:dest}, 1000, 'swing');
	});
});
-->
</script>
