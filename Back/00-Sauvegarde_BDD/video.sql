-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 21 fév. 2020 à 14:03
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
-- Base de données :  `video`
--

-- --------------------------------------------------------

--
-- Structure de la table `adherent`
--

DROP TABLE IF EXISTS `adherent`;
CREATE TABLE IF NOT EXISTS `adherent` (
  `numero_adherent` int(11) NOT NULL AUTO_INCREMENT,
  `nom_adherent` varchar(50) NOT NULL,
  `prenom_adherent` varchar(50) NOT NULL,
  `adresse_adherent` varchar(50) DEFAULT NULL,
  `adresse2_adherent` varchar(50) DEFAULT NULL,
  `code_postal_adherent` varchar(5) NOT NULL DEFAULT '06000',
  `ville_adherent` varchar(30) DEFAULT NULL,
  `telephone_adherent` varchar(10) DEFAULT NULL,
  `references_pieces_identite` varchar(50) NOT NULL,
  `code_pi` int(11) NOT NULL,
  PRIMARY KEY (`numero_adherent`),
  KEY `Adherant_Type_PI_FK` (`code_pi`),
  KEY `ADHERENT_NOM_PRENOM` (`nom_adherent`,`prenom_adherent`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `adherent`
--

INSERT INTO `adherent` (`numero_adherent`, `nom_adherent`, `prenom_adherent`, `adresse_adherent`, `adresse2_adherent`, `code_postal_adherent`, `ville_adherent`, `telephone_adherent`, `references_pieces_identite`, `code_pi`) VALUES
(5, 'Martin', 'Martin', NULL, NULL, '06000', NULL, NULL, 'fgh5652552', 1),
(6, 'Martin', 'Martin', NULL, NULL, '01000', NULL, NULL, 'fgh5652552', 1);

--
-- Déclencheurs `adherent`
--
DROP TRIGGER IF EXISTS `before_insert_adherent`;
DELIMITER $$
CREATE TRIGGER `before_insert_adherent` BEFORE INSERT ON `adherent` FOR EACH ROW BEGIN
    IF (New.code_postal_adherent NOT BETWEEN '01000' AND '99999')
    THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erreur : le Code postal n\'est pas valide';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `date`
--

DROP TABLE IF EXISTS `date`;
CREATE TABLE IF NOT EXISTS `date` (
  `JJMMAAAA` date NOT NULL,
  PRIMARY KEY (`JJMMAAAA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `date`
--

INSERT INTO `date` (`JJMMAAAA`) VALUES
('2018-08-12');

-- --------------------------------------------------------

--
-- Structure de la table `erreur`
--

DROP TABLE IF EXISTS `erreur`;
CREATE TABLE IF NOT EXISTS `erreur` (
  `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `erreur` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `erreur` (`erreur`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `erreur`
--

INSERT INTO `erreur` (`id`, `erreur`) VALUES
(1, 'Erreur : la date film doit être comprise entre 1900 et 2300'),
(2, 'Erreur : le Code postal n\'est pas valide');

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

DROP TABLE IF EXISTS `etat`;
CREATE TABLE IF NOT EXISTS `etat` (
  `code_etat` char(1) NOT NULL,
  `libelle_etat` varchar(50) NOT NULL,
  PRIMARY KEY (`code_etat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `etat`
--

INSERT INTO `etat` (`code_etat`, `libelle_etat`) VALUES
('1', 'P'),
('2', 'R'),
('3', 'O');

-- --------------------------------------------------------

--
-- Structure de la table `exemplaire`
--

DROP TABLE IF EXISTS `exemplaire`;
CREATE TABLE IF NOT EXISTS `exemplaire` (
  `exemplaire` int(11) NOT NULL,
  `defectueux` varchar(50) DEFAULT NULL,
  `date_achat` date DEFAULT NULL,
  `code_etat` char(1) NOT NULL,
  `code_film` varchar(6) NOT NULL,
  `code_support` int(11) NOT NULL,
  PRIMARY KEY (`exemplaire`),
  KEY `Exemplaire_Etat_FK` (`code_etat`),
  KEY `Exemplaire_Film0_FK` (`code_film`),
  KEY `Exemplaire_support1_FK` (`code_support`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `exemplaire`
--

INSERT INTO `exemplaire` (`exemplaire`, `defectueux`, `date_achat`, `code_etat`, `code_film`, `code_support`) VALUES
(1, NULL, '2018-02-10', '1', 'volau1', 1);

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

DROP TABLE IF EXISTS `film`;
CREATE TABLE IF NOT EXISTS `film` (
  `code_film` varchar(6) NOT NULL,
  `titre_film` varchar(100) NOT NULL,
  `annee_film` int(11) DEFAULT NULL,
  `ref_image` varchar(50) NOT NULL,
  `resume` text NOT NULL,
  `code_type_film` varchar(3) NOT NULL,
  `code_star` int(11) NOT NULL,
  PRIMARY KEY (`code_film`),
  KEY `Film_Type_film_FK` (`code_type_film`),
  KEY `Film_Star0_FK` (`code_star`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`code_film`, `titre_film`, `annee_film`, `ref_image`, `resume`, `code_type_film`, `code_star`) VALUES
('volau1', 'Vol au dessus d\'un nid de coucous', 1968, 'dddddd', 'blablabla', 'vol', 1);

--
-- Déclencheurs `film`
--
DROP TRIGGER IF EXISTS `before_insert_film`;
DELIMITER $$
CREATE TRIGGER `before_insert_film` BEFORE INSERT ON `film` FOR EACH ROW BEGIN
    IF (NEW.annee_film IS NULL or NEW.annee_film NOT BETWEEN 1900 and 2200)
    THEN
    	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erreur : l’année du film doit être comprise entre 1900 et 2300';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `fournir`
--

DROP TABLE IF EXISTS `fournir`;
CREATE TABLE IF NOT EXISTS `fournir` (
  `code_film` varchar(6) NOT NULL,
  `fournissueurid` int(11) NOT NULL,
  `note` int(11) NOT NULL,
  PRIMARY KEY (`code_film`,`fournissueurid`),
  KEY `fournir_Fournisseur0_FK` (`fournissueurid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `fournissueurid` int(11) NOT NULL AUTO_INCREMENT,
  `nom_fournisseur` varchar(50) NOT NULL,
  `adresse_fournisseur` varchar(100) NOT NULL,
  `adresse2_fournisseur` varchar(100) NOT NULL,
  `code_postal_fournisseur` int(11) NOT NULL,
  `ville_fournisseur` varchar(30) NOT NULL,
  `telephone_fournisseur` varchar(10) NOT NULL,
  PRIMARY KEY (`fournissueurid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `louer`
--

DROP TABLE IF EXISTS `louer`;
CREATE TABLE IF NOT EXISTS `louer` (
  `exemplaire` int(11) NOT NULL,
  `JJMMAAAA` date NOT NULL,
  `numero_adherent` int(11) NOT NULL,
  `date_rendu` date NOT NULL,
  `prix_applique` int(11) DEFAULT NULL,
  `prix_reel` int(11) DEFAULT NULL,
  PRIMARY KEY (`exemplaire`,`JJMMAAAA`,`numero_adherent`),
  KEY `louer_Date0_FK` (`JJMMAAAA`),
  KEY `louer_Adherant1_FK` (`numero_adherent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `louer`
--

INSERT INTO `louer` (`exemplaire`, `JJMMAAAA`, `numero_adherent`, `date_rendu`, `prix_applique`, `prix_reel`) VALUES
(1, '2018-08-12', 5, '2018-08-14', NULL, NULL);

--
-- Déclencheurs `louer`
--
DROP TRIGGER IF EXISTS `before_insert_louer`;
DELIMITER $$
CREATE TRIGGER `before_insert_louer` BEFORE INSERT ON `louer` FOR EACH ROW BEGIN
    IF (NEW.JJMMAAAA >= NEW.date_rendu)
    THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erreur : la Date d\'emprunt doit être inférieur à la date de retour';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `participer`
--

DROP TABLE IF EXISTS `participer`;
CREATE TABLE IF NOT EXISTS `participer` (
  `code_type_role` int(11) NOT NULL,
  `code_film` varchar(6) NOT NULL,
  `code_star` int(11) NOT NULL,
  `rang` int(11) NOT NULL,
  PRIMARY KEY (`code_type_role`,`code_film`,`code_star`),
  KEY `participer_Film0_FK` (`code_film`),
  KEY `participer_Star1_FK` (`code_star`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `code_type_role` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_role` varchar(50) NOT NULL,
  PRIMARY KEY (`code_type_role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `star`
--

DROP TABLE IF EXISTS `star`;
CREATE TABLE IF NOT EXISTS `star` (
  `code_star` int(11) NOT NULL AUTO_INCREMENT,
  `nom_star` varchar(50) NOT NULL,
  `prenom_star` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`code_star`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `star`
--

INSERT INTO `star` (`code_star`, `nom_star`, `prenom_star`) VALUES
(1, 'Nicholson', 'Jack');

-- --------------------------------------------------------

--
-- Structure de la table `support`
--

DROP TABLE IF EXISTS `support`;
CREATE TABLE IF NOT EXISTS `support` (
  `code_support` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_support` varchar(50) NOT NULL,
  PRIMARY KEY (`code_support`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `support`
--

INSERT INTO `support` (`code_support`, `libelle_support`) VALUES
(1, 'DVD'),
(2, 'Blu-Ray');

-- --------------------------------------------------------

--
-- Structure de la table `tarifer`
--

DROP TABLE IF EXISTS `tarifer`;
CREATE TABLE IF NOT EXISTS `tarifer` (
  `code_type_film` varchar(3) NOT NULL,
  `code_support` int(11) NOT NULL,
  `tarif` int(11) NOT NULL,
  PRIMARY KEY (`code_type_film`,`code_support`),
  KEY `tarifer_support0_FK` (`code_support`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `type_film`
--

DROP TABLE IF EXISTS `type_film`;
CREATE TABLE IF NOT EXISTS `type_film` (
  `code_type_film` varchar(3) NOT NULL,
  `libelle_type_film` varchar(50) NOT NULL,
  PRIMARY KEY (`code_type_film`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `type_film`
--

INSERT INTO `type_film` (`code_type_film`, `libelle_type_film`) VALUES
('vol', 'Comédie dramatique');

-- --------------------------------------------------------

--
-- Structure de la table `type_pi`
--

DROP TABLE IF EXISTS `type_pi`;
CREATE TABLE IF NOT EXISTS `type_pi` (
  `code_pi` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_pi` varchar(50) NOT NULL,
  PRIMARY KEY (`code_pi`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `type_pi`
--

INSERT INTO `type_pi` (`code_pi`, `libelle_pi`) VALUES
(1, 'essai');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adherent`
--
ALTER TABLE `adherent`
  ADD CONSTRAINT `Adherant_Type_PI_FK` FOREIGN KEY (`code_pi`) REFERENCES `type_pi` (`code_pi`);

--
-- Contraintes pour la table `exemplaire`
--
ALTER TABLE `exemplaire`
  ADD CONSTRAINT `Exemplaire_Etat_FK` FOREIGN KEY (`code_etat`) REFERENCES `etat` (`code_etat`),
  ADD CONSTRAINT `Exemplaire_Film0_FK` FOREIGN KEY (`code_film`) REFERENCES `film` (`code_film`),
  ADD CONSTRAINT `Exemplaire_support1_FK` FOREIGN KEY (`code_support`) REFERENCES `support` (`code_support`);

--
-- Contraintes pour la table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `Film_Star0_FK` FOREIGN KEY (`code_star`) REFERENCES `star` (`code_star`),
  ADD CONSTRAINT `Film_Type_film_FK` FOREIGN KEY (`code_type_film`) REFERENCES `type_film` (`code_type_film`);

--
-- Contraintes pour la table `fournir`
--
ALTER TABLE `fournir`
  ADD CONSTRAINT `fournir_Film_FK` FOREIGN KEY (`code_film`) REFERENCES `film` (`code_film`),
  ADD CONSTRAINT `fournir_Fournisseur0_FK` FOREIGN KEY (`fournissueurid`) REFERENCES `fournisseur` (`fournissueurid`);

--
-- Contraintes pour la table `louer`
--
ALTER TABLE `louer`
  ADD CONSTRAINT `louer_Adherant1_FK` FOREIGN KEY (`numero_adherent`) REFERENCES `adherent` (`numero_adherent`),
  ADD CONSTRAINT `louer_Date0_FK` FOREIGN KEY (`JJMMAAAA`) REFERENCES `date` (`JJMMAAAA`),
  ADD CONSTRAINT `louer_Exemplaire_FK` FOREIGN KEY (`exemplaire`) REFERENCES `exemplaire` (`exemplaire`);

--
-- Contraintes pour la table `participer`
--
ALTER TABLE `participer`
  ADD CONSTRAINT `participer_Film0_FK` FOREIGN KEY (`code_film`) REFERENCES `film` (`code_film`),
  ADD CONSTRAINT `participer_Role_FK` FOREIGN KEY (`code_type_role`) REFERENCES `role` (`code_type_role`),
  ADD CONSTRAINT `participer_Star1_FK` FOREIGN KEY (`code_star`) REFERENCES `star` (`code_star`);

--
-- Contraintes pour la table `tarifer`
--
ALTER TABLE `tarifer`
  ADD CONSTRAINT `tarifer_Type_film_FK` FOREIGN KEY (`code_type_film`) REFERENCES `type_film` (`code_type_film`),
  ADD CONSTRAINT `tarifer_support0_FK` FOREIGN KEY (`code_support`) REFERENCES `support` (`code_support`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
