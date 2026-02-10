/* Création de la base de donnée */
CREATE DATABASE IF NOT EXISTS tifosi DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `tifosi`;

/* Création de l'utilisateur */
CREATE USER `tifosi`@`localhost` IDENTIFIED BY 'Admin123';
GRANT ALL PRIVILEGES ON tifosi.* TO `tifosi`@`localhost`;
FLUSH PRIVILEGES; 

/* Création de la table focaccia */
CREATE TABLE IF NOT EXISTS focaccia (
    id_focaccia INT AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL UNIQUE,
    prix DECIMAL(5,2) NOT NULL,
PRIMARY KEY (id_focaccia) 
);

/* Création de la table ingrédient */
CREATE TABLE IF NOT EXISTS ingredient (
    id_ingredient INT AUTO_INCREMENT,
    nom_ VARCHAR(50) NOT NULL UNIQUE,
PRIMARY KEY (id_ingredient)       
);

/* Création de la table boisson */
CREATE TABLE IF NOT EXISTS boisson (
    id_boisson INT AUTO_INCREMENT,
    nom VARCHAR(30) NOT NULL UNIQUE,
PRIMARY KEY (id_boisson)   
);

/* Création de la table marque */
CREATE TABLE IF NOT EXISTS marque (
    id_marque INT AUTO_INCREMENT,
    nom VARCHAR(30) NOT NULL UNIQUE,
PRIMARY KEY (id_marque)      
);

/* Creation de la table clients */
CREATE TABLE IF NOT EXISTS client (
    id_client INT AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    code_postal INT NOT NULL,
PRIMARY KEY (id_client)
);

/* Creation de la table menu */
CREATE TABLE IF NOT EXISTS menu (
    id_menu INT AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL UNIQUE,
    prix DECIMAL(5,2) NOT NULL,
PRIMARY KEY (id_menu)
);


/*Creation de la table des composants ingredients */
CREATE TABLE comprend (

)
