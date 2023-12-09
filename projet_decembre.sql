-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : sam. 09 déc. 2023 à 21:20
-- Version du serveur : 10.5.20-MariaDB
-- Version de PHP : 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `id21643610_projet_decembre`
--

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id_comment` int(11) NOT NULL,
  `content_comment` text DEFAULT NULL,
  `date_comment` varchar(16) DEFAULT NULL,
  `id_topic` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id_comment`, `content_comment`, `date_comment`, `id_topic`, `id_user`) VALUES
(1, 'TEST commentaire\n', '08/12/2023 22:43', 1, 3),
(2, 'ouais ouais\n', '08/12/2023 22:43', 1, 3),
(3, 'Allez stream le fruit de mon epoques les brothers\n', '08/12/2023 22:43', 1, 3),
(5, 'Interessant', '09/12/2023 16:37', 3, 4),
(6, 'ok Brother', '09/12/2023 16:39', 3, 5),
(7, 'C\'est une révolution ! L\'IA autonome peut transformer notre façon de travailler et vivre, mais pose aussi d\'importantes questions éthiques et de sécurité.', '09/12/2023 16:40', 9, 5),
(8, 'La fusion nucléaire pourrait être la réponse à nos besoins énergétiques futurs, sans les risques des centrales nucléaires actuelles.', '09/12/2023 17:24', 10, 4),
(9, 'Bien que prometteuse, cette technologie soulève des inquiétudes concernant la vie privée, le contrôle et l\'impact sur l\'emploi.', '09/12/2023 17:26', 9, 6),
(10, 'Cette technologie pourrait bouleverser les marchés énergétiques et réduire la dépendance aux combustibles fossiles.', '09/12/2023 17:27', 10, 6),
(11, 'Naps j\'aime trop tes sons !', '09/12/2023 17:28', 3, 6),
(12, 'C\'est une étape cruciale vers un avenir durable, mais ne doit pas détourner l\'attention de la réduction de notre consommation énergétique.', '09/12/2023 17:28', 10, 3),
(13, 'C\'est l\'avenir des affaires ! Les entreprises qui adoptent rapidement l\'IA autonome auront un avantage compétitif majeur.', '09/12/2023 17:29', 9, 3),
(14, 'Cette technologie est un espoir incroyable pour de nombreux patients, mais nécessite une réglementation stricte pour assurer la sécurité.', '09/12/2023 17:29', 11, 3),
(15, 'La thérapie génique est la frontière de la médecine de précision, mais il reste encore beaucoup à explorer pour comprendre ses implications à long terme.', '09/12/2023 17:30', 11, 4),
(16, 'Cela pourrait changer ma vie, mais j\'ai des inquiétudes quant à l\'accessibilité et au coût de ces traitements.', '09/12/2023 17:31', 11, 7),
(17, 'J\'y crois pas.', '09/12/2023 17:31', 9, 7),
(18, 'Mais non Nabil bien ou quoi ?', '09/12/2023 17:33', 3, 7),
(19, 'La RA et la RV rendent l\'apprentissage plus engageant et accessible, surtout pour des sujets difficiles à enseigner dans une salle de classe traditionnelle.', '09/12/2023 17:34', 12, 8),
(20, 'Les voitures autonomes peuvent réduire la congestion urbaine, mais il est essentiel de repenser nos villes pour les adapter à cette nouvelle mobilité.', '09/12/2023 17:38', 13, 9),
(21, 'La RA et la RV rendent l\'apprentissage plus engageant et accessible, surtout pour des sujets difficiles à enseigner dans une salle de classe traditionnelle.', '09/12/2023 17:39', 12, 9),
(22, 'Ces technologies rendent mes cours plus intéressants, mais parfois je me sens déconnecté du monde réel.', '09/12/2023 17:39', 12, 9),
(23, 'L\'impression 3D est un outil incroyable pour la chirurgie personnalisée, mais sa mise en œuvre nécessite une formation spécifique.', '09/12/2023 17:40', 14, 10),
(24, 'e suis préoccupé par l\'impact sur les emplois comme le mien, mais j\'espère aussi une réduction des accidents de la route.', '09/12/2023 17:41', 13, 10),
(25, 'Il est crucial d\'intégrer ces outils de manière équilibrée pour ne pas éclipser les méthodes d\'enseignement traditionnelles.', '09/12/2023 17:41', 12, 10),
(26, 'Ces technologies sont clés pour surmonter l\'intermittence des énergies renouvelables comme le solaire et l\'éolien.', '09/12/2023 17:43', 16, 12),
(27, 'Ces technologies peuvent aider à répondre à la demande alimentaire croissante tout en préservant l\'environnement.', '09/12/2023 17:46', 17, 13),
(28, 'C\'est une étape importante vers un avenir durable, mais ne doit pas nous faire oublier la réduction de notre consommation globale.', '09/12/2023 17:46', 16, 13),
(29, 'Les robots chirurgicaux améliorent la précision des opérations, mais requièrent une formation approfondie pour les médecins.', '09/12/2023 17:48', 18, 14),
(30, 'Je suis curieux de voir comment ces innovations peuvent améliorer mon rendement, mais je m\'inquiète aussi de leur coût et de leur acceptation par le public.', '09/12/2023 17:48', 17, 14),
(31, 'Les opportunités commerciales dans le domaine du stockage d\'énergie sont immenses et vont attirer de nombreux investissements.', '09/12/2023 17:48', 16, 14),
(32, 'ouais bof', '09/12/2023 17:50', 19, 15),
(33, 'Les robots peuvent être d\'une grande aide pour les soins quotidiens, mais ne doivent pas remplacer l\'interaction humaine.', '09/12/2023 17:50', 18, 15),
(34, 'Il est essentiel que ces avancées soient sûres et ne nuisent pas à la diversité biologique.', '09/12/2023 17:51', 17, 15),
(35, 'La blockchain est une avancée majeure en matière de sécurité des données, mais elle n\'est pas infaillible et présente de nouveaux défis.', '09/12/2023 17:51', 21, 16),
(36, 'vraiment bof', '09/12/2023 17:52', 19, 16),
(37, 'Nous devons veiller à ce que l\'utilisation de la robotique dans les soins de santé n\'augmente pas les inégalités d\'accès aux soins.', '09/12/2023 17:52', 18, 16),
(38, 'hmmm le bon thé\n', '09/12/2023 17:53', 15, 16),
(39, 'raf', '09/12/2023 18:00', 22, 18),
(40, 'Cette technologie a le potentiel de démocratiser l\'accès aux données sécurisées, mais nécessite une compréhension technique approfondie.', '09/12/2023 18:01', 21, 18),
(41, 'mouais', '09/12/2023 18:01', 19, 18),
(42, 'masterclass', '09/12/2023 18:34', 23, 19),
(43, 'ok', '09/12/2023 18:34', 22, 19),
(44, 'La blockchain pourrait transformer la manière dont les entreprises gèrent les données, mais il reste à voir comment elle sera adoptée à grande échelle.', '09/12/2023 18:35', 21, 19),
(45, 'L\'IA est un outil puissant pour le diagnostic, mais elle ne remplace pas le jugement clinique et l\'expérience des professionnels de santé.', '09/12/2023 18:36', 24, 20),
(46, 'Reel', '09/12/2023 18:37', 23, 20),
(47, 'pfff', '09/12/2023 18:37', 22, 20),
(48, 'Incroyable', '09/12/2023 18:39', 1, 20),
(49, 'La 5G va révolutionner Internet en permettant des applications en temps réel insoupçonnées, mais sa mise en œuvre nécessite des investissements considérables en infrastructure.', '09/12/2023 18:50', 25, 21),
(50, 'Bien que prometteuse, l\'IA en médecine doit encore surmonter des défis éthiques et de précision.', '09/12/2023 18:52', 24, 21),
(51, 'Sheesh', '09/12/2023 18:52', 23, 21),
(52, 'Beurk', '09/12/2023 18:52', 22, 21),
(53, 'L\'IA peut être un outil puissant pour l\'éducation personnalisée, mais elle ne doit pas remplacer l\'interaction humaine essentielle dans le processus d\'apprentissage.', '09/12/2023 18:54', 26, 22),
(54, 'La télémédecine améliorée par la 5G pourrait changer la donne pour l\'accès aux soins de santé, en particulier dans les zones reculées.', '09/12/2023 18:55', 25, 22),
(55, 'L\'utilisation de l\'IA pour les diagnostics me rassure sur la précision des résultats, mais j\'ai des préoccupations quant à la confidentialité de mes données.', '09/12/2023 18:58', 24, 22);

