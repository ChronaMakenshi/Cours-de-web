-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le :  jeu. 05 mars 2020 à 15:56
-- Version du serveur :  5.7.26
-- Version de PHP :  7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `AutoRetroChic`
--
CREATE DATABASE IF NOT EXISTS `AutoRetroChic` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `AutoRetroChic`;

-- --------------------------------------------------------

--
-- Structure de la table `T_Construct`
--

DROP TABLE IF EXISTS `T_Construct`;
CREATE TABLE IF NOT EXISTS `T_Construct` (
  `id_construct` int(11) NOT NULL AUTO_INCREMENT,
  `nom_construct` varchar(100) NOT NULL,
  `text_construct` text NOT NULL,
  `logo_construct` varchar(100) NOT NULL,
  `img_construct` varchar(100) NOT NULL,
  PRIMARY KEY (`id_construct`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `T_Construct`
--

INSERT INTO `T_Construct` (`id_construct`, `nom_construct`, `text_construct`, `logo_construct`, `img_construct`) VALUES
(1, 'Bugatti', 'Bugatti Automobiles est un constructeur automobile français filiale du groupe allemand Volkswagen AG. Fondée en 1909 par le constructeur franco-italien Ettore Bugatti, l’entreprise est longtemps considérée comme pionnière dans le domaine de l’automobile et produit de luxueuses sportives de prestige marquées par l’adage cher à Ettore : « Rien n’est trop beau, rien n’est trop cher »5.\r\nBugatti est dépositaire de plus de 1 000 inventions brevetées en mécanique et se distingue particulièrement en compétition automobile, notamment dans la première moitié du xxe siècle, avec ses « légendaires » bolides bleus de France à la calandre en fer à cheval. Son palmarès compte plus de 10 000 victoires internationales en course ainsi que 37 records6. Reprise un temps par le « fils du Patron » Jean Bugatti, décédé précocement, Bugatti est contraint de mettre un terme à ses activités peu après la Seconde Guerre mondiale.\r\nDe nouvelles productions d’automobiles portant le nom de Bugatti sont cependant entreprises après la disparition de la marque, d’abord en 1987 par l’Italien Romano Artioli sous le nom de « Bugatti Automobili SpA » ayant pour fait majeur la construction d\'une toute nouvelle usine futuriste en Italie et le lancement d\'une toute nouvelle égérie pour la marque, la EB110, puis en 1998 par le groupe allemand Volkswagen AG avec la création de la société Bugatti Automobiles SAS. En 2005, Bugatti produit un modèle d’exception, une supercar : la Bugatti Veyron 16.4 et ses versions Grand Sport, Super Sport et Grand Sport Vitesse.\r\nEn 2015, Bugatti annonce la fin du modèle Veyron dont elle a produit 450 exemplaires et l\'arrivée d\'un tout nouveau modèle pour 2016 qui sera la Bugatti Chiron, du nom du pilote monégasque Louis Chiron, et est propulsé par un W16 développant 1 500 ch7. Sa vitesse maximale est bridée à 420 km/h.\r\n', 'logo-bugatti.png', 'Ettore_Bugatti.jpg'),
(2, 'Chenard&Walcker', 'Chenard et Walcker est une marque d\'automobiles française créée par Ernest Chenard et Henry Walcker en 1899. Quatrième constructeur français en volume vers 1922 sous la direction de l\'ingénieur Lucien Chenard, il est le premier vainqueur de la première édition des 24 Heures du Mans en 1923 et collectionne les victoires en compétition automobile. Son succès commercial est assuré par ses luxueuses automobiles de sport et de tourisme.\r\n\r\nOutre sa gamme automobile, des camions sont produits à partir de 1931. La société est filialisée par la Société des usines Chausson en 1936 et la production automobile cesse en 1940. Après la Seconde Guerre mondiale, la société produira des camions et utilitaires commercialisés par la marque Peugeot jusqu\'en 1965.', 'Chenard_&_Walcker-logo.jpg', 'Ernest-Chenard.jpg'),
(3, 'Delahaye', 'Firme fondée à Tours par Emile Delahaye qui produisait depuis 1845 des machines pour la fabrication des briques, puis des moteurs fixes.\r\n\r\nLes premières Delahaye sont très semblables aux Benz et sont dotées d\'un moteur horizontal de faible puissance, monté à l\'arrière et entraîné par courroie.\r\n\r\nElles participent à des courses jusqu\'en 1902, mais depuis 1898, la société se consacre essentiellement à la production de voitures particulières comme des monocylindres de 1,4 ch et des bicylindres de 4,5 et 6 ch.\r\n\r\nAprès le départ d\'Emile Delahaye en 1901, la firme se consacre à la production de quatre-cylindres allant de 9 à 12 ch comme le modèle 10 B de 2,2 litres et la grosse 28 ch de 4,9 litres.\r\n\r\nEn 1905, la gamme comprend deux modèles twin et trois modèles quatre-cylindres dont le plus grand est un 8 litres.\r\n\r\nEn 1907, les Delahaye sont vendues sous licence en Allemagne sous la marque Presto et peu après aux Etats-unis où les 20/30 ch Delahaye sont distribuées par White.\r\n\r\nEn 1911, paraît le modèle 44 équipé d\'un V6 et d\'une boîte quatre vitesses, en 1927, Delahaye forme un consortium avec Chenard et Walcker, Donnet et Unic pour rationaliser sa production. De cette association naissent les six-cylindres 2,5 et 2,9 litres de 1928.\r\n\r\nEn 1929, le radiateur en V est remplacé par un radiateur à ailettes de type américain, en 1930, sont lancées deux nouvelles quatre-cylindres et une grosse six-cylindres. le modèle 126, qui marque le renouveau de la marque.\r\n\r\nEn 1934, sortent la Super 12 de 2150 cm3 et la 18 CV Superlux, toutes deux dotées d\'une suspension avant indépendante, le rachat de Delage en 1935 donne une nouvelle impulsion à la société, particulièrement avec le modèle 135 120 ch et la \"Coupe des Alpes\" 110 ch qui atteignent 160 km/h en équipement de série.\r\n\r\nEn 1937, Delahaye lance la 145 dotée d\'un V12 de 4,5 litres avec une boîte de vitesses Cotal et un essieu arrière De Dion ; elle atteint 265km/h avec ses 238 ch. Le type 165 V12 en est issu.\r\n\r\nPendant la Deuxième Guerre mondiale, Delahaye se joint au Groupe français de l\'automobile dont les initiales GFA figurent sur les emblèmes de radiateur de toutes les voitures d\'après-guerre, même après la disparition de ce groupe en 1952.\r\n\r\nEn 1946, les 134 et 135 Delahaye sont à nouveau fabriquées, mais avec des moteurs plus puissants. En 1948, sortent les séries du modèle 175, 4,5 litres. dotées de freins hydrauliques. Malgré ses 185 ch. cette voiture n\'a pas de succès et en 1951, les dernières Delahaye sont présentées, dont la Jeep et le modèle 235 de 3,5 litres.\r\n\r\nEn 1954, Delahaye s\'associe avec Hotchkiss et ne fabrique plus que des camions.', 'logo_Delahaye.jpg', 'emile_delahaye.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `T_Voiture`
--

DROP TABLE IF EXISTS `T_Voiture`;
CREATE TABLE IF NOT EXISTS `T_Voiture` (
  `id_voiture` int(11) NOT NULL AUTO_INCREMENT,
  `modele_voiture` varchar(100) NOT NULL,
  `dmc_voiture` int(4) NOT NULL,
  `text_voiture` text NOT NULL,
  `img_voiture` varchar(100) NOT NULL,
  `id_construct_voiture` int(11) NOT NULL,
  PRIMARY KEY (`id_voiture`),
  KEY `FK_construct_voiture` (`id_construct_voiture`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `T_Voiture`
--

INSERT INTO `T_Voiture` (`id_voiture`, `modele_voiture`, `dmc_voiture`, `text_voiture`, `img_voiture`, `id_construct_voiture`) VALUES
(2, 'BUGATTI TYPE 32\r\n', 1923, 'La type 32 étrennait une carrosserie pour le moins originale, en forme d\'aile d\'avion. Son style sans fioriture lui valut rapidement le surnom de tank. Basée sur la type 30, son châssis surbaissé passait sous les essieux. Ettore Bugatti, sans formation spécifique sur les questions d\'aérodynamique, s\'était aventuré sur un terrain qu\'il connaissait mal. La voiture devenait impossible à maîtriser à hautes vitesses, et tout le talent de Friederich fut nécessaire pour conduire le tank Bugatti à la troisième place lors de sa première course, le Grand Prix de l\'ACF en 1923. Malgré ce résultat mitigé, la voiture fut exposée sur le stand Bugatti du salon de Paris cette même année.\r\n\r\nEttore tirait les conclusions qui s\'imposaient, et orientait ses recherches vers un autre type d\'automobile radicalement différent. La Bugatti 35 allait bientôt prendre forme.', 'Bugatti32.png', 1),
(3, 'CHENARD&WALCKER AIGLE 8 U16', 1937, 'La Chenard & Walcker Aigle 8 U16 fut produite en 1937 en 15 exemplaires.\r\n\r\ncaractéristiques: Le modèle U16 (phares en dehors et capot à l\'ancienne) avec le V8 Ford, 3,6 litres, est une présérie de 15 automobiles qui a servi de test pour relancer en 37 la marque CW qui avait fait faillite 4 mois avant.', 'Chenard&Walcker-Aigle-8-U16.jpg', 2),
(4, 'Delahaye 135 M cabriolet', 1938, 'La Delahaye 135 M cabriolet, cette ancienne voiture fut produite de 1938 à 1951, cette Delahaye 135 de 1938 mesure 1.65 mètres de large, 3.96 mètres de long, et a un empattement de 2.92 mètres.', 'Delahaye-135-M-cabriolet.jpg', 3),
(5, 'Bugatti 57 Cabriolet', 1936, 'La Bugatti Type 57 est un des modèles les plus important dans l’histoire de Bugatti commercialisée entre mars 1934 à mai 1940. Il existe deux versions de la Bugatti Type 57. La Bugatti Type 57 déclinée en de nombreuses carrosseries de prestiges : Galibier, Ventoux, Stelvio, Atalante, Aérolithe et Atlantic. Elle fut victorieuse avec la version 57G tank aux 24 Heures du Mans en 1937 et en 1939 dotée d\'un compresseur. La Bugatti Type 57S (Sport), déclinée en coupé Atlantic, coupé Atalante (noter les différences avec l’Atalante sur châssis 57) et cabriolet Aravis qui peut être considéré comme un modèle à lui tout seul.\r\n\r\nLa Bugatti Type 57 est présentée au mondial de l\'automobile de Paris en octobre 1933 et remplace la Bugatti Type 49.\r\n\r\nElle utilise un châssis conventionnel de type Bugatti Type 49, mais sa mécanique est plus moderne avec un moteur 8 cylindres en ligne de 3 257 cm3 à double arbre à cames en tête de 135 ch à 4 500 tr/min (140 ch à partir de 1935), pour 155 km/h, formant un bloc avec l\'embrayage et la boîte, le tout faisant office d\'entretoise de châssis.', 'Bugatti-57-Cabriolet.jpg', 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `T_Voiture`
--
ALTER TABLE `T_Voiture`
  ADD CONSTRAINT `FK_construct_voiture` FOREIGN KEY (`id_construct_voiture`) REFERENCES `T_Construct` (`id_construct`) ON DELETE CASCADE;

