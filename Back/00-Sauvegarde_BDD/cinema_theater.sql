-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  mer. 17 mars 2021 à 22:07
-- Version du serveur :  8.0.18
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `cinema_theater`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id_categorie` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_categorie` text NOT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id_categorie`, `libelle_categorie`) VALUES
(1, 'Comédie'),
(2, 'Policier'),
(3, 'Comédie Dramatique'),
(4, 'Thriller'),
(5, 'Film Animation'),
(6, 'Horreur'),
(7, 'Drame'),
(8, 'Western'),
(9, 'Science Fiction'),
(10, 'Comédie Musicale'),
(11, 'Série'),
(12, 'Biopic'),
(13, 'Aventure'),
(14, 'Guerre');

-- --------------------------------------------------------

--
-- Structure de la table `films`
--

DROP TABLE IF EXISTS `films`;
CREATE TABLE IF NOT EXISTS `films` (
  `id_film` int(11) NOT NULL AUTO_INCREMENT,
  `id_categorie` int(11) NOT NULL,
  `titre_film` text NOT NULL,
  `pitch` longtext NOT NULL,
  `file_img` text NOT NULL,
  `annee_sortie` int(11) NOT NULL,
  PRIMARY KEY (`id_film`),
  KEY `index_categorie` (`id_categorie`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `films`
--

INSERT INTO `films` (`id_film`, `id_categorie`, `titre_film`, `pitch`, `file_img`, `annee_sortie`) VALUES
(1, 13, 'King Kong', 'New York, 1933. Ann Darrow est une artiste de music‐hall dont la carrière a été brisée net par la Dépression. Se retrouvant sans emploi ni ressources, la jeune femme rencontre l’audacieux explorateur‐réalisateur Carl Denham et se laisse entraîner par lui dans la plus périlleuse des aventures… Ce dernier a dérobé à ses producteurs le négatif de son film inachevé. Il n’a que quelques heures pour trouver une nouvelle star et l’embarquer pour Singapour avec son scénariste, Jack Driscoll, et une équipe réduite. Objectif avoué : achever sous ces cieux lointains son génial film d’action. Mais Denham nourrit en secret une autre ambition, bien plus folle : être le premier homme à explorer la mystérieuse Skull Island et à en ramener des images. Sur cette île de légende, Denham sait que « quelque chose » l’attend, qui changera à jamais le cours de sa vie…', 'king_kong.jpg', 2005),
(2, 11, 'Hercule Poirot', 'En 33 romans, 51 nouvelles, des dizaines de films et une série de 70 épisodes, Hercule Poirot a captivé des milliards de lecteurs et de téléspectateurs. Mais quelles sont les raisons de ce succès hors-norme ? À l\'écran, de Peter Ustinov à Kenneth Branagh en passant par John Malkovich, tous les grands acteurs ont rêvé d\'incarner Hercule Poirot. Mais depuis 30 ans, c\'est le comédien britannique David Suchet, qui est devenu indissociable de son personnage. Grâce aux témoignages des comédiens, comme celui du célèbre Capitaine Hastings et des producteurs de la série, tous les secrets qui ont fait le succès de la série sont dévoilés.', 'poirot.jpg', 2019),
(3, 9, 'Godzilla', 'Une tempête effroyable se déchaîne sur le Pacifique, engloutissant un pétrolier tandis qu\'un immense éclair illumine le ciel au-dessus de la Polynésie française. Des empreintes géantes creusent un inquiétant sillon à travers des milliers de kilomètres de forêts et de plages au Panama. Les navires chavirent au large des côtes américaines et ces horribles phénomènes s\'approchent de plus en plus près de New York. Le chercheur Nick Tatopoulos est arraché à ses recherches afin d\'aider les États-Unis à traquer le monstre qui est à l\'origine de ces désastres mystérieux.', 'godzilla.jpg', 1998),
(4, 9, 'Hulk', 'Au cours d\'une opération scientifique qui a mal tourné, le docteur Bruce Banner est exposé à une surdose de radiations nucléaires. Miraculeusement indemne, il sort néanmoins affecté de cette douloureuse expérience et développe le pouvoir de se transformer en Hulk, un monstre vert à la force surhumaine et à la rage incontrôlable. Cette créature ne se manifeste que lorsque ce dernier est soumis à une intense émotion. Mis au ban de la société, le docteur Banner est obligé de se cacher pour ne pas faire subir aux autres sa métamorphose. Le général Ross, le père de Betty, l\'ex-petite amie de Bruce, est chargé de stopper le monstre par tous les moyens. Glenn Talbot, rival scientifique de Banner, est également sur les traces de Hulk. Lorsque Betty découvre que la créature a un rapport avec les recherches du père de Bruce, elle devient la seule à pouvoir comprendre ce qu\'est Hulk...', 'hulk.jpg', 2003),
(5, 7, '	Il était une fois en Amérique', 'Il était une fois deux truands juifs, Max et Noodles, liés par un pacte d’éternelle amitié. Débutant au début du siècle par de fructueux trafics dans le ghetto de New York, ils voient leurs chemins se séparer, lorsque Noodles se retrouve durant quelques années derrière les barreaux, puis se recouper en pleine période de prohibition, dans les années vingt. Jusqu’au jour où la trahison les sépare à nouveau.', 'en_amerique.jpg', 1984),
(6, 6, 'Scream', 'Casey Becker, une belle adolescente, est seule dans la maison familiale. Elle s\'apprête à regarder un film d\'horreur, mais le téléphone sonne. Au bout du fil, un serial killer la malmène, et la force à jouer à un jeu terrible : si elle répond mal à ses questions portant sur les films d\'horreur, celui-ci tuera son copain... Sidney Prescott sait qu\'elle est l\'une des victimes potentielles du tueur de Woodsboro. Celle-ci ne sait plus à qui faire confiance. Entre Billy, son petit ami, sa meilleure amie Tatum et son frère Dewey, ses copains de classe Stuart et Randy, la journaliste arriviste Gale Weathers et son caméraman Kenny qui traînent tout le temps dans les parages et son père toujours absent, qui se cache derrière le masque du tueur ?', 'scream.jpg', 1996),
(7, 5, 'Trolls', 'Connus pour leurs cheveux fluos et magiques, les Trolls sont des créatures délirantes et joyeuses et surtout les rois de la pop. Mais leur monde d’arcs‐en‐ciel et de cupcakes est changé à jamais lorsque leur leader Poppy doit se lancer dans une mission de sauvetage qui l’entraînera loin de ce paradis.', 'trolls.jpg', 2016),
(8, 5, 'Les Croods', 'Lorsque la caverne où ils vivent depuis toujours est détruite et leur univers familier réduit en miettes, les Croods se retrouvent obligés d’entreprendre leur premier grand voyage en famille. Entre conflits générationnels et bouleversements sismiques, ils vont découvrir un nouveau monde fascinant, rempli de créatures fantastiques, et un futur au‐delà de tout ce qu’ils avaient imaginé.', 'croods.jpg', 2013),
(9, 5, 'Spirit', 'L\'étalon sauvage Spirit naît dans les plaines vierges de l\'Ouest américain, aux premières années de la Conquête. Son enfance est tout entière placée sous le signe du jeu et de l\'aventure. Spirit découvre avec émerveillement l\'immensité, les ressources infinies, la beauté majestueuse de sa terre natale. Jeune adulte, il devient le chef de sa bande.Un soir, Spirit rencontre l\'Homme. Pris au lasso, livré à un colonel sadique, il refuse de se faire dompter...', 'spirit.jpg', 2002),
(10, 8, 'Il était une fois dans l\'Ouest', 'Trois hors-la-loi attaquent un mystérieux inconnu, surnommé «Hombre», dans une gare perdue de l\'Ouest américain. Mais l\'homme réussit à les éliminer. Il se met ensuite à jouer un air lancinant sur son harmonica. Pendant ce temps, le fermier McBain prépare une grande fête en l\'honneur de Jill, la ravissante fille de saloon qu\'il vient d\'épouser. C\'est alors que, sur ordre de l\'ignoble Frank, d\'autres tueurs surgissent pour abattre McBain et ses trois enfants. Frank décide de garder la jeune femme pour lui. Un aventurier, Cheyenne, accusé du quadruple meurtre, vient de s\'enfuir de prison. Nul ne sait que le crime a été en réalité commandité par Morton, un magnat du rail, qui veut s\'approprier les terres des McBain afin de mener à bien des projets très lucratifs. Sans se départir de son flegme, Hombre vole au secours de Cheyenne et se fait un devoir de protéger Jill...', 'dans_l_ouest.jpg', 1968),
(11, 1, 'Le Grand Blond avec une chaussure noire', 'François Perrin arrive à Orly avec aux pieds une chaussure jaune et l\'autre noire. Une aubaine pour Perrache, adjoint du colonel Toulouse, chef d\'un service secret, que ce jeune violoniste fantasque. Il le choisit pour jouer, à ses dépens, le rôle d\'un redoutable espion international. Toulouse, las de défendre sa place contre son très ambitieux adjoint Milan, a décidé de s\'en débarrasser une fois pour toute, en le lançant sur une fausse piste.', 'grand_blond.jpg', 1972),
(12, 1, 'Le Jouet', 'Un milliardaire et son jeune fils se ballade dans un grand magasin, afin de choisir un cadeau. Le choix de l\'enfant se porte sur un journaliste, qui va être mis à sa disposition et devenir son jouet.', 'le_jouet.jpg', 1976),
(13, 12, 'Apollo 13', 'Après les premiers pas de l\'homme sur la Lune, la NASA décide de poursuivre les vols habités. Jim Lovell qui, deux ans plus tôt, avait participé au vol Apollo 8, est choisi pour diriger la mission Apollo 13. Avec Fred Haise et Ken Mattingly, il suit un entraînement intensif. Une semaine avant le départ prévu, les médecins détectent chez Ken Mattingly des signes de rougeole. À contrecœur, Jim Lovell doit se résigner à le remplacer par Jack Swigert, insuffisamment préparé à son goût. Le jour du lancement, le 11 avril 1970, Apollo 13 décolle de Cap Kennedy, dans l\'indifférence générale. Jusqu\'au troisième jour, tout se passe bien.', 'apollo13.jpg', 1995),
(14, 9, 'Alien', 'En 2122, le Nostromo, vaisseau de commerce, fait route vers la Terre avec à son bord un équipage de sept personnes en hibernation et une cargaison de minerais. Il interrompt soudain sa course suite à la réception d’un mystérieux message provenant d’une planète inexplorée. Réveillé par l’ordinateur de bord, l’équipage se rend sur place et découvre les restes d’un gigantesque vaisseau extraterrestre dont le seul passager semble être mort dans d’étranges circonstances…', 'alien.jpg', 1979),
(15, 9, 'Alien vs Predator', 'Un Alien issu d\'un Predator, appelé Predalien, décime un vaisseau Predator, mettant hors d\'état de fonctionnement ce dernier, qui s\'écrase sur Terre, non loin de Gunnison, une ville américaine. Rapidement, les face-huggers retenus en captivité dans le vaisseau s\'échappent, ainsi que le Predalien, contaminant peu à peu les habitants de la ville. En réponse à ce grave incident, un ancien Prédator expérimenté, surnommé Wolf, est envoyé sur Terre afin d\'éliminer la menace Xénomorphe, effacer toutes les preuves concernant l\'existence des Aliens et des Predators, mais surtout, éliminer le terrible danger que représente le Predalien.', 'alien_vs_predator.jpg', 2007),
(16, 1, 'La Chèvre', 'La fille du Grand PDG Bens est tellement malchanceuse qu\'elle se fait enlever alors qu\'elle est en vacances au Mexique. Pour la retrouver, son père engage le détective privé Campana qu\'il associe à un gaffeur invétéré dans l\'espoir qu\'il le raproche de sa fille...', 'la_chevre.jpg', 1981),
(17, 6, 'Saw', 'Deux hommes se réveillent enchaînés au mur d’une salle de bains. Ils ignorent où ils sont et ne se connaissent pas. Ils savent juste que l’un doit absolument tuer l’autre, sinon dans moins de huit heures, ils seront exécutés tous les deux… Voici l’une des situations imaginées par un machiavélique maître criminel qui impose à ses victimes des choix auxquels personne ne souhaite jamais être confronté un jour. Un détective est chargé de l’enquête…', 'saw.jpg', 2004),
(18, 6, 'Hannibal', 'Il y a dix ans, le docteur Hannibal Lecter s’échappait de sa cellule. Clarice Starling, agent du FBI sur la touche, n’a pas oublié sa rencontre avec lui, sa présence troublante et le son grave de sa voix qui hantent toujours ses nuits.Mason Verger, un ancien patient, se souvient également d’Hannibal, puisqu’il a été sa quatrième victime. Malgré le fait qu’il ait été atrocement défiguré et mutilé, il a survécu. Il nourrit sa vengeance depuis dix ans. Devenu extrêmement riche, il promet une récompense de trois millions de dollars pour quiconque le repérera.L’inspecteur Rinaldo Pazzi lui téléphone pour l’informer de sa présence en Italie. En effet, après avoir changé d’identité, Hannibal est devenu le conservateur d’un musée à Florence. Et pour attirer ce dernier dans ses filets, Mason connaît un appât irrésistible : Clarice Starling. L’heure de la vengeance va peut‐être sonner.', 'hannibal.jpg', 2001),
(19, 13, 'Jurassic Park', 'Ne pas réveiller le chat qui dort... C\'est ce que le milliardaire John Hammond aurait dû se rappeler avant de se lancer dans le clonage de dinosaures. C\'est à partir d\'une goutte de sang absorbée par un moustique fossilisé que John Hammond et son équipe ont réussi à faire renaître une dizaine d\'espèces de dinosaures. Il s\'apprête maintenant avec la complicité du docteur Alan Grant, paléontologue de renom, et de son amie Ellie, à ouvrir le plus grand parc à thème du monde. Mais c\'était sans compter la cupidité et la malveillance de l\'informaticien Dennis Nedry, et éventuellement des dinosaures, seuls maîtres sur l\'île...', 'jurassic_park.jpg', 1993),
(20, 6, 'Vendredi 13', 'En 1957, un jeune garçon, prénommé Jason, meurt noyé au camp de Crystal Lake. L\'année suivante, les deux responsables du camp sont tués. Crystal Lake ferme. Mais en 1980, Steve Christy décide de le rouvrir un vendredi 13, jour anniversaire des décès survenus vingt-trois ans auparavant. Lors de la préparation du camp pour son ouverture, les moniteurs du centre disparaissent les uns après les autres pendant la nuit…', 'vendredi13.jpg', 1980),
(21, 7, 'American Beauty', 'Un pavillon bourgeois dans une banlieue résidentielle : c\'est ici que résident Lester Burnhamm, sa femme Carolyn et leur fille Jane. Derrière cette respectable façade se tisse une grinçante tragi-comédie familiale où se révéleront désirs inavoués, frustrations et violences refoulées.', 'american_beauty.jpg', 1999),
(22, 12, 'Aviator', 'À la fin des années 1920, Howard Hughes, jeune héritier d\'une famille du Sud possédant de nombreux puits de pétrole, investit une somme considérable dans la production de « Hell\'s Angels », un film retraçant les exploits d\'aviateurs pendant la Première Guerre mondiale. Au cours d\'un tournage qui va s\'étaler sur 3 ans, le producteur-réalisateur rencontre deux de ses fidèles collaborateurs : Noah Dietrich, chargé de s\'occuper des finances de l\'entreprise, et le professeur Fitz, qui devient son conseiller scientifique. Ce tournage avive également l\'intérêt de Howard pour l\'aéronautique, l\'amenant à concevoir et à tester de nouveaux modèles d\'avions rapides. Peu de temps après la sortie en fanfare de « Hell\'s Angels », Howard fait la connaissance de la comédienne Katharine Hepburn, dont il tombe amoureux...', 'aviator.jpg', 2004),
(23, 8, 'Butch Cassidy et le Kid', 'De Butch Cassidy, visage incontournable de l\'histoire de l\'Ouest et du cinéma, on connaît peu de choses, hors sa légende. Il serait mort, non en Bolivie, comme le racontait George Roy Hill, mais aux Etats-Unis, tranquille et vieux, après une existence menée aux confins de la Patagonie. Alors Lester a choisi de raconter sa jeunesse et ses débuts...', 'cassidy.jpg', 1979),
(24, 5, '1001 Pattes', 'Tilt, fourmi quelque peu tête en l’air, détruit par inadvertance la récolte de la saison. La fourmilière est dans tous ses états. En effet cette bévue va rendre fou de rage le Borgne, méchant insecte qui chaque été fait main basse sur une partie de la récolte avec sa bande de sauterelles racketteuses. Fou de rage, ce dernier annonce qu’il reviendra à l’automne prélever le double de sa ration habituelle. Tilt décide alors, pour se faire pardonner, de quitter l’île pour recruter des mercenaires capables de chasser le Borgne.', '1001_pattes.jpg', 1998),
(25, 12, 'Amadeus', 'À Vienne, en novembre 1823. Au cœur de la nuit, un vieil homme égaré clame cette étonnante confession : « Pardonne, Mozart, pardonne à ton assassin ! » Ce fantôme, c\'est Antonio Salieri, jadis musicien réputé et compositeur officiel de la Cour. Dès l\'enfance, il s\'était voué tout entier au service de Dieu, s\'engageant à le célébrer par sa musique, au prix d\'un incessant labeur. Pour prix de ses sacrifices innombrables, il réclamait la gloire éternelle. Son talent, reconnu par l\'empereur mélomane Joseph II, valut durant quelques années à Salieri les plus hautes distinctions. Mais, en 1781, un jeune homme arrive à Vienne, précédé d\'une flatteuse réputation. Wolfgang Amadeus Mozart est devenu le plus grand compositeur du siècle. Réalisant la menace que représente pour lui ce surdoué arrogant dont il admire le profond génie, Salieri tente de l\'évincer.', 'amadeus.jpg', 1984),
(26, 4, 'American Psycho', 'Au coeur des années Reagan, Patrick Bateman est un pur produit de la réussite américaine. Jeune, riche, il est un de ces golden boys qui triomphent à la bourse. Seul le nec plus ultra est digne de lui et il s\'emploie à ne retrouver que des symboles qui lui renvoient une image de succès. Il accumule, avec une obsession maladive, les vêtements selects, les relations enviables. Son voeu le plus cher est de se fondre dans cette foule, de trouver sa place au milieu de ceux auxquels il s\'identifie.', 'american_psycho.jpg', 2000),
(27, 14, 'Apocalypse Now', 'L’état‐major américain confie au jeune capitaine Willard une mission secrète : Éliminer le colonel Kurtz, qui s’est constitué, au‐delà de la frontière cambodgienne, un royaume personnel sur lequel il règne par la violence et la terreur.', 'apocalypse_now.jpg', 1979),
(28, 13, 'Cyrano de Bergerac', 'Les aventures du célèbre et turbulent cadet de Gascogne, amoureux de sa cousine, Roxane, vues par le réalisateur de «La vie de château» et le scénariste Jean-Claude Carrière. «Il s\'agissait de faire un film. Nous ne pouvions nous contenter d\'une simple mise en images de la pièce. Nous voulions donner à cette histoire que nous aimions la dynamique et la tension d\'un film. Le vrai pari du film, c\'est que les personnages y parlent en vers.»', 'cyrano.jpg', 1990),
(29, 9, 'Hollow Man', 'Un brillant scientifique, Sebastian Caine, travaille pour les services secrets. Il vient de mettre au point une formule pour rendre invisible. Apres l\'avoir testée avec succès sur lui-même, il s’aperçoit qu\'il ne peut plus inverser le phénomène. Ses collègues tentent alors de trouver une solution. Mais Caine devient de plus en plus obsédé par son nouveau pouvoir et se persuade peu à peu que ses collègues en veulent à sa vie. Désormais, Caine va sombrer dans la folie et représenter une menace réelle pour son entourage.', 'hollow_man.jpg', 2000),
(30, 13, 'Indiana Jones et le Temple maudit', 'L’archéologue Indiana Jones est obligé de fuir un cabaret de Shanghai après une négociation houleuse. En compagnie de la chanteuse Willie Scott et du petit Short Round, il se retrouve sur un glacier himalayen, dans un village dont une secte a dérobé le diamant magique et enlevé les enfants afin de les sacrifier.', 'indiana_temple_maudit.jpg', 1984),
(31, 1, 'Inspecteur La Bavure', 'Michel Clément, fils d\'un héros de la police, est promu inspecteur-stagiaire grâce à l\'indulgence du jury. Suite à un quiproquo, il est passé à tabac par ses collègues. Marie-Anne Prossant, journaliste, menace de publier une photo de la scène si on lui refuse un reportage. Elle se joint donc à l\'équipe formée par Watrin et Clément, qui, quant à lui, rêve d\'arrêter Morzini, l\'ennemi public numéro 1 ... ', 'inspecteur_bavure.jpg', 1980),
(32, 3, 'Intolérable cruauté', 'Miles Massey est l\'avocat que l\'on s\'arrache quand on veut divorcer. Sa renommée et son train de vie témoignent de sa remarquable réussite. Mais Miles s\'ennuie. Il ne va pas tarder à trouver un cas à sa mesure.Marylin Rexroth, future ex-femme d\'un richissime investisseur immobilier pris en flagrant délit d\'adultère, comptait profiter de la vie et d\'une belle pension. Mais Miles réussit à dispenser son client du moindre dédommagement.Décidée à se venger, la jeune femme épouse aussitôt un magnat du pétrole. Entre Miles et Marylin commence alors un match où tous les coups sont permis.', 'intolerable_cruaute.jpg', 2003),
(33, 10, 'Les Commitments', 'Splendeur et misères d\'un groupe de soul music de Dublin, les Commitments, formé par Jimmy Rabitte. C\'est au moment où leur musique devient parfaite que leur groupe éclate ... ', 'les_commitments.jpg', 1991),
(34, 12, 'Pollock', 'La vie de l\'artiste new-yorkais d\'après-guerre Jackson Pollock qui s\'est fait connaître du grand public par sa peinture abstraite. ', 'pollock.jpg', 2000),
(35, 2, '15 Minutes', 'Le policier Eddie Flemming est connu de tous les médias de New York pour être le meilleur dans sa spécialité. Lorsque deux cadavres sont découverts dans un appartement ravagé par le feu, il est contraint de faire équipe avec Jordy Warsaw, un enquêteur de la brigade des incendies criminels, homme discret qui méprise la presse et la course au sensationnel. Malgré leurs divergences, ils se lancent ensemble sur la piste de pyromanes un peu particuliers ...', '15_minutes.jpg', 2001),
(36, 2, 'Heat', 'Hanna, lieutenant de police aguerri qui ne vit que pour son métier, entreprend de traquer sans relâche Neil McCauley, malfrat de haut vol sur le point de se retirer des affaires. Quand Neil dirige un hold-up spectaculaire, qu’il espère être son dernier, un de ses complices abat les convoyeurs. Furieux, Neil décide de le liquider, mais l’homme s’enfuit.', 'heat.jpg', 1995),
(37, 13, 'Braveheart', 'À la fin du XIIIème siècle, le roi Edward 1er d\'Angleterre s\'empare du trône d\'Ecosse, réduisant son peuple à la misère. William Wallace donne le signe de la révolte et, à la tête d\'une armée de gueux, parvient à reconquérir plusieurs places fortes. Mais les nobles écossais sont lâchés et par deux fois trahissent le héros de leur peuple ... ', 'braveheart.jpg', 1995),
(38, 14, 'Full Metal Jacket', 'Pendant la guerre du Vietnam, la préparation et l’entrainement d’un groupe de jeunes marines, jusqu’au terrible baptême du feu et la sanglante offensive du Tet à Hue, en 1968. ', 'full_metal.jpg', 1987),
(39, 14, 'La Liste de Schindler', 'Évocation des années de guerre d’Oskar Schindler, fils d’industriel d’origine autrichienne rentré à Cracovie en 1939 avec les troupes allemandes. Il va, tout au long de la guerre, protéger des juifs en les faisant travailler dans sa fabrique et en 1944 sauver 800 hommes et 300 femmes du camp d’extermination d’Auschwitz‐Birkenau. ', 'liste_schindler.jpg', 1993),
(40, 1, 'Quand la Panthère Rose s\'emmêle', 'Traumatisé par la chance de son adjoint Clouseau, l\'inspecteur Dreyfus est interné dans un hopital psychiatrique. ', 'panthere_rose_emmele.jpg', 1976),
(41, 14, 'La Déchirure', 'Journaliste au New York Times, Sidney Schanberg est un des rares reporters à rester au Cambodge après la prise de Phnom Penh par les Khmers rouges. L\'intervention de son assistant Dith Pran lui sauve la vie. Pran arrêté, Schanberg regagne les États-Unis alors que la répression s\'abat sur le Cambodge.', 'dechirure.jpg', 1984),
(42, 3, 'The Truman Show', 'Truman Burbank mène une vie calme et heureuse. Il habite dans un petit pavillon propret de la radieuse station balnéaire de Seahaven. Il part tous les matins à son bureau d’agent d’assurances dont il ressort huit heures plus tard pour regagner son foyer, savourer le confort de son habitat modèle, la bonne humeur inaltérable et le sourire mécanique de sa femme, Meryl. Mais parfois, Truman étouffe sous tant de bonheur et la nuit l’angoisse le submerge. Il se sent de plus en plus étranger, comme si son entourage jouait un rôle. Pis encore, il se sent observé.', 'truman_show.jpg', 1998),
(43, 3, '\r\nBuffet froid', 'Tout commence quand Alphonse Tram, chômeur, rencontre un inconnu dans les couloirs déserts du R.E.R. Il le retrouve quelques temps plus tard assassiné avec son propre couteau. Dans la tour immense qu\'il habite, il fait alors successivement connaissance d\'un commissaire de police et de l\'assassin de sa femme et se retrouve entrainé dans une série de meurtres plus surréalistes les uns que les autres.', 'buffet_froid.jpg', 1979),
(44, 3, ' Coup de torchon', '1938. En Afrique occidentale française. Lucien Cordier est l\'unique policier d\'une petite ville coloniale. Méprisé de tous pour sa lâcheté et sa veulerie, il est l\'objet de moqueries et de railleries. Lorsque son officier supérieur lui fait prendre conscience de sa médiocrité, il va peu à peu se transformer en impitoyable assassin et se débarrasser de tous ses tourmenteurs, femme et maîtresse comprises par un jeu diabolique qui consiste à faire accuser d\'autres que lui avant de les éliminer jusqu\'à ce qu\'il reste seul.', 'coup_torchon.jpg', 1981),
(45, 9, ' RoboCop', 'À l\'aube de l\'an 2000, Détroit est, comme toujours dans cette sorte d\'histoire, la proie du crime et de la corruption. Pour pallier ce terrible état, les services de police inventent une nouvelle arme infaillible, Robocop, mi-homme, mi-robot, policier électronique de chair et d\'acier qui a pour mission de sauvegarder la tranquillité de la ville. Mais comme souvent, ce cyborg a aussi une âme.', 'robocop.jpg', 1987),
(46, 1, 'Tout le monde il est beau, tout le monde il est gentil', 'Selon Radio plus près de Dieu, rien n\'est conçu sans Dieu, surtout pas les shampoings, produits de beauté, la vente des disques... Un animateur dénonce cette escroquerie à l\'antenne, ce qui lui vaut d\'être licencié. Il réapparaîtra sur de nouvelles ondes avec Radio plus près de la Vérité', 'beau_et_gentil.jpg', 1972),
(47, 7, 'Le Vieux Fusil', 'L\'action se déroule en 1944, à Montauban. Le chirurgien Julien Dandieu y mène une vie paisible avec sa femme, Clara, et leur fille Florence. Cependant, l\'invasion allemande ne peut le laisser indifférent : préférant les savoir éloignées des tourments de cette guerre, Julien demande à son ami François de conduire Clara et Florence à la campagne, où cette famille possède un château, véritable forteresse médiévale qui surplombe un village. Une semaine plus tard, ne supportant plus l\'absence des siens, Julien rejoint sa famille pour découvrir, avec effroi, que les Allemands ont déjà semé la terreur dans le village.', 'vieux_fusil.jpg', 1975),
(48, 7, 'Gorilles dans la brume', 'En 1966, Dian Fossey, une jeune Américaine, obtient l\'autorisation d\'aller recenser les gorilles dans les montagnes du Zaïre. Avec un pisteur, Sembagare, elle réussit à s\'installer à proximité d\'un groupe de primates et à s\'en faire accepter. Mais une guerre civile déchire le Zaïre, et Dian doit quitter le pays. Elle se réfugie au Rwanda où elle crée, sur les hauts plateaux, le centre de recherche de Karisoke. Là, elle déclare la guerre aux braconniers qui vendent les jeunes gorilles aux zoos et coupent les mains et les têtes des singes pour en faire des souvenirs. Elle s\'attire de nombreuses inimitiés, qui mettent sa vie en danger ...', 'gorille_brume.jpg', 1988),
(49, 1, 'Cuisine américaine', 'À la suite d\'un incident avec un officier, Loren Collins se fait virer de la marine américaine, où il apprenait le métier de chef faute de pouvoir se payer une école de cuisine. Il part alors à Dijon où il a réussi à obtenir une promesse d\'embauche dans le restaurant prestigieux du chef Louis Boyer, réputé caractériel.', 'cuisine_americaine.jpg', 1998),
(50, 2, '\r\nPiège en eaux troubles', 'Tom Hardy et son père, tous deux dans la police, repèrent un soir un serial killer qui accumule les victimes. La poursuite se termine mal et le père de Tom est tué. Tom declare alors que le tueur fait partie de la police.', 'piege_eaux_troubles.jpg', 1993),
(51, 5, 'Fourmiz', 'Z-4195, fourmi ouvrière, est amoureux de la belle princesse Bala. Simple numéro parmi les milliards composant sa colonie il n\'a aucune chance d\'attirer le regard de la belle. Pourtant il demande l\'aide de son meilleur ami, la fourmi soldat Weaver, afin d\'approcher l’élue de son cœur. C\'est ainsi que par un caprice du hasard, il parasite involontairement le plan machiavélique de l\'ambitieux général Mandibule qui veut tout bonnement liquider la colonie afin de la recréer à son image. Z se retrouve bientôt à la tête d\'une révolution.', 'fourmiz.jpg', 1998),
(52, 2, 'Le Clan des Siciliens', 'Le tueur Roger Sartet s\'évade du fourgon cellulaire qui le transportait. C\'est le clan des Siciliens dirigé par Vittorio Manalese qui a mis au point cette évasion. Sartet confie au clan un projet dont l\'idée lui est venue en prison: s\'emparer de la collection de bijoux d\'une exposition. Manalese fait alors venir son ami Tony Nicosia, un «professionnel» et Sartet prend l\'identité d\'un diamantaire chargé du convoi des bijoux. L\'avion est détourné en vol mais Sartet, qui a eu une brève liaison avec Jeanne, la belle-fille de Manalese, est dénoncé à ce dernier. Manalese fait revenir Sartet à Paris et le tue. Peu de temps après, le clan des Siciliens est arrêté par la police.', 'clan_siciliens.jpg', 1969),
(53, 1, '\r\nAlexandre le Bienheureux', 'Lorsque sa femme meurt, Alexandre décide de se consacrer à sa grande passion: la paresse. Il se couche pour plusieurs semaines. Son chien lui rapporte les provisions que lui sert la jolie Agathe, qui finit par le séduire. Mais, au moment de l\'épouser, il se ravise, sa liberté et sa paresse risquant d\'être compromises.', 'alexandre_bienheureux.jpg', 1968),
(54, 7, 'Midnight Express', 'Billy Hayes est arrêté en Turquie pour avoir sur lui du hashisch. Condamné à perpétuité, il est enfermé dans des geôles ...', 'midnight_express.jpg', 1978),
(55, 10, 'Moulin Rouge', 'À la fin du XIXe siècle, dans le Paris de la Belle Époque, Christian, un jeune poète désargenté, s\'installe dans le quartier de Montmartre. Il découvre un univers où se mêlent sexe, drogue et french cancan, mais se rebelle contre ce milieu décadent en menant une vie de bohème. Christian rêve d\'écrire une grande pièce, et le peintre Henri de Toulouse-Lautrec est prêt à lui donner sa chance. Celui-ci a besoin d\'un spectacle grandiose pour le Moulin Rouge et le poète est embauché pour rédiger le livret de la revue. C\'est là qu\'il tombe amoureux de la courtisane Satine, la star du prodigieux cabaret ...', 'moulin_rouge.jpg', 2001),
(56, 3, 'Antitrust', 'Milo est un jeune prodige de l\'informatique qui, du fond de son garage où il a installé sa start-up, a une ambition. Il veut devenir l\'artisan de la convergence numérique. Il en a le talent. Bientôt, grâce à ses recherches, tous les instruments numériques pourront se comprendre et être associés... Lorsque Gary Winston, le tout-puissant patron de N.U.R.V. Corp., propose à Milo de rejoindre son équipe de recherche, le jeune homme ne peut pas refuser. Gary est son modèle, son icône, celui qui a tout inventé. Fasciné, Milo met tout son talent au service du richissime magnat. Pour les deux, l\'enjeu est énorme, Milo veut entrer dans l\'Histoire et Gary veut rester le numéro un.', 'antitrust.jpg', 2001),
(57, 9, 'La Planète des singes : L\'Affrontement', 'Une nation de plus en plus nombreuse de singes évolués, dirigée par César, est menacée par un groupe d’humains qui a survécu au virus dévastateur qui s\'est répandu 10 ans plus tôt. Ils parviennent à une trêve fragile, mais de courte durée : les deux camps sont sur le point de se livrer une guerre qui décidera de l’espèce dominante sur Terre.', 'planete_singes_affrontement.jpg', 2014),
(58, 3, '\r\nElephant Man', 'Londres, 1884. Le chirurgien Frederick Treves découvre un homme complètement défiguré et difforme, devenu une attraction de foire. John Merrick, \'le monstre\', doit son nom de Elephant Man au terrible accident que subit sa mère. Alors enceinte de quelques mois, elle est renversée par un éléphant. Impressionné par de telles difformités, le Dr. Treves achète Merrick, l\'arrachant ainsi à la violence de son propriétaire, et à l\'humiliation quotidienne d\'être mis en spectacle. Le chirurgien pense alors que \'le monstre\' est un idiot congénital. Il découvre rapidement en Merrick un homme meurtri, intelligent et doté d\'une grande sensibilité.', 'elephant_man.jpg', 1980),
(59, 10, 'Chantons sous la pluie', 'Don Lockwood et Lina Lamont sont le couple star du moment à Hollywood. Mais lorsque le parlant arrive, la voix de crécelle de Lina menace la carrière du duo ...', 'chantons_sous_la_pluie.jpg', 1952),
(60, 3, 'Fight Club', 'Le narrateur, sans identité précise, vit seul, travaille seul, dort seul, mange seul ses plateaux‐repas pour une personne comme beaucoup d’autres personnes seules qui connaissent la misère humaine, morale et sexuelle. C’est pourquoi il va devenir membre du Fight club, un lieu clandestin où il va pouvoir retrouver sa virilité, l’échange et la communication. Ce club est dirigé par Tyler Durden, une sorte d’anarchiste entre gourou et philosophe qui prêche l’amour de son prochain ...', 'fight_club.jpg', 1999),
(61, 2, 'Dobermann', 'Le Dobermann et son gang défraient la chronique. Banques, postes, fourgons, tout y passe. Une anthologie du braquage, un best-of du hold-up ! En face d\'eux, un flic quelque peu pourri, qui fait de leur arrestation une affaire personnelle. ', 'dobermann.jpg', 1997),
(62, 13, 'Gangs of New york', 'En 1846, le quartier de Five Points, un faubourg pauvre de New York, est le théâtre d’une guerre des gangs entre émigrants irlandais et américans natifs. Ces derniers mettent rapidement en déroute leurs ennemis en assassinant leur chef, et afin de renforcer leur pouvoir, s’allient avec un politicien influent. ', 'gangs_of_new_york.jpg', 2002),
(63, 13, 'Bonnie & Clyde', 'La dramatique aventure de deux amants révoltés pendant la grande dépression des années trente aux Etats-Unis, inspirée par un fait reel. Film culte réalisé un an avant les évènements de 1968.', 'bonnie_and_clyde.jpg', 1967),
(64, 13, 'L\'insoutenable légèreté de l\'être', 'Le Printemps de Prague vu par un jeune chirurgien passionné par son métier et les femmes et une jeune serveuse devenue photographe qu\'il finit par épouser. La beauté du célèbre « Printemps », l\'arrivée des Soviétiques, l\'exil à Genève, le retour en Tchécoslovaquie ...', 'insoutenable_legerete_etre.jpg', 1988);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;