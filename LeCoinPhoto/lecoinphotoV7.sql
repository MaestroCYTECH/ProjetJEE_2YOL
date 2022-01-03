-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 03, 2022 at 09:06 PM
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
  PRIMARY KEY (`ID`),
  UNIQUE KEY `categorie` (`categorie`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`ID`, `categorie`) VALUES
(1, 'appareils'),
(2, 'objectifs'),
(3, 'accessoires');

-- --------------------------------------------------------

--
-- Table structure for table `produits`
--

DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `categorie` varchar(20) NOT NULL DEFAULT 'appareils',
  `image` varchar(255) NOT NULL DEFAULT 'blank.png',
  `nom` varchar(255) NOT NULL DEFAULT 'INCONNU',
  `description` varchar(6500) NOT NULL DEFAULT 'Inconnue',
  `prix` float NOT NULL DEFAULT '0',
  `stock` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produits`
--

INSERT INTO `produits` (`ID`, `categorie`, `image`, `nom`, `description`, `prix`, `stock`) VALUES
(8, 'objectifs', 'F50140.jpg', 'Fujinon 50-140 F2.8 OIS WR', 'Monture : Fuji X', 1599, 7),
(9, 'objectifs', 'HB80.jpg', 'Hasselblad XCD 80 F1.9', 'Monture : Hasselblad X', 1599, 5),
(10, 'accessoires', 'SD128.jpg', 'Sandisk Extreme 128', 'Carte SD Sandisk Extreme 128 Go 150mbps', 24.99, 2),
(11, 'accessoires', 'PDS.jpg', 'Peak Design Slide (Noir)', 'Courroie Peak Design Slide', 49.99, 5),
(12, 'accessoires', 'BPM.jpg', 'Tiffen Black Pro Mist', 'Diffuseur Tiffen Black Pro Mist 1\\/4 (77mm)', 139.99, 3),
(13, 'accessoires', 'VA2PRO.jpg', 'Vanguard Alta 2 Pro', 'Trépied Vanguard Alta 2 Pro', 149.99, 7),
(7, 'objectifs', 'Z50.jpg', 'ZEISS Touit 50 F2.8', 'Monture : Sony E', 899, 5),
(5, 'objectifs', '1855.jpg', 'Fujinon 18-55 F2.8-4 R LM OIS', 'Monture : fuji X', 599, 1),
(6, 'objectifs', 'NZ50.jpg', 'Nikkor Z 50 F1.8', 'Monture : Nikon Z', 599, 9),
(4, 'appareils', 'FGFX100.jpg', 'Fujifilm GFX 100 (Boitier nu)', 'Capteur Moyen Format de 100Mp, monture Fuji GFX', 9999, 6),
(3, 'appareils', 'HBX1D.jpg', 'Hasselblad X1D (Boitier nu)', 'Capteur Moyen Format de 50Mp, monture Hasselblad X', 5999, 8),
(2, 'appareils', 'SA7RIV.jpg', 'Sony A7RIV (Boitier nu)', 'Capteur Full Frame de 61Mp, monture Sony E', 3499, 1),
(1, 'appareils', 'NZ6II.jpg', 'Nikon Z6 II (Boitier nu)', 'Capteur Full Frame de 24.5Mp, monture Nikkon Z', 1999, 2),
(0, 'appareils', 'FXT4.jpg', 'Fujifilm X-T4 (Boitier nu)', 'Capteur Format APS-C de 26Mp, monture Fuji X', 1699, 0),
(14, 'accessoires', 'PDEB.jpg', 'Peak Design Everyday Backpack', 'Sac Photo Peak Design Everyday Backpack', 199.99, 8);

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utilisateurs`
--

INSERT INTO `utilisateurs` (`ID`, `nom`, `prenom`, `sexe`, `email`, `login`, `pwd`, `panier`, `statut`) VALUES
(2, 'nouveau', 'nouveau', 'Homme', 'nouveau@nouveau.fr', 'nouveau', 'b7ede464fdac97e896bb72c67369be17', 'Vide', 'simple'),
(1, 'admin', 'admin', 'Homme', 'lecoinphoto@gmail.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Vide,2,2,2,8,0', 'admin');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
