-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 21 fév. 2020 à 14:11
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
-- Base de données :  `client`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `ID_client` int(11) NOT NULL AUTO_INCREMENT,
  `adresse_client` char(32) DEFAULT NULL,
  `code_postal_client` char(5) DEFAULT NULL,
  `ville_client` char(25) DEFAULT NULL,
  `telephone_client` char(10) DEFAULT NULL,
  `nature_client` char(15) NOT NULL,
  `raison_sociale_client` char(50) NOT NULL,
  `type_societe_client` char(10) NOT NULL,
  `chiffre_affaire_client` int(11) NOT NULL,
  `effectif_client` int(11) DEFAULT NULL,
  `id_secteur` int(11) NOT NULL,
  `commentaire_client` longtext,
  PRIMARY KEY (`ID_client`),
  KEY `FK_AvoirPourSecteur` (`id_secteur`)
) ENGINE=MyISAM AUTO_INCREMENT=3229 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`ID_client`, `adresse_client`, `code_postal_client`, `ville_client`, `telephone_client`, `nature_client`, `raison_sociale_client`, `type_societe_client`, `chiffre_affaire_client`, `effectif_client`, `id_secteur`, `commentaire_client`) VALUES
(1, '42 rue jean jaures', '60000', 'machin', '0121451425', 'Principale', 'LA COMETE', 'Privé', 125000, 150, 1, ' Ceci est un text'),
(2, '25 rue tortue', '85000', 'LA ROCHE SUR YON', '0221451425', 'Secondaire', 'MATMUT', 'Public', 100000, 100, 1, ' Ceci est un groooos texte'),
(3227, '1 rue des capucins', '75001', 'Paris', '0156584512', 'Principale', 'SachaCorp', 'Public', 1000000, 500, 1, 'Test Sacha Corp'),
(3228, '35 rue des Lilas', '19240', 'Allassac', '0112121212', 'Principale', 'SachaCorp', 'Privé', 100000, 250, 1, 'test');

-- --------------------------------------------------------

--
-- Structure de la table `commander`
--

