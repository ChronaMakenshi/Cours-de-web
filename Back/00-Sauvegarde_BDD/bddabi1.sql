-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 21 fév. 2020 à 14:12
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
-- Base de données :  `bddabi1`
--

DELIMITER $$
--
-- Procédures
--
DROP PROCEDURE IF EXISTS `maj_prix`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `maj_prix` (IN `coef` FLOAT)  BEGIN
          UPDATE T1 SET PRICE = PRICE * coef;
      END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `idClient` int(11) NOT NULL AUTO_INCREMENT,
  `idSect` int(11) NOT NULL,
  `raisonSociale` char(50) NOT NULL,
  `adresseClient` char(32) NOT NULL,
  `codePostalClient` char(5) NOT NULL,
  `villeClient` char(25) NOT NULL,
  `CA` int(11) NOT NULL,
  `effectif` int(11) NOT NULL,
  `telephoneClient` char(15) NOT NULL,
  `typeClient` char(10) NOT NULL,
  `natureClient` char(15) NOT NULL,
  `commentaireClient` longtext NOT NULL,
  PRIMARY KEY (`idClient`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`idClient`, `idSect`, `raisonSociale`, `adresseClient`, `codePostalClient`, `villeClient`, `CA`, `effectif`, `telephoneClient`, `typeClient`, `natureClient`, `commentaireClient`) VALUES
(2, 1, 'AgriCorp', '32 Rue des allouettes', '19033', 'Brive', 1500000, 2000, '0555231245', 'Public', 'Secondaire', 'En approche'),
(3, 2, 'AgriMoon', '12 Rue des lampions', '19500', 'Objat', 80000, 12, '0555121415', 'Public', 'Principale', 'En approche'),
(4, 3, 'AgriGel', '10 Rue des lapins', '87000', 'Limoges', 40000, 10, '0555457458', 'Privé', 'Principale', 'En attente'),
(10, 3, 'Silice', '79 Rue des Maturins', '75008', 'Paris', 100000, 150, '0612121212', 'Privé', 'Principale', 'En négociation'),
(11, 1, 'Dastin', '89 Rue des anges', '81000', 'Narbonne', 45000, 60, '2323232323', 'Privé', 'Principale', 'En attente de validation'),
(13, 2, 'Accenture Agro', '99 Rue des granges', '31000', 'Toulouse', 800000, 600, '0145477896', 'Privé', 'Secondaire', 'Client avec un fort potentiel de développement'),
(18, 2, 'Xander', '12 rue Galiénie', '92300', 'Levallois Perret', 180000, 300, '0356895874', 'Public', 'Secondaire', 'Client vraiment très très intéressant !!!'),
(19, 1, 'Brut', '78 rue des fushias', '75002', 'Paris', 1000000, 2000, '0212457889', 'Privé', 'Secondaire', 'On avance\r\n');

-- --------------------------------------------------------

--
-- Structure de la table `commander`
--

