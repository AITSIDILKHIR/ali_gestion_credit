-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 20 fév. 2023 à 13:28
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
-- Base de données : `gestioncredit`
--

-- --------------------------------------------------------

--
-- Structure de la table `app1_carousel`
--

DROP TABLE IF EXISTS `app1_carousel`;
CREATE TABLE IF NOT EXISTS `app1_carousel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `description` longtext,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `app1_carousel`
--

INSERT INTO `app1_carousel` (`id`, `title`, `description`, `image`) VALUES
(1, 'slide1', '', 'online1.jpg'),
(2, 'slide2', '', 'online2.jpg'),
(3, 'slide3', '', 'online3.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `app1_category`
--

DROP TABLE IF EXISTS `app1_category`;
CREATE TABLE IF NOT EXISTS `app1_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `app1_category`
--

INSERT INTO `app1_category` (`id`, `name`, `created`) VALUES
(8, 'cat13', '2023-02-19 23:44:40.252751');

-- --------------------------------------------------------

--
-- Structure de la table `app1_clients`
--

DROP TABLE IF EXISTS `app1_clients`;
CREATE TABLE IF NOT EXISTS `app1_clients` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `cin` varchar(100) DEFAULT NULL,
  `updated` datetime(6) NOT NULL,
  `created` datetime(6) NOT NULL,
  `credit` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `app1_clients`
--

INSERT INTO `app1_clients` (`id`, `nom`, `prenom`, `adresse`, `contact`, `image`, `cin`, `updated`, `created`, `credit`) VALUES
(1, 'ali233', 'AIT SIDO ', 'DIYAR TANGER GROUPE 12 IM 7 APP6', '089297249', 'online3_m6vkhKB.jpg', 'V009', '2023-02-20 13:10:42.517766', '2023-02-20 00:56:05.212532', NULL),
(2, 'yassin', 'ahmadi', 'diyar tanger', '0989898', 'ALIII_ioPe31j.jpg', 'KB0908', '2023-02-20 01:41:36.996593', '2023-02-20 01:41:36.996593', NULL),
(3, 'monir', 'ahmed', 'diyar tanger', '098739287', 'ALIII_sOnoiTs.jpg', 'kb3232', '2023-02-20 01:47:01.198074', '2023-02-20 01:47:01.198074', 9089);

-- --------------------------------------------------------

--
-- Structure de la table `app1_product`
--

DROP TABLE IF EXISTS `app1_product`;
CREATE TABLE IF NOT EXISTS `app1_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` longtext,
  `price` varchar(100) DEFAULT NULL,
  `discount` varchar(100) DEFAULT NULL,
  `updated` datetime(6) NOT NULL,
  `created` datetime(6) NOT NULL,
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app1_product_category_id_cc5a3c69_fk_app1_category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `app1_product`
--

INSERT INTO `app1_product` (`id`, `name`, `image`, `description`, `price`, `discount`, `updated`, `created`, `category_id`) VALUES
(5, 'nouriture', 'logo_Pw07zBQ.png', '', '120', '', '2023-02-19 23:53:24.057140', '2023-02-19 23:53:24.057140', 8);

-- --------------------------------------------------------

--
-- Structure de la table `app1_userprofile`
--

DROP TABLE IF EXISTS `app1_userprofile`;
CREATE TABLE IF NOT EXISTS `app1_userprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mobile` varchar(100) DEFAULT NULL,
  `address` longtext,
  `image` varchar(100) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app1_userprofile_user_id_37647760_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `app1_userprofile`
--

