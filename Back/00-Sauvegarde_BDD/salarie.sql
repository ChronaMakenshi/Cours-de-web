-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 21 fév. 2020 à 14:04
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
-- Base de données :  `salarie`
--

-- --------------------------------------------------------

--
-- Structure de la table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(80) NOT NULL,
  `salary` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `city` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `employee`
--

INSERT INTO `employee` (`id`, `emp_name`, `salary`, `gender`, `city`, `email`) VALUES
(1, 'Yogesh', '30000', 'male', 'Bhopal', 'yogesh@makitweb.com'),
(2, 'Vishal', '28000', 'male', 'Pune', 'vishal@gmail.com'),
(3, 'Vijay', '35000', 'male', 'Jaipur', 'vijayec@yahoo.com'),
(4, 'Rahul', '25000', 'male', 'Kanpur', 'rahul512@gmail.com'),
(5, 'Sonarika', '50000', 'female', 'Mumbai', 'bsonarika@gmail.com'),
(6, 'Jitentendre', '48000', 'male', 'Bhopal', 'jiten94@yahoo.com'),
(7, 'Aditya', '36000', 'male', 'Pune', 'aditya@gmail.com'),
(8, 'Anil', '32000', 'male', 'Indore', 'anilsingh@gmail.com'),
(9, 'Sunil', '48000', 'male', 'Nagpur', 'sunil1993@gmail.com'),
(10, 'Akilesh', '52000', 'male', 'Surat', 'akileshsahu@yahoo.com'),
(11, 'Raj', '48000', 'male', 'Ahmedabad', 'rajsingh@gmail.com'),
(12, 'Mayank', '54000', 'male', 'Ghaziabad', 'mpatidar@gmail.com'),
(13, 'Shalu', '43000', 'female', 'Bhopal', 'gshalu521@gmail.com'),
(14, 'Ravi', '32000', 'male', 'Ludhiana', 'ravisharma21@yahoo.com'),
(15, 'Shruti', '45000', 'female', 'Delhi', 'shruti@gmail.com'),
(16, 'Rishi', '38000', 'male', 'Mumbai', 'rishi121@gmail.com'),
(17, 'Rohan', '47000', 'male', 'Jaipur', 'rohansingh@gmail.com'),
(18, 'Priya', '28000', 'female', 'Indore', 'priya1992@gmail.com'),
(19, 'Rakesh', '34000', 'male', 'bhopal', 'rakesh@yahoo.com'),
(20, 'Vinay', '34000', 'male', 'Delhi', 'vinaysingh@gmail.com'),
(21, 'Tanu', '41000', 'female', 'pune', 'Tanu@gmail.com'),
(22, 'Ajay', '28000', 'male', 'bhopal', 'ajay93@gmail.com'),
(23, 'Nikhil', '46000', 'male', 'pune', 'nikhil@gmail.com'),
(24, 'Arav', '28000', 'male', 'Nagpur', 'aravsingh@yahoo.com'),
(25, 'Madhu', '32000', 'female', 'Rajkot', 'madhu@gmail.com'),
(26, 'Sagar', '44000', 'male', 'Rajkot', 'sagar@gmail.com'),
(27, 'Anju ', '30000', 'female', 'Ranchi', 'anju@gmail.com'),
(28, 'Rajat', '28000', 'male', 'kota', 'rajat@gmail.com'),
(29, 'Anjali', '32000', 'female', 'Gwalior', 'anjali@gmail.com'),
(30, 'Saloni', '32000', 'female', 'Nashik', 'saloni@gmail.com'),
(31, 'Mayur', '28000', 'male', 'Bhopal', 'mayur@gmail.com'),
(32, 'Pankaj', '32000', 'male', 'Indore', 'pankaj@gmail.com'),
(33, 'Hrithik', '33000', 'male', 'Pune', 'hrithik@gmail.com');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
