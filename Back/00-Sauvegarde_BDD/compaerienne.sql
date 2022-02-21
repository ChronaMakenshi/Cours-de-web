-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 21 fév. 2020 à 14:10
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
-- Base de données :  `compaerienne`
--

-- --------------------------------------------------------

--
-- Structure de la table `avion`
--

DROP TABLE IF EXISTS `avion`;
CREATE TABLE IF NOT EXISTS `avion` (
  `AV` int(11) NOT NULL AUTO_INCREMENT,
  `AVMARQ` varchar(30) NOT NULL,
  `AVNOM` varchar(30) NOT NULL,
  `CAP` int(11) NOT NULL,
  `LOC` varchar(30) NOT NULL,
  PRIMARY KEY (`AV`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `avion`
--

INSERT INTO `avion` (`AV`, `AVMARQ`, `AVNOM`, `CAP`, `LOC`) VALUES
(1, 'AIRBUS', 'A320', 300, 'Nice'),
(2, 'BOEING', 'B707', 250, 'Paris'),
(3, 'AIRBUS', 'A320', 300, 'Toulouse'),
(4, 'CARAVELLE', 'Caravelle', 200, 'Toulouse'),
(5, 'BOEING', 'B747', 400, 'Paris'),
(6, 'AIRBUS', 'A320', 300, 'Grenoble'),
(7, 'ATR', 'ATR42', 50, 'Paris'),
(8, 'BOEING', 'B727', 300, 'Lyon'),
(9, 'BOEING', 'B727', 300, 'Nantes'),
(10, 'AIRBUS', 'A340', 350, 'Bastia');

-- --------------------------------------------------------

--
-- Structure de la table `pilote`
--

DROP TABLE IF EXISTS `pilote`;
CREATE TABLE IF NOT EXISTS `pilote` (
  `PIL` int(11) NOT NULL AUTO_INCREMENT,
  `PILNOM` varchar(30) NOT NULL,
  `ADR` varchar(30) NOT NULL,
  PRIMARY KEY (`PIL`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pilote`
--

INSERT INTO `pilote` (`PIL`, `PILNOM`, `ADR`) VALUES
(1, 'SERGE', 'Nice'),
(2, 'JEAN', 'Paris'),
(3, 'CLAUDE', 'Grenoble'),
(4, 'ROBERT', 'Nantes'),
(5, 'MICHEL', 'Paris'),
(6, 'LUCIEN', 'Toulouse'),
(7, 'BERTRAND', 'Lyon'),
(8, 'HERVE', 'Bastia'),
(9, 'LUC', 'Paris');

-- --------------------------------------------------------

--
-- Structure de la table `vol`
--

DROP TABLE IF EXISTS `vol`;
CREATE TABLE IF NOT EXISTS `vol` (
  `VOL` int(11) NOT NULL AUTO_INCREMENT,
  `AV` int(11) NOT NULL,
  `PIL` int(11) NOT NULL,
  `VD` varchar(30) NOT NULL,
  `VA` varchar(30) NOT NULL,
  `HD` int(11) NOT NULL,
  `HA` int(11) NOT NULL,
  PRIMARY KEY (`VOL`),
  KEY `AV` (`AV`),
  KEY `PIL` (`PIL`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vol`
--

INSERT INTO `vol` (`VOL`, `AV`, `PIL`, `VD`, `VA`, `HD`, `HA`) VALUES
(1, 1, 1, 'NICE', 'PARIS', 7, 9),
(2, 1, 2, 'PARIS', 'TOULOUSE', 11, 12),
(3, 2, 1, 'PARIS', 'NICE', 12, 14),
(4, 6, 3, 'GRENOBLE', 'TOULOUSE', 9, 11),
(5, 6, 3, 'TOULOUSE', 'GRENOBLE', 17, 19),
(6, 8, 7, 'LYON', 'PARIS', 6, 7),
(7, 10, 8, 'BASTIA', 'PARIS', 10, 13),
(8, 7, 9, 'PARIS', 'BRIVE', 7, 8),
(9, 7, 9, 'BRIVE', 'PARIS', 19, 20),
(10, 8, 7, 'PARIS', 'LYON', 18, 19),
(11, 3, 2, 'TOULOUSE', 'PARIS', 15, 16),
(12, 2, 4, 'NICE', 'NANTES', 17, 19);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `vol`
--
ALTER TABLE `vol`
  ADD CONSTRAINT `vol_ibfk_1` FOREIGN KEY (`AV`) REFERENCES `avion` (`AV`),
  ADD CONSTRAINT `vol_ibfk_2` FOREIGN KEY (`PIL`) REFERENCES `pilote` (`PIL`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
