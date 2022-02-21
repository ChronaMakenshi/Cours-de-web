-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  Dim 13 déc. 2020 à 14:29
-- Version du serveur :  8.0.18
-- Version de PHP :  7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `immobilier`
--

-- --------------------------------------------------------

--
-- Structure de la table `appart`
--

DROP TABLE IF EXISTS `appart`;
CREATE TABLE IF NOT EXISTS `appart` (
  `noappart` int(11) NOT NULL,
  `noimm` char(5) NOT NULL,
  `nbrepieces` int(11) NOT NULL,
  `prix` decimal(8,0) NOT NULL,
  `surface` decimal(4,2) NOT NULL,
  PRIMARY KEY (`noappart`),
  KEY `FK_appart_immeuble` (`noimm`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `appart`
--

INSERT INTO `appart` (`noappart`, `noimm`, `nbrepieces`, `prix`, `surface`) VALUES
(10, '1', 3, '500', '25.00'),
(20, '1', 2, '400', '25.00'),
(30, '2', 2, '300', '20.00'),
(40, '2b', 4, '700', '50.00'),
(50, '3', 4, '500', '50.00'),
(60, '3', 2, '400', '40.00'),
(70, '3b', 4, '600', '60.00'),
(80, '4', 2, '400', '25.00');

-- --------------------------------------------------------

--
-- Structure de la table `immeuble`
--

DROP TABLE IF EXISTS `immeuble`;
CREATE TABLE IF NOT EXISTS `immeuble` (
  `noimm` char(5) NOT NULL,
  `adresse` char(50) NOT NULL,
  `ville` char(30) NOT NULL,
  PRIMARY KEY (`noimm`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `immeuble`
--

INSERT INTO `immeuble` (`noimm`, `adresse`, `ville`) VALUES
('1', 'route de l\'analyse', 'Caen'),
('2', 'chemin de la raison', 'Rouen'),
('2b', 'détour du code', 'Le Havre'),
('3', 'impasse des exceptions', 'Le Havre'),
('3b', 'rue des sources', 'Caen'),
('4', 'bd des objets', 'Le Mans');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