-- --------------------------------------------------------

--
-- Structure de la table `topic`
--

CREATE TABLE `topic` (
  `id_topic` int(11) NOT NULL,
  `title_topic` varchar(255) DEFAULT NULL,
  `message_topic` text DEFAULT NULL,
  `date_topic` varchar(16) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `topic`
--

INSERT INTO `topic` (`id_topic`, `title_topic`, `message_topic`, `date_topic`, `id_user`) VALUES
(1, 'Hobbies créatifs : Partagez vos projets et inspirez la communauté !', 'Salut à tous les créatifs de la communauté !\r\n\r\nQue vous soyez passionné de peinture, de couture, de bricolage, de photographie, ou de tout autre hobby créatif, ce fil est dédié à la célébration de nos projets et à l\'inspiration mutuelle.\r\n\r\nJe commence en présentant mon dernier projet de création de bijoux faits main, mais j\'ai hâte de découvrir ce que vous avez entrepris récemment. Qu\'il s\'agisse d\'une œuvre d\'art qui vous a demandé des heures de concentration, d\'une nouvelle compétence que vous avez acquise, ou même d\'une idée que vous avez en tête et que vous souhaitez discuter, partagez-le ici !\r\n\r\nN\'oubliez pas de mentionner les défis que vous avez rencontrés et comment vous les avez surmontés, ainsi que les ressources qui vous ont inspiré. Nous sommes tous différents dans nos passions, mais je suis convaincu qu\'il y a quelque chose d\'extraordinaire dans chaque projet.\r\n\r\nAlors, qu\'est-ce qui occupe vos moments créatifs ces jours-ci ? Partagez vos réalisations, échangez des conseils et célébrons ensemble la diversité de nos talents créatifs !\r\n\r\n\r\n\r\nN\'hésitez pas à personnaliser le post en fonction de vos propres passions créatives !', '08/12/2023 19:05', 1),
(11, 'Thérapie Génique Avancée', 'La thérapie génique avancée représente un tournant dans la médecine moderne, offrant le potentiel de guérir des maladies génétiques auparavant incurables. Cette approche permet de modifier ou remplacer les gènes défectueux et ouvre la voie à des traitements personnalisés.', '09/12/2023 17:27', 6),
(9, 'Intelligence Artificielle Autonome', 'L\'Intelligence Artificielle (IA) autonome représente une avancée majeure dans la technologie. Ces systèmes peuvent apprendre, s\'adapter et prendre des décisions sans intervention humaine, offrant des possibilités illimitées dans divers domaines tels que la médecine, l\'automatisation industrielle et la résolution des grands défis mondiaux.', '09/12/2023 16:38', 4),
(10, 'Fusion Nucléaire Contrôlée', 'La fusion nucléaire contrôlée est sur le point de devenir une réalité, promettant une source d\'énergie presque illimitée et propre. Cette technologie pourrait résoudre les crises énergétiques et environnementales en fournissant une énergie abondante sans émissions de carbone.', '09/12/2023 16:40', 5),
(3, 'L\'IA va révolution mes albums les brothers !', 'Salut tout le monde!\r\n\r\nJe voulais partager avec vous une découverte incroyable que j\'ai faite récemment. Je suis tombé sur une intelligence artificielle capable d\'écrire des textes de rap ! Cela semble fou, mais cette IA peut générer des paroles qui ressemblent vraiment à mon style.\r\n\r\nCela a commencé comme une simple curiosité, mais maintenant, je me demande si je devrais l\'utiliser pour m\'aider à créer de nouvelles chansons. Cela soulève tout un tas de questions sur la créativité et l\'originalité dans la musique.\r\n\r\nQu\'en pensez-vous ? Est-ce que l\'utilisation de l\'IA dans la création artistique est une bonne idée ou est-ce que ça enlève l\'authenticité de l\'œuvre ? J\'aimerais vraiment entendre vos opinions à ce sujet, surtout venant de personnes passionnées par la technologie et l\'innovation.\r\n\r\nMerci pour vos retours !', '08/12/2023 22:36', 3),
(12, 'Réalité Augmentée et Virtuelle dans l\'Éducation', 'La réalité augmentée (RA) et la réalité virtuelle (RV) commencent à transformer l\'enseignement, en offrant des expériences immersives et interactives qui améliorent l\'apprentissage. Ces technologies permettent aux étudiants d\'explorer des environnements virtuels, de visualiser des concepts complexes et de participer à des simulations éducatives.', '09/12/2023 17:32', 7),
(13, 'Voitures Autonomes et Mobilité Urbaine', 'Les voitures autonomes promettent de révolutionner la mobilité urbaine. En éliminant le besoin de conducteurs, elles pourraient réduire les embouteillages, diminuer les accidents de la route et transformer la conception des villes.', '09/12/2023 17:34', 8),
(14, 'Impression 3D en Médecine', 'L\'impression 3D ouvre des horizons nouveaux dans le domaine médical, permettant la fabrication sur mesure d\'implants, de prothèses, et même la bio-impression de tissus humains. Cette technologie pourrait révolutionner les soins de santé et la chirurgie.', '09/12/2023 17:38', 9),
(15, 'Les Bienfaits pour la Santé du Thé Vert', 'Le thé vert est célèbre non seulement pour son goût mais aussi pour ses nombreux bienfaits pour la santé. Riche en antioxydants comme les catéchines, le thé vert est réputé pour ses propriétés anti-inflammatoires et son potentiel à réduire le risque de certaines maladies chroniques, y compris les maladies cardiaques et certains types de cancer.', '09/12/2023 17:42', 10),
(16, 'Technologies de Stockage d\'Énergie Avancées', 'Les nouvelles technologies de stockage d\'énergie, comme les batteries à haute capacité et les supercondensateurs, promettent de révolutionner notre façon de stocker et d\'utiliser l\'énergie. Elles sont essentielles pour une transition efficace vers des sources d\'énergie renouvelables et pour la stabilisation des réseaux électriques.', '09/12/2023 17:43', 11),
(17, 'Biotechnologie et Agriculture Durable', 'Les avancées en biotechnologie offrent des solutions prometteuses pour une agriculture durable. Des techniques comme le CRISPR pour l\'édition de gènes permettent de développer des cultures plus résistantes et plus productives, tout en réduisant l\'impact environnemental.', '09/12/2023 17:44', 12),
(18, 'Robotique dans les Soins de Santé', 'La robotique dans les soins de santé, incluant les robots chirurgicaux et les assistants robotiques pour les personnes âgées, transforme le domaine médical. Ces technologies offrent une précision accrue dans les interventions chirurgicales et aident à fournir des soins aux populations vieillissantes.', '09/12/2023 17:46', 13),
(19, 'Technologies de Réalité Mixte dans l\'Éducation', 'La réalité mixte, combinant éléments de réalité virtuelle (RV) et réalité augmentée (RA), est en train de transformer l\'éducation. Elle permet une immersion dans des environnements virtuels tout en intégrant des éléments du monde réel, offrant ainsi des expériences d\'apprentissage uniques et interactives pour des matières comme l\'histoire, la science, et même l\'art.', '09/12/2023 17:47', 14),
(20, 'Technologies de Réalité Mixte dans l\'Éducation', 'La réalité mixte, combinant éléments de réalité virtuelle (RV) et réalité augmentée (RA), est en train de transformer l\'éducation. Elle permet une immersion dans des environnements virtuels tout en intégrant des éléments du monde réel, offrant ainsi des expériences d\'apprentissage uniques et interactives pour des matières comme l\'histoire, la science, et même l\'art.', '09/12/2023 17:47', 14),
(21, 'Blockchain et Sécurité des Données', 'La technologie blockchain est louée pour sa capacité à offrir une sécurité des données sans précédent. En utilisant des registres décentralisés et cryptographiques, elle promet une transparence et une immutabilité qui pourraient révolutionner des secteurs comme la finance, la santé et même le vote électronique.', '09/12/2023 17:51', 15),
(22, 'Réalité Virtuelle dans la Formation Professionnelle', 'La réalité virtuelle (RV) s\'implante de plus en plus dans le domaine de la formation professionnelle. En créant des environnements simulés, la RV offre une méthode d\'apprentissage immersive et pratique, idéale pour des domaines tels que la médecine, l\'aviation, et même la formation militaire.', '09/12/2023 17:53', 16),
(23, 'Golmon - Un Concept Traditionnel dans la Culture Francaise', 'Le \"golmon\" est un concept central dans la culture traditionnelle Francaise. Ce terme encapsule un ensemble complexe de croyances, de pratiques et de valeurs qui influencent profondément la vie sociale, politique et spirituelle de certains francais', '09/12/2023 18:00', 18),
(24, 'Intelligence Artificielle dans le Diagnostic Médical', 'L\'intelligence artificielle (IA) transforme le domaine médical, en particulier dans le diagnostic de maladies. Grâce à sa capacité à analyser de grandes quantités de données rapidement, l\'IA peut assister les médecins dans la détection précoce de conditions comme le cancer, améliorant ainsi les chances de traitement réussi.', '09/12/2023 18:36', 19),
(25, 'Technologie 5G et son Impact sur la Communication', 'La 5G, la dernière génération de technologie de réseau mobile, promet des vitesses de connexion ultra-rapides et une faible latence. Elle est destinée à transformer non seulement nos téléphones portables, mais aussi à permettre des avancées dans des domaines comme la télémédecine, l\'automobile autonome, et plus encore.', '09/12/2023 18:37', 20),
(26, 'Intelligence Artificielle et Éducation Personnalisée', 'L\'intelligence artificielle (IA) révolutionne le secteur de l\'éducation en offrant des expériences d\'apprentissage personnalisées. En analysant les styles et les rythmes d\'apprentissage des étudiants, l\'IA peut adapter le contenu éducatif pour répondre aux besoins individuels, améliorant ainsi les résultats d\'apprentissage.', '09/12/2023 18:52', 21),
(27, 'Internet des Objets (IoT) et Gestion Intelligente des Villes', 'L\'Internet des Objets (IoT) transforme les villes en métropoles intelligentes. En intégrant des capteurs et des appareils connectés dans les infrastructures urbaines, l\'IoT permet une gestion plus efficace des ressources, une meilleure surveillance de l\'environnement et une amélioration des services publics.', '09/12/2023 18:53', 22);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `mail_user` varchar(320) NOT NULL,
  `pseudo_user` varchar(16) NOT NULL,
  `password_user` varchar(64) NOT NULL,
  `role_user` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `mail_user`, `pseudo_user`, `password_user`, `role_user`) VALUES
