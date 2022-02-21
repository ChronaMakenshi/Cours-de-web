-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  lun. 02 août 2021 à 08:27
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
-- Base de données :  `jarditou2`
--

-- --------------------------------------------------------

--
-- Structure de la table `ps_dicton`
--

DROP TABLE IF EXISTS `ps_dicton`;
CREATE TABLE IF NOT EXISTS `ps_dicton` (
  `jour` int(11) NOT NULL,
  `mois` int(11) NOT NULL,
  `saint` longtext,
  `dicton` text,
  `conseil` text,
  PRIMARY KEY (`jour`,`mois`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ps_dicton`
--

INSERT INTO `ps_dicton` (`jour`, `mois`, `saint`, `dicton`, `conseil`) VALUES
(1, 5, 'Saint Jérémie', 'En mai, fais ce qu\'il te plaît.', 'Il est temps de semer'),
(2, 5, 'Saint Boris', 'Vin de mai, piquette de chai.', 'Il est temps de semer'),
(3, 5, 'Saint Croix', 'À la sainte Croix, on sème les pois.', 'Il est temps de semer'),
(4, 5, 'Saint Sylvain', 'Quand l\'aubépine est en fleur, le temps est en rigueur.', 'Il est temps de semer'),
(5, 5, 'Saint Judith', 'Qui n\'a pas semé à la sainte Croix, au lieu d\'un grain en mettra trois.', 'Il est temps de semer'),
(6, 5, 'Saint Prudence', 'Soleil à la petite saint Jean, mois de mai fleurissant.', 'Il est temps de semer'),
(7, 5, 'Sainte Gisèle', 'Chaleur au mois de mai, de tout l\'an fait la beauté.', 'Il est temps de semer'),
(8, 5, 'Saint Boniface', 'Au jour de saint Boniface, toute boue s\'efface.', 'Il est temps de semer'),
(9, 5, 'Saint Pacôme', 'Brouillard de mai et chaleur de juin, aménent la moisson à point.', 'Il est temps de semer'),
(10, 5, 'Saint Antonin', 'À la saint Antonin, se pointe le mois de juin.', 'Il est temps de semer'),
(11, 5, 'Saint Mamert', 'Aux trois Saints de glace, fais toujours face.', 'Il est temps de désherber'),
(12, 5, 'Saint Pancrace', 'Souvent saint Pancrace, rapporte la glace.', 'Il est temps de désherber'),
(14, 5, 'Saint Matthias', 'À la saint Matthias, tout chaud ou de glace.', 'Il est temps de désherber'),
(13, 5, 'Saint Servais', 'Passé saint Servais, on peut semer.', 'Il est temps de désherber'),
(15, 5, 'Saint Isidore', 'À la saint Isidore, la dernière gelée.', 'Il est temps de désherber'),
(16, 5, 'Saint Honoré', 'À la saint Honoré, s\'il fait gelée le vin diminue de moitié.', 'Il est temps de désherber'),
(17, 5, 'Saint  Pascal', 'À la saint Honoré, s\'il fait gelée le vin diminue de moitié.\r\nÀ la saint Pascal, s\'il fait beau l\'été sera méridional.\r\n', 'Il est temps de récolter les cerises'),
(18, 5, 'Sainte  Coralie', 'À la sainte Coralie, tous les lilas sont fleuris.\r\n', 'Il est temps de récolter les cerises'),
(19, 5, 'Saint  Yvonnet', 'Craignez le petit Yvonnet, c\'est le pire de tous quand il s\'y met.', 'Il est temps de récolter les cerises'),
(20, 5, 'Saint  Bernardin', 'À la saint Bernardin, compte tes barriques de vin.', 'Il est temps de récolter les cerises'),
(21, 5, 'Saint  Constantin', 'À la saint Constantin, compte tes sous dans tes mains.', 'Il est temps de récolter les cerises'),
(22, 5, 'Sainte Julie', 'À la sainte Julie, le soleil ne quitte pas son lit.', 'Il est temps de récolter les cerises'),
(23, 5, 'Saint Didier', 'À la saint Didier soleil orgueilleux, nous annonce un été joyeux.', 'Il est temps de récolter les cerises'),
(24, 5, 'Sainte Angèle', 'Après sainte Angèle, le jardinier ne craint plus le gel.', 'Il est temps de récolter les cerises'),
(25, 5, 'Saint Urbain', 'Après la saint Urbain, plus ne gèlent vin ni pain.', 'Il est temps de planter vos tomates'),
(26, 5, 'Saint Philippe', 'Quand il pleut à la saint Philippe, le pauvre n\'a pas besoin du riche.', 'Il est temps de planter vos tomates'),
(27, 5, 'Saint Ildevert', 'À la saint Ildevert, est mort tout arbre qui n\'est point vert.', 'Il est temps de planter vos tomates'),
(28, 5, 'Saint Germain', 'Soleil de saint Germain, nous promet du bon vin.', 'Il est temps de planter vos tomates'),
(29, 5, 'Saint Maximin', 'Le jour de saint Maximin, s\'embaume le jasmin.', 'Il est temps de planter vos tomates'),
(30, 5, 'Saint Ferdinand', 'Lorsque mai est trop jardinier, cela ne remplit pas le grenier.', 'Il est temps de planter vos tomates'),
(31, 5, 'Sainte Pétronille', 'Eau de sainte Pétronille, change le raisin en grapille.', 'Il est temps de planter vos tomates'),
(1, 6, 'Saint Trinité', 'S\'il pleut à la saint Trinité, le blé diminue de moitié.', 'Il est temps de faire des boutures'),
(12, 12, 'Saint Corentin', 'À la Saint-Corentin, le plein hiver glace le chemin.', 'Il est temps de rempailler'),
(13, 12, 'Sainte Luce', 'À la Sainte-Luce, le jour croît d\'un saut de puce.', 'Il est temps de rempailler'),
(14, 12, ' Sainte Odile', 'Quand en hiver est été, mais en été l\'hivernée, cette contrariété, ne fit jamais bonne année. ', 'Il est temps de rempailler'),
(15, 12, ' Sainte Ninon', 'Froid et neige en décembre, du blé à revendre.', 'Il est temps de rempailler'),
(16, 12, ' Sainte Alice', 'Le mois de l\'Avent est de pluie et de vent, tire ton bonnet jusqu\'aux dents. ', 'Il est temps de rempailler'),
(17, 12, 'Saint Gaël', 'Quand secs sont les Avents, abondant sera l\'an.', 'Il est temps de rempailler'),
(18, 12, 'Saint Gatien', 'À la Saint-Gatien, le temps ne vaut rien.', 'Il est temps de rempailler'),
(19, 12, 'Saint Urbain', 'S\'il pleut à la Saint-Urbain, c\'est quarante jours de pluie en chemin. ', 'Il est temps de rempailler'),
(20, 12, 'Saint Théophile', 'Au vingt de Noël, les jours rallongent d\'un pas d\'hirondelle.', 'Il est temps de rempailler'),
(21, 12, 'Saint Pierre Canisius', 'Neige de décembre est engrais pour la terre.', 'Il est temps de rempailler'),
(22, 12, 'Saint Xavière', 'Décembre trop beau, été dans l\'eau.', 'Il est temps de rempailler'),
(23, 12, 'Saint Évariste', 'À Saint-Évariste, jour de pluie, jour triste.', 'Il est temps de rempailler'),
(24, 12, 'Sainte Adèle', 'Beau temps à Sainte-Adèle est un cadeau du ciel.', 'Il est temps de rempailler'),
(25, 12, 'Noël', 'Noël au balcon, Pâques au tison.', 'Il est temps de rempailler'),
(2, 12, 'Sainte Viviane', 'Temps clair à la Sainte-Viviane, temps clair pendant quarante jours et une semaine.', 'Il est temps de rempailler'),
(3, 12, 'Saint François', 'Décembre prend, il ne rend.', 'Il est temps de rempailler'),
(4, 12, 'Sainte Barbe', 'À la Sainte-Barbe, soleil peu arde.', 'Il est temps de rempailler'),
(5, 12, 'Saint Gérald', 'À la saint Gérald, neige de décembre, c\'est pour le jardin cendres.', 'Il est temps de rempailler'),
(6, 12, 'Saint Nicolas', ' Neige à la Saint-Nicolas donne froid pour trois mois.', 'Il est temps de rempailler'),
(7, 12, 'Saint Ambroise', 'Quand Saint-Ambroise voit neiger, de dix-huit jours de froid sommes en danger. ', 'Il est temps de rempailler'),
(8, 12, 'Immaculé Conception', 'Jour de l\'Immaculée, ne passe jamais sans gelée.', 'Il est temps de rempailler'),
(9, 12, 'Sainte-Léocadie', 'De Sainte-Léocadie à Sainte-Nicaise, les gelées naissent.', 'Il est temps de rempailler'),
(10, 12, 'Sainte Julie', 'À Sainte-Julie, le soleil ne quitte pas son lit.', 'Il est temps de rempailler'),
(11, 12, 'Saint Daniel', 'Tel temps à la Saint-Daniel, même temps à Noël.', 'Il est temps de rempailler'),
(24, 10, 'Saint Raphaël', 'À la saint Raphaël, la chaleur monte au ciel.', 'Il est temps de dormir'),
(26, 10, 'Saint Amand', 'À la saint Amand, sont mûrs les glands.', 'Il est temps de dormir'),
(27, 10, 'Sainte Antoinette', 'À la sainte Antoinette, la neige s\'apprête.', 'Il est temps de dormir'),
(25, 10, 'Saint Crépin', 'À la saint Crépin, les mouches voient leur fin.', 'Il est temps de dormir'),
(20, 11, 'Saint Félix', 'Saint Félix et la Présentation amènent le froid pour de bon.', 'Il est temps de dormir'),
(22, 11, 'Sainte Cécile', 'Pour sainte Cécile, chaque haricot en fait mille.', 'Il est temps de dormir'),
(23, 11, 'Sainte Clément', 'Quand l\'hiver vient doucement, il est là à la saint Clément.', 'Il est temps de dormir'),
(24, 11, 'Sainte Flora', 'À la sainte Flora, plus rien ne fleurira.', 'Il est temps de dormir'),
(25, 11, 'Sainte Catherine', 'À la sainte Catherine, tout arbre prend racine.', 'Il est temps de dormir'),
(26, 11, 'Sainte Delphine', 'À la sainte Delphine, mets ton manteau à pèlerine.', 'Il est temps de dormir'),
(27, 11, 'Saint Séverin', 'À la saint Séverin, chauffe tes reins.', 'Il est temps de dormir'),
(28, 11, 'Saint Sosthène', 'À la saint Sosthène, il y a des chrysanthèmes.', 'Il est temps de dormir'),
(29, 11, 'Saint Saturnin', 'À la saint Saturnin, l\'hiver est pour demain.', 'Il est temps de dormir'),
(30, 11, 'Saint André', 'Neige de saint André, peut cent jours durer.', 'Il est temps de dormir'),
(1, 12, 'Avent', 'Neige de saint André, peut cent jours durer.Décembre, le mois de l\'Avent, c\'est pluie ou vent.', 'Il est temps de dormir'),
(1, 3, 'Saint Aubin', 'Quand il pleut à la Saint Aubin, l\'eau est plus chère que le vin.', 'Pense au lendemain'),
(2, 3, 'Saint Charles', 'À la Saint Charles, la gelée parle.', 'Pense au lendemain'),
(3, 3, 'Sainte Cunégonde', 'À la Sainte Cunégonde la terre redevient féconde.', 'Pense au lendemain'),
(4, 3, 'Saint Casimir', 'De Saint Casimir la douceur fait peur aux jardiniers et aux laboureurs.', 'Pense au lendemain'),
(5, 3, 'Saint Adrien', 'À la Saint Adrien, froidure ne gèle que les nains.', 'Pense au lendemain'),
(6, 3, 'Sainte Colette', 'À la Sainte Colette, siffle siffle l\'alouette.', 'Pense au lendemain'),
(7, 3, 'Sainte Félicité', 'Le jour de la Sainte Félicité se voit venir avec gaieté.', 'Pense au lendemain'),
(8, 3, 'Sainte Véronique', 'Quand vient Sainte Véronique, le soleil nous fait la nique.', 'Pense au lendemain'),
(9, 3, 'Sainte Françoise', 'Semé à la Sainte Françoise, ton grain aura du poids.', 'Pense au lendemain'),
(10, 3, 'Saint Vivien', 'Si Saint Vivien est gelé, quarante jours le jardinier aura froid aux pieds.', 'Pense au lendemain'),
(11, 3, 'Sainte Euloge', 'Sainte Euloge, voit les jeunes lapins à l\'auge.', 'Pense au lendemain'),
(12, 3, 'Saint Grégoire', 'À la Saint Grégoire taille la vigne pour boire.', 'Pense au lendemain'),
(13, 3, 'Sainte Euphrasie', 'À la Sainte Euphrasie pointe la fraise.', 'Pense au lendemain'),
(14, 3, 'Sainte Mahaud', 'Pluie de Sainte Mahaud n\'est jamais de trop.', 'Pense au lendemain'),
(15, 3, 'Sainte Louise', 'Neige de mars brûle le bourgeon.', 'Pense au lendemain'),
(16, 3, 'Sainte Bénédicte', 'Quand mars fait avril, avril fait mars.', 'Pense au lendemain'),
(17, 3, 'Saint Patrice', 'Quand il fait doux à la Saint Patrice, de leurs trous sortent les écrevisses.', 'Pense au lendemain'),
(18, 3, 'Saint Narcisse', 'À la Saint Narcisse les mouches, aux pêcheurs les touches.', 'Pense au lendemain'),
(27, 1, 'Sainte Mélanie', 'La Sainte Mélanie, de la pluie en veut mie.', 'Il est temps de rempailler'),
(28, 1, 'Saint Julien', 'Saint Julien brise la glace, s\'il ne la brise, il l\'embrasse.', 'Il est temps de rempailler'),
(29, 1, 'Saint Sulplice', 'S\'il gèle à la Saint Sulplice, le printemps sera propice.', 'Il est temps de rempailler'),
(30, 1, 'Sainte Martine', 'Souvent à la Sainte Martine, l\'hiver reprend dès mâtines.', 'Il est temps de rempailler'),
(31, 1, ' Sainte Marcelle', 'Souvent fin janvier ne remplit pas le panier.', 'Il est temps de rempailler'),
(1, 2, 'Saint Ignace', 'À la Saint Ignace l\'eau est de glace.', 'Il est temps de rempailler'),
(2, 2, 'Saint Théophane', 'Quand Notre-Dame de la chandeleur luit, l\'hiver quarante jours s\'ensuit.', 'Il est temps de rempailler'),
(3, 2, 'Saint Blaise', 'Si le jour de la Saint Blaise est serein, bon temps pour le grain.', 'Il est temps de rempailler'),
(4, 2, 'Sainte Véronique', 'À Sainte Véronique, les marchands de marrons plient boutique.', 'Il est temps de rempailler'),
(5, 2, 'Sainte Agathe', 'À la Sainte Agathe, les oignons se plantent même dans la glace.', 'Il est temps de rempailler'),
(6, 2, 'Saint Gaston', 'À la Saint Gaston, surveille tes bourgeons.', 'Il est temps de rempailler'),
(7, 2, 'Sainte Eugénie', 'Si février n\'est pas pluvieux, ménage ton grenier.', 'Il est temps de rempailler'),
(8, 2, 'Sainte Jacqueline', 'À la Sainte Jacqueline, froid et bruine.', 'Il est temps de rempailler'),
(9, 2, 'Sainte Apolline', 'À la Sainte Apolline, bien souvent l\'hiver nous quitte.', 'Il est temps de rempailler'),
(10, 2, 'Saint Arnaud', 'Quand la bise oublie février, elle arrive en mai.', 'Il est temps de rempailler'),
(11, 2, ' Notre Dame de Lourdes', 'Février, bon mois, pour semer carottes et pois.', 'Il est temps de rempailler'),
(12, 2, 'Saint Félix', 'Saint Félix et la Présentation amènent le froid pour de bon.', 'Il est temps de rempailler'),
(13, 2, 'Sainte Béatrice', 'De Sainte Béatrice la nuée assure six semaines mouillées.', 'Il est temps de rempailler'),
(14, 2, 'Saint Valentin', 'À la Saint Valentin, la pie monte au sapin.', 'Il est temps d\'être amoureux'),
(15, 2, 'Saint Claude', 'À la Saint Claude, regarde ton seau, tu ne le verras pas plus haut.', 'L\'hivers est dans le retro'),
(16, 2, 'Sainte Julienne', 'À la Sainte Julienne, faut toujours que le soleil vienne.', 'L\'hivers est dans le retro'),
(17, 2, 'Saint Alexis', 'À la Saint Alexis, foin occis.', 'L\'hivers est dans le retro'),
(18, 2, 'Saint Alexandre', 'À la Saint Alexandre, finies les cendres.', 'L\'hivers est dans le retro'),
(19, 2, 'Saint Siméon', 'À la Saint Siméon, la neige et les tisons.', 'L\'hivers est dans le retro'),
(20, 2, 'Sainte Aimée', 'Souvent à la Sainte Aimée, la campagne est enneigée.', 'L\'hivers est dans le retro'),
(21, 2, 'Saint Pierre-Damien', 'À la Saint Pierre-Damien, l\'hiver reprend ou s\'éteint.', 'L\'hivers est dans le retro'),
(22, 2, 'Sainte Isabelle', 'Neige à la Sainte Isabelle, fait la fleur plus belle.', 'L\'hivers est dans le retro'),
(23, 2, 'Saint Florent', 'À la Saint Florent, l\'hiver s\'en va ou reprend.', 'L\'hivers est dans le retro'),
(24, 2, 'Saint Modeste', 'À la Saint Modeste, repique tes choux s\'il t\'en reste.', 'L\'hivers est dans le retro'),
(25, 2, 'Saint Roméo', 'Lune de Mardi-Gras, tonnerre entendra.', 'L\'hivers est dans le retro'),
(26, 2, 'Saint Nestor', 'Vents forts à la Saint Nestor, bon vin à la saint Marcellin.', 'L\'hivers est dans le retro'),
(27, 2, 'Sainte Honorine', 'À la Sainte Honorine, bourgeonne l\'aubépine.', 'L\'hivers est dans le retro'),
(28, 2, 'Saint Romain', 'Ciel clair à la Saint Romain, c\'est beaucoup de bien et de bon vin.', 'L\'hivers est dans le retro'),
(29, 2, 'Saint Auguste', 'En l\'année bissextile, garde du blé pour l\'an qui suit.', 'L\'hivers est dans le retro'),
(2, 8, 'Saint-Eusèbe', 'À la Saint-Eusèbe,Au plus tard, fais battre la gerbe', 'Le Soleil radieux est notre meilleur ami'),
(8, 9, 'Saint-Adrien', 'À la bonne Dame de septembre,Tout fruit est bon à prendre', 'Le Soleil nous accompagne vers l\'Automne naissant'),
(9, 9, 'Saint-Alain', 'Septembre emporte les ponts, Ou tarit les fontaines', 'Le Soleil nous accompagne vers l\'Automne naissant'),
(3, 8, 'Saint-Nicodème', 'Il faut cueillir les choux, L\'un des trois premiers jours d\'août', 'Le Soleil radieux est notre meilleur ami'),
(4, 8, 'Saint-Aristarque', 'Quand août est bon, Abondance à la maison', 'Le Soleil radieux est notre meilleur ami'),
(10, 9, 'Saint-Inès', 'À la Sainte-Inès,\r\nTravaille sans cesse', 'Le Soleil nous accompagne vers l\'Automne');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
