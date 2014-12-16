---
layout: post
title: "Markdown et HTML via Javascript"
date: 2014-07-19
disqus_comments: true
social_share: true
categories:
description: Comment convertir une portion de page au format html avec des balises markdown en html
published: true
---

{: .lead}
Au cours de mon utilisation de Jekyll, j'ai voulu mélanger du html et du markdown,
 j'ai été confronté à certains problèmes notamment une inclusion involontaire du code généré dans des balises
En cherchant des solutions je suis tombé sur le [gist][01] suivant qui permet de convertir une portion de html écrite en markdown en html <p>

Je vous livre la solution que j'ai adapté en utilisant un cdn et yepnope


## Solution

{% gist ea31657e56b06d5fc63c %}

## Resultat

<script type="text/javascript">
yepnope.injectJs("//cdnjs.cloudflare.com/ajax/libs/showdown/0.3.1/showdown.min.js", function () {
  [].forEach.call( document.querySelectorAll('[data-markdown]'), function  fn(elem){
    // strip leading whitespace so it isn't evaluated as code
    var text      = elem.innerHTML.replace(/\n\s*\n/g,'\n'),
        // set indentation level so your markdown can be indented within your HTML
        leadingws = text.match(/^\n?(\s*)/)[1].length,
        regex     = new RegExp('\\n?\\s{' + leadingws + '}','g'),
        md        = text.replace(regex,'\n'),
        html      = (new Showdown.converter()).makeHtml(md);

    // here, have sum HTML
    elem.innerHTML = html;
    });
  },{charset: "utf-8"},5000);

</script>


<div class="slide">
 <section class="hbox" data-markdown>
  ## Who Am I?

  * an item
  * a link [Modernizr](//modernizr.com)
  * an image ![An image](http://mirrors.creativecommons.org/presskit/buttons/88x31/png/by.png)
  </section>
</div>






[01]:  https://gist.github.com/paulirish/1343518 "Ouvrir le Gist"
