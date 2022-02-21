-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  mar. 20 juil. 2021 à 07:00
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
-- Base de données :  `formation`
--

-- --------------------------------------------------------

--
-- Structure de la table `membres`
--

DROP TABLE IF EXISTS `membres`;
CREATE TABLE IF NOT EXISTS `membres` (
  `id_membre` int(11) NOT NULL AUTO_INCREMENT,
  `nom_membre` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `login_membre` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_membre`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `membres`
--

INSERT INTO `membres` (`id_membre`, `nom_membre`, `login_membre`) VALUES
(3, 'HOUAM', 'Mehdi'),
(4, 'MIDON', 'Julie'),
(5, 'ROLLAN', 'Shaquille'),
(8, 'BERNABEN', 'Brandon'),
(9, 'BORDAS', 'Thomas'),
(10, 'GAONAC\'H', 'Léo'),
(12, 'LAGARDE-MARTIAL', 'Julien'),
(14, 'MESTDAGH', 'Christophe'),
(15, 'RAFFY', 'Jason'),
(16, 'RIVA', 'Nicolas'),
(55, 'VERCELLY', 'Pierre-Xavier'),
(56, 'FOIDEFOND', 'Olivier'),
(57, 'AMOUROUX', 'Clément'),
(60, 'MEGERT', 'Romaric');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
