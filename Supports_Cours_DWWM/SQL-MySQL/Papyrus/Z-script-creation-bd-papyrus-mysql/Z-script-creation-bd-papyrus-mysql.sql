-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           5.1.53-community-log - MySQL Community Server (GPL)
-- Serveur OS:                   Win64
-- HeidiSQL Version:             8.1.0.4545
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Export de la structure de la base pour papyrus
DROP DATABASE IF EXISTS `papyrus`;
CREATE DATABASE IF NOT EXISTS `papyrus` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci */;
USE `papyrus`;


-- Export de la structure de table papyrus. fournis
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


-- Export de la structure de table papyrus. produit
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


-- Export de la structure de table papyrus. vente
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
  KEY `NUMFOU` (`NUMFOU`),
  CONSTRAINT `vente_ibfk_1` FOREIGN KEY (`NUMFOU`) REFERENCES `fournis` (`NUMFOU`),
  CONSTRAINT `vente_ibfk_2` FOREIGN KEY (`CODART`) REFERENCES `produit` (`CODART`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