INSERT INTO `app1_userprofile` (`id`, `mobile`, `address`, `image`, `user_id`) VALUES
(1, '0645480226', 'DIYAR TANGER GR 12 APP 6 IM7', 'ALIII.jpg', 8),
(2, 'JKJKJ', '', 'ALIII_sqxBlHj.jpg', 9),
(3, '067378718', 'ffg', 'ALIII_leN1eDv.jpg', 10),
(4, '4324Z', 'GFGFH', 'ALIII_m1SOLR7.jpg', 11),
(5, '090103108', 'X VXV', 'ALIII_Vx5h4Zr.jpg', 12);

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'ventes');

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add student', 7, 'add_student'),
(26, 'Can change student', 7, 'change_student'),
(27, 'Can delete student', 7, 'delete_student'),
(28, 'Can view student', 7, 'view_student'),
(29, 'Can add carousel', 8, 'add_carousel'),
(30, 'Can change carousel', 8, 'change_carousel'),
(31, 'Can delete carousel', 8, 'delete_carousel'),
(32, 'Can view carousel', 8, 'view_carousel'),
(33, 'Can add category', 9, 'add_category'),
(34, 'Can change category', 9, 'change_category'),
(35, 'Can delete category', 9, 'delete_category'),
(36, 'Can view category', 9, 'view_category'),
(37, 'Can add product', 10, 'add_product'),
(38, 'Can change product', 10, 'change_product'),
(39, 'Can delete product', 10, 'delete_product'),
(40, 'Can view product', 10, 'view_product'),
(41, 'Can add user profile', 11, 'add_userprofile'),
(42, 'Can change user profile', 11, 'change_userprofile'),
(43, 'Can delete user profile', 11, 'delete_userprofile'),
(44, 'Can view user profile', 11, 'view_userprofile'),
(45, 'Can add client', 12, 'add_client'),
(46, 'Can change client', 12, 'change_client'),
(47, 'Can delete client', 12, 'delete_client'),
(48, 'Can view client', 12, 'view_client'),
(49, 'Can add clients', 13, 'add_clients'),
(50, 'Can change clients', 13, 'change_clients'),
(51, 'Can delete clients', 13, 'delete_clients'),
(52, 'Can view clients', 13, 'view_clients');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$bRX7iNu8q8AFTTcLZorlWf$esSQoA1YAhbLKF3Mn/OnD9CGSzZiLHb9FlpZXf+NFlU=', '2023-02-20 09:55:27.343353', 1, 'ALI', '', '', 'ali.aitsidilkhir@gmail.com', 1, 1, '2023-02-15 22:19:37.000000'),
(2, 'pbkdf2_sha256$260000$JJlcToTEWJuBAewXeSZx7f$yTtaNBsVUi3RabMiHjJHLwbn8C0T49jc/azDKezFHmk=', '2023-02-20 00:15:17.788997', 1, 'LKHIR', '', '', 'ali.midelt@hotmail.fr', 1, 1, '2023-02-16 17:21:00.000000'),
(3, 'pbkdf2_sha256$260000$DGaq6Kkguq7K3W172Qc2RU$964PRvr+E055k9Vw5PPTrM5s2z1jQ2EqlsssbGV17uM=', NULL, 0, 'alia', '', '', '', 0, 1, '2023-02-17 19:42:23.182079'),
(4, 'pbkdf2_sha256$260000$FRFQ8yOSYF41b05ALTiIqx$1WBG2L9xu4F4NO/Hd3FsGzdB8kzRtuKFVnGWgW7K/Q8=', NULL, 0, 'ali.aitsidilkhir@gmail.com', 'HAMZAOUI', 'YAHYAOUI', 'ali.aitsidilkhir@gmail.com', 0, 1, '2023-02-18 19:42:54.121229'),
(6, 'pbkdf2_sha256$260000$dIh2vcD5RU6amuVFmlMMvJ$3+Xoxhs6KSk77SMiKnaYxe70pwpzO+uV3/PEUubtXDY=', NULL, 0, 'ali.ati@gmail.com', 'HAMZAOUI', 'YAHYAOUI', 'ali.ati@gmail.com', 0, 1, '2023-02-18 19:52:05.045563'),
(8, 'pbkdf2_sha256$260000$5MxQvYTxprQwvi3brn5Ps2$QbjYCCrGuMVyLhOPdFwYYux+xbKkKSLfj+iRZ1B9PXM=', NULL, 0, 'ali.at@gmail.com', 'HAMZAOUI', 'YAHYAOUI', 'ali.at@gmail.com', 0, 1, '2023-02-18 20:00:55.942033'),
(9, 'pbkdf2_sha256$260000$KEYeiAUmLr5CNZJ6KtYD87$JU+xO6oBtXI8pBJ6Lb9OXoScjuPrZSvxLGYedrj/8l4=', NULL, 0, 'KLK@jkj', '', '', 'KLK@jkj', 0, 1, '2023-02-18 20:02:43.899748'),
(10, 'pbkdf2_sha256$260000$21ePw0ay5Yu6O98OsYsri9$u53CO/YxQ9PiD/+UVJ38vqNYqA0tg1Y4EALkwBE4qJk=', NULL, 0, 'amin@kkj', 'mohamed', 'yassin', 'amin@kkj', 0, 1, '2023-02-18 20:55:33.105042'),
(11, 'pbkdf2_sha256$260000$5GqwEj8XCoA76l3AekeGO7$vCeSAE7iZ60hfb+7rA1mxWJH0W7oBA4129y8td80zcw=', NULL, 0, 'kflskf@kjedkj', 'ahmed', 'ilkl', 'kflskf@kjedkj', 0, 1, '2023-02-18 21:07:10.595269'),
(12, 'pbkdf2_sha256$260000$bvofIFB9yMyJhGeevuZ04z$9mwHtWtZ0N5zCHVYPWFaS/ZnEvOjNaJljnMiDpRQT/g=', NULL, 0, 'ad@daa', 'sasa', 'dadad', 'ad@daa', 0, 1, '2023-02-18 21:18:57.727936');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ;

