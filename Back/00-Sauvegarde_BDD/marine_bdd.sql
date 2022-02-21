-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 21 fév. 2020 à 14:24
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `marine_bdd`
--

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `id_image` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_image` varchar(255) NOT NULL,
  `image` text,
  `id_travaux` int(11) NOT NULL,
  PRIMARY KEY (`id_image`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `images`
--

INSERT INTO `images` (`id_image`, `libelle_image`, `image`, `id_travaux`) VALUES
(1, 'Charadesign dessin dragon', '/images/animaux/18b.png', 6),
(3, 'Illustration Baghee et la vie en appartement', '/images/animaux/39.png', 6),
(4, 'F?lin royal', '/images/animaux/46.png', 6),
(5, 'Charadesign beau crapaud ', '/images/animaux/78.png', 6),
(6, 'Dessin animaux belettes', '/images/animaux/21.png', 6),
(7, 'Brave souris', '/images/animaux/mousewarrior.png', 6),
(8, 'Perruche et coconut', '/images/animaux/rhea.png', 6),
(9, 'Charadesign Demoiselle de rivi?re en armure', '/images/animaux/warriorinsect.png', 6),
(10, 'Aquarelle Autoire Lot', '/images/aquarelles/1.png', 3),
(11, 'Aquarelle nature Lot Dordogne', '/images/aquarelles/2.png', 3),
(12, 'Aquarelles Dordogne vieille souche', '/images/aquarelles/3.png', 3),
(13, 'Aquarelle Lot Abreuvoir en pierre', '/images/aquarelles/4.png', 3),
(14, 'Aquarelles Poulain et labrador', '/images/aquarelles/5.png', 3),
(15, 'Croquis encre et aquarelle Animaux sauvages', '/images/aquarelles/6.png', 3),
(16, 'Dessin encre chat curieux', '/images/encre/1.png', 2),
(17, 'Dessin encre chats amoureux ', '/images/encre/2.png', 2),
(18, 'Encre chat herboriste', '/images/encre/3.png', 2),
(19, 'Encre Le dragon de compagnie ', '/images/encre/4.png', 2),
(20, 'Illustration encre toucher les ?toiles', '/images/encre/5.png', 2),
(21, 'Encre Le sortil?ge', '/images/encre/6.png', 2),
(22, 'Illustration pas touche aux cookies', '/images/encre/7.png', 2),
(23, 'Charadesign Encre Chats du XVIIIe', '/images/encre/8.png', 2),
(24, 'Illustration Marie Antoinette ', '/images/illustrations/2b.png', 4),
(25, 'Illustration La trouvaille', '/images/illustrations/5.png', 4),
(26, 'Illustration Barbe Bleue La porte ', '/images/illustrations/6b.png', 4),
(27, 'Foot f?minin jeunesse', '/images/illustrations/11.png', 4),
(28, 'Illustration petite sir?ne ', '/images/illustrations/14.png', 4),
(29, 'Illustration journalisme', '/images/illustrations/15.png', 4),
(31, 'Illustration Pollution ', '/images/illustrations/25.png', 4),
(32, 'Illustration Alice au Pays des merveilles 2019', '/images/illustrations/2019.png', 4),
(33, 'Illustration le Billet doux', '/images/illustrations/cdba.png', 4),
(34, 'Illustration l\'heure du th', '/images/illustrations/cdba5bis.png', 4),
(35, 'Illustration L\'?ventail', '/images/illustrations/cdba2.png', 4),
(36, 'For?t d\'automne Le chemin', '/images/illustrations/foretautomne.png', 4),
(37, 'Labyrinth Jareth et Sarah', '/images/illustrations/labyrinthdoodles.png', 4),
(38, 'Illustration Sous-bois ', '/images/illustrations/sousbois2.png', 4),
(39, 'Illustration Sous-bois d\'automne ', '/images/illustrations/sousbois.png', 4),
(40, 'Etude Arbres fa?on Evind Earle', '/images/illustrations/trees.png', 4),
(41, 'La retraite', '/images/illustrations-type-presse/5.png', 5),
(42, 'Illustration Le capitalisme', '/images/illustrations-type-presse/dessin14.png', 5),
(43, 'Illustration Economie', '/images/illustrations-type-presse/dessin21.png', 5),
(44, 'Illustration Champagne ', '/images/illustrations-type-presse/dessin9.png', 5),
(45, 'Balance ?conomie', '/images/illustrations-type-presse/illu14.png', 5),
(46, 'Charadesign Elf', '/images/personnages/2.png', 1),
(47, 'Charadesign ?poque 18e', '/images/personnages/2b.png', 1),
(48, 'Charadesign sorci?re Baba Yaga', '/images/personnages/3.png', 1),
(49, 'Charadesign la perplexit? d\'une petite Sir?ne', '/images/personnages/3b.png', 1),
(50, 'Croquis ?charpe fluffy', '/images/personnages/4.png', 1),
(51, 'Croquis Sir?ne', '/images/personnages/9.png', 1),
(52, 'Charadesign Pepsi-girl', '/images/personnages/80\'s.png', 1),
(53, 'Charadesign petite fille victorienne', '/images/personnages/A.png', 1),
(54, 'Dessin Visage Jeune femme', '/images/personnages/endeduplookinglikepocahontas.png', 1),
(55, 'Charadesign Lutin-Laitue', '/images/personnages/gnomesalade.png', 1),
(56, 'Illustration Nope', '/images/personnages/grmpf.png', 1),
(57, 'Dessin Hades et Persehone', '/images/personnages/hadespersephone.png', 1),
(58, 'Dessin Hades et Persephone 2', '/images/personnages/hadesperse.png', 1),
(59, 'Mermays Trio de sir?nes', '/images/personnages/mermays.png', 1),
(60, 'Paysanne et son changelin', '/images/personnages/mothergoblinson.png', 1),
(61, 'Charadesign Sasquatch', '/images/personnages/sasquatch.png', 1),
(62, 'Illustration Dressage de dragon', '/images/illustrations/Illustration Dressage de dragon.png', 4),
(63, 'Illustration La bougie', '/images/illustrations/Illustration La bougie.png', 4),
(64, 'Illustration La lecure', '/images/illustrations/Illustration La lecure.png', 4),
(65, 'Illustration Profil Antoinette', '/images/illustrations/Illustration Profil Antoinette.png', 4),
(66, 'Illustration Romance', '/images/illustrations/Illustration Romance.png', 4),
(67, 'Illustration Sorci?re aux plantes', '/images/illustrations/Illustration Sorci?re aux plantes.png', 4),
(68, 'Illustration esprits de la for', '/images/illustrations/Illustration esprits de la for?t.png', 4),
(69, 'Croquis Le tr?sor', '/images/illustrations/Croquis Le tr?sor.png', 4),
(70, 'Gif princesse des neignes', '/images/personnages/elsa.gif', 1),
(71, 'Dessin de chat', '/images/animaux/Bribri.png', 6);

-- --------------------------------------------------------

--
-- Structure de la table `travaux`
--

DROP TABLE IF EXISTS `travaux`;
CREATE TABLE IF NOT EXISTS `travaux` (
  `id_travaux` int(11) NOT NULL AUTO_INCREMENT,
  `slug` text NOT NULL,
  `libelle_travaux` text NOT NULL,
  PRIMARY KEY (`id_travaux`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `travaux`
--

INSERT INTO `travaux` (`id_travaux`, `slug`, `libelle_travaux`) VALUES
(1, 'personnages', 'Personnages'),
(2, 'encres', 'Encres'),
(3, 'aquarelles', 'Aquarelles'),
(4, 'illustrations', 'Illustrations'),
(5, 'illustrations_type_presse', 'Illustrations-type-presse'),
(6, 'animaux', 'Animaux');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
