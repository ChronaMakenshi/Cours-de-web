-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 21 fév. 2020 à 14:11
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
-- Base de données :  `casvideo`
--

-- --------------------------------------------------------

--
-- Structure de la table `adherent`
--

DROP TABLE IF EXISTS `adherent`;
CREATE TABLE IF NOT EXISTS `adherent` (
  `NUM_ADHERENT` int(4) NOT NULL AUTO_INCREMENT,
  `NOM_ADHERENT` varchar(25) NOT NULL DEFAULT '',
  `PRENOM_ADHERENT` varchar(20) NOT NULL DEFAULT '',
  `ADR_ADHERENT` varchar(32) NOT NULL DEFAULT '',
  `ADR2_ADHERENT` varchar(32) DEFAULT NULL,
  `CODEPOSTAL_ADHERENT` varchar(5) DEFAULT NULL,
  `VILLE_ADHERENT` varchar(25) DEFAULT NULL,
  `TEL_ADHERENT` varchar(15) DEFAULT NULL,
  `DATE_ADHESION` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `REF_PIECE_IDENTITE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`NUM_ADHERENT`),
  KEY `NOM_ADHERENT` (`NOM_ADHERENT`,`PRENOM_ADHERENT`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `adherent`
--

INSERT INTO `adherent` (`NUM_ADHERENT`, `NOM_ADHERENT`, `PRENOM_ADHERENT`, `ADR_ADHERENT`, `ADR2_ADHERENT`, `CODEPOSTAL_ADHERENT`, `VILLE_ADHERENT`, `TEL_ADHERENT`, `DATE_ADHESION`, `REF_PIECE_IDENTITE`) VALUES
(1, 'Adh1', 'Pr?nomAdh1', 'adrAdh1', '', '06300', 'Nice', '0102030405', '2005-12-15 12:01:41', ''),
(2, 'Adh2', 'pr?nomadh2', '32, adr adh 2', NULL, '06500', 'Menton', NULL, '2006-10-03 00:00:00', 'CNI 542345678');

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

DROP TABLE IF EXISTS `film`;
CREATE TABLE IF NOT EXISTS `film` (
  `ID_FILM` int(6) NOT NULL AUTO_INCREMENT,
  `CODE_TYPE_FILM` char(3) NOT NULL DEFAULT '',
  `ID_REALIS` int(4) NOT NULL DEFAULT '0',
  `TITRE_FILM` varchar(100) NOT NULL DEFAULT '',
  `ANNEE_FILM` int(4) NOT NULL DEFAULT '0',
  `REF_IMAGE` varchar(50) DEFAULT NULL,
  `RESUME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_FILM`),
  KEY `CODE_TYPE_FILM` (`CODE_TYPE_FILM`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`ID_FILM`, `CODE_TYPE_FILM`, `ID_REALIS`, `TITRE_FILM`, `ANNEE_FILM`, `REF_IMAGE`, `RESUME`) VALUES
(11, 'AVE', 4, 'LES DENTS DE TA MéRE', 1984, 'dentamere.jpg', 'Maman tu as les plus belles dents au Monde'),
(2, 'POL', 3, 'LE COEUR DES HOMMES 3', 2007, 'coeurdeshommes2.jpg', 'Paroles d\'hommes'),
(4, 'AVE', 2, 'BIG MOVIE', 1990, 'bigmovie.jpg', 'Test'),
(5, 'AVE', 2, 'IL ETAIT UNE FOIS EN AMERIQUE', 1985, 'enAmerique.jpg', 'Sur l\'Amérique'),
(7, 'COM', 3, 'LE SUCRE', 1978, 'sucre.jpg', 'Une Escroquerie financière réunie 2 amis'),
(8, 'AVE', 2, 'BLACKSTORM', 2018, 'blackstorm.jpg', 'Beaucoup de vent !!!'),
(9, 'AVE', 1, 'DEADPOOL', 2017, 'deadpool.jpg', 'Marvel'),
(10, 'AVE', 4, 'TWISTER', 1996, 'twister.jpg', 'Tornades en vue !!!');

-- --------------------------------------------------------

--
-- Structure de la table `location`
--

DROP TABLE IF EXISTS `location`;
CREATE TABLE IF NOT EXISTS `location` (
  `NUM_ADHERENT` int(4) NOT NULL DEFAULT '0',
  `ID_FILM` int(6) NOT NULL DEFAULT '0',
  `CODE_SUPPORT` char(1) NOT NULL DEFAULT '',
  `DEBUT_LOCATION` date NOT NULL DEFAULT '0000-00-00',
  `DATE_RETOUR` date DEFAULT NULL,
  `TARIF_APPLIQUE` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`NUM_ADHERENT`,`ID_FILM`,`CODE_SUPPORT`,`DEBUT_LOCATION`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `location`
--

INSERT INTO `location` (`NUM_ADHERENT`, `ID_FILM`, `CODE_SUPPORT`, `DEBUT_LOCATION`, `DATE_RETOUR`, `TARIF_APPLIQUE`) VALUES
(1, 5, 'D', '2019-01-16', NULL, NULL),
(1, 7, 'D', '2019-01-16', NULL, NULL),
(1, 6, 'D', '2019-01-16', NULL, NULL),
(1, 8, 'D', '2019-01-16', NULL, NULL),
(1, 9, 'D', '2019-01-16', NULL, NULL),
(1, 6, 'D', '2019-01-17', NULL, NULL),
(1, 5, 'D', '2019-01-17', NULL, NULL),
(1, 8, 'D', '2019-01-17', NULL, NULL),
(1, 9, 'D', '2019-01-17', NULL, NULL),
(1, 4, 'D', '2019-01-17', NULL, NULL),
(1, 11, 'D', '2019-01-17', NULL, NULL),
(2, 11, 'D', '2019-01-17', NULL, NULL),
(2, 9, 'D', '2019-01-17', NULL, NULL),
(1, 7, 'D', '2019-02-14', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `star`
--

DROP TABLE IF EXISTS `star`;
CREATE TABLE IF NOT EXISTS `star` (
  `ID_STAR` int(4) NOT NULL AUTO_INCREMENT,
  `NOM_STAR` varchar(25) NOT NULL DEFAULT '',
  `PRENOM_STAR` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID_STAR`),
  KEY `NOM_STAR` (`NOM_STAR`,`PRENOM_STAR`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `star`
--

INSERT INTO `star` (`ID_STAR`, `NOM_STAR`, `PRENOM_STAR`) VALUES
(1, 'Pitt', 'Brad'),
(2, 'De Niro', 'Robert'),
(3, 'Binoche', 'Juliette'),
(4, 'Allen', 'Woody');

-- --------------------------------------------------------

--
-- Structure de la table `support`
--

DROP TABLE IF EXISTS `support`;
CREATE TABLE IF NOT EXISTS `support` (
  `CODE_SUPPORT` char(1) NOT NULL DEFAULT '',
  `LIB_SUPPORT` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`CODE_SUPPORT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `support`
--

INSERT INTO `support` (`CODE_SUPPORT`, `LIB_SUPPORT`) VALUES
('D', 'DVD'),
('K', 'K7 Vid'),
('B', 'Blue Ray');

-- --------------------------------------------------------

--
-- Structure de la table `typefilm`
--

DROP TABLE IF EXISTS `typefilm`;
CREATE TABLE IF NOT EXISTS `typefilm` (
  `CODE_TYPE_FILM` char(3) NOT NULL DEFAULT '',
  `LIB_TYPE_FILM` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`CODE_TYPE_FILM`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `typefilm`
--

INSERT INTO `typefilm` (`CODE_TYPE_FILM`, `LIB_TYPE_FILM`) VALUES
('AVE', 'Aventure'),
('COM', 'Comédie'),
('DES', 'Dessin anim'),
('POL', 'Policier');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
