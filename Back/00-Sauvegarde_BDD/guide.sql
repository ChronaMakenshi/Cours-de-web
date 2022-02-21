-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 21 fév. 2020 à 14:09
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
-- Base de données :  `guide`
--

-- --------------------------------------------------------

--
-- Structure de la table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
CREATE TABLE IF NOT EXISTS `restaurant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `adresse` text NOT NULL,
  `prix` double NOT NULL,
  `commentaires` text NOT NULL,
  `note` double NOT NULL,
  `visite` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `restaurant`
--

INSERT INTO `restaurant` (`id`, `nom`, `adresse`, `prix`, `commentaires`, `note`, `visite`) VALUES
(2, 'La Marinade', '54, chemin des Amarantes 44000 Nantes', 28, 'Excellents poissons. Service convenable. Cave bien fournie', 14, '18/05/2008'),
(3, 'Chez Zalbâr', '30, Boulevard Gouvion Saint Cyr 75017 Paris', 40, 'Spécialités algéroises de premier choix. Pâtisseries délicates, tajines envoûtantes. Le décor participe au dépaysement. Evasion garantie', 15, '30/01/2019'),
(4, 'En Cuisine', '25, rue des Ardoises 19300 Brive', 55, 'Spécialités Corréziennes remises au goût du jour. Produits de qualité. Excellente prestation', 18, '28/06/2016'),
(5, 'Le Diepp', '8, rue des Albinos 75008 Paris', 51, 'Spécialités Asiatiques. Produits très frais. Cadre très agréable. Pour les sorties de prestige.', 18, '05/02/2019'),
(12, 'Le Napoli', '25, rue des Navarins 19300 Brive', 50, 'Excellent plats Italiens de tradition. Cadre agréable.', 15, '15/02/2019');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
