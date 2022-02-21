-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 21 fév. 2020 à 14:02
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
-- Base de données :  `papyrus`
--

DELIMITER $$
--
-- Procédures
--
DROP PROCEDURE IF EXISTS `prc_CA_Fournisseur`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_CA_Fournisseur` (IN `numfou` DECIMAL(10), IN `datcom` TIMESTAMP)  NO SQL
SELECT SUM(priuni*qtecde) AS CA
 FROM entcom
 INNER JOIN ligcom ON entcom.numcom = ligcom.numcom
 WHERE numfou= 9180
 AND EXTRACT(YEAR FROM datcom) = '2015'$$

DROP PROCEDURE IF EXISTS `prc_LST_Commandes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_LST_Commandes` (IN `OBSCOM` VARCHAR(25))  NO SQL
SELECT ligcom.numcom, fournis.nomfou, libart
FROM entcom
 INNER JOIN fournis
 ON entcom.numfou = fournis.numfou
 INNER JOIN ligcom
 ON entcom.numcom = ligcom.numcom
 INNER JOIN produit
 ON ligcom.codart = produit.codart
WHERE obscom LIKE '%' || 'urgent' || '%'$$

DROP PROCEDURE IF EXISTS `prc_LST_fournis`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_LST_fournis` ()  NO SQL
SELECT DISTINCT numfou FROM entcom$$

--
-- Fonctions
--
DROP FUNCTION IF EXISTS `fn_CA_Fournisseur`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_CA_Fournisseur` (`v_numfou` DECIMAL(10,0), `annee` INT) RETURNS DECIMAL(10,2) NO SQL
BEGIN
 DECLARE ca DECIMAL(10,2);

 SELECT SUM(qtecde*priuni*1.2060) INTO ca
 FROM entcom
 INNER JOIN ligcom
 ON entcom.numcom = ligcom.numcom
 WHERE EXTRACT(YEAR FROM datcom) = annee AND entcom.numfou = v_numfou;
 RETURN ca;
END$$

DROP FUNCTION IF EXISTS `fn_DATEFORMAT`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_DATEFORMAT` (`pdate` DATE, `psep` VARCHAR(5)) RETURNS VARCHAR(20) CHARSET latin1 COLLATE latin1_general_ci READS SQL DATA
BEGIN
 RETURN CONCAT(EXTRACT(DAY FROM pdate), psep, EXTRACT(MONTH FROM pdate),
psep, EXTRACT(YEAR FROM pdate) );
END$$

