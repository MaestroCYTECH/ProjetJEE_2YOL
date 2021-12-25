SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `lecoinphoto` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `lecoinphoto`;

INSERT INTO `categories` (`ID`, `categorie`, `icone`) VALUES
(1, 'appareils', 'camera.png'),
(2, 'objectifs', 'lens.png'),
(3, 'accessoires', 'bag.png'),
(4, 'pellicules', 'blankWhite.png');

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

INSERT INTO `utilisateurs` (`ID`, `nom`, `prenom`, `sexe`, `naissance`, `email`, `login`, `pwd`, `panier`, `statut`) VALUES
(2, 'nouveau', 'nouveau', 'Homme', '2000-01-01', 'nouveau@nouveau.fr', 'nouveau', '$2y$10$sGI2njwmg2/cRIYS0FYO3OpnEnKMR23nGCHzx272WtHzxy7ejP9VK', 'Vide', 'simple'),
(1, 'admin', 'admin', 'Homme', '2021-04-14', 'lecoinphoto@gmail.com', 'admin', '$2y$10$.9Oovd9gWLlUTvT.Vmbw9.UhPLLU5JK0ISh6kOaswjt3e5zLVzpv2', 'Vide,acc1,acc1,acc1,inconnu1', 'admin');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
