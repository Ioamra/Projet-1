-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 22 nov. 2023 à 15:32
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet_decembre`
--

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `id_message` int NOT NULL AUTO_INCREMENT,
  `contenu` text,
  `date` datetime DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `id_topic` int DEFAULT NULL,
  PRIMARY KEY (`id_message`),
  KEY `id_user` (`id_user`),
  KEY `id_topic` (`id_topic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `topic`
--

DROP TABLE IF EXISTS `topic`;
CREATE TABLE IF NOT EXISTS `topic` (
  `id_topic` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `message` text,
  `creation_date` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  PRIMARY KEY (`id_topic`),
  KEY `id_user` (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `topic`
--

INSERT INTO `topic` (`id_topic`, `title`, `message`, `creation_date`, `id_user`) VALUES
(1, 'Premier topic', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quos explicabo nulla ab quas dolorum pariatur reprehenderit autem omnis doloribus doloremque quis eligendi eius laboriosam delectus dicta accusantium dolorem architecto asperiores natus, suscipit modi corporis sunt. Praesentium ratione omnis a sint nemo eaque alias vero blanditiis voluptates, ipsa perspiciatis neque amet nam non eum qui laudantium unde eveniet ex doloribus sunt. Excepturi molestias tenetur, magni suscipit assumenda harum hic enim voluptas nihil culpa! Error assumenda nobis, mollitia quas nostrum voluptates ducimus repellat odio, ut architecto adipisci voluptas earum? Quibusdam harum mollitia quis, ad ex quo laboriosam exercitationem temporibus, tenetur rerum consequatur.', '22/11/2023 13:47', 1),
(2, 'Second topic', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quos explicabo nulla ab quas dolorum pariatur reprehenderit autem omnis doloribus doloremque quis eligendi eius laboriosam delectus dicta accusantium dolorem architecto asperiores natus, suscipit modi corporis sunt. Praesentium ratione omnis a sint nemo eaque alias vero blanditiis voluptates, ipsa perspiciatis neque amet nam non eum qui laudantium unde eveniet ex doloribus sunt. Excepturi molestias tenetur, magni suscipit assumenda harum hic enim voluptas nihil culpa! Error assumenda nobis, mollitia quas nostrum voluptates ducimus repellat odio, ut architecto adipisci voluptas earum? Quibusdam harum mollitia quis, ad ex quo laboriosam exercitationem temporibus, tenetur rerum consequatur.', '22/11/2023 13:48', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `mail` varchar(320) NOT NULL,
  `pseudo` varchar(16) NOT NULL,
  `password` varchar(64) NOT NULL,
  `role` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `mail`, `pseudo`, `password`, `role`) VALUES
(1, 'admin@gmail.com', 'Admin', 'f2d81a260dea8a100dd517984e53c56a7523d96942a834b9cdc249bd4e8c7aa9', 1),
(2, 'test@gmail.com', 'test', 'f2d81a260dea8a100dd517984e53c56a7523d96942a834b9cdc249bd4e8c7aa9', 0),
(3, 'michel.dumas@gmail.com', 'Michel Dumas', 'f2d81a260dea8a100dd517984e53c56a7523d96942a834b9cdc249bd4e8c7aa9', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
