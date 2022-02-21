-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  jeu. 22 avr. 2021 à 09:20
-- Version du serveur :  8.0.18
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `annonce`
--

-- --------------------------------------------------------

--
-- Structure de la table `annonces`
--

DROP TABLE IF EXISTS `annonces`;
CREATE TABLE IF NOT EXISTS `annonces` (
  `id_annonce` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(150) NOT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nom_image` varchar(150) NOT NULL,
  PRIMARY KEY (`id_annonce`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `annonces`
--

INSERT INTO `annonces` (`id_annonce`, `titre`, `message`, `nom_image`) VALUES
(10, 'Un Petit Pingouin', 'fLorem ipsum dolor sit amet consectetur adipisicing elit. Nihil dolores hic, ad dolorum beatae officia asperiores unde aliquam. Nam quaerat expedita rem beatae voluptas nobis earum rerum iste unde nisi ducimus iusto, sit impedit voluptates nemo suscipit repellat dolores veniam debitis temporibus dolore ratione! Reprehenderit assumenda voluptatibus, architecto nam rem accusantium quaerat dolore maiores molestiae soluta ab vitae? Rem, error sunt unde recusandae alias voluptates beatae reprehenderit, modi doloremque accusamus ea architecto sint fuga? Nam, necessitatibus! Molestias veritatis harum dolores.', 'Poke_Pinguin.png'),
(11, 'Un petit chien', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolore quam aperiam quisquam fugit eaque dolorum iure, reiciendis at beatae? Perspiciatis, ea? Hic neque commodi iusto a earum pariatur voluptatibus quas dignissimos at quasi architecto, quaerat ducimus delectus voluptate? Unde quidem atque hic. Maiores earum rerum incidunt modi suscipit? Aut aperiam, neque quod optio nulla asperiores odio nostrum quasi culpa reprehenderit, inventore labore natus alias obcaecati quidem, excepturi veritatis rerum enim quia aliquam sed! A perspiciatis dolorem deleniti. Iste temporibus doloribus deleniti officiis dicta. Iste dignissimos eligendi, dolor qui eaque voluptate alias ullam quisquam unde animi, dolorum magnam ut ratione voluptas!', 'Pokemon22.png');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
