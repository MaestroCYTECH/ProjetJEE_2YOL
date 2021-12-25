SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `lecoinphoto` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `lecoinphoto`;

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `categorie` varchar(20) NOT NULL DEFAULT 'inconnu',
  `icone` varchar(255) NOT NULL DEFAULT 'blankWhite.png',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `categorie` (`categorie`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `categorie` varchar(20) NOT NULL DEFAULT 'appareils',
  `reference` varchar(255) NOT NULL DEFAULT 'inconnu1',
  `image` varchar(255) NOT NULL DEFAULT 'blank.png',
  `nom` varchar(255) NOT NULL DEFAULT 'INCONNU',
  `description` varchar(6500) NOT NULL DEFAULT 'Inconnue',
  `prix` float NOT NULL DEFAULT 1,
  `stock` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `reference` (`reference`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `sexe` varchar(10) NOT NULL,
  `naissance` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `panier` varchar(6500) NOT NULL DEFAULT 'Vide',
  `statut` varchar(10) NOT NULL DEFAULT 'simple',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `login` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
