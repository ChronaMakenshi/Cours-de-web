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
-- Base de données :  `abi_commercial`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `IDCLIENT` int(11) NOT NULL AUTO_INCREMENT,
  `IDSECT` int(11) NOT NULL,
  `RAISONSOCIALE` char(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ADRESSECLIENT` char(32) DEFAULT NULL,
  `CODEPOSTALCLIENT` char(5) DEFAULT NULL,
  `VILLECLIENT` char(25) DEFAULT NULL,
  `CA` int(11) DEFAULT NULL,
  `EFFECTIF` int(11) DEFAULT NULL,
  `TELEPHONECLIENT` char(15) DEFAULT NULL,
  `TYPECLIENT` char(10) NOT NULL,
  `NATURECLIENT` char(15) NOT NULL,
  `COMMENTAIRECLIENT` longtext,
  PRIMARY KEY (`IDCLIENT`),
  KEY `FK_AVOIRPOURSECTEUR` (`IDSECT`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`IDCLIENT`, `IDSECT`, `RAISONSOCIALE`, `ADRESSECLIENT`, `CODEPOSTALCLIENT`, `VILLECLIENT`, `CA`, `EFFECTIF`, `TELEPHONECLIENT`, `TYPECLIENT`, `NATURECLIENT`, `COMMENTAIRECLIENT`) VALUES
(1, 1, 'AgroCorp', 'Allassac', '19240', 'Allassac', 150000, 2000, '06 23 56 12 14', 'Public', 'Principale', ''),
(2, 1, 'Perlim', '32 Rue des allouettes', '19300', 'Brive', 1500000, 2000, '0555231245', 'Public', 'Principale', 'En approche'),
(3, 1, 'AgriMoon', '12 Rue des lampions', '19500', 'Objat', 80000, 12, '0555121415', 'Public', 'Principale', 'En approche'),
(4, 3, 'AgriGel', '10 Rue des lapins', '87000', 'Limoges', 40000, 10, '0555457458', 'Public', 'Principale', 'En attente'),
(5, 2, 'Alliance', '102 Rue des maturins', '75000', 'Paris', 100000, 100, '0555454512', 'Public', 'Principale', 'En attente'),
(10, 3, 'Silice', '79 Rue des Maturins', '75008', 'Paris', 100000, 150, '612121212', 'privé', 'secondaire', 'En négociation');

-- --------------------------------------------------------

--
-- Structure de la table `commander`
--

DROP TABLE IF EXISTS `commander`;
CREATE TABLE IF NOT EXISTS `commander` (
  `IDCLIENT` int(11) NOT NULL,
  `CODEPROJET` int(11) NOT NULL,
  PRIMARY KEY (`IDCLIENT`,`CODEPROJET`),
  KEY `FK_COMMANDER2` (`CODEPROJET`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commander`
--

INSERT INTO `commander` (`IDCLIENT`, `CODEPROJET`) VALUES
(1, 2),
(1, 4),
(2, 1),
(2, 2),
(2, 3),
(3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `IDCONTACT` int(11) NOT NULL AUTO_INCREMENT,
  `IDCLIENT` int(11) DEFAULT NULL,
  `IDFONC` int(11) DEFAULT NULL,
  `NOMCONTACT` char(32) NOT NULL,
  `PRENOMCONTACT` char(32) NOT NULL,
  `TELCONTACT` char(15) NOT NULL,
  `EMAILCONTACT` char(50) DEFAULT NULL,
  `PHOTO` char(255) DEFAULT NULL,
  `DUREE` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDCONTACT`),
  KEY `FK_ASSOCIATION_5` (`IDFONC`),
  KEY `FK_TRAVAILLERPOUR` (`IDCLIENT`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `contacts`
--

INSERT INTO `contacts` (`IDCONTACT`, `IDCLIENT`, `IDFONC`, `NOMCONTACT`, `PRENOMCONTACT`, `TELCONTACT`, `EMAILCONTACT`, `PHOTO`, `DUREE`) VALUES
(3, 3, 4, 'Valadas', 'Alain', '0645123655', 'alain.valadas@agrimoon.com', '/photos/valadas.png', 50),
(2, 1, 1, 'Cordier', 'Alexandre', '0658565452', 'alexandre.cordier@agrocorp.com', '/photos/cordier.png', 120);

-- --------------------------------------------------------

--
-- Structure de la table `documents`
--

DROP TABLE IF EXISTS `documents`;
CREATE TABLE IF NOT EXISTS `documents` (
  `IDDOC` int(11) NOT NULL AUTO_INCREMENT,
  `IDCONTACT` int(11) DEFAULT NULL,
  `TITRE` char(255) NOT NULL,
  `RESUME` char(255) DEFAULT NULL,
  `DATEEDITION` date DEFAULT NULL,
  PRIMARY KEY (`IDDOC`),
  KEY `FK_PUBLIER` (`IDCONTACT`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `documents`
--

INSERT INTO `documents` (`IDDOC`, `IDCONTACT`, `TITRE`, `RESUME`, `DATEEDITION`) VALUES
(1, 2, 'Titre1', 'Resumé1', '2018-04-03');

-- --------------------------------------------------------

--
-- Structure de la table `fonction`
--

DROP TABLE IF EXISTS `fonction`;
CREATE TABLE IF NOT EXISTS `fonction` (
  `IDFONC` int(11) NOT NULL AUTO_INCREMENT,
  `FONCTION` char(25) NOT NULL,
  PRIMARY KEY (`IDFONC`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fonction`
--

INSERT INTO `fonction` (`IDFONC`, `FONCTION`) VALUES
(1, 'Directeur'),
(2, 'Responsable Commercial'),
(3, 'DRH'),
(4, 'Manager'),
(5, 'Responsable Développement'),
(6, 'Directeur Adjoint');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `membres`
--

INSERT INTO `membres` (`id_membre`, `nom_membre`, `login_membre`) VALUES
(2, 'BERNARD', 'Damien'),
(3, 'BORROU', 'Enzo'),
(4, 'LACOMBE', 'Isabelle'),
(5, 'CANARD', 'Krystyna'),
(6, 'PARNY', 'Bledi'),
(8, 'BOULESQUES', 'Phil'),
(9, 'WEBER', 'Alan'),
(10, 'COULIBALY', 'Bourama'),
(11, 'BENBAKIR', 'Khélis'),
(12, 'GINEZ', 'Maxime'),
(13, 'RICARD', 'Maxime'),
(14, 'DUNAIS', 'David'),
(15, 'BONSARD', 'Benj'),
(16, 'AJLIL', 'Khalid');

-- --------------------------------------------------------

--
-- Structure de la table `projets`
--

DROP TABLE IF EXISTS `projets`;
CREATE TABLE IF NOT EXISTS `projets` (
  `CODEPROJET` int(11) NOT NULL AUTO_INCREMENT,
  `ABREGEPROJET` char(10) NOT NULL,
  `NOMPROJET` char(32) NOT NULL,
  `TYPEPROJET` char(25) NOT NULL,
  PRIMARY KEY (`CODEPROJET`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `projets`
--

INSERT INTO `projets` (`CODEPROJET`, `ABREGEPROJET`, `NOMPROJET`, `TYPEPROJET`) VALUES
(1, 'Intra', 'IntranetPro', 'Développement'),
(2, 'Model', 'Modéle', 'Fonctionnel'),
(3, 'Xperview', 'Intranet Logistique', 'Tactic'),
(4, 'ScyLab', 'Extranet Labo', 'CMS');

-- --------------------------------------------------------

--
-- Structure de la table `secteur_activite`
--

DROP TABLE IF EXISTS `secteur_activite`;
CREATE TABLE IF NOT EXISTS `secteur_activite` (
  `IDSECT` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVITE` char(25) NOT NULL,
  PRIMARY KEY (`IDSECT`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `secteur_activite`
--

INSERT INTO `secteur_activite` (`IDSECT`, `ACTIVITE`) VALUES
(1, 'Agroalimentaire'),
(2, 'Céréales'),
(3, 'Grande Distribution');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `IDUSER` int(11) NOT NULL AUTO_INCREMENT,
  `LOGINUSER` char(50) NOT NULL,
  `PASSUSER` char(15) NOT NULL,
  PRIMARY KEY (`IDUSER`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`IDUSER`, `LOGINUSER`, `PASSUSER`) VALUES
(1, 'RespCom', 'RespCom'),
(2, 'RespDev', 'RespDev');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
