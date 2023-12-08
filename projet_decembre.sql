-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 08 déc. 2023 à 18:06
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

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
-- Structure de la table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id_comment` int NOT NULL AUTO_INCREMENT,
  `content_comment` text,
  `date_comment` varchar(16) DEFAULT NULL,
  `id_topic` int DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  PRIMARY KEY (`id_comment`),
  KEY `id_topic` (`id_topic`),
  KEY `id_user` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `topic`
--

DROP TABLE IF EXISTS `topic`;
CREATE TABLE IF NOT EXISTS `topic` (
  `id_topic` int NOT NULL AUTO_INCREMENT,
  `title_topic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `message_topic` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `date_topic` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  PRIMARY KEY (`id_topic`),
  KEY `id_user` (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `topic`
--

INSERT INTO `topic` (`id_topic`, `title_topic`, `message_topic`, `date_topic`, `id_user`) VALUES
(1, 'Hobbies créatifs : Partagez vos projets et inspirez la communauté !', 'Salut à tous les créatifs de la communauté !\r\n\r\nQue vous soyez passionné de peinture, de couture, de bricolage, de photographie, ou de tout autre hobby créatif, ce fil est dédié à la célébration de nos projets et à l\'inspiration mutuelle.\r\n\r\nJe commence en présentant mon dernier projet de création de bijoux faits main, mais j\'ai hâte de découvrir ce que vous avez entrepris récemment. Qu\'il s\'agisse d\'une œuvre d\'art qui vous a demandé des heures de concentration, d\'une nouvelle compétence que vous avez acquise, ou même d\'une idée que vous avez en tête et que vous souhaitez discuter, partagez-le ici !\r\n\r\nN\'oubliez pas de mentionner les défis que vous avez rencontrés et comment vous les avez surmontés, ainsi que les ressources qui vous ont inspiré. Nous sommes tous différents dans nos passions, mais je suis convaincu qu\'il y a quelque chose d\'extraordinaire dans chaque projet.\r\n\r\nAlors, qu\'est-ce qui occupe vos moments créatifs ces jours-ci ? Partagez vos réalisations, échangez des conseils et célébrons ensemble la diversité de nos talents créatifs !\r\n\r\n\r\n\r\nN\'hésitez pas à personnaliser le post en fonction de vos propres passions créatives !', '08/12/2023 19:05', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `mail_user` varchar(320) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pseudo_user` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_user` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `mail_user`, `pseudo_user`, `password_user`, `role_user`) VALUES
(1, 'admin@gmail.com', 'admin', 'f2d81a260dea8a100dd517984e53c56a7523d96942a834b9cdc249bd4e8c7aa9', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