--
-- Déchargement des données de la table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-02-15 22:29:23.030704', '1', 'ventes', 1, '[{\"added\": {}}]', 3, 1),
(2, '2023-02-15 22:31:19.824260', '1', 'ventes', 2, '[]', 3, 1),
(3, '2023-02-15 22:33:23.206835', '1', 'ALI', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(4, '2023-02-15 22:46:57.624302', '1', 'student object (1)', 1, '[{\"added\": {}}]', 7, 1),
(5, '2023-02-15 22:47:27.770551', '2', 'student object (2)', 1, '[{\"added\": {}}]', 7, 1),
(6, '2023-02-16 01:49:43.561388', '1', 'slide1', 1, '[{\"added\": {}}]', 8, 1),
(7, '2023-02-16 01:49:53.429260', '2', 'slide2', 1, '[{\"added\": {}}]', 8, 1),
(8, '2023-02-16 01:50:09.377002', '3', 'slide3', 1, '[{\"added\": {}}]', 8, 1),
(9, '2023-02-16 13:25:32.595772', '1', 'ALI', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(10, '2023-02-16 17:21:00.619502', '2', 'LKHIR', 1, '[{\"added\": {}}]', 4, 1),
(11, '2023-02-16 17:21:34.580865', '2', 'LKHIR', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 4, 1),
(12, '2023-02-17 00:23:52.542878', '3', 'student object (3)', 1, '[{\"added\": {}}]', 7, 2),
(13, '2023-02-17 00:24:01.742830', '4', 'student object (4)', 1, '[{\"added\": {}}]', 7, 2),
(14, '2023-02-17 19:42:23.494269', '3', 'alia', 1, '[{\"added\": {}}]', 4, 2),
(15, '2023-02-19 00:17:49.048942', '1', 'ali', 1, '[{\"added\": {}}]', 12, 2),
(16, '2023-02-19 00:18:21.097186', '1', 'ali', 2, '[]', 12, 2);

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(8, 'app1', 'carousel'),
(9, 'app1', 'category'),
(12, 'app1', 'client'),
(13, 'app1', 'clients'),
(10, 'app1', 'product'),
(7, 'app1', 'student'),
(11, 'app1', 'userprofile'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-02-15 21:04:31.785024'),
(2, 'auth', '0001_initial', '2023-02-15 21:04:48.770268'),
(3, 'admin', '0001_initial', '2023-02-15 21:04:53.211938'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-02-15 21:04:53.253496'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-02-15 21:04:53.314502'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-02-15 21:04:55.103859'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-02-15 21:04:56.711427'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-02-15 21:04:56.917497'),
(9, 'auth', '0004_alter_user_username_opts', '2023-02-15 21:04:56.994753'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-02-15 21:04:58.246170'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-02-15 21:04:58.389471'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-02-15 21:04:58.500487'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-02-15 21:04:59.936879'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-02-15 21:05:01.660119'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-02-15 21:05:01.885710'),
(16, 'auth', '0011_update_proxy_permissions', '2023-02-15 21:05:01.968255'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-02-15 21:05:03.810392'),
(18, 'sessions', '0001_initial', '2023-02-15 21:05:04.875807'),
(19, 'app1', '0001_initial', '2023-02-15 22:46:10.629867'),
(20, 'app1', '0002_carousel', '2023-02-16 01:00:57.247562'),
(21, 'app1', '0003_category', '2023-02-16 21:38:05.400544'),
(22, 'app1', '0004_product', '2023-02-16 23:48:28.959238'),
(23, 'app1', '0005_userprofile', '2023-02-18 19:13:20.799741'),
(24, 'app1', '0006_client', '2023-02-18 23:30:44.590007'),
(25, 'app1', '0007_auto_20230220_0125', '2023-02-20 00:25:40.992612'),
(26, 'app1', '0008_clients_credit', '2023-02-20 01:37:07.281578');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2mc39nd8eabfzdmr34ze21olu4u4y3iu', '.eJxVjDsOwjAQBe_iGlmJv1lKes5g7dobHEC2FCcV4u5gKQW0b2beSwTctxz2xmtYkjiLUZx-N8L44NJBumO5VRlr2daFZFfkQZu81sTPy-H-HWRs-VvDZDR5g6TU7JQlMxBo0i4mzzDF5AgZ2UdtMAHi0M1ZK1CjtUgA4v0B7jk4Wg:1pTutl:_tFX0FnNeZCuUME93Vfwq0GyEKfjBP-eNktxb9BWhW8', '2023-03-06 01:23:21.683830'),
('gq5b4wqw6rfshdofxtk7t7vey352ypgf', '.eJxVjDsOwjAQBe_iGlmJv1lKes5g7dobHEC2FCcV4u5gKQW0b2beSwTctxz2xmtYkjiLUZx-N8L44NJBumO5VRlr2daFZFfkQZu81sTPy-H-HWRs-VvDZDR5g6TU7JQlMxBo0i4mzzDF5AgZ2UdtMAHi0M1ZK1CjtUgA4v0B7jk4Wg:1pU2tL:MIovM4liBZ29kEkQw_YSFvZBSiu8RvS-W7c7Xpkbzbs', '2023-03-06 09:55:27.393589'),
('qx3raxqlex64a988geoxwqqs54rib2r2', '.eJxVjMsOwiAQRf-FtSFlyqO4dO83EGYGpGogKe3K-O_apAvd3nPOfYkQt7WEraclzCzOQonT74aRHqnugO-x3pqkVtdlRrkr8qBdXhun5-Vw_w5K7OVbA4Mzii0qduNoETHnASdGbcGgBWANyRN545PCQSvno3XggPIUOZN4fwDmDTgv:1pST8Y:0JKoHtk7E8Z9kKxGE1MPRJRWZ8aOhRAr8MqvRyLSQDM', '2023-03-02 01:32:38.593626'),
('ydh6p8ki6flignbrrhttt6spd5bcandl', '.eJxVjMsOwiAQRf-FtSHDQ0CX7vsNzTAMUjWQlHZl_HdD0oVu7znnvsWM-1bmvfM6L0lchRan3y0iPbkOkB5Y701Sq9u6RDkUedAup5b4dTvcv4OCvYxaYw6gvGJnDbA-o4raMnlnLtlFZoMALqhkg7cQyWVLIWvOkBKqQOLzBdyBOCM:1pTtpt:kCi-NdAn6MNKOZdbt2L0s6O3vp6QW8Wik7jfqpnl_WQ', '2023-03-06 00:15:17.836259');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `app1_product`
--
ALTER TABLE `app1_product`
  ADD CONSTRAINT `app1_product_category_id_cc5a3c69_fk_app1_category_id` FOREIGN KEY (`category_id`) REFERENCES `app1_category` (`id`);

--
-- Contraintes pour la table `app1_userprofile`
--
ALTER TABLE `app1_userprofile`
  ADD CONSTRAINT `app1_userprofile_user_id_37647760_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
