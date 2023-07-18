//
//  PlayerData.swift
//  UltraSolem_final
//
//  Created by Emma ORLANDINI on 02/11/2022.
//

import Foundation

class PlayerData : ObservableObject {
    @Published var name = ""
    @Published var etape = 0
    @Published var displaySat = true
    
    
    //    @Published var storyStep = [
    //        Step(etap: stories[0].titre, histoire: stories[0].mainStory, planetVisitee: " ")]
    
        
    var stories = [
        Story(planete: "Terre",
              choix1: "Terre",
              choix2: "Terre",
              choix1vu: false,
              choix2vu: false,
              jour: 1,
              dateDecouverte: "1 Janvier 2052",
              titre: "Prologue",
              mainStory: "Dans un futur proche, l’espace est devenu un lieu presque banal. Depuis un point d’observation au sol par nuit dégagée, on peut désormais apercevoir à l’oeil nu le maillage des réseaux internet satellitaires concurrents. Par ici une station spatiale. Par là une nouvelle constellation de satellites espions. Oui, un espace « presque banal » pour ceux qui ont les moyens. Les vols d’avions, qui ont plus l’air de fusées et qui caressent l’exosphère à vitesse hypersonique sont fréquents. Pour les autres, qui ne sont pas des scientifiques ou pour qui le ticket Pékin - New York en 3 heures est inaccessible, il reste un moyen de flirter avec les étoiles : tenter le concours d’agent de maintenance extra ionosphère de rang 5... \rEn gros, éboueur de l’espace.",
              resume: "Le commencement", type: "prologue"),
//----------------
        Story(planete: "Terre",
                    choix1: "Lune",
                    choix2: "ISS",
                    choix1vu: false,
                    choix2vu: false,
                    jour: 2,
                    dateDecouverte: "1 janvier 2052",
                    titre: "Le sydrome de Kessler",
                    mainStory: "Paradoxalement, la conquête de notre système solaire s’est interrompu. Non pas parce qu’on a déjà envoyé des sondes en faire le tour mais parce que l’espace est devenu un véritable dépotoir. Il y a ce type intelligent à lunettes qu’on a étudié à la fac, Kessler je crois. Il avait vu dans le mille plus d’un demi siècle avant. La prolifération des satellites a engendré tout autant de déchets et entre les engins obsolètes qu’on abandonne et ceux qui se détériorent, les risques de collisions sont devenus exponentiels. Ce job d’auto tamponneur de l’espace est devenu primordial.\rTant mieux, c’est mon ticket pour l’espace. En fait, je crois que j’ai toujours fait ça quand, nonchalamment, je dégageais du bout de l’ongle les graines de sésame du bun de mon Burger Mac. C’est presque pareil aujourd’hui, je glisse au dessus de la thermosphère et je pousse les débris pour les ralentir et les observe s’émietter inexorablement dans l’atmosphère... ",
                    resume: "Notre planète est cernée par les satellites en fonction mais aussi hors d'usage rendant la poursuite de la \"conquête\" de l'espace impossible...", type: "Chapitre"),
        
        Story(planete: "ISS - Lune",
              choix1: "Mars",
              choix2: "Mars",
              choix1vu: false,
              choix2vu: false,
              jour: 3,
              dateDecouverte: "1 Janvier 2052",
              titre: "Les signaux",
              mainStory: "A la différence de plein d’autres choses on s’était mis à créer des dispositifs qui ne sont pas à l’image de l’être humain. C’est vrai qu’on a un sacré défaut de conception : notre CPU, notre « nous » et peut-être notre âme sont au même endroit. Un mauvais coup sur la tête et c’est l’écran bleu. Coma, paralysie, et perte de mémoire au choix. Enfin non, au pif. Du coup on s’est mis à septupler, octupler les circuits de nos IA dans nos véhicules autonomes et nos robots et ils sont disséminés bien à l’écart les uns des autres pour qu’il y ait une redondance en cas de panne. \rÇa n’a pas empêché HANa de subir quelques dommages irréversibles suite à notre dernière sortie un peu freestyle. Rien de « grave » selon elle, l’intégrité de sa base de données et les unités de calcul n’ont pas été altérés. Elle a juste besoin désormais d’une intervention humaine pour saisir des clés de contrôle. Le fameux Human BackUp Control. \rSauf que le lien avec GroundControl et SpaceUp s’est rompu et qu’HANa s’est mise à illuminer ma jolie carte du système solaire -comme si on avait encore besoin d’une carte pour naviguer-. Elle reçoit des signaux inhabituels depuis chaque astre de notre cher système et a enclenché le protocole pour s’y rendre. ",
              resume: "Nous pensions avoir tout exploré dans notre système solaire. Pourtant, HANa reçoit des signaux et s'écarte de sa mission... ",type: "Chapitre"),
        
        
        
        Story(planete: "Lune - Mars",
              choix1: "Venus",
              choix2: "Mercure",
              choix1vu: false,
              choix2vu: false,
              jour: 4,
              dateDecouverte: "17 mars 2052",
              titre: "\"Ca fait le taff\"",
              mainStory: "Bien que l’exploration spatiale ait été stoppée, des types et des nanas intelligents ont continué de perfectionner la technologie du moteur à ion. Alors bon, on ne voit toujours pas un tunnel d’étoiles défiler à vitesse supraluminique comme dans les séries S.-F. un peu ringardes avec des gars en collants et qui sont rediffusées après une heure du matin. Mais d’après HANa, « ça fait le taff ». Tiens, c’est marrant qu’elle dise ça, le petit coup dans la carlingue l’a peut-être un peu détendue, qui sait. En tout cas, je me rappelle qu’à une époque, lorsque des milliardaires excentriques voulaient coloniser Mars et avant qu’ils n’y laissent toutes leurs économies, on mettait six mois pour aller vers le caillou rouge. Le temps de trajet a été réduit par deux depuis. La propulsion du moteur à ion est faible mais elle est permanente et consomme sensiblement moins que ce que les panneaux solaires déployés génèrent. \rToutefois, on a encore besoin d’assistance gravitationnelle. Pour aller vers Mercure et Venus, il va falloir que l’on aille caresser l’orbite soit de la lune soit de Mars. Ils appelaient ça la sphère de Hill dans mes vieux bouquins. Encore un nom savant pour décrire un truc qu’on faisait gamin quand on descendait à fond les ballons la côte en bas du quartier et qu'on s’agrippait à l’arrière du bus qui arrivait par le côté au dernier moment pour gagner de la vitesse.",
              resume: "Nous allons pouvoir voyager plus loin grâce au moteur à ion et en profitant de l'assistance gravitationnelle d'une autre planète...",type: "Chapitre"),
        
        
        Story(planete: "Venus - Mercure",
              choix1: "Soleil",
              choix2: "Soleil",
              choix1vu: false,
              choix2vu: false,
              jour: 5,
              dateDecouverte: "9 septembre 2052",
              titre: "Le cairn",
              mainStory: "La mise en orbite s’est déroulée sans problème. Le signal détecté au départ de Venus s’est, comme attendu, amplifié. Toutefois, sa modulation avait changé. Comme un battement de coeur, le rythme régulier avait ralenti, comme si notre arrivée avait apaisé l’appareil, la chose ou peut-être l’être qui l’émettait... \rPlusieurs passages ont été nécessaires pour repérer le signal émis depuis un amoncèlement de roches observable en orbite basse. Avec un peu d'imagination ça pourrait être une sorte de cairn. Après tout, on date les premiers du néolithique et on en trouve d’Inde en Écosse. Coïncidence, cette zone n’a pas été explorée encore par Venera 9, la sonde vénusienne. Les vents solaires et l’activité sismique l’auraient façonné. Sauf que son ombre interroge. La section la plus haute, à peu près carrée et culminant à 150 mètres est également la plus grande, avec des côtes d’environ 230 mètres quand la base, elle, ne fait que 15 mètres. Comme si « quelqu’un » avait retourné la grande pyramide de Kheops...",
              resume: "La structure observée sur Venus, d'où est émis le signal, est suprenante. Est-ce possible qu'elle ait été fabriquée ?",type: "Chapitre"),
        
        Story(planete: "Soleil",
              choix1: "Jupiter",
              choix2: "Saturne",
              choix1vu: false,
              choix2vu: false,
              jour: 6,
              dateDecouverte: "25 août 2053",
              titre: "Les ailes d'Icare",
              mainStory: "J’envoie tous les jours des messages à SpaceUp et GroundControl. Je leur explique qu’HANa m’a demandé de valider le trajet pour le soleil. Le SOLEIL. Elle me dit que les boucliers servant à nous protéger des débris feront le taff pour les rayonnements. Et on est censés rester à bonne distance de possibles éruptions. Mais pour faire quoi ? Encore une fois je n’aurais pas de réponse, tout au plus une fumeuse explication sur l’amélioration du moteur à ion et l’extraordinaire effet de fronde attendu. Je la soupçonne de vouloir partir à la recherche du signal dont elle a repéré l’origine au centre de notre système solaire. \"Mairde\" c’est juste une boule de gaz incandescente de 5500°C qui brûle depuis 4603 milliards d’années. Je ne peux pas saboter HANa sans me saboter moi-même. J’espère simplement qu’on ne se brûlera pas les ailes…",
              resume: "Par son rayonnement elle permet la vie mais nous pourrions bien s'y brûler les panneaux solaires",type: "Chapitre"),
        
        Story(planete: "Jupiter - Saturne",
              choix1: "Uranus",
              choix2: "Neptune",
              choix1vu: false,
              choix2vu: false,
              jour: 7,
              dateDecouverte: "31 décembre 2052",
              titre: "L'oeil de Ganymède",
              mainStory: "Cela fait des mois que nous voyageons en quête de réponses. HANa me dit qu'il faut aller ici, là, ou encore ici. Je m'exécute en saisissant les clés de contrôles en espérant un message de GroundControl qui la persuaderait de rentrer à la maison. Elle est évasive lorsque je lui demande de me montrer les images de nos passages en orbite ou les enregistrements des signaux. Elle me dit que je ne suis pas qualifié... En même temps elle a raison. Je dois me résigner. Alors je contemple. Les nombreux hublots, qui normalement permettent de bien appréhender les débris à dégager, sont autant de tableaux sublimes. Avant-hier en arrivant, je voyais le soleil se lever sur Jupiter. Il y a quelque chose d'immense, de palpable mais d'indescriptible qui m'envahit.\nJ'assiste en ce moment à une eclipse du soleil. Ce dernier est en train de passer lentement derrière Ganymède. Coïncidence... ou pas, l'ombre du satellite géant pointe précisément dans l'oeil du cyclone perpétuel. HANa me dit qu'elle a repéré le signal dans cet \"iris\"...",
              resume: "Le prochain signal est apparu dans le cyclone perpétuel de Jupiter, durant l'écplise du soleil, au passage de l'ombre de Ganymède...",type: "Chapitre"),
        
    ]
}
