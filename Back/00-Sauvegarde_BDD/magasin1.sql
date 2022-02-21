-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  ven. 30 juil. 2021 à 16:25
-- Version du serveur :  8.0.18
-- Version de PHP :  7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `magasin1`
--

DELIMITER $$
--
-- Procédures
--
DROP PROCEDURE IF EXISTS `ps_liste_articles`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ps_liste_articles` ()  NO SQL
BEGIN

SELECT A.id_article, A.designation, A.prix, A.categorie, SUM(L.quantite) AS Quantite_articles_commandes
from article as A join ligne as L 
ON A.id_article = L.id_article 
GROUP BY A.id_article;

END$$

DROP PROCEDURE IF EXISTS `ps_note_suivant_quantite_article`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ps_note_suivant_quantite_article` (OUT `note` VARCHAR(30))  NO SQL
BEGIN
DECLARE idarticle char(5);
DECLARE designation varchar(30);
DECLARE prix Decimal(8,2);
DECLARE categorie varchar(30);
DECLARE quantite int(11);

DECLARE manote CURSOR FOR SELECT A.id_article, A.designation, A.prix, A.categorie, SUM(L.quantite) AS Quantite_articles_commandes
from article as A join ligne as L 
ON A.id_article = L.id_article 
GROUP BY A.id_article;
    
OPEN manote;    
    
note_loop : LOOP
    FETCH manote INTO idarticle, designation, prix, categorie, quantite;
    
    If quantite BETWEEN 0 and 3 THEN 
    	SET note = "Médiocre";
    END IF;
    IF quantite BETWEEN 4 and 8 THEN
    	SET note ="Attractif";
    END IF;
    IF quantite > 9 THEN
    	SET note ="Excellent";
    END IF;
END LOOP;

CLOSE manote;

END$$

