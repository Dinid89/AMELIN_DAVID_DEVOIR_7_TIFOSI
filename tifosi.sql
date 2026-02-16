-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 13 fév. 2026 à 13:13
-- Version du serveur : 8.0.45
-- Version de PHP : 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

DROP DATABASE IF EXISTS tifosi;
CREATE DATABASE tifosi DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE tifosi;

/*Creation d'un utilisateur */
DROP USER IF EXISTS 'tifosi'@'localhost';
CREATE USER `tifosi`@`localhost` IDENTIFIED BY 'Admin123!';
GRANT ALL PRIVILEGES ON tifosi.* TO `tifosi`@`localhost`;
FLUSH PRIVILEGES; 


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tifosi`
--

-- --------------------------------------------------------

--
-- Structure de la table `achete`
--

DROP TABLE IF EXISTS `achete`;
CREATE TABLE IF NOT EXISTS `achete` (
  `id_client` int NOT NULL,
  `id_menu` int NOT NULL,
  PRIMARY KEY (`id_client`,`id_menu`),
  UNIQUE KEY `id_client` (`id_client`),
  KEY `id_menu` (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `appartient`
--

DROP TABLE IF EXISTS `appartient`;
CREATE TABLE IF NOT EXISTS `appartient` (
  `id_marque` int NOT NULL,
  `id_boisson` int NOT NULL,
  PRIMARY KEY (`id_marque`,`id_boisson`),
  KEY `id_boisson` (`id_boisson`),
  KEY `id_marque` (`id_marque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `appartient`
--

