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
-- Base de données :  `blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contenu` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `titre`, `contenu`, `image`, `created_at`) VALUES
(2, 'Titre de l\'Article n°2', '<p>Contenu de l\'Article n°2</p>', 'http://placehold.it/350x150', '2020-02-07 09:06:20'),
(3, 'Titre de l\'Article n°3', '<p>Contenu de l\'Article n°3</p>', 'http://placehold.it/350x150', '2020-02-07 09:06:20'),
(4, 'Titre de l\'Article n°4', '<p>Contenu de l\'Article n°4</p>', 'http://placehold.it/350x150', '2020-02-07 09:06:20'),
(5, 'Titre de l\'Article n°5', '<p>Contenu de l\'Article n°5</p>', 'http://placehold.it/350x150', '2020-02-07 09:06:20'),
(6, 'Titre de l\'Article n°6', '<p>Contenu de l\'Article n°6</p>', 'http://placehold.it/350x150', '2020-02-07 09:06:20'),
(7, 'Titre de l\'Article n°7', '<p>Contenu de l\'Article n°7</p>', 'http://placehold.it/350x150', '2020-02-07 09:06:20'),
(8, 'Titre de l\'Article n°8', '<p>Contenu de l\'Article n°8</p>', 'http://placehold.it/350x150', '2020-02-07 09:06:20'),
(9, 'Titre de l\'Article n°9', '<p>Contenu de l\'Article n°9</p>', 'http://placehold.it/350x150', '2020-02-07 09:06:20'),
(10, 'Titre de l\'Article n°10', '<p>Contenu de l\'Article n°10</p>', 'http://placehold.it/350x150', '2020-02-07 09:06:20'),
(21, 'Mila et les Dragons', '<p>Mila s\'enfonce dans la forêt de Pluie. Elle rencontre son premier Dragonnet.</p>', 'http://placehold.it/350x180', '2020-02-10 19:20:25');

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20200124142719', '2020-01-24 14:30:38');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