DROP TABLE IF EXISTS `commander`;
CREATE TABLE IF NOT EXISTS `commander` (
  `idClient` int(11) NOT NULL,
  `codeProjet` int(11) NOT NULL,
  PRIMARY KEY (`idClient`,`codeProjet`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commander`
--

INSERT INTO `commander` (`idClient`, `codeProjet`) VALUES
(1, 2),
(1, 4),
(1, 5),
(2, 1),
(2, 2),
(2, 3),
(2, 5),
(3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `idContact` int(11) NOT NULL AUTO_INCREMENT,
  `idClient` int(11) NOT NULL,
  `idFonc` int(11) NOT NULL,
  `nomContact` char(32) NOT NULL,
  `prenomContact` char(32) NOT NULL,
  `telContact` char(15) NOT NULL,
  `emailContact` char(50) NOT NULL,
  `photo` char(255) NOT NULL,
  `duree` int(11) NOT NULL,
  PRIMARY KEY (`idContact`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `contacts`
--

INSERT INTO `contacts` (`idContact`, `idClient`, `idFonc`, `nomContact`, `prenomContact`, `telContact`, `emailContact`, `photo`, `duree`) VALUES
(1, 2, 5, 'Mounier', 'Alain', '0612131514', 'alain.mounier@perlim.com', '/photos/mounier.png', 25),
(2, 1, 2, 'Cordier', 'Alexandre', '0658565452', 'alexandre.cordier@agrocorp.com', '/photos/cordier.png', 200),
(3, 3, 1, 'Valadas', 'Alain', '0645123655', 'alain.valadas@agrimoon.com', '/photos/valadas.png', 50),
(4, 1, 3, 'Haller', 'Philippe', '0689632314', 'philippe.haller@agrocorp.com', '/photos/haller.png', 65),
(6, 1, 2, 'Breton', 'Thierry', '06 56 23 21 45', 'breton.thierry@gmail.com', '/photos/breton.jpeg', 30),
(9, 24, 3, 'Test', 'Test', '0112121212', 'fsddsds@dsds.com', 'test.png', 50);

-- --------------------------------------------------------

--
-- Structure de la table `documents`
--

DROP TABLE IF EXISTS `documents`;
CREATE TABLE IF NOT EXISTS `documents` (
  `idDoc` int(11) NOT NULL AUTO_INCREMENT,
  `idContact` int(11) NOT NULL,
  `titre` char(255) NOT NULL,
  `resume` char(255) NOT NULL,
  `dateEdition` date NOT NULL,
  PRIMARY KEY (`idDoc`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `fonction`
--

DROP TABLE IF EXISTS `fonction`;
CREATE TABLE IF NOT EXISTS `fonction` (
  `idFonc` int(11) NOT NULL AUTO_INCREMENT,
  `fonction` char(25) NOT NULL,
  PRIMARY KEY (`idFonc`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fonction`
--

INSERT INTO `fonction` (`idFonc`, `fonction`) VALUES
(1, 'Commercial'),
(2, 'Drh'),
(3, 'Responsable Logistique'),
(4, 'Agent technique'),
(5, 'Manager District');

-- --------------------------------------------------------

--
-- Structure de la table `projets`
--

DROP TABLE IF EXISTS `projets`;
CREATE TABLE IF NOT EXISTS `projets` (
  `codeProjet` int(11) NOT NULL AUTO_INCREMENT,
  `abregeProjet` char(10) NOT NULL,
  `nomProjet` char(32) NOT NULL,
  `typeProjet` char(25) NOT NULL,
  PRIMARY KEY (`codeProjet`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `projets`
--

INSERT INTO `projets` (`codeProjet`, `abregeProjet`, `nomProjet`, `typeProjet`) VALUES
(1, 'Intra', 'IntranetPro', 'Développement'),
(2, 'Model', 'Modéle SAS', 'Fonctionnel'),
(3, 'Xperview', 'Intranet Logistique', 'Tactic'),
(4, 'ScyLab', 'Extranet Labo', 'CMS'),
(5, 'ArchiMan', 'Architecture Reseau', 'Ldap');

-- --------------------------------------------------------

--
-- Structure de la table `secteuractivite`
--

DROP TABLE IF EXISTS `secteuractivite`;
CREATE TABLE IF NOT EXISTS `secteuractivite` (
  `idSect` int(11) NOT NULL AUTO_INCREMENT,
  `activite` char(25) NOT NULL,
  PRIMARY KEY (`idSect`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `secteuractivite`
--

INSERT INTO `secteuractivite` (`idSect`, `activite`) VALUES
(1, 'Agroalimentaire'),
(2, 'Cereales'),
(3, 'Grande Distribution');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `loginUser` char(50) NOT NULL,
  `passUser` char(15) NOT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `idUser` (`idUser`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`idUser`, `loginUser`, `passUser`) VALUES
(1, 'RespCom', 'RespCom'),
(2, 'RespDev', 'RespDev');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
