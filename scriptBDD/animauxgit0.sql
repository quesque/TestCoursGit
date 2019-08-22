-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 22 août 2019 à 15:26
-- Version du serveur :  5.7.19
-- Version de PHP :  7.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `animauxgit`
--

-- --------------------------------------------------------

--
-- Structure de la table `animal`
--

DROP TABLE IF EXISTS `animal`;
CREATE TABLE IF NOT EXISTS `animal` (
  `idAnimal` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `age` int(11) NOT NULL,
  `sexe` tinyint(1) NOT NULL,
  `idType` int(11) NOT NULL,
  
  PRIMARY KEY (`idAnimal`),
  KEY `FK_TYPE` (`idType`)
 
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `animal`
--

INSERT INTO `animal` (`idAnimal`, `nom`, `age`, `sexe`, `idType`) VALUES
(1, 'Tya', 7, 0, 2),
(2, 'Milo', 3, 1, 2),
(3, 'Mina', 2, 0, 1),
(4, 'Felicia', 4, 0, 2),
(5, 'Lili', 1, 0, 2),
(6, 'Hoquet', 7, 1, 1),
(7, 'Cacahouette', 2, 1, 3),
(8, 'Snoopy', 1, 0, 3),
(9, 'Lola', 4, 0, 1)
;

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `idType` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(30) NOT NULL,
  PRIMARY KEY (`idType`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`idType`, `libelle`) VALUES
(1, 'chien'),
(2, 'chat'),
(3, 'lapin')
;

--
-- Structure de la table `image`
--

DROP TABLE IF EXISTS `image`;
CREATE TABLE IF NOT EXISTS `image` (
  `idImage` int(11) NOT NULL AUTO_INCREMENT,
  `chemin` varchar(50) NOT NULL,
  PRIMARY KEY (`idImage`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`idImage`, `chemin`) VALUES
(1, 'Tya/Tya.jpg'),
(2, 'Milo/Milo.jpg'),
(3, 'Mina/Mina.jpg'),
(4, 'Felicia/Felicia.jpg'),
(5, 'Lili/Lili.jpg'),
(6, 'Hoquet/Hoquet.jpg'),
(7, 'Cacahouette/Cacahouette.jpg'),
(8, 'Snoopy/Snoopy.jpg'),
(9, 'Lola/Lola.jpg')
;


--
-- Structure de la table `image_animal`
--

DROP TABLE IF EXISTS `image_animal`;
CREATE TABLE IF NOT EXISTS `image_animal` (
  `idImage` int(11) NOT NULL,
  `idAnimal` int(11) NOT NULL,
  PRIMARY KEY (`idImage`,`idAnimal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image_animal` (`idImage`, `idAnimal`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9)
;
--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `FK_TYPE` FOREIGN KEY (`idType`) REFERENCES `type` (`idType`);
  
ALTER TABLE `image_animal`
  ADD CONSTRAINT `FK_IMAGE` FOREIGN KEY (`idImage`) REFERENCES `image` (`idImage`);

ALTER TABLE `image_animal`
  ADD CONSTRAINT `FK_ANIMAL` FOREIGN KEY (`idAnimal`) REFERENCES `animal` (`idAnimal`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
