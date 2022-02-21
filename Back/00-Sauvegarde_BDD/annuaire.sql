-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 19 fév. 2019 à 13:21
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
-- Base de données :  `annuaire`
--

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

DROP TABLE IF EXISTS `personne`;
CREATE TABLE IF NOT EXISTS `personne` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `telephone` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`id`, `nom`, `telephone`) VALUES
(1, 'Karine Chemin', '0800949950'),
(2, 'Félix Bost', '0766212371'),
(3, 'Karine Van-Dame', '0882600541'),
(4, 'Marie Duchamp', '0624032255'),
(5, 'Fred Van-Dame', '0909943862'),
(6, 'Marie Martin', '0655156160'),
(7, 'Hélène Comin', '0718478186'),
(8, 'François Van-Dame', '0658953586'),
(9, 'Simone Sarfaty', '0859909623'),
(10, 'François Dupont', '0648078508'),
(11, 'Nicolas Charlemagne', '0689625682'),
(12, 'Mila Durand', '0964589196'),
(13, 'Nathalie Valadas', '0995144182'),
(14, 'Raoul Van-Dame', '0904157268'),
(15, 'Bernard Morillon', '0827236871'),
(16, 'Karine Charlemagne', '0691774345'),
(17, 'Marguerite Magnoux', '0707232061'),
(18, 'Cherry Lescure', '0800249269'),
(19, 'Nathalie Bost', '0678462845'),
(20, 'Fred Sarfaty', '0590123920'),
(21, 'Pierre Adam', '0610192216'),
(22, 'François Hoche', '0606402174'),
(23, 'Jerôme Hoche', '0555119327'),
(24, 'Fred Restoueix', '0702511381'),
(25, 'François Martin', '0812606141'),
(26, 'Nicolas Adam', '0700583122'),
(27, 'Sabrina Comin', '0816618697'),
(28, 'Maxime Restoueix', '0899542315'),
(29, 'Fred Dupont', '0630673622'),
(30, 'Simone Duchamp', '0841769775'),
(31, 'Karine Sarfaty', '0771986590'),
(32, 'Maxime Bost', '0570972372'),
(33, 'Félix Hoche', '0561877451'),
(34, 'Cherry Magnoux', '0726787953'),
(35, 'Marie Comin', '0890252006'),
(36, 'Karine Dupont', '0628414258'),
(37, 'Maxime Dupont', '0533346396'),
(38, 'Hélène Van-Dame', '0786716539'),
(39, 'Hélène Lescure', '0972423069'),
(40, 'Marie Valadas', '0761814204'),
(41, 'Nathalie Martin', '0723644859'),
(42, 'Jerôme Comin', '0636500531'),
(43, 'Nicolas Bost', '0877831659'),
(44, 'Nicolas Valadas', '0964696117'),
(45, 'Nicolas Amina', '0576998806'),
(46, 'Pierre Valadas', '0707339533'),
(47, 'Simone Lescure', '0816209611'),
(48, 'Marguerite Amina', '0955815536'),
(49, 'Karine Magnoux', '0873863031'),
(50, 'Pierre Lescure', '0906738543'),
(51, 'Fred Hoche', '0945151225'),
(52, 'Félix Van-Dame', '0996985069'),
(53, 'Simone Durand', '0758387110'),
(54, 'Simone Dupont', '0883086335'),
(55, 'Marguerite Morillon', '0979291114'),
(56, 'Sabrina Dupont', '0617852156'),
(57, 'Simone Restoueix', '0790022756'),
(58, 'Marguerite Martin', '0825039847'),
(59, 'Pierre Sarfaty', '0673071679'),
(60, 'Bernard Martin', '0781039682'),
(61, 'Maxime Hoche', '0635109815'),
(62, 'Nathalie Van-Dame', '0792855632'),
(63, 'Marguerite Lescure', '0939286345'),
(64, 'Simone Magnoux', '0726592710'),
(65, 'Maxime Magnoux', '0652190791'),
(66, 'Karine Martin', '0869280029'),
(67, 'Maxime Lescure', '0836188400'),
(68, 'Nicolas Magnoux', '0905735544'),
(69, 'Karine Valadas', '0695123669'),
(70, 'Marie Adam', '0909314382'),
(71, 'Pierre Bost', '0975742771'),
(72, 'Hélène Dupont', '0568614116'),
(73, 'Bernard Hoche', '0625752933'),
(74, 'Nathalie Comin', '0807970958'),
(75, 'Raoul Lescure', '0803330566'),
(76, 'Mila Hoche', '0648651621'),
(77, 'Pierre Van-Dame', '0506026459'),
(78, 'Pierre Comin', '0794349182'),
(79, 'Mila Charlemagne', '0743757380'),
(80, 'Fred Bost', '0993804122'),
(81, 'Maxime Amina', '0997787840'),
(82, 'Karine Comin', '0606155202'),
(83, 'Nicolas Martin', '0651224633'),
(84, 'Sabrina Magnoux', '0576665592'),
(85, 'Marguerite Charlemagne', '0734765953'),
(86, 'Jerôme Chemin', '0644509880'),
(87, 'Marguerite Adam', '0741877840'),
(88, 'Sabrina Lescure', '0706011304'),
(89, 'Bernard Charlemagne', '0517833209'),
(90, 'François Comin', '0644314856'),
(91, 'Félix Charlemagne', '0978727400'),
(92, 'Hélène Sarfaty', '0766454234'),
(93, 'Raoul Bost', '0679938838'),
(94, 'Pierre Durand', '0826780073'),
(95, 'Nathalie Sarfaty', '0646881938'),
(96, 'Marguerite Sarfaty', '0565941542'),
(97, 'Raoul Chemin', '0780706079'),
(98, 'Raoul Durand', '0707532379'),
(99, 'Cherry Sarfaty', '0711498733'),
(100, 'Simone Van-Dame', '0987895224'),
(101, 'Bernard Restoueix', '0696293871'),
(102, 'Maxime Charlemagne', '0817751529'),
(103, 'Bernard Magnoux', '0506465421'),
(104, 'Maxime Valadas', '0949252511'),
(105, 'Simone Chemin', '0966264846'),
(106, 'Nicolas Dupont', '0753279659'),
(107, 'Hélène Valadas', '0978223201'),
(108, 'Pierre Chemin', '0525546320'),
(109, 'Nathalie Dupont', '0554637951'),
(110, 'Félix Valadas', '0985288215'),
(111, 'Marie Restoueix', '0619588997'),
(112, 'Marie Durand', '0524722090'),
(113, 'Simone Morillon', '0941085498'),
(114, 'Bernard Bost', '0570322353'),
(115, 'Fred Lescure', '0706791890'),
(116, 'Cherry Charlemagne', '0849294419'),
(117, 'Marie Dupont', '0750627534'),
(118, 'Nicolas Durand', '0609960619'),
(119, 'Jerôme Magnoux', '0952737414'),
(120, 'Bernard Lescure', '0588129847'),
(121, 'Mila Duchamp', '0872937682'),
(122, 'Karine Hoche', '0646647249'),
(123, 'Nathalie Hoche', '0703858069'),
(124, 'Félix Duchamp', '0925718189'),
(125, 'Cherry Amina', '0651142798');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `idu` int(11) NOT NULL AUTO_INCREMENT,
  `login` text NOT NULL,
  `mdp` text NOT NULL,
  PRIMARY KEY (`idu`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idu`, `login`, `mdp`) VALUES
(1, 'jean', 'valjean'),
(2, 'victor', 'hugo'),
(3, 'sacha', 'moi');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
