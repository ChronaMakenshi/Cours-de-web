-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 21 fév. 2020 à 14:24
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
-- Base de données :  `clinique`
--

-- --------------------------------------------------------

--
-- Structure de la table `consulte`
--

DROP TABLE IF EXISTS `consulte`;
CREATE TABLE IF NOT EXISTS `consulte` (
  `id_malade` int(11) NOT NULL AUTO_INCREMENT,
  `id_medecins` int(11) NOT NULL,
  `obsevation_consult` text,
  `frais_consultation` int(11) DEFAULT NULL,
  `date_consultation` date DEFAULT NULL,
  PRIMARY KEY (`id_malade`,`id_medecins`),
  KEY `FK_consulte_id_medecins` (`id_medecins`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `consulte`
--

INSERT INTO `consulte` (`id_malade`, `id_medecins`, `obsevation_consult`, `frais_consultation`, `date_consultation`) VALUES
(2, 1, 'problème respiratoire', 100, '2018-03-22'),
(3, 2, 'le patient se plaint des douleurs', 500, '2018-03-22');

-- --------------------------------------------------------

--
-- Structure de la table `laboratoire`
--

DROP TABLE IF EXISTS `laboratoire`;
CREATE TABLE IF NOT EXISTS `laboratoire` (
  `id_labo` int(11) NOT NULL AUTO_INCREMENT,
  `type_examen` varchar(50) DEFAULT NULL,
  `observation_labo` text,
  `date_examen` date DEFAULT NULL,
  `frais_examen` int(11) DEFAULT NULL,
  `malade_id_malade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_labo`),
  KEY `FK_LABORATOIRE_malade_id_malade` (`malade_id_malade`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `laboratoire`
--

INSERT INTO `laboratoire` (`id_labo`, `type_examen`, `observation_labo`, `date_examen`, `frais_examen`, `malade_id_malade`) VALUES
(1, 'simple', '', '2018-03-23', 500, 1),
(2, 'grave', '', '2018-03-23', 400, 2);

-- --------------------------------------------------------

--
-- Structure de la table `malade`
--

DROP TABLE IF EXISTS `malade`;
CREATE TABLE IF NOT EXISTS `malade` (
  `id_malade` int(11) NOT NULL AUTO_INCREMENT,
  `nom_malade` varchar(50) DEFAULT NULL,
  `prenom_malade` varchar(50) DEFAULT NULL,
  `sexe_malade` varchar(2) DEFAULT NULL,
  `adr_malade` varchar(50) DEFAULT NULL,
  `temperature` varchar(15) DEFAULT NULL,
  `poids` float DEFAULT NULL,
  PRIMARY KEY (`id_malade`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `malade`
--

INSERT INTO `malade` (`id_malade`, `nom_malade`, `prenom_malade`, `sexe_malade`, `adr_malade`, `temperature`, `poids`) VALUES
(1, 'sylvain', 'julien', 'M', 'dixin', '50', 70),
(2, 'baldé', 'dilane', 'F', 'maxime', '45', 90),
(3, 'olivier', 'gasim', 'M', 'dixin', '78', 100),
(4, 'florian', 'thierry', 'M', 'maxime', '15', NULL),
(5, 'test', 'sacha', 'M', '35 rue des Lilas', '100', NULL),
(6, 'RESTOUEIX', 'Sacha', 'M', '25 rue des allouettes', '100', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `medecins`
--

DROP TABLE IF EXISTS `medecins`;
CREATE TABLE IF NOT EXISTS `medecins` (
  `id_medecins` int(11) NOT NULL AUTO_INCREMENT,
  `nom_medecins` varchar(50) DEFAULT NULL,
  `prenom_medecins` varchar(50) DEFAULT NULL,
  `sexe_medecins` varchar(2) DEFAULT NULL,
  `adr_medecins` varchar(50) DEFAULT NULL,
  `tel_medecins` varchar(12) DEFAULT NULL,
  `fonction_medecins` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_medecins`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `medecins`
--

INSERT INTO `medecins` (`id_medecins`, `nom_medecins`, `prenom_medecins`, `sexe_medecins`, `adr_medecins`, `tel_medecins`, `fonction_medecins`) VALUES
(1, 'Boris', 'Emonnot', 'M', 'rue paillon', '0672021583', 'Saint etienne'),
(2, 'Emilie', 'Mathelin', 'F', 'rue paillon', '0672021583', 'saint etienne');

-- --------------------------------------------------------

--
-- Structure de la table `traitement`
--

DROP TABLE IF EXISTS `traitement`;
CREATE TABLE IF NOT EXISTS `traitement` (
  `id_trai` int(11) NOT NULL AUTO_INCREMENT,
  `nom_maladie` text,
  `date_debut_trait` date DEFAULT NULL,
  `date_fin_trait` date DEFAULT NULL,
  `frais_trait` int(11) DEFAULT NULL,
  `etat_patient` varchar(50) DEFAULT NULL,
  `malade_id_malade` int(11) DEFAULT NULL,
  `medicament_prescrit` text NOT NULL,
  PRIMARY KEY (`id_trai`),
  KEY `FK_TRAITEMENT_malade_id_malade` (`malade_id_malade`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `traitement`
--

INSERT INTO `traitement` (`id_trai`, `nom_maladie`, `date_debut_trait`, `date_fin_trait`, `frais_trait`, `etat_patient`, `malade_id_malade`, `medicament_prescrit`) VALUES
(1, 'asthme', '2018-03-22', '2018-03-23', 500, 'Poumons clairs', 1, 'ventoline , Flexotide'),
(2, 'Rhumatisme', '2018-02-21', '2018-03-22', 500, ' se plaint de douleurs ', 2, 'Doliprane ');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `consulte`
--
ALTER TABLE `consulte`
  ADD CONSTRAINT `FK_consulte_id_malade` FOREIGN KEY (`id_malade`) REFERENCES `malade` (`id_malade`),
  ADD CONSTRAINT `FK_consulte_id_medecins` FOREIGN KEY (`id_medecins`) REFERENCES `medecins` (`id_medecins`);

--
-- Contraintes pour la table `laboratoire`
--
ALTER TABLE `laboratoire`
  ADD CONSTRAINT `FK_LABORATOIRE_malade_id_malade` FOREIGN KEY (`malade_id_malade`) REFERENCES `malade` (`id_malade`);

--
-- Contraintes pour la table `traitement`
--
ALTER TABLE `traitement`
  ADD CONSTRAINT `FK_TRAITEMENT_malade_id_malade` FOREIGN KEY (`malade_id_malade`) REFERENCES `malade` (`id_malade`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
