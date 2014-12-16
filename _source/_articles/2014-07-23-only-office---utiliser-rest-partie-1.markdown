---
layout: post
title: "Only Office - Utiliser REST Partie 1"
date: 2014-07-23
disqus_comments: true
social_share: true
categories:
description: Comment utiliser REST dans le portail openoffice
published: true
article:
  written_on: 2014-07-23
  updated_on: 2014-07-23
  order: 3
---

{: .lead}
[OnlyOffice][1] est une solution de travail collaboratif que j'aime particulièrement, surtout de par son caractère facilité de prise en main.
Qui dit simplicité dit aussi qu'à un certain moment vous vous heurterez à certains manques de la solution,
mais comme le portail peut facilement s'attquer via REST, il ne nous/vous reste plus qu'a implémenter les solutions qui vont bien.


{% include modules/toc.liquid %}


# Au préalable

## Quelques conventions

 * remplacer PORTAIL par le nom de votre portail exemple webworkers.onlyoffice.eu
 * remplacer NOMUTILISATEUR par l'utilisateur qui veut se connecter au portail (nom de l'utilisateur sous onlyoffice)
 * remplacer MOTDEPASSE par le mot de passe de l'utilisateur qui veut se connecter au portail

## Bref coup d'oeil sur la documentation

On retient principalement deux choses :

 * pour s'authentifier on doit utiliser l'url https://PORTAIL/api/2.0/authentication auquel il faudra passer les paramètre utilisateur et mot de passe
 * pour obtenir la liste des projets on doit utiliser https://PORTAIL/api/2.0/project auqiel il faudra adjoindre le token obentu lors de notre authentification

 Pour faire nos premiers tests je vous propose d'utiliser curl que vous trouverez [ici][2]

# Première requête

## Récupération du Token

On lance la commande dans un boite DOS

{% highlight batch %}
C:\Chocolatey\bin>curl "https://PORTAIL/api/2.0/authentication" -k --data "userName=NOMUTILISATEUR&password=MOTDEPASSE"
{% endhighlight %}

Voici ce que nous retourne le serveur, notez bien le contenu dans la balise <token>, c'est ce qui va nous permettre de nous authentifier désormais

{% highlight json %}
<result><count>1</count><status>0</status><statusCode>201</statusCode><response>
<token>v3n2rWemV8/IB9a9DxFYwVOTdzoMPW0OD6/caiqgMyQVmlMGL7LL4Hdh2Zntj/2yl3LjQkiNYn0nsp0F+jDAaX1jXiVBk8Bq8sUO69XEpXfvEMGeFkKl29t8MULXRWsG</token>
<expires>2015-07-23T11:40:40.459934+00:00</expires><sms>false</sms><phoneNoise /></response></result>
{% endhighlight %}


## Utilisation du Token

Utilisons à présent le token obtenu pour pouvoir demander la liste des projets

{% highlight batch %}
C:\Chocolatey\bin>curl "https://PORTAIL/api/2.0/project" -H "Authorization: v3n2rWemV8/IB9a9DxFYwVOTdzoMPW0OD6/caiqgMyQVmlMGL7LL4Hdh2Zntj/2yl3LjQkiNYn0nsp0F+jDAaX1jXiVBk8Bq8sUO69XEpXfvEMGeFkKl29t8MULXRWsG" -k
{% endhighlight %}

si tout c'est bien passé vous devriez obtenir quelque chose qui ressemble à cela

{% highlight json %}
<result><count>4</count><status>0</status><statusCode>200</statusCode><response><id>67617</id><title>SCOP Web Workers</title>
<description></description><status>0</status><responsible><id>74676c28-c488-4b08-9e05-dfc068022ec8</id><displayName>St&amp;#233;phane Ty</displayName
<avatarSmall>https://data-teamlab-eu-com.s3.amazonaws.com/06/80/05/userphotos/74676c28-c488-4b08-9e05-dfc068022ec8_size_64-64.png</avatarSmall>
<profileUrl>/products/people/profile.aspx?user=president.webworkers</profileUrl></responsible><canEdit>true</canEdit><isPrivate>false</isPrivate></response>
<response><id>67046</id><title>Site Web AAM59.com</title><description>Gestion du site de l'association AAM59.com pour le compte de l'association</description>
<status>0</status><responsible><id>74676c28-c488-4b08-9e05-dfc068022ec8</id><displayName>St&amp;#233;phane Ty</displayName>
<avatarSmall>https://data-teamlab-eu-com.s3.amazonaws.com/06/80/05/userphotos/74676c28-c488-4b08-9e05-dfc068022ec8_size_64-64.png</avatarSmall>
<profileUrl>/products/people/profile.aspx?user=president.webworkers</profileUrl></responsible><canEdit>true</canEdit><isPrivate>false</isPrivate>
</response><response><id>67032</id><title>Site Web BeWe.eu</title><description></description><status>0</status><responsible>
<id>74676c28-c488-4b08-9e05-dfc068022ec8</id><displayName>St&amp;#233;phane Ty</displayName><avatarSmall>
https://data-teamlab-eu-com.s3.amazonaws.com/06/80/05/userphotos/74676c28-c488-4b08-9e05-dfc068022ec8_size_64-64.png</avatarSmall>
<profileUrl>/products/people/profile.aspx?user=president.webworkers</profileUrl></responsible><canEdit>true</canEdit><isPrivate>false</isPrivate>
</response><response><id>67033</id><title>Site Web Office365</title><description></description><status>0</status><responsible>
<id>74676c28-c488-4b08-9e05-dfc068022ec8</id><displayName>St&amp;#233;phane Ty</displayName><avatarSmall>
https://data-teamlab-eu-com.s3.amazonaws.com/06/80/05/userphotos/74676c28-c488-4b08-9e05-dfc068022ec8_size_64-64.png</avatarSmall>
<profileUrl>/products/people/profile.aspx?user=president.webworkers</profileUrl></responsible><canEdit>true</canEdit><isPrivate>false</isPrivate>
</response></result>
{% endhighlight %}


[1]: http://www.onlyoffice.com              "Aller sur le site web d'OnlyOffice"
[2]: http://curl.haxx.se/download.html                               "Télécharger curl"
