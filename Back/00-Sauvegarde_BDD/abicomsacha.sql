-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 21 fév. 2020 à 14:13
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
-- Base de données :  `abicomsacha`
--

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

DROP TABLE IF EXISTS `activite`;
CREATE TABLE IF NOT EXISTS `activite` (
  `idActivite` int(11) NOT NULL AUTO_INCREMENT,
  `libActivite` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idActivite`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `activite`
--

INSERT INTO `activite` (`idActivite`, `libActivite`) VALUES
(1, 'Administration'),
(2, 'Agro'),
(3, 'Industrie'),
(4, 'Service'),
(5, 'Electronique'),
(6, 'Commerce'),
(7, 'Informatique');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numclient` int(11) DEFAULT NULL,
  `raisonSociale` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `adresse1` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `adresse2` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `codepostal` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `ville` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `telClient` char(15) COLLATE utf8_unicode_ci NOT NULL,
  `typeclientprive` tinyint(1) NOT NULL,
  `idActivite` int(11) DEFAULT '999',
  `idNature` int(11) DEFAULT '999',
  `effectif` int(11) DEFAULT '999',
  `ca` int(11) DEFAULT '999',
  PRIMARY KEY (`id`),
  UNIQUE KEY `numclient` (`numclient`) USING BTREE,
  KEY `client_activite_FK` (`idActivite`),
  KEY `client_nature0_FK` (`idNature`)
) ENGINE=InnoDB AUTO_INCREMENT=1166 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `numclient`, `raisonSociale`, `adresse1`, `adresse2`, `codepostal`, `ville`, `telClient`, `typeclientprive`, `idActivite`, `idNature`, `effectif`, `ca`) VALUES
(4, 1137, 'AgriMoon', '25 rue des Accacias', 'Allassac', '19000', 'Tulle', '0555006633', 1, 2, 2, 89, 300000),
(5, 1125, 'Sacha Corp', '28', 'avenue Colonel Bizot', '75078', 'Paris', '0505050505', 1, 1, 1, 100, 1000000),
(6, 1126, 'Music', '230', 'rue de la musique', '23200', 'Limoges', '0505055566', 1, 5, 1, 12, 200000),
(1144, 1141, 'Mila Corp', '3 rue des Flibustiers', '', '19240', 'Allassac', '0123456789', 1, 5, 3, 100, 800000),
(1151, 1143, 'Xantrax', '5 rue des pépinières', '', '75012', 'Paris', '0101020103', 0, 6, 2, 1, 1),
(1152, 1144, 'Test', 'Test', '', '19240', 'Allassac', '0678541957', 1, 3, 1, 1, 200),
(1157, 1145, 'Surcouf', '12 rue des Prairies', '', '19240', 'Allassac', '0678541957', 1, 5, 2, 100, 700000),
(1163, 1150, 'nicola', 'aazzz', '', '19240', 'allassac', '0201030405', 1, 3, 2, 100, 100000),
(1165, NULL, 'Test', 'test', 'Test', '16000', 'Test', '0555006633', 1, 2, 2, 89, 300000);

--
-- Déclencheurs `client`
--
DROP TRIGGER IF EXISTS `before_insert_client`;
DELIMITER $$
CREATE TRIGGER `before_insert_client` BEFORE INSERT ON `client` FOR EACH ROW BEGIN
    IF (New.codepostal NOT BETWEEN '01000' AND '99999')
    THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erreur : le Code postal n'est pas valide';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `idcontact` int(11) NOT NULL AUTO_INCREMENT,
  `nomContact` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `prenomContact` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `telContact` char(15) COLLATE utf8_unicode_ci DEFAULT '999',
  `emailContact` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fonctionContact` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `numclient` int(11) DEFAULT '999',
  PRIMARY KEY (`idcontact`),
  KEY `contact_client_FK` (`numclient`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`idcontact`, `nomContact`, `prenomContact`, `telContact`, `emailContact`, `fonctionContact`, `numclient`) VALUES
(17, 'XAN', 'xannom', '0101010101', 'xannom@gmail.com', 'Directeur', 1143),
(18, 'EEEEE', 'eeeee', '0101010101', 'eeeee@gmail.com', 'Comptable', 1126),
(19, 'EEEEE', 'eeeee', '0000000000', 'eeee@gmail.com', 'Technicien', 1137),
(23, 'FFFFF', 'fffff', '0202020202', 'fffff@gmail.com', 'Directeur', 1137),
(24, 'CONTACT1', 'contact1', '0101010101', 'contact1@gmail.com', 'Comptable', 1141),
(26, 'CONTACT2', 'contact2', '0202020202', 'contact2@gmail.com', 'Directeur', 1141),
(27, 'CONTACT3', 'contact3', '0102030405', 'contact3@gmail.com', 'Comptable', 1141),
(28, 'XAN1', 'xan1', '0102030405', 'xan1@gmail.com', 'Directeur', 1143),
(29, 'XAN2', 'xan2', '0205080104', 'xan2@gmail.com', 'Directeur', 1143);

-- --------------------------------------------------------

--
-- Structure de la table `nature`
--

DROP TABLE IF EXISTS `nature`;
CREATE TABLE IF NOT EXISTS `nature` (
  `idNature` int(11) NOT NULL AUTO_INCREMENT,
  `libNature` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idNature`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `nature`
--

INSERT INTO `nature` (`idNature`, `libNature`) VALUES
(1, 'Principale'),
(2, 'Secondaire'),
(3, 'Ancienne');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_activite_FK` FOREIGN KEY (`idActivite`) REFERENCES `activite` (`idActivite`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_nature0_FK` FOREIGN KEY (`idNature`) REFERENCES `nature` (`idNature`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_client_FK` FOREIGN KEY (`numclient`) REFERENCES `client` (`numclient`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
