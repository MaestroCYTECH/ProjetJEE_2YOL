-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 26, 2021 at 01:32 PM
-- Server version: 8.0.27-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lecoinphoto`
--
CREATE DATABASE IF NOT EXISTS `lecoinphoto` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `lecoinphoto`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `categorie` varchar(20) NOT NULL DEFAULT 'inconnu',
  `icone` varchar(255) NOT NULL DEFAULT 'blankWhite.png',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `categorie` (`categorie`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`ID`, `categorie`, `icone`) VALUES
(1, 'appareils', 'camera.png'),
(2, 'objectifs', 'lens.png'),
(3, 'accessoires', 'bag.png'),
(4, 'pellicules', 'blankWhite.png');

-- --------------------------------------------------------

--
-- Table structure for table `produits`
--

DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `categorie` varchar(20) NOT NULL DEFAULT 'appareils',
  `reference` varchar(255) NOT NULL DEFAULT 'inconnu1',
  `image` varchar(255) NOT NULL DEFAULT 'blank.png',
  `nom` varchar(255) NOT NULL DEFAULT 'INCONNU',
  `description` varchar(6500) NOT NULL DEFAULT 'Inconnue',
  `prix` float NOT NULL DEFAULT '1',
  `stock` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `reference` (`reference`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produits`
--

INSERT INTO `produits` (`ID`, `categorie`, `reference`, `image`, `nom`, `description`, `prix`, `stock`) VALUES
(9, 'objectifs', 'obj4', 'F50140.jpg', 'Fujinon 50-140 F2.8 OIS WR', 'Monture : Fuji X', 1599, 7),
(10, 'objectifs', 'obj5', 'HB80.jpg', 'Hasselblad XCD 80 F1.9', 'Monture : Hasselblad X', 1599, 7),
(11, 'accessoires', 'acc1', 'SD128.jpg', 'Sandisk Extreme 128', 'Carte SD Sandisk Extreme 128 Go 150mbps', 24.99, 2),
(12, 'accessoires', 'acc2', 'PDS.jpg', 'Peak Design Slide (Noir)', 'Courroie Peak Design Slide', 49.99, 3),
(13, 'accessoires', 'acc3', 'BPM.jpg', 'Tiffen Black Pro Mist', 'Diffuseur Tiffen Black Pro Mist 1\\/4 (77mm)', 139.99, 3),
(14, 'accessoires', 'acc4', 'VA2PRO.jpg', 'Vanguard Alta 2 Pro', 'Tr\\u00e9pied Vanguard Alta 2 Pro', 149.99, 7),
(8, 'objectifs', 'obj3', 'Z50.jpg', 'ZEISS Touit 50 F2.8', 'Monture : Sony E', 899, 5),
(6, 'objectifs', 'obj1', '1855.jpg', 'Fujinon 18-55 F2.8-4 R LM OIS', 'Monture : fuji X', 599, 1),
(7, 'objectifs', 'obj2', 'NZ50.jpg', 'Nikkor Z 50 F1.8', 'Monture : Nikon Z', 599, 4),
(5, 'appareils', 'app5', 'FGFX100.jpg', 'Fujifilm GFX 100 (Boitier nu)', 'Capteur Moyen Format de 100Mp, monture Fuji GFX', 9999, 8),
(4, 'appareils', 'app4', 'HBX1D.jpg', 'Hasselblad X1D (Boitier nu)', 'Capteur Moyen Format de 50Mp, monture Hasselblad X', 5999, 4),
(3, 'appareils', 'app3', 'SA7RIV.jpg', 'Sony A7RIV (Boitier nu)', 'Capteur Full Frame de 61Mp, monture Sony E', 3499, 3),
(2, 'appareils', 'app2', 'NZ6II.jpg', 'Nikon Z6 II (Boitier nu)', 'Capteur Full Frame de 24.5Mp, monture Nikkon Z', 1999, 2),
(1, 'appareils', 'app1', 'FXT4.jpg', 'Fujifilm X-T4 (Boitier nu)', 'Capteur Format APS-C de 26Mp, monture Fuji X', 1699, 0),
(15, 'accessoires', 'acc5', 'PDEB.jpg', 'Peak Design Everyday Backpack', 'Sac Photo Peak Design Everyday Backpack', 199.99, 8),
(16, 'pellicules', 'pel1', 'blank.png', 'TEST', 'TEST', 50, 2),
(17, 'pellicules', 'pel2', 'blank.png', 'TEST 2', 'TEST 2', 60, 2);

-- --------------------------------------------------------

--
-- Table structure for table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `sexe` varchar(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `panier` varchar(6500) NOT NULL DEFAULT 'Vide',
  `statut` varchar(10) NOT NULL DEFAULT 'simple',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `login` (`login`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utilisateurs`
--

INSERT INTO `utilisateurs` (`ID`, `nom`, `prenom`, `sexe`, `email`, `login`, `pwd`, `panier`, `statut`) VALUES
(2, 'nouveau', 'nouveau', 'Homme', 'nouveau@nouveau.fr', 'nouveau', '$2y$10$sGI2njwmg2/cRIYS0FYO3OpnEnKMR23nGCHzx272WtHzxy7ejP9VK', 'Vide', 'simple'),
(1, 'admin', 'admin', 'Homme', 'lecoinphoto@gmail.com', 'admin', '$2y$10$.9Oovd9gWLlUTvT.Vmbw9.UhPLLU5JK0ISh6kOaswjt3e5zLVzpv2', 'Vide,acc1,acc1,acc1,inconnu1', 'admin');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
