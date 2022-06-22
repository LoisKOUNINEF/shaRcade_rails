# ShaRcade (Rail back-end)

### _Lien vers le repo du [front-end](https://github.com/Teacher-droid/shaRcade_react)_

# ShaRcade! (nom non-définitif :wink:)

## 1. Présentation

Notre projet consiste en une plateforme sociale de centralisation de scores de petits jeux / casual games.
L'objectif est de disposer de comptes "**joueurs**", de comptes "**éditeurs / producteurs / programmeurs de jeux**" et d'un compte "**admin**".
Chaque jeu pourra disposer d'une fiche de présentation doublée d'une clé d'API permettant à l'éditeur / au producteur que tout joueur utilisant l'un de ses jeux voit son score stocké sur notre plateforme.
A cela s'ajoutera une dimension sociale puisqu'on pourra, en tant que membre "joueur", partager ses scores, commenter ceux des autres joueurs, etc.

## 2. Parcours utilisateur

Les **éditeurs / producteurs / programmeurs** pourront s'inscrire sur la plateforme puis gérer les fiches de leurs jeux (CRUD). Une clé d'accès à l'API de stockage des scores leur est donnée pour chaque jeu pour permettre que ce dernier envoie les hi-scores sur notre plateforme.

Les **joueurs** auront la possibilité de créer un compte, de lier leurs différents hi-scores à ce dernier, de les commenter et les partager avec la communauté des autres joueurs. Ils pourront également, sur chaque fiche de jeu, ajouter une évaluation et un commentaire.

## 3. Environnement technique

### 3.1. Base de données

_"Décris ici comment tu vois la base de données de l'application ?"_
Bien pensée, bien remplie, évidemment : pourquoi cette question :smile: ?

Plus sérieusement, le modèle central n'est pas trop compliqué et devrait vous rappeler quelque chose :

- Des "users" (avec des rôles pour ceux inscrits sur la plateforme):
  - les "joueurs" (users inscrits),
  - les "éditeurs / producteurs / programmeurs" (à voir si on les différenciera mais le principe est d'être le "propriétaire du jeu")
  - enfin, un petit nombre d'élu(e)s pourrait bénéficier de l'enviable statut d'administrateur(trice) : le "God Mode" de la plateforme, en quelques sortes :sunglasses:.
  - même s'ils ne feront pas l'objet d'un traitement particulier par la plateforme, il y aura aussi évidemment les "simples visiteurs" qui pourront consulter la partie visible de notre iceberg :ice_cream:
- Des "fiches", décrivant chaque jeu ; ces dernières étant, chacune, liée à l'utilisateur "éditeur / producteur / programmeur" dudit jeu
- Des commentaires et des évaluations, sur les fiches jeux, émanant des joueurs
- Des listes de hi-scores pour chaque (fiche) jeu avec un lien vers le joueur / membre (le cas échéant)
- A cela pourrait sûrement s'ajouter quelques "vérues", du genre _like_ et commentaires à propos des cours

### 3.2. Front-end
Un milk-shake à base de :

- React, pour la structure et les mécanismes
- CSS 3 (voire du Sass), total custom, pour embellir et animer la plateforme
- Bootstrap 6 (juste une touche de-ci, de-là), sûrement un peu revampé
- belles images avec un camaïeu top hype
- une navigation intuitive

... Et le tour est joué ;-) !

### 3.3. Back-end