DROP TABLE IF EXISTS `commander`;
CREATE TABLE IF NOT EXISTS `commander` (
  `id_client` int(11) NOT NULL,
  `id_projet` int(11) NOT NULL,
  UNIQUE KEY `index_client_projet` (`id_client`,`id_projet`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commander`
--

INSERT INTO `commander` (`id_client`, `id_projet`) VALUES
(1, 1),
(1, 2),
(2, 3),
(3227, 14);

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id_contact` int(11) NOT NULL AUTO_INCREMENT,
  `ID_client` int(5) DEFAULT NULL,
  `id_fonction` int(5) NOT NULL,
  `nom_contact` char(32) NOT NULL,
  `prenom_contact` char(32) NOT NULL,
  `telephone_contact` char(15) NOT NULL,
  `email_contact` char(50) DEFAULT NULL,
  `photo_contact` char(255) DEFAULT NULL,
  `duree_projet_contact` int(11) DEFAULT NULL,
  UNIQUE KEY `id_contact` (`id_contact`),
  KEY `fk_Travailpour` (`ID_client`),
  KEY `fk_Apourfonction` (`id_fonction`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`id_contact`, `ID_client`, `id_fonction`, `nom_contact`, `prenom_contact`, `telephone_contact`, `email_contact`, `photo_contact`, `duree_projet_contact`) VALUES
(1, 1, 1, 'Mr PEREIRAd', 'Hugo', '0245142512', 'pereira@gmail.com', '', 0),
(2, 2, 1, 'Mr YOUPOULOF', 'Dimitri', '0145454711', 'youpoulof@gmail.com', '', 0),
(31, 1, 5, 'Mr PEREIRAzz', 'Hugod', '0245142512', 'pereira@gmail.com', NULL, NULL),
(34, 3227, 4, 'Test Sacha Corp', 'Sacha', '0112121212', 'sacha@sachacorp.fr', NULL, NULL),
(25, 1, 1, 'Valaded', 'Valade', '0669381855', 'f@f', NULL, NULL),
(24, 1, 1, 'Valade', 'Valade', '0669381855', 'f@fdddd', NULL, NULL),
(35, 3227, 2, 'Titus', 'Bobby', '0156584512', 'ssss@ddd.fr', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `documents`
--

DROP TABLE IF EXISTS `documents`;
CREATE TABLE IF NOT EXISTS `documents` (
  `id_doc` int(11) NOT NULL,
  `id_contact` int(5) DEFAULT NULL,
  `titre_document` char(255) NOT NULL,
  `resume_document` char(255) DEFAULT NULL,
  `date_edition_document` date DEFAULT NULL,
  PRIMARY KEY (`id_doc`),
  KEY `fk_ApourAuteur` (`id_contact`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `documents`
--

INSERT INTO `documents` (`id_doc`, `id_contact`, `titre_document`, `resume_document`, `date_edition_document`) VALUES
(1, 1, 'Doc1', 'Document 1 v Document 1 Document 1 Document 1 Document 1 Document 1 Document 1 Document 1 Document 1 Document 1', NULL),
(2, 1, 'Doc1', 'Document 1 v Document 1 Document 1 Document 1 Document 1 Document 1 Document 1 Document 1 Document 1 Document 1', NULL),
(3, 1, 'Doc3', 'Document 3  Document 3 Document 3 Document 3 Document 3 Document 3 Document 3 Document 3 Document 3 Document 3', NULL),
(4, 1, 'Doc4', 'Document 4 Document 4 Document 4 Document 4 Document 4 Document 4 Document 4 Document 4 Document 4 Document 4', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `fonction`
--

DROP TABLE IF EXISTS `fonction`;
CREATE TABLE IF NOT EXISTS `fonction` (
  `id_fonction` int(5) NOT NULL,
  `fonction` char(25) NOT NULL,
  UNIQUE KEY `fonction` (`id_fonction`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fonction`
--

INSERT INTO `fonction` (`id_fonction`, `fonction`) VALUES
(1, 'Comptable'),
(2, 'Aide-Comptable'),
(3, 'Gestionnaire contrat'),
(4, 'DRH'),
(5, 'Assistant DRH'),
(6, 'Directeur logistique'),
(7, 'Secrétaire Logistique');

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

DROP TABLE IF EXISTS `projet`;
CREATE TABLE IF NOT EXISTS `projet` (
  `id_projet` int(11) NOT NULL AUTO_INCREMENT,
  `nom_abrege_projet` char(10) NOT NULL,
  `nom_projet` char(32) NOT NULL,
  `type_projet` char(25) NOT NULL,
  `date_deb_prevue_projet` date DEFAULT NULL,
  `date_fin_prevue_projet` date DEFAULT NULL,
  `date_deb_reelle_projet` date DEFAULT NULL,
  `date_fin_reelle_projet` date DEFAULT NULL,
  `nbr_max_collaborateurs_projet` int(11) DEFAULT NULL,
  `charge_globale_estimee_projet` int(11) DEFAULT NULL,
  `id_secteur` int(11) DEFAULT NULL,
  `id_contact` int(11) DEFAULT NULL,
  `matricule_scrum_master_projet` int(11) DEFAULT NULL,
  `matricule_commercial_projet` int(11) DEFAULT NULL,
  `langage_projet` char(32) DEFAULT NULL,
  `plateforme_projet` char(32) DEFAULT NULL,
  `outile_dev_projet` char(32) DEFAULT NULL,
  UNIQUE KEY `id_projet` (`id_projet`),
  KEY `fk_ApourSecteur` (`id_secteur`),
  KEY `fk_ApourContact` (`id_contact`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `projet`
--

INSERT INTO `projet` (`id_projet`, `nom_abrege_projet`, `nom_projet`, `type_projet`, `date_deb_prevue_projet`, `date_fin_prevue_projet`, `date_deb_reelle_projet`, `date_fin_reelle_projet`, `nbr_max_collaborateurs_projet`, `charge_globale_estimee_projet`, `id_secteur`, `id_contact`, `matricule_scrum_master_projet`, `matricule_commercial_projet`, `langage_projet`, `plateforme_projet`, `outile_dev_projet`) VALUES
(1, 'COMPTABLE', 'Gestion des taxes', 'Régie', '2018-05-01', '2018-05-02', '2018-05-01', '2018-05-03', 100, 2, 1, NULL, 465, 11, 'mac', 'tru', 'much'),
(2, 'COMPTABLE', 'Gestion des heures sup', 'Forfait', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'COMPTABLE', 'Gestion des primes', 'Forfait', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'gestion', 'gestion des stocks', 'Régie', NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL),
(5, 'fournisseu', 'gestion des fournisseurs', 'Forfait', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL),
(14, 'test', 'projet test', 'Forfait', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `secteur_activite`
--

DROP TABLE IF EXISTS `secteur_activite`;
CREATE TABLE IF NOT EXISTS `secteur_activite` (
  `id_secteur` int(11) NOT NULL,
  `activite_secteur` char(25) NOT NULL,
  PRIMARY KEY (`id_secteur`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `secteur_activite`
--

INSERT INTO `secteur_activite` (`id_secteur`, `activite_secteur`) VALUES
(1, 'Agroalimentaire'),
(2, 'Banque/assurances'),
(3, 'Imprimerie'),
(4, 'BTP'),
(5, 'Chimie'),
(6, 'Négoce'),
(7, 'Multimédia'),
(8, 'Electronique'),
(9, 'Etude de conseil'),
(10, 'Industrie pharmaceutique'),
(11, 'Informatique/Télécom');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `email_user` varchar(100) DEFAULT NULL,
  `login_user` char(50) NOT NULL,
  `pwd_user` char(255) NOT NULL,
  `fonction` char(80) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_user`, `email_user`, `login_user`, `pwd_user`, `fonction`) VALUES
(1, NULL, 'DAMIEN', 'DAMIEN', 'Commercial'),
(2, NULL, 'NOE', 'NOE', 'Responsable de Développement'),
(3, NULL, 'MJEANNE', 'MJEANNE', 'Responsable de Développement'),
(18, 'sacha8milo@gmail.com', 'Sacha', '$2y$10$YzbzAk2EA2BoU.GTQzaB.eBAZxlUEgCystttiRrqUnzHItpt1gHhe', 'Formateur'),
(17, 'mila@gmail.com', 'Mila', '$2y$10$d8XQAwtuvc16/yzsuYt..uoIBtpwf/bdwXt9EmzPEV9FTnmzU3W36', 'Ecolière'),
(19, 'sacha@gmail.com', 'Sacha', '$2y$10$/EmHIpL8TuJuISIFSHGVE.1jyBbH0ZhSvAomVVZlmMvJ1QO6kkP4W', 'Formateur'),
(16, 'sacha@gmail.com', 'Sacha', '$2y$10$5Em6zgApK8Pq3n5O446tpOWadJlzcBZPs6v.uMGVhc/syTYJc1So2', 'Formateur');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
