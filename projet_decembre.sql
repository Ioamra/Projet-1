-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 23 nov. 2023 à 15:18
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id_comment`, `content_comment`, `date_comment`, `id_topic`, `id_user`) VALUES
(1, 'Premier commentaire !', '23/11/2023 15:00', 1, 1),
(2, 'Second commentaire !\nWahou !', '23/11/2023 15:16', 1, 1),
(3, 'Troisime com', '23/11/2023 15:17', 1, 1),
(4, 'Ca a l\'air trop bien !', '23/11/2023 15:18', 1, 1),
(5, 'Encore un petit com pour test', '23/11/2023 15:55', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `topic`
--

DROP TABLE IF EXISTS `topic`;
CREATE TABLE IF NOT EXISTS `topic` (
  `id_topic` int NOT NULL AUTO_INCREMENT,
  `title_topic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `message_topic` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `date_topic` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  PRIMARY KEY (`id_topic`),
  KEY `id_user` (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `topic`
--

INSERT INTO `topic` (`id_topic`, `title_topic`, `message_topic`, `date_topic`, `id_user`) VALUES
(1, 'Premier topic', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quos explicabo nulla ab quas dolorum pariatur reprehenderit autem omnis doloribus doloremque quis eligendi eius laboriosam delectus dicta accusantium dolorem architecto asperiores natus, suscipit modi corporis sunt. Praesentium ratione omnis a sint nemo eaque alias vero blanditiis voluptates, ipsa perspiciatis neque amet nam non eum qui laudantium unde eveniet ex doloribus sunt. Excepturi molestias tenetur, magni suscipit assumenda harum hic enim voluptas nihil culpa! Error assumenda nobis, mollitia quas nostrum voluptates ducimus repellat odio, ut architecto adipisci voluptas earum? Quibusdam harum mollitia quis, ad ex quo laboriosam exercitationem temporibus, tenetur rerum consequatur.', '22/11/2023 13:47', 1),
(2, 'Second topic', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quos explicabo nulla ab quas dolorum pariatur reprehenderit autem omnis doloribus doloremque quis eligendi eius laboriosam delectus dicta accusantium dolorem architecto asperiores natus, suscipit modi corporis sunt. Praesentium ratione omnis a sint nemo eaque alias vero blanditiis voluptates, ipsa perspiciatis neque amet nam non eum qui laudantium unde eveniet ex doloribus sunt. Excepturi molestias tenetur, magni suscipit assumenda harum hic enim voluptas nihil culpa! Error assumenda nobis, mollitia quas nostrum voluptates ducimus repellat odio, ut architecto adipisci voluptas earum? Quibusdam harum mollitia quis, ad ex quo laboriosam exercitationem temporibus, tenetur rerum consequatur.', '22/11/2023 13:48', 1),
(3, 'Nouveau topic super intéressant, ca parle de lorem, de lorem et de lorem, c\'est incroyable !', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Maiores, impedit ut dolore totam magnam labore ratione enim voluptatibus natus assumenda perferendis consectetur commodi vero voluptates doloremque quas odio quia architecto magni! Beatae non nobis vitae reprehenderit voluptates quisquam sequi delectus id nam temporibus inventore eum quasi esse, nesciunt ex. Quam eum commodi amet impedit velit voluptas, nam quos fuga sit tenetur voluptate temporibus, pariatur iure voluptates sapiente. Ab praesentium excepturi alias, odio nesciunt sequi et illo itaque optio distinctio nihil similique veritatis, aspernatur amet voluptatem mollitia modi quos nam beatae eveniet iure perspiciatis ex. Exercitationem eum ea voluptates fugiat, ipsam fuga ex, ullam consectetur dolor vitae libero dolores itaque soluta explicabo dolorem. Assumenda aliquid molestias minima quibusdam aspernatur delectus est deserunt, velit excepturi enim cum numquam aut natus accusamus optio quo corrupti ipsum laboriosam nemo officia eum sit voluptas consequuntur. Odio hic dolorem repellat, consequuntur minus quo! Perferendis asperiores, facere omnis est adipisci sed vel libero accusantium dicta laboriosam iure, doloribus reprehenderit nesciunt sunt explicabo consectetur ipsa impedit eligendi, doloremque cum? Ratione explicabo, porro cumque, quia aliquam enim, tempore debitis vel repudiandae aspernatur nesciunt rem eligendi iste tenetur commodi tempora earum. Minus adipisci vero tenetur natus ipsum possimus illum eveniet.', '23/11/2023 11:34', 1),
(4, 'Nouveau topic super intéressant, ca parle de lorem, de lorem et de lorem, c\'est incroyable !', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Maiores, impedit ut dolore totam magnam labore ratione enim voluptatibus natus assumenda perferendis consectetur commodi vero voluptates doloremque quas odio quia architecto magni! Beatae non nobis vitae reprehenderit voluptates quisquam sequi delectus id nam temporibus inventore eum quasi esse, nesciunt ex. Quam eum commodi amet impedit velit voluptas, nam quos fuga sit tenetur voluptate temporibus, pariatur iure voluptates sapiente. Ab praesentium excepturi alias, odio nesciunt sequi et illo itaque optio distinctio nihil similique veritatis, aspernatur amet voluptatem mollitia modi quos nam beatae eveniet iure perspiciatis ex. Exercitationem eum ea voluptates fugiat, ipsam fuga ex, ullam consectetur dolor vitae libero dolores itaque soluta explicabo dolorem. Assumenda aliquid molestias minima quibusdam aspernatur delectus est deserunt, velit excepturi enim cum numquam aut natus accusamus optio quo corrupti ipsum laboriosam nemo officia eum sit voluptas consequuntur. Odio hic dolorem repellat, consequuntur minus quo! Perferendis asperiores, facere omnis est adipisci sed vel libero accusantium dicta laboriosam iure, doloribus reprehenderit nesciunt sunt explicabo consectetur ipsa impedit eligendi, doloremque cum? Ratione explicabo, porro cumque, quia aliquam enim, tempore debitis vel repudiandae aspernatur nesciunt rem eligendi iste tenetur commodi tempora earum. Minus adipisci vero tenetur natus ipsum possimus illum eveniet.', '23/11/2023 11:36', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `mail_user` varchar(320) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pseudo_user` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role_user` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `mail_user`, `pseudo_user`, `password_user`, `role_user`) VALUES
(1, 'admin@gmail.com', 'Admin', 'f2d81a260dea8a100dd517984e53c56a7523d96942a834b9cdc249bd4e8c7aa9', 1),
(2, 'test@gmail.com', 'test', 'f2d81a260dea8a100dd517984e53c56a7523d96942a834b9cdc249bd4e8c7aa9', 0),
(3, 'michel.dumas@gmail.com', 'Michel Dumas', 'f2d81a260dea8a100dd517984e53c56a7523d96942a834b9cdc249bd4e8c7aa9', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