INSERT INTO `appartient` (`id_marque`, `id_boisson`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(3, 10),
(3, 11),
(4, 12);

-- --------------------------------------------------------

--
-- Structure de la table `boisson`
--

DROP TABLE IF EXISTS `boisson`;
CREATE TABLE IF NOT EXISTS `boisson` (
  `id_boisson` int NOT NULL AUTO_INCREMENT,
  `nom_boisson` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_boisson`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `boisson`
--

INSERT INTO `boisson` (`id_boisson`, `nom_boisson`) VALUES
(1, 'Coca-cola zéro'),
(2, 'Coca-cola original'),
(3, 'Fanta citron'),
(4, 'Fanta orange'),
(5, 'Capri-sun'),
(6, 'Pepsi'),
(7, 'Pepsi Max Zéro'),
(8, 'Lipton zéro citron'),
(9, 'Lipton Peach'),
(10, 'Monster energy ultra gold'),
(11, 'Monster energy ultra blue'),
(12, 'Eau de source ');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `nom_client` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email_client` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `code_postal` int NOT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `comprend`
--

DROP TABLE IF EXISTS `comprend`;
CREATE TABLE IF NOT EXISTS `comprend` (
  `id_focaccia` int NOT NULL,
  `id_ingredient` int NOT NULL,
  `quantite` int NOT NULL,
  PRIMARY KEY (`id_focaccia`,`id_ingredient`),
  KEY `id_ingredient` (`id_ingredient`),
  KEY `id_focaccia` (`id_focaccia`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `comprend`
--

INSERT INTO `comprend` (`id_focaccia`, `id_ingredient`, `quantite`) VALUES
(1, 1, 2),
(1, 3, 20),
(1, 5, 200),
(1, 7, 40),
(1, 9, 20),
(1, 13, 80),
(1, 16, 20),
(1, 18, 50),
(1, 20, 1),
(1, 25, 50),
(2, 1, 2),
(2, 5, 200),
(2, 7, 40),
(2, 9, 20),
(2, 11, 50),
(2, 16, 20),
(2, 18, 50),
(2, 20, 1),
(3, 1, 2),
(3, 5, 200),
(3, 7, 40),
(3, 9, 20),
(3, 18, 50),
(3, 20, 1),
(3, 22, 50),
(4, 6, 200),
(4, 7, 40),
(4, 9, 20),
(4, 10, 50),
(4, 15, 20),
(4, 18, 50),
(4, 20, 2),
(5, 5, 200),
(5, 7, 80),
(5, 9, 20),
(5, 12, 80),
(5, 16, 10),
(5, 17, 10),
(5, 18, 50),
(5, 20, 1),
(5, 25, 50),
(6, 2, 40),
(6, 4, 80),
(6, 5, 200),
(6, 9, 20),
(6, 16, 20),
(6, 18, 50),
(6, 19, 2),
(6, 20, 1),
(6, 25, 50),
(7, 4, 80),
(7, 5, 200),
(7, 9, 20),
(7, 16, 20),
(7, 18, 50),
(7, 20, 1),
(7, 21, 40),
(7, 25, 50),
(8, 1, 2),
(8, 3, 20),
(8, 6, 200),
(8, 7, 40),
(8, 8, 50),
(8, 9, 20),
(8, 13, 80),
(8, 14, 50),
(8, 16, 20),
(8, 18, 50),
(8, 20, 1),
(8, 21, 80);

-- --------------------------------------------------------

--
-- Structure de la table `constitue`
--

DROP TABLE IF EXISTS `constitue`;
CREATE TABLE IF NOT EXISTS `constitue` (
  `id_menu` int NOT NULL,
  `id_focaccia` int NOT NULL,
  PRIMARY KEY (`id_menu`,`id_focaccia`),
  UNIQUE KEY `id_menu` (`id_menu`),
  KEY `id_focaccia` (`id_focaccia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contient`
--

DROP TABLE IF EXISTS `contient`;
CREATE TABLE IF NOT EXISTS `contient` (
  `id_menu` int NOT NULL,
  `id_boisson` int NOT NULL,
  PRIMARY KEY (`id_menu`,`id_boisson`),
  UNIQUE KEY `id_menu` (`id_menu`),
  KEY `id_boisson` (`id_boisson`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `focaccia`
--

DROP TABLE IF EXISTS `focaccia`;
CREATE TABLE IF NOT EXISTS `focaccia` (
  `id_focaccia` int NOT NULL AUTO_INCREMENT,
  `nom_focaccia` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `prix_focaccia` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id_focaccia`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `focaccia`
--

INSERT INTO `focaccia` (`id_focaccia`, `nom_focaccia`, `prix_focaccia`) VALUES
(1, 'Mozaccia', 9.80),
(2, 'Gorgonzollaccia', 10.80),
(3, 'Raclaccia', 8.90),
(4, 'Emmentalaccia', 9.80),
(5, 'Tradizione', 8.90),
(6, 'Hawaienne', 11.20),
(7, 'Américaine', 10.80),
(8, 'Paysanne', 12.80);

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
CREATE TABLE IF NOT EXISTS `ingredient` (
  `id_ingredient` int NOT NULL AUTO_INCREMENT,
  `nom_ingredient` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_ingredient`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ingredient`
--

INSERT INTO `ingredient` (`id_ingredient`, `nom_ingredient`) VALUES
(1, 'Ail'),
(2, 'Ananas'),
(3, 'Artichaut'),
(4, 'Bacon'),
(5, 'Base Tomate'),
(6, 'Base crème'),
(7, 'Champignon'),
(8, 'Chevre'),
(9, 'Cresson'),
(10, 'Emmental'),
(11, 'Gorgonzola'),
(12, 'Jambon cuit'),
(13, 'Jambon fumé'),
(14, 'Oeuf'),
(15, 'Oignon'),
(16, 'Olive noire'),
(17, 'Olive verte'),
(18, 'Parmesan'),
(19, 'Piment'),
(20, 'Poivre'),
(21, 'Pomme de terre'),
(22, 'Raclette'),
(23, 'Salami'),
(24, 'Tomate cerise'),
(25, 'Mozarella');

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

DROP TABLE IF EXISTS `marque`;
CREATE TABLE IF NOT EXISTS `marque` (
  `id_marque` int NOT NULL AUTO_INCREMENT,
  `nom_marque` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_marque`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `marque`
--

INSERT INTO `marque` (`id_marque`, `nom_marque`) VALUES
(1, 'Coca-cola'),
(2, 'Pepsico'),
(3, 'Monster'),
(4, 'Cristalline');

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id_menu` int NOT NULL AUTO_INCREMENT,
  `nom_menu` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `prix_menu` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `achete`
--
ALTER TABLE `achete`
  ADD CONSTRAINT `achete_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `achete_ibfk_2` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD CONSTRAINT `appartient_ibfk_1` FOREIGN KEY (`id_marque`) REFERENCES `marque` (`id_marque`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `appartient_ibfk_2` FOREIGN KEY (`id_boisson`) REFERENCES `boisson` (`id_boisson`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `comprend`
--
ALTER TABLE `comprend`
  ADD CONSTRAINT `comprend_ibfk_1` FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia` (`id_focaccia`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `comprend_ibfk_2` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `constitue`
--
ALTER TABLE `constitue`
  ADD CONSTRAINT `constitue_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `constitue_ibfk_2` FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia` (`id_focaccia`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `contient`
--
ALTER TABLE `contient`
  ADD CONSTRAINT `contient_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `contient_ibfk_2` FOREIGN KEY (`id_boisson`) REFERENCES `boisson` (`id_boisson`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

/* LISTE DES REQUETES */

/* REQUETE 1 : AFFICHAGE DES FOCACCIAS PAR ORDRE ALPHABETIQUE */
SELECT nom_focaccia FROM focaccia ORDER BY nom_focaccia;
/* Résultats : 
Américaine
Emmentalaccia
Gorgonzollaccia
Hawaienne
Mozaccia
Paysanne
Raclaccia
Tradizione */

/* REQUETE 2 : NOMBRE TOTAL D'INGREDIENTS */
SELECT COUNT(*) id_ingredient FROM ingredient;
/* Résultats :  25 ingredients */

/* REQUETE 3 : AFFICHER LE PRIX MOYEN DES FOCACCIAS */
SELECT AVG(prix_focaccia) AS AveragePrice FROM focaccia;
/* Resultat prix moyen : 10,37 */


/* REQUETE 4 : AFFICHER LA LISTE DES BOISSONS AVEC LEUR MARQUE TRIEE PAR NOM */
SELECT boisson.nom_boisson, marque.nom_marque FROM boisson
INNER JOIN appartient ON boisson.id_boisson = appartient.id_boisson
INNER JOIN marque ON appartient.id_marque = marque.id_marque
ORDER BY boisson.nom_boisson ASC;
/* Resultat :
Capri-sun - Coca Cola
Coca Cola Original - Coca Cola
Coca Cola Zero - Coca Cola
Eau de Source - Cristaline
(....)
*/

/* REQUETE 5 : AFFICHER LES INGREDIENTS POUR UNE RACLACCIA */
SELECT nom_ingredient AS ingredient_Raclaccia FROM focaccia 
INNER JOIN comprend ON focaccia.id_focaccia = comprend.id_focaccia
INNER JOIN ingredient ON comprend.id_ingredient = ingredient.id_ingredient 
WHERE nom_focaccia = 'raclaccia';
/* Resultat :
Ail
Base Tomate
Champignon
Cresson
Parmesan
Poivre
Raclette
 */

/* REQUETE 6 : AFFICHER LE NOM ET LE NOMBRE D'INGREDIENT POUR CHAQUE FOCACCIA */
SELECT nom_focaccia, COUNT(comprend.id_ingredient) AS nombre_ingredient FROM focaccia
INNER JOIN comprend ON focaccia.id_focaccia = comprend.id_focaccia
GROUP BY focaccia.id_focaccia, focaccia.nom_focaccia
ORDER BY focaccia.nom_focaccia;
/* Resultat :
Américaine
8
Emmentalaccia
7
Gorgonzollaccia
8
Hawaienne
9
Mozaccia
10
Paysanne
12
Raclaccia
7
Tradizione
9
*/

/* REQUETE 7 : AFFICHER LE NOM DE LA FOCACCIA AVEC LE PLUS D'INGREDIENT */
SELECT nom_focaccia, COUNT(comprend.id_ingredient) AS nombre_ingredient FROM focaccia
INNER JOIN comprend ON focaccia.id_focaccia = comprend.id_focaccia
GROUP BY focaccia.id_focaccia, focaccia.nom_focaccia
ORDER BY nombre_ingredient DESC
LIMIT 1;
/* Resultat :
Paysanne
12
 */

/* REQUETE 8 : AFFICHER LES FOCACCIA AVEC DE L'AIL */
SELECT nom_focaccia FROM focaccia
INNER JOIN comprend ON focaccia.id_focaccia = comprend.id_focaccia
INNER JOIN ingredient ON comprend.id_ingredient = ingredient.id_ingredient
WHERE ingredient.nom_ingredient LIKE '%ail%'
ORDER BY nom_focaccia;
/* Resultat :
Gorgonzollaccia
Mozaccia
Paysanne
Raclaccia
*/

/* REQUETE 9 : AFFICHER LES INGREDIENTS NON UTILISES */
SELECT nom_ingredient FROM ingredient
LEFT JOIN comprend ON ingredient.id_ingredient = comprend.id_ingredient
WHERE comprend.id_ingredient IS NULL
ORDER BY ingredient.nom_ingredient ASC;
/* Resultat :
Salami
Tomate cerise
 */

/* REQUETE 10 : AFFICHER LES FOCACCIAS SANS CHAMPIGNONS  */
SELECT nom_focaccia FROM focaccia
WHERE focaccia.id_focaccia NOT IN ( 
    SELECT comprend.id_focaccia
    FROM comprend
    INNER JOIN ingredient ON comprend.id_ingredient = ingredient.id_ingredient
    WHERE ingredient.nom_ingredient LIKE '%champignon%' )
ORDER BY nom_focaccia ASC;
/* Resultat :
Hawaienne
Américaine
*/