(1, 'admin@gmail.com', 'admin', 'f2d81a260dea8a100dd517984e53c56a7523d96942a834b9cdc249bd4e8c7aa9', 1),
(2, 'jean.michel@gmail.com', 'Jean Michel', 'f2d81a260dea8a100dd517984e53c56a7523d96942a834b9cdc249bd4e8c7aa9', 0),
(3, 'naps@richesse.com', 'Naps', 'f2d81a260dea8a100dd517984e53c56a7523d96942a834b9cdc249bd4e8c7aa9', 0),
(4, 'Michel@obama.com', 'MichelObama', 'f2d81a260dea8a100dd517984e53c56a7523d96942a834b9cdc249bd4e8c7aa9', 0),
(5, 'dylandu13@clio.fr', 'Dylandu13', 'f2d81a260dea8a100dd517984e53c56a7523d96942a834b9cdc249bd4e8c7aa9', 0),
(6, 'Ioamra@pantoufle.com', 'Ioamra', 'f2d81a260dea8a100dd517984e53c56a7523d96942a834b9cdc249bd4e8c7aa9', 0),
(7, 'Castor@prudent.com', 'Trevor', 'f2d81a260dea8a100dd517984e53c56a7523d96942a834b9cdc249bd4e8c7aa9', 0),
(8, 'Francis@pomme.fr', 'FrancisNgnougnou', 'f2d81a260dea8a100dd517984e53c56a7523d96942a834b9cdc249bd4e8c7aa9', 0),
(9, 'Caramelo@jaune.fr', 'Mati', 'f2d81a260dea8a100dd517984e53c56a7523d96942a834b9cdc249bd4e8c7aa9', 0),
(10, 'kinder@pinguin.com', 'Alan', 'f2d81a260dea8a100dd517984e53c56a7523d96942a834b9cdc249bd4e8c7aa9', 0),
(11, 'Mario@nintendo.com', 'Lucas', 'f2d81a260dea8a100dd517984e53c56a7523d96942a834b9cdc249bd4e8c7aa9', 0),
(12, 'Kylian@pasteque.com', 'Kylian', 'f2d81a260dea8a100dd517984e53c56a7523d96942a834b9cdc249bd4e8c7aa9', 0),
(13, 'fifa@achier.com', 'Jean-MichMich', 'f2d81a260dea8a100dd517984e53c56a7523d96942a834b9cdc249bd4e8c7aa9', 0),
(14, 'Nvidia@amd.com', 'Xiang-Pong', 'f2d81a260dea8a100dd517984e53c56a7523d96942a834b9cdc249bd4e8c7aa9', 0),
(15, 'djiewdadadwa@fefefwq.fr', 'Eric', 'f2d81a260dea8a100dd517984e53c56a7523d96942a834b9cdc249bd4e8c7aa9', 0),
(16, 'fuewofmewfw@fewfiweifw.fr', 'Teemo', 'f2d81a260dea8a100dd517984e53c56a7523d96942a834b9cdc249bd4e8c7aa9', 0),
(17, 'fwefhwoijpkfwkji@fowekfe.fr', 'TimCook', 'f2d81a260dea8a100dd517984e53c56a7523d96942a834b9cdc249bd4e8c7aa9', 0),
(18, 'fweuyugyhufjiewoklfofe@wsh.com', 'ADLorent', 'f2d81a260dea8a100dd517984e53c56a7523d96942a834b9cdc249bd4e8c7aa9', 0),
(19, 'fefy8f98weijfjwwf@frfgrf.gt', 'Benoit', 'f2d81a260dea8a100dd517984e53c56a7523d96942a834b9cdc249bd4e8c7aa9', 0),
(20, 'grewgwrg@feiwjfwe.fr', 'Mickeal', 'f2d81a260dea8a100dd517984e53c56a7523d96942a834b9cdc249bd4e8c7aa9', 0),
(21, 'fgrhifwiuefiw@fjriefer.fr', 'Coralie', 'f2d81a260dea8a100dd517984e53c56a7523d96942a834b9cdc249bd4e8c7aa9', 0),
(22, 'fewfwuehjwfk@tyson.com', 'Younes', 'f2d81a260dea8a100dd517984e53c56a7523d96942a834b9cdc249bd4e8c7aa9', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `id_topic` (`id_topic`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`id_topic`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id_comment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT pour la table `topic`
--
ALTER TABLE `topic`
  MODIFY `id_topic` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
