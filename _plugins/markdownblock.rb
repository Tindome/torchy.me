=begin
trouvé ici https://stackoverflow.com/questions/15917463/embedding-markdown-in-jekyll-html
=end

module Jekyll
  class MarkdownBlock < Liquid::Block
    def initialize(tag_name, text, tokens)
      super
    end
    require "kramdown"
    def render(context)
      content = super
=begin ai tenté mais marche pas la balise p ne doit pas etre ajoutée à ce moment là
issu d'un code trouvé ici : https://github.com/dtrasbo/formatize/blob/master/lib/formatize/helper.rb
            text = Kramdown::Document.new(content).to_html

            if text[0..2] == "<p>"
              text = text[3..-1]
            end

            if text[-4..-1] == "</p>"
              text = text[0..-5]
            end

            "#{text}"
=end
      "#{Kramdown::Document.new(content).to_html}"
    end
  end
end
Liquid::Template.register_tag('markdown', Jekyll::MarkdownBlock)

=begin
Attention à l'ajout automatique de balise ... en l'occurene dans l'exemple qui suit le style n'est pas appliqué car on englobe le resultat dans une balise fermante
Attention si on utilise les references elles doivent etre présentent deux fois une fois dans le bloc et une fois en dehors

<p class="lead">
{% markdown %}

Je suis tombé sur cette page par hasard [Aller sur le Github de l'auteur](https://github.com/carlsednaoui/gitsocial) , c'est simple, c'est efficace est beau aussi je partage
Je suis tombé sur cette page par hasard [Aller sur le Github de l'auteur][1] , c'est simple, c'est efficace est beau aussi je partage


[1]: https://github.com/carlsednaoui/gitsocial "Aller sur le Github de l'auteur"


{% endmarkdown %}
</p>
[Aller sur le Github de l'auteur][1]

## test




#cloner le hub

{% highlight batch %}
C:\SandBox\GitSocial> git clone https://github.com/carlsednaoui/gitsocial.git
{% endhighlight %}

[1]: https://github.com/carlsednaoui/gitsocial "Aller sur le Github de l'auteur"

=end