Hormis Rails (v7.0.2 ou v7.0.3... On hésite encore ;-) ) et les quelques gems Ruby / RoR déjà étudiées ("devise" et "devise-jwt" pour la connexion et le sessionning, "dotenv-rails" pour gérer d'éventuelles infos sensibles à stocker, optionnellement "stripe" pour simuler des paiements et quelque chose pour un éventuel _chat_ entre joueurs, etc.), nous n'avons pas encore achevé de réfléchir jusqu'à quel point nous pourrons / voudrions / saurons / aurons le temps de _pimper_ notre ShaRcade :copyright:. A suivre donc... Il faut bien garder un peu de mystère...

## 4. Equipe

Notre équipe, elle, est bien arrêtée et remontée à bloc !
Elle est constituée de :

- **Loïs KOUNINEF**, _à compléter_.
- **Damian PIERRE-LOUIS**, _MacGyver Spirit_. Inventeur en herbe 🔧, abonné au magazine Geekanoids, le voici à bord du navire rempli de gentils pirates vaguant sur les flots de la grande DataBase en attendant de pouvoir mettre son satellite en orbite 🛰 et d'être le premier homme à écrire une [ligne de code sur la Lune](https://ak.picdn.net/shutterstock/videos/14202959/thumb/1.jpg)

- **Jean-Baptiste VIDAL**, _The Amstrad Mastermind_. Il est tombé dans le code quand il était tout petit (:heart:[CPC 6128](https://fr.wikipedia.org/wiki/Amstrad_CPC_6128):heart:). Depuis, il n'a pas beaucoup grandi et a dû faire une désyntox' :syringe: de 15 ans "no code" 💔. Depuis quelques semaines, THPix, le druide du \_peer-learning* lui a permis de reprendre quelques lampées de prog', _The Librarian_ lui a trouvé 1 ou 2 sites de docs sympas sur [Ruby Guides](https://www.rubyguides.com/2020/03/rails-scaffolding/) et, jusqu'ici, hormis quelques _scaffoldings_ un peu trop sauvages, tout va bien...

:warning: Une fois ça dit, il faudra voir le "qui fait quoi" dans l'équipe plus précisément mais notre but est clairement que tout le monde mette "la main à la patte", sans trop rester sur une spécialité ou un domaine déjà maîtrisé(e).

## 5. Organisation projet

Pour la gestion du projet, nous aurons un espace de travail [Trello](https://trello.com/b/Q5qGqAhO/sharcade) public.
Discord restera notre outil d'échanges, écrits, visuels et vocaux.

Pour la conception, nous pensons notamment utiliser deux outils ayant fait leur preuves durant Full-Stack :

- [Whimsical](https://whimsical.com/) pour les aspects _wireframing_ du site (~site map / tree), modélisation de la base de données, etc.
- [Figma](https://www.figma.com/) pour le pan graphique et UI du prototypage

Nous travaillerons en sprints quotidiens avec, en tout début de journée, une répartition des tâches permettant à chacun(e) d'entre nous de toucher à la fois au front et au back de l'application, de prendre part à la conception comme à la réalisation. Certaines tâches nécessiteront évidemment aussi que nous épaulions et regroupions nos force / compétences :muscle:.
Aucun(e) d'entre nous ne restera donc bloqué(e) des heures, esseulé(e) jusqu'au désespoir :sob: :weary: : nous sommes avant tout une équipe !

Afin de se familiariser avec le code produit par nos collègues, les _reviews_ de test pour validation se feront, en équipe, en début de journée avant la définition du sprint.

## 6. MVP a.k.a. "La version minimaliste mais fonctionnelle qu'il faudra avoir livré la première semaine"

Tout ça reste évidemment à préciser à date mais on peut imaginer, au bout de ces quelques jours, de disposer :

- d'une landing page expliquant l'offre de valeur ShaRcade
- de quelques pages d'info et d'accroche, lorsqu'on est pas connecté
- des pages et fonctionnalités de base de consultation, modification (selon les types de profil), création (idem) et suppression (idem²) des principaux "objets" du modèles (utilisateurs, fiches jeu, hi-scores...)
- des utilisateurs des différents types (admin, joueurs, éditeurs) et d'un système complet de connexion / déconnexion / récupération de mot de passe...
- d'un accès à l'API des hi-scores, avec une page expliquant ses règles de fonctionnement
- d'un ou plusieurs "_casual game_", adapté(s) pour l'occasion, permettant de démontrer le stockage des hi-scores et autres informations liées
- d'une sorte de tableau de bord pour :
  - chaque éditeur / producteur / programmeur
  - chaque joueur, pour gérer son compte, ses hi-scores...
  - l'administrateur qui centralise des informations et chiffres en lien avec les jeux, les utilisateurs...

Le tout avec un look acceptable qui ne pique pas trop les yeux... Alors, ça vous tente ?

## 5. La version que l'on présenterait aux jury

En plus de finaliser les fonctionnalités et le look du MVP de la semaine n°1, on pourrait discuter d'extras comme :

- l'ajout de commentaires et/ou évaluations et/ou likes sur les (fiches de) jeux
- l'enrichissement des tableaux de bord proposés avec, par exemple, des indicateurs de pilotage et/ou [KPIs](https://fr.wikipedia.org/wiki/Indicateur_cl%C3%A9_de_performance), à destinations de l'administrateur et des éditeurs / producteurs / programmeurs pour suivre la popularité de leur(s) jeu(x)
- une messagerie interne (instantanée type _chat_ ou asynchrone type forum, à voir) ; éventuellement assortie d'une logique de messages privés _vs._ publics

## 6. Fonctionnalités "bonus" (en suspens)

- Rendre les évaluations plus uniquement individuelles mais "par les pairs" avec des "barrières" adaptées (ex. 80% d'appréciations positives par le ou les correcteurs)
- Logique de "sessions / promotions" plutôt que d'inscription à la volée et individuelle
- Différentiation des types d'utilisateurs autour du jeu, avec des fonctionnalités particulières (ex. un éditeur utilisera la plateforme différemment du programmeur, davantage dans un esprit de promotion du jeu)

## 7. Notre mentor

Ca y est ! En ce jour saint du jeudi 9 juin 2022, avant que ne sonnent 16 heures, **Denis PASIN** (a.k.a. **_Zaratan_**) a solennellement accepté d'être notre mentor. Rôle qu'il assurera - avec élégance et prestance - depuis sa retraite estivale canadienne et etats-unienne !
Comme quoi, croiser les doigts :four_leaf_clover: et prier :pray: nous a porté chance :wink: !

## 8. Contacts

Si tu es emballé(e) par ce projet, notre état d'esprit, et que tu aimes transmettre tes connaissances, n'hésites pas à envoyer un MP sur Discord à l'un(e) d'entre nous

- **Loïs KOUNINEF** | AWizardDidIt#7927
- **Damian PIERRE-LOUIS** | RamenKimshi#8983
- **Jean-Baptiste VIDAL** | GibbZ#4997

A très bientôt !

## 99. Le mot de la fin

Que tu sois moussaillon(ne), pirate, corsaire ou membre du staff, nous sommes preneurs de ton avis, tes suggestions, etc. N'hésite donc pas à nous aborder (et pas saborder, hein...) sur Discord pour nous donner ton avis, ta vision, des idées, etc !