DROP PROCEDURE IF EXISTS `ps_rendement_categorie`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ps_rendement_categorie` (IN `categorie` VARCHAR(30), OUT `rendement` FLOAT)  NO SQL
BEGIN

SELECT SUM(ligne.quantite*ligne.prix_unit) into @rendement FROM article INNER JOIN ligne ON article.id_article = ligne.id_article WHERE article.categorie = categorie;

SELECT @rendement;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id_article` char(5) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `prix` decimal(8,2) NOT NULL,
  `categorie` enum('tout','photo','video','informatique','divers') NOT NULL,
  PRIMARY KEY (`id_article`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id_article`, `designation`, `prix`, `categorie`) VALUES
('CA300', 'Canon EOS 3000V zoom 28/80', '329.00', 'photo'),
('CAS07', 'Cassette DV60 par 5', '26.90', 'divers'),
('CP100', 'Camescope Panasonic SV-AV 100', '1490.00', 'video'),
('CS330', 'Caméscope Sony DCR-PC330', '1629.00', 'video'),
('DEL30', 'Portable Dell X300', '1715.00', 'informatique'),
('DVD75', 'DVD vierge par 3', '17.50', 'divers'),
('HP497', 'PC Bureau HP497 écran TFT', '1500.00', 'informatique'),
('NIK55', 'Nikon F55+zoom 28/80', '269.00', 'photo'),
('NIK80', 'Nikon F80', '479.00', 'photo'),
('SAX15', 'Portable Samsung X15 XVM', '1999.00', 'informatique'),
('SOXMP', 'PC Portable Sony Z1-XMP', '2399.00', 'informatique');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `ville` varchar(30) NOT NULL,
  `code_postal` varchar(5) DEFAULT '19240',
  `mail` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `nom`, `prenom`, `age`, `adresse`, `ville`, `code_postal`, `mail`) VALUES
(1, 'Marti', 'Jean', 36, '5 Avenue Einstein', 'Orléans', '19240', 'mart@marti.com'),
(2, 'Rapp', 'Paul', 44, '32 Avenue Foch', 'Paris', NULL, 'rapp@libert.com'),
(3, 'Devos', 'Marie', 18, '75 Boulevard Hochimin', 'Lille', NULL, 'grav@wanadoo.com'),
(4, 'Hauchon', 'Paul', 22, '12 Rue Tsétsé', 'Chartres', NULL, 'hauch@gmail.com'),
(5, 'Grave', 'Nuyen', 18, '75 Boulevard Hochimin', 'Lille', NULL, 'grave@gmail.com'),
(6, 'Hachette', 'Jeanne', 45, '60 Rue d\'Amiens', 'Versailles', NULL, NULL),
(7, 'Marti', 'Pierre', 25, '4 Avenue Henry 8', 'Paris', NULL, 'marti@gmail.com'),
(8, 'Mac Neal', 'John', 52, '59 Rue Diana', 'Lyon', NULL, 'macneal@gmail.com'),
(9, 'Basile', 'Did', 37, '26 Rue Gallas', 'Nantes', NULL, 'bas@walabi.com'),
(10, 'Darc', 'Jeanne', 19, '9 Avenue d\'Orléans', 'Paris', NULL, NULL),
(11, 'Gate', 'Bill', 75, '9 Boulevard des Bugs', 'Lyon', '78000', 'bill@microhard.be'),
(14, 'RESTOUEIX', 'Sacha', 52, '25 Route de la Plaine', 'Allassac', '87000', 'sacha8milo@gmail.com');

--
-- Déclencheurs `client`
--
DROP TRIGGER IF EXISTS `before_insert_cp`;
DELIMITER $$
CREATE TRIGGER `before_insert_cp` BEFORE INSERT ON `client` FOR EACH ROW BEGIN
 IF NEW.code_postal IS NOT NULL   -- le code postal est NON NULL
    AND NEW.code_postal NOT BETWEEN "01000" AND "99999"
      THEN
        /* SET NEW.code_postal = "19240"; */
        
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Mauvais Code Postal';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id_comm` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `id_client` int(11) NOT NULL,
  PRIMARY KEY (`id_comm`),
  KEY `commande_client_FK` (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_comm`, `date`, `id_client`) VALUES
(1, '2012-06-11', 5),
(2, '2012-06-25', 9),
(3, '2012-07-12', 1),
(4, '2012-07-14', 3),
(5, '2012-07-31', 9),
(6, '2012-08-08', 10),
(7, '2012-08-25', 2),
(8, '2012-09-04', 7),
(9, '2012-10-15', 11),
(10, '2012-11-23', 4),
(11, '2013-01-21', 8),
(12, '2013-02-01', 5),
(13, '2013-03-03', 9);

-- --------------------------------------------------------

--
-- Structure de la table `ligne`
--

DROP TABLE IF EXISTS `ligne`;
CREATE TABLE IF NOT EXISTS `ligne` (
  `id_article` char(5) NOT NULL,
  `id_comm` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix_unit` float NOT NULL,
  PRIMARY KEY (`id_article`,`id_comm`),
  KEY `ligne_commande0_FK` (`id_comm`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ligne`
--

INSERT INTO `ligne` (`id_article`, `id_comm`, `quantite`, `prix_unit`) VALUES
('CA300', 5, 1, 329),
('CAS07', 1, 3, 26.9),
('CAS07', 6, 3, 26.9),
('CAS07', 12, 4, 26.9),
('CP100', 6, 1, 1490),
('CP100', 8, 1, 1490),
('CS330', 1, 1, 1629),
('CS330', 12, 3, 1629),
('DEL30', 10, 2, 1715),
('DVD75', 4, 2, 17.5),
('DVD75', 11, 10, 17.5),
('HP497', 2, 2, 1500),
('NIK55', 9, 1, 269),
('NIK80', 3, 5, 479),
('SAX15', 7, 5, 1999),
('SAX15', 10, 1, 1999),
('SAX15', 13, 2, 1999),
('SOXMP', 4, 3, 2399),
('SOXMP', 8, 1, 2399);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_role` varchar(30) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`role_id`, `libelle_role`) VALUES
(1, 'Admin'),
(2, 'Editeur'),
(3, 'Lecteur');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `utilisateur_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `login` varchar(30) NOT NULL,
  `pwd` varchar(30) NOT NULL,
  PRIMARY KEY (`utilisateur_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`utilisateur_id`, `role_id`, `login`, `pwd`) VALUES
(1, 1, 'Sacha', 'Sacha68!'),
(3, 3, 'Steeve', 'Austin3md!');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_client_FK` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Contraintes pour la table `ligne`
--
ALTER TABLE `ligne`
  ADD CONSTRAINT `ligne_article_FK` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`),
  ADD CONSTRAINT `ligne_commande0_FK` FOREIGN KEY (`id_comm`) REFERENCES `commande` (`id_comm`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `utilisateur` (`utilisateur_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