DROP FUNCTION IF EXISTS `fn_Satisfaction`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_Satisfaction` (`indice` INT) RETURNS VARCHAR(20) CHARSET latin1 COLLATE latin1_general_ci NO SQL
RETURN CASE
 WHEN indice IS NULL THEN 'Sans commentaire'
 WHEN indice =0 THEN 'Sans commentaire'
 WHEN indice BETWEEN 1 AND 2 THEN 'Mauvais'
 WHEN indice BETWEEN 3 AND 4 THEN 'Passable'
 WHEN indice BETWEEN 5 AND 6 THEN 'Moyen'
 WHEN indice BETWEEN 7 AND 8 THEN 'Bon'
 WHEN indice >= 9 THEN 'Excellent'
 END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `entcom`
--

DROP TABLE IF EXISTS `entcom`;
CREATE TABLE IF NOT EXISTS `entcom` (
  `NUMCOM` mediumint(9) NOT NULL AUTO_INCREMENT,
  `NUMFOU` decimal(10,0) DEFAULT NULL,
  `DATCOM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OBSCOM` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`NUMCOM`),
  KEY `FK_ENTCOM_FOURNIS` (`NUMFOU`)
) ENGINE=InnoDB AUTO_INCREMENT=70630 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `entcom`
--

INSERT INTO `entcom` (`NUMCOM`, `NUMFOU`, `DATCOM`, `OBSCOM`) VALUES
(70010, '120', '2014-01-15 14:42:07', NULL),
(70011, '540', '2014-01-15 14:42:07', 'Commande urgente'),
(70020, '9180', '2014-01-15 14:42:07', NULL),
(70025, '9150', '2014-01-15 14:42:07', 'Commande urgente'),
(70210, '120', '2014-01-15 14:42:07', 'Commande cadencée'),
(70250, '8700', '2014-01-15 14:42:07', 'Commande cadencée'),
(70300, '9120', '2014-01-15 14:42:07', NULL),
(70620, '540', '2014-01-15 14:42:07', NULL),
(70625, '120', '2014-01-15 14:42:07', NULL),
(70629, '9180', '2014-01-15 14:42:07', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `fournis`
--

DROP TABLE IF EXISTS `fournis`;
CREATE TABLE IF NOT EXISTS `fournis` (
  `NUMFOU` decimal(10,0) NOT NULL,
  `NOMFOU` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `RUEFOU` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `POSFOU` varchar(5) COLLATE latin1_general_ci NOT NULL,
  `VILFOU` varchar(25) COLLATE latin1_general_ci NOT NULL,
  `CONFOU` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `SATISF` decimal(3,0) DEFAULT NULL,
  PRIMARY KEY (`NUMFOU`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `fournis`
--

INSERT INTO `fournis` (`NUMFOU`, `NOMFOU`, `RUEFOU`, `POSFOU`, `VILFOU`, `CONFOU`, `SATISF`) VALUES
('120', 'GROBRIGAN', '20 rue du papier', '92200', 'papercity', 'georges', '8'),
('540', 'ECLIPSE', '53 rue laisse flotter', '78250', 'bugbugville', 'nestor', '7'),
('8700', 'MEDICIS', '120 rue des plantes', '75014', 'paris', 'lison', NULL),
('9120', 'DICOBOL', '11 rue des sports', '85100', 'roche/yon', 'hercule', '8'),
('9150', 'DEPANPAP', '26 av des loco', '59987', 'coroncountry', 'pollux', '0'),
('9180', 'HURRYTAPE', '68 bvd des octets', '4044', 'Dumpville', 'Track', '10');

--
-- Déclencheurs `fournis`
--
DROP TRIGGER IF EXISTS `before_update_FOURNIS_1`;
DELIMITER $$
CREATE TRIGGER `before_update_FOURNIS_1` BEFORE UPDATE ON `fournis` FOR EACH ROW BEGIN
IF NEW.satisf =8   
THEN
SET NEW.satisf = 10;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `fournis_ind`
--

DROP TABLE IF EXISTS `fournis_ind`;
CREATE TABLE IF NOT EXISTS `fournis_ind` (
  `NUMFOU` decimal(10,0) NOT NULL,
  `NOMFOU` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `RUEFOU` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `POSFOU` varchar(5) COLLATE latin1_general_ci NOT NULL,
  `VILFOU` varchar(25) COLLATE latin1_general_ci NOT NULL,
  `CONFOU` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `SATISF` decimal(3,0) DEFAULT NULL,
  PRIMARY KEY (`NUMFOU`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `fournis_ind`
--

INSERT INTO `fournis_ind` (`NUMFOU`, `NOMFOU`, `RUEFOU`, `POSFOU`, `VILFOU`, `CONFOU`, `SATISF`) VALUES
('120', 'GROBRIGAN', '20 rue du papier', '92200', 'papercity', 'georges', '8'),
('540', 'ECLIPSE', '53 rue laisse flotter', '78250', 'bugbugville', 'nestor', '7'),
('9120', 'DICOBOL', '11 rue des sports', '85100', 'roche/yon', 'hercule', '8');

-- --------------------------------------------------------

--
-- Structure de la table `ligcom`
--

DROP TABLE IF EXISTS `ligcom`;
CREATE TABLE IF NOT EXISTS `ligcom` (
  `NUMCOM` mediumint(9) NOT NULL,
  `CODART` char(4) COLLATE latin1_general_ci NOT NULL,
  `NUMLIG` decimal(3,0) NOT NULL,
  `QTECDE` decimal(6,0) NOT NULL,
  `PRIUNI` decimal(5,2) NOT NULL,
  `QTELIV` decimal(6,0) DEFAULT NULL,
  `DERLIV` date DEFAULT NULL,
  PRIMARY KEY (`NUMCOM`,`CODART`),
  KEY `FK_LIGCOM_PRODUIT` (`CODART`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `ligcom`
--

INSERT INTO `ligcom` (`NUMCOM`, `CODART`, `NUMLIG`, `QTECDE`, `PRIUNI`, `QTELIV`, `DERLIV`) VALUES
(70010, 'D035', '4', '200', '40.00', '250', '2014-01-15'),
(70010, 'I100', '1', '3000', '470.00', '3000', '2014-01-15'),
(70010, 'I105', '2', '2000', '485.00', '2000', '2014-01-15'),
(70010, 'I108', '3', '1000', '680.00', '1000', '2014-01-15'),
(70010, 'P220', '5', '6000', '999.99', '6000', '2014-01-15'),
(70010, 'P240', '6', '6000', '999.99', '2000', '2014-01-15'),
(70010, 'R080', '2', '10000', '999.99', '10000', '2014-01-15'),
(70011, 'I105', '1', '1000', '600.00', '1000', '2014-01-15'),
(70020, 'B001', '1', '200', '140.00', NULL, '2017-12-31'),
(70020, 'B002', '2', '200', '140.00', NULL, '2017-12-31'),
(70025, 'I100', '1', '1000', '590.00', '1000', '2014-01-15'),
(70025, 'I105', '2', '500', '590.00', '500', '2014-01-15'),
(70210, 'I100', '1', '1000', '470.00', '1000', '2014-01-15'),
(70250, 'P220', '2', '10000', '999.99', '10000', '2014-01-15'),
(70250, 'P230', '1', '15000', '999.99', '12000', '2014-01-15'),
(70300, 'I110', '1', '50', '790.00', '50', '2014-01-15'),
(70620, 'I105', '1', '200', '600.00', '200', '2014-01-15'),
(70625, 'I100', '1', '1000', '470.00', '1000', '2014-01-15'),
(70625, 'P220', '2', '10000', '999.99', '10000', '2014-01-15'),
(70629, 'B001', '1', '200', '140.00', NULL, '2017-12-31'),
(70629, 'B002', '2', '200', '140.00', NULL, '2017-12-31');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `CODART` char(4) COLLATE latin1_general_ci NOT NULL,
  `LIBART` varchar(25) COLLATE latin1_general_ci NOT NULL,
  `STKALE` decimal(7,0) NOT NULL,
  `STKPHY` decimal(7,0) NOT NULL,
  `QTEANN` decimal(7,0) NOT NULL,
  `UNIMES` char(5) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`CODART`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`CODART`, `LIBART`, `STKALE`, `STKPHY`, `QTEANN`, `UNIMES`) VALUES
('B001', 'Bande magnetique 1200', '20', '87', '240', 'unite'),
('B002', 'Bande magnétique 6250', '20', '12', '410', 'unite'),
('D035', 'CD R slim 80 mm', '40', '42', '150', 'B010'),
('D050', 'CD R-W 80mm', '50', '4', '0', 'B010'),
('I100', 'Papier 1 ex continu', '100', '557', '3500', 'B1000'),
('I105', 'Papier 2 ex continu', '75', '5', '2300', 'B1000'),
('I108', 'Papier 3 ex continu', '200', '557', '3500', 'B500'),
('I110', 'Papier 4 ex continu', '10', '12', '63', 'B400'),
('P220', 'Pre-imprime commande', '500', '2500', '24500', 'B500'),
('P230', 'Pre-imprime facture', '500', '250', '12500', 'B500'),
('P240', 'Pre-imprime bulletin paie', '500', '3000', '6250', 'B500'),
('P250', 'Pre-imprime bon livraison', '500', '2500', '24500', 'B500'),
('P270', 'Pre-imprime bon fabricati', '500', '2500', '24500', 'B500'),
('R080', 'ruban Epson 850', '10', '2', '120', 'unite'),
('R132', 'ruban impl 1200 lignes', '25', '200', '182', 'unite');

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

DROP TABLE IF EXISTS `vente`;
CREATE TABLE IF NOT EXISTS `vente` (
  `CODART` char(4) COLLATE latin1_general_ci NOT NULL,
  `NUMFOU` decimal(10,0) NOT NULL,
  `DELLIV` decimal(6,0) NOT NULL,
  `QTE1` decimal(6,0) NOT NULL,
  `PRIX1` decimal(5,2) NOT NULL,
  `QTE2` decimal(6,0) NOT NULL,
  `PRIX2` decimal(5,2) NOT NULL,
  `QTE3` decimal(6,0) NOT NULL,
  `PRIX3` decimal(5,0) NOT NULL,
  PRIMARY KEY (`CODART`,`NUMFOU`),
  KEY `NUMFOU` (`NUMFOU`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `vente`
--

INSERT INTO `vente` (`CODART`, `NUMFOU`, `DELLIV`, `QTE1`, `PRIX1`, `QTE2`, `PRIX2`, `QTE3`, `PRIX3`) VALUES
('B001', '8700', '15', '20', '150.00', '50', '145.00', '100', '140'),
('B002', '8700', '15', '0', '210.00', '50', '200.00', '100', '185'),
('D035', '120', '0', '0', '40.00', '0', '0.00', '0', '0'),
('D035', '9120', '5', '0', '40.00', '100', '30.00', '0', '0'),
('I100', '120', '90', '0', '700.00', '50', '600.00', '120', '500'),
('I100', '540', '70', '0', '710.00', '60', '630.00', '100', '600'),
('I100', '9120', '60', '0', '800.00', '70', '600.00', '90', '500'),
('I100', '9150', '90', '0', '650.00', '90', '600.00', '200', '590'),
('I100', '9180', '30', '0', '720.00', '50', '670.00', '100', '490'),
('I105', '120', '90', '10', '705.00', '50', '630.00', '120', '500'),
('I105', '540', '70', '0', '810.00', '60', '645.00', '100', '600'),
('I105', '8700', '30', '0', '720.00', '50', '670.00', '100', '510'),
('I105', '9120', '60', '0', '920.00', '70', '800.00', '90', '700'),
('I105', '9150', '90', '0', '685.00', '90', '600.00', '200', '590'),
('I108', '120', '90', '5', '795.00', '30', '720.00', '100', '680'),
('I108', '9120', '60', '0', '920.00', '70', '820.00', '100', '780'),
('I110', '9120', '60', '0', '950.00', '70', '850.00', '90', '790'),
('I110', '9180', '90', '0', '900.00', '70', '870.00', '90', '835'),
('R080', '9120', '10', '0', '120.00', '100', '100.00', '0', '0'),
('R132', '9120', '5', '0', '275.00', '0', '0.00', '0', '0');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `entcom`
--
ALTER TABLE `entcom`
  ADD CONSTRAINT `FK_ENTCOM_FOURNIS` FOREIGN KEY (`NUMFOU`) REFERENCES `fournis` (`NUMFOU`) ON DELETE SET NULL;

--
-- Contraintes pour la table `ligcom`
--
ALTER TABLE `ligcom`
  ADD CONSTRAINT `FK_LIGCOM_ENTCOM` FOREIGN KEY (`NUMCOM`) REFERENCES `entcom` (`NUMCOM`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_LIGCOM_PRODUIT` FOREIGN KEY (`CODART`) REFERENCES `produit` (`CODART`);

--
-- Contraintes pour la table `vente`
--
ALTER TABLE `vente`
  ADD CONSTRAINT `vente_ibfk_1` FOREIGN KEY (`NUMFOU`) REFERENCES `fournis` (`NUMFOU`),
  ADD CONSTRAINT `vente_ibfk_2` FOREIGN KEY (`CODART`) REFERENCES `produit` (`CODART`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
