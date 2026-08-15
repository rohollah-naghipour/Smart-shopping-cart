/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: nova
-- ------------------------------------------------------
-- Server version	10.11.13-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `algorithm_versions`
--

DROP TABLE IF EXISTS `algorithm_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `algorithm_versions` (
  `id` char(36) NOT NULL,
  `version` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `released_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_algorithm_versions_version` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `algorithm_versions`
--

LOCK TABLES `algorithm_versions` WRITE;
/*!40000 ALTER TABLE `algorithm_versions` DISABLE KEYS */;
INSERT INTO `algorithm_versions` VALUES
('alg-0001','v1.0.0','Initial NOVA MVP recommendation algorithm','2026-08-10 05:30:00');
/*!40000 ALTER TABLE `algorithm_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_categories_parent_id` (`parent_id`),
  CONSTRAINT `fk_categories_parent` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES
('cat-0001',NULL,'Staple Foods','Basic food products',NULL),
('cat-0002','cat-0001','Rice','Rice products',NULL),
('cat-0003','cat-0001','Pasta','Pasta products',NULL),
('cat-0004',NULL,'Dairy','Milk and dairy products',NULL),
('cat-0005',NULL,'Protein','Protein-rich foods',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `decision_logs`
--

DROP TABLE IF EXISTS `decision_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `decision_logs` (
  `id` char(36) NOT NULL,
  `recommendation_history_id` char(36) NOT NULL,
  `product_id` char(36) NOT NULL,
  `action` smallint(6) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`details`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_decision_logs_history` (`recommendation_history_id`),
  KEY `idx_decision_logs_product` (`product_id`),
  CONSTRAINT `fk_decision_logs_history` FOREIGN KEY (`recommendation_history_id`) REFERENCES `recommendation_history` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_decision_logs_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decision_logs`
--

LOCK TABLES `decision_logs` WRITE;
/*!40000 ALTER TABLE `decision_logs` DISABLE KEYS */;
INSERT INTO `decision_logs` VALUES
('decision-0001','rec-0001','prd-0005',1,'Selected','{\"score\":92,\"budget_fit\":true}','2026-08-10 06:30:00'),
('decision-0002','rec-0001','prd-0004',1,'Selected','{\"score\":88,\"budget_fit\":true}','2026-08-10 06:30:00');
/*!40000 ALTER TABLE `decision_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2026-08-10 09:29:12.231541'),
(2,'auth','0001_initial','2026-08-10 09:29:16.659944'),
(3,'admin','0001_initial','2026-08-10 09:29:17.487998'),
(4,'admin','0002_logentry_remove_auto_add','2026-08-10 09:29:17.586762'),
(5,'admin','0003_logentry_add_action_flag_choices','2026-08-10 09:29:17.643396'),
(6,'contenttypes','0002_remove_content_type_name','2026-08-10 09:29:18.200707'),
(7,'auth','0002_alter_permission_name_max_length','2026-08-10 09:29:18.550720'),
(8,'auth','0003_alter_user_email_max_length','2026-08-10 09:29:18.767066'),
(9,'auth','0004_alter_user_username_opts','2026-08-10 09:29:18.796132'),
(10,'auth','0005_alter_user_last_login_null','2026-08-10 09:29:19.125097'),
(11,'auth','0006_require_contenttypes_0002','2026-08-10 09:29:19.161008'),
(12,'auth','0007_alter_validators_add_error_messages','2026-08-10 09:29:19.185368'),
(13,'auth','0008_alter_user_username_max_length','2026-08-10 09:29:19.366683'),
(14,'auth','0009_alter_user_last_name_max_length','2026-08-10 09:29:19.624763'),
(15,'auth','0010_alter_group_name_max_length','2026-08-10 09:29:19.849851'),
(16,'auth','0011_update_proxy_permissions','2026-08-10 09:29:19.880756'),
(17,'auth','0012_alter_user_first_name_max_length','2026-08-10 09:29:20.091131'),
(18,'sessions','0001_initial','2026-08-10 09:29:20.415853');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `families`
--

DROP TABLE IF EXISTS `families`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `families` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `monthly_budget` decimal(18,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_families_name_city` (`name`,`city`),
  CONSTRAINT `chk_families_budget` CHECK (`monthly_budget` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `families`
--

LOCK TABLES `families` WRITE;
/*!40000 ALTER TABLE `families` DISABLE KEYS */;
INSERT INTO `families` VALUES
('fam-0001','Ahmadi Family','Tehran',25000000.00,'2026-08-10 05:30:00'),
('fam-0002','Rahimi Family','Shiraz',18000000.00,'2026-08-10 05:35:00');
/*!40000 ALTER TABLE `families` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `family_members`
--

DROP TABLE IF EXISTS `family_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `family_members` (
  `id` char(36) NOT NULL,
  `family_id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `height_cm` decimal(5,2) NOT NULL,
  `weight_kg` decimal(6,2) NOT NULL,
  `activity_level` smallint(6) NOT NULL,
  `goal` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_family_members_family_name` (`family_id`,`name`),
  KEY `idx_family_members_family_id` (`family_id`),
  CONSTRAINT `fk_family_members_family` FOREIGN KEY (`family_id`) REFERENCES `families` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chk_family_members_age` CHECK (`age` >= 0 and `age` <= 150),
  CONSTRAINT `chk_family_members_height` CHECK (`height_cm` > 0),
  CONSTRAINT `chk_family_members_weight` CHECK (`weight_kg` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family_members`
--

LOCK TABLES `family_members` WRITE;
/*!40000 ALTER TABLE `family_members` DISABLE KEYS */;
INSERT INTO `family_members` VALUES
('mem-0001','fam-0001','Ali',35,1,178.00,82.50,2,1),
('mem-0002','fam-0001','Sara',32,0,165.00,62.00,1,1),
('mem-0003','fam-0001','Arman',8,1,128.00,28.50,2,1),
('mem-0004','fam-0002','Reza',40,1,180.00,88.00,1,1),
('mem-0005','fam-0002','Mina',37,0,162.00,67.00,1,1);
/*!40000 ALTER TABLE `family_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutrition_profiles`
--

DROP TABLE IF EXISTS `nutrition_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `nutrition_profiles` (
  `id` char(36) NOT NULL,
  `product_id` char(36) NOT NULL,
  `calories` decimal(10,2) NOT NULL,
  `protein` decimal(10,2) NOT NULL,
  `fat` decimal(10,2) NOT NULL,
  `carbohydrate` decimal(10,2) NOT NULL,
  `fiber` decimal(10,2) NOT NULL,
  `sugar` decimal(10,2) NOT NULL,
  `sodium` decimal(10,2) NOT NULL,
  `vitamins` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`vitamins`)),
  `minerals` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`minerals`)),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_nutrition_profiles_product` (`product_id`),
  KEY `idx_nutrition_profiles_product_id` (`product_id`),
  CONSTRAINT `fk_nutrition_profiles_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `CONSTRAINT_1` CHECK (`calories` >= 0),
  CONSTRAINT `CONSTRAINT_2` CHECK (`protein` >= 0),
  CONSTRAINT `CONSTRAINT_3` CHECK (`fat` >= 0),
  CONSTRAINT `CONSTRAINT_4` CHECK (`carbohydrate` >= 0),
  CONSTRAINT `CONSTRAINT_5` CHECK (`fiber` >= 0),
  CONSTRAINT `CONSTRAINT_6` CHECK (`sugar` >= 0),
  CONSTRAINT `CONSTRAINT_7` CHECK (`sodium` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutrition_profiles`
--

LOCK TABLES `nutrition_profiles` WRITE;
/*!40000 ALTER TABLE `nutrition_profiles` DISABLE KEYS */;
INSERT INTO `nutrition_profiles` VALUES
('nut-0001','prd-0001',360.00,7.00,0.70,80.00,1.30,0.20,2.00,'{\"B1\":0.2,\"B3\":1.6}','{\"iron\":0.8}'),
('nut-0002','prd-0002',350.00,12.00,1.50,72.00,3.00,3.00,5.00,'{\"B1\":0.4}','{\"iron\":2.0}'),
('nut-0003','prd-0003',45.00,3.20,1.50,4.80,0.00,4.80,45.00,'{\"B12\":0.4,\"D\":1.0}','{\"calcium\":120}'),
('nut-0004','prd-0004',143.00,12.60,9.50,0.70,0.00,0.40,142.00,'{\"A\":160,\"B12\":1.1}','{\"iron\":1.8}'),
('nut-0005','prd-0005',340.00,25.00,1.20,60.00,11.00,2.00,6.00,'{\"B1\":0.5}','{\"iron\":7.5}'),
('nut-prd-0006','prd-0006',45.00,3.20,1.50,4.60,0.00,4.60,45.00,'{\"B12\": 0.4, \"D\": 1.0}','{\"calcium\": 120, \"potassium\": 150}'),
('nut-prd-0007','prd-0007',60.00,3.00,2.00,4.80,0.00,4.80,42.00,'{\"B12\": 0.5, \"D\": 0.8}','{\"calcium\": 115, \"potassium\": 140}'),
('nut-prd-0008','prd-0008',58.00,3.00,1.80,4.70,0.00,4.70,40.00,'{\"B12\": 0.4, \"D\": 0.7}','{\"calcium\": 110, \"potassium\": 135}'),
('nut-prd-0009','prd-0009',65.00,3.50,3.20,4.80,0.00,4.50,35.00,'{\"B12\": 0.4, \"B2\": 0.2}','{\"calcium\": 130, \"potassium\": 120}'),
('nut-prd-0010','prd-0010',85.00,2.50,1.50,15.00,0.50,12.00,25.00,'{\"B12\": 0.3, \"C\": 1.2}','{\"calcium\": 90, \"potassium\": 100}'),
('nut-prd-0011','prd-0011',52.00,2.80,1.20,6.00,0.00,5.50,30.00,'{\"B12\": 0.3, \"B2\": 0.15}','{\"calcium\": 95, \"potassium\": 110}'),
('nut-prd-0012','prd-0012',45.00,2.50,1.00,5.00,0.00,4.50,120.00,'{\"B12\": 0.2}','{\"calcium\": 80, \"potassium\": 90, \"sodium\": 120}'),
('nut-prd-0013','prd-0013',250.00,18.00,20.00,2.00,0.00,1.00,450.00,'{\"A\": 160, \"B12\": 1.1}','{\"calcium\": 200, \"sodium\": 450}'),
('nut-prd-0014','prd-0014',280.00,22.00,20.00,2.50,0.00,1.50,380.00,'{\"A\": 150, \"B12\": 1.0}','{\"calcium\": 180, \"sodium\": 380}'),
('nut-prd-0015','prd-0015',320.00,6.00,30.00,5.00,0.00,3.00,250.00,'{\"A\": 120}','{\"calcium\": 80, \"sodium\": 250}'),
('nut-prd-0016','prd-0016',280.00,20.00,22.00,2.00,0.00,1.00,420.00,'{\"A\": 140, \"B12\": 0.9}','{\"calcium\": 190, \"sodium\": 420}'),
('nut-prd-0017','prd-0017',120.00,8.00,9.00,3.00,0.00,2.50,200.00,'{\"B12\": 0.5}','{\"calcium\": 150, \"sodium\": 200}'),
('nut-prd-0018','prd-0018',260.00,15.00,20.00,5.00,0.00,3.00,300.00,'{\"A\": 100, \"B12\": 0.7}','{\"calcium\": 160, \"sodium\": 300}'),
('nut-prd-0019','prd-0019',180.00,3.00,8.00,25.00,0.00,20.00,40.00,'{\"A\": 80}','{\"calcium\": 80}'),
('nut-prd-0020','prd-0020',160.00,2.50,6.00,24.00,0.50,18.00,30.00,'{\"C\": 2.0}','{\"calcium\": 60}'),
('nut-prd-0021','prd-0021',175.00,2.80,7.50,24.00,0.60,19.00,35.00,'{\"C\": 1.5, \"A\": 50}','{\"calcium\": 75}'),
('nut-prd-0022','prd-0022',120.00,1.00,0.50,28.00,1.00,20.00,800.00,'{\"C\": 5.0}','{\"sodium\": 800}'),
('nut-prd-0023','prd-0023',300.00,2.00,10.00,50.00,0.00,45.00,80.00,'null','{\"calcium\": 50}'),
('nut-prd-0024','prd-0024',280.00,12.00,14.00,28.00,2.00,4.00,600.00,'{\"A\": 60, \"C\": 1.0}','{\"calcium\": 150, \"sodium\": 600, \"iron\": 2.5}'),
('nut-prd-0025','prd-0025',46.00,0.70,0.20,11.00,0.20,9.00,5.00,'{\"C\": 30.0}','{\"potassium\": 180}'),
('nut-prd-0026','prd-0026',120.00,24.00,1.50,3.00,0.00,2.00,50.00,'{\"B6\": 0.2}','{\"calcium\": 120, \"sodium\": 50, \"iron\": 0.5}'),
('nut-prd-0027','prd-0027',250.00,8.00,1.00,52.00,3.00,2.00,400.00,'null','{\"sodium\": 400, \"iron\": 2.0}'),
('nut-prd-0028','prd-0028',265.00,9.00,3.50,48.00,2.50,4.00,350.00,'null','{\"sodium\": 350, \"iron\": 1.8}'),
('nut-prd-0029','prd-0029',230.00,7.50,2.50,45.00,2.00,3.50,380.00,'null','{\"sodium\": 380, \"iron\": 1.5}'),
('nut-prd-0030','prd-0030',250.00,18.00,20.00,2.00,0.00,1.00,500.00,'null','{\"sodium\": 500, \"iron\": 4.0}');
/*!40000 ALTER TABLE `nutrition_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `prices` (
  `id` char(36) NOT NULL,
  `product_id` char(36) NOT NULL,
  `store_name` varchar(150) NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `date` date NOT NULL,
  `currency` char(3) NOT NULL DEFAULT 'IRR',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_prices_product_store_date` (`product_id`,`store_name`,`date`),
  KEY `idx_prices_product_date` (`product_id`,`date` DESC),
  KEY `idx_prices_store_name` (`store_name`),
  CONSTRAINT `fk_prices_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chk_prices_price` CHECK (`price` >= 0),
  CONSTRAINT `chk_prices_currency` CHECK (`currency` = 'IRR')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prices`
--

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
INSERT INTO `prices` VALUES
('price-0001','prd-0001','Test Supermarket',1250000.00,'2026-08-08','IRR',0),
('price-0002','prd-0001','Test Supermarket',1350000.00,'2026-08-10','IRR',1),
('price-0003','prd-0002','Test Supermarket',650000.00,'2026-08-10','IRR',1),
('price-0004','prd-0003','Test Supermarket',450000.00,'2026-08-10','IRR',1),
('price-0005','prd-0004','Test Supermarket',850000.00,'2026-08-10','IRR',1),
('price-0006','prd-0005','Test Supermarket',900000.00,'2026-08-10','IRR',1),
('price-prd-0006','prd-0006','NOVA Test Store',45000.00,'2026-08-10','IRR',1),
('price-prd-0007','prd-0007','NOVA Test Store',40000.00,'2026-08-10','IRR',1),
('price-prd-0008','prd-0008','NOVA Test Store',42000.00,'2026-08-10','IRR',1),
('price-prd-0009','prd-0009','NOVA Test Store',85000.00,'2026-08-10','IRR',1),
('price-prd-0010','prd-0010','NOVA Test Store',35000.00,'2026-08-10','IRR',1),
('price-prd-0011','prd-0011','NOVA Test Store',28000.00,'2026-08-10','IRR',1),
('price-prd-0012','prd-0012','NOVA Test Store',25000.00,'2026-08-10','IRR',1),
('price-prd-0013','prd-0013','NOVA Test Store',95000.00,'2026-08-10','IRR',1),
('price-prd-0014','prd-0014','NOVA Test Store',55000.00,'2026-08-10','IRR',1),
('price-prd-0015','prd-0015','NOVA Test Store',45000.00,'2026-08-10','IRR',1),
('price-prd-0016','prd-0016','NOVA Test Store',65000.00,'2026-08-10','IRR',1),
('price-prd-0017','prd-0017','NOVA Test Store',50000.00,'2026-08-10','IRR',1),
('price-prd-0018','prd-0018','NOVA Test Store',38000.00,'2026-08-10','IRR',1),
('price-prd-0019','prd-0019','NOVA Test Store',75000.00,'2026-08-10','IRR',1),
('price-prd-0020','prd-0020','NOVA Test Store',25000.00,'2026-08-10','IRR',1),
('price-prd-0021','prd-0021','NOVA Test Store',78000.00,'2026-08-10','IRR',1),
('price-prd-0022','prd-0022','NOVA Test Store',45000.00,'2026-08-10','IRR',1),
('price-prd-0023','prd-0023','NOVA Test Store',35000.00,'2026-08-10','IRR',1),
('price-prd-0024','prd-0024','NOVA Test Store',95000.00,'2026-08-10','IRR',1),
('price-prd-0025','prd-0025','NOVA Test Store',55000.00,'2026-08-10','IRR',1),
('price-prd-0026','prd-0026','NOVA Test Store',26600000.00,'2026-08-10','IRR',1),
('price-prd-0027','prd-0027','NOVA Test Store',18000.00,'2026-08-10','IRR',1),
('price-prd-0028','prd-0028','NOVA Test Store',22000.00,'2026-08-10','IRR',1),
('price-prd-0029','prd-0029','NOVA Test Store',28000.00,'2026-08-10','IRR',1),
('price-prd-0030','prd-0030','NOVA Test Store',120000.00,'2026-08-10','IRR',1);
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_categories` (
  `id` char(36) NOT NULL,
  `product_id` char(36) NOT NULL,
  `category_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_product_categories` (`product_id`,`category_id`),
  KEY `idx_product_categories_category_id` (`category_id`),
  CONSTRAINT `fk_product_categories_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_product_categories_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES
('pc-0001','prd-0001','cat-0002'),
('pc-0002','prd-0002','cat-0003'),
('pc-0003','prd-0003','cat-0004'),
('pc-0004','prd-0004','cat-0005'),
('pc-0006','prd-0005','cat-0001'),
('pc-0005','prd-0005','cat-0005');
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` char(36) NOT NULL,
  `sku` varchar(100) NOT NULL,
  `name` varchar(200) NOT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `weight_g` decimal(13,3) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_products_sku` (`sku`),
  CONSTRAINT `chk_products_weight` CHECK (`weight_g` > 0),
  CONSTRAINT `chk_products_stock` CHECK (`stock` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES
('prd-0001','RICE-001','Iranian Rice 1kg','Shirin',1000.000,NULL,'Iranian white rice',100),
('prd-0002','PASTA-001','Pasta 700g','Mana',700.000,NULL,'Wheat pasta',200),
('prd-0003','MILK-001','Milk 1L','Kalleh',1000.000,NULL,'Low-fat milk',150),
('prd-0004','EGG-001','Egg 12 Pack','Local Farm',600.000,NULL,'Fresh eggs',80),
('prd-0005','LENTIL-001','Lentils 900g','Shirin',900.000,NULL,'Dried lentils',120),
('prd-0006','MILK-002','Low-fat Milk 1.5L','Kalleh',1500.000,NULL,'Fresh pasteurized low-fat milk',320),
('prd-0007','MILK-003','Full-fat Milk 1L','Kalleh',1000.000,NULL,'Rich and creamy full-fat milk',280),
('prd-0008','MILK-004','Sterilized Milk 1L','Kalleh',1000.000,NULL,'UHT sterilized milk with long shelf life',200),
('prd-0009','YOG-001','Seven Yoghurt 750g','Kalleh',750.000,NULL,'Premium creamy yoghurt',150),
('prd-0010','YOG-002','Fruit Yoghurt Peach 125g','Kalleh',125.000,NULL,'Peach-flavored fruit yoghurt',400),
('prd-0011','YOG-003','Drink Yoghurt 250ml','Kalleh',250.000,NULL,'Refreshing drinking yoghurt',350),
('prd-0012','DOOGH-001','Doogh 330ml','Kalleh',330.000,NULL,'Traditional Iranian carbonated yogurt drink',300),
('prd-0013','CHS-001','White Cheese 400g','Kalleh',400.000,NULL,'Classic Iranian white brined cheese',180),
('prd-0014','CHS-002','Gouda Cheese 100g','Kalleh',100.000,NULL,'Semi-hard Gouda cheese',250),
('prd-0015','CHS-003','Cream Cheese 180g','Kalleh',180.000,NULL,'Smooth and creamy cheese for spreading',220),
('prd-0016','CHS-004','Mozzarella Cheese 200g','Kalleh',200.000,NULL,'Pizza cheese with excellent melting properties',160),
('prd-0017','CHS-005','Labneh Cheese 180g','Kalleh',180.000,NULL,'Thick and creamy strained yogurt cheese',190),
('prd-0018','CHS-006','Processed Cheese Slices 200g','Kalleh',200.000,NULL,'Convenient processed cheese slices',300),
('prd-0019','ICE-001','Vanilla Ice Cream 900ml','Kalleh',450.000,NULL,'Classic creamy vanilla ice cream',120),
('prd-0020','ICE-002','Fruit Ice Cream Cup 90g','Kalleh',90.000,NULL,'Glazed ice cream with fruit syrup',350),
('prd-0021','ICE-003','Strawberry Ice Cream 900ml','Kalleh',450.000,NULL,'Rich strawberry flavored ice cream',130),
('prd-0022','SAU-001','Thai Chili Sauce 400g','Kalleh',400.000,NULL,'Spicy Thai chili sauce',180),
('prd-0023','SAU-002','Caramel Spread 200g','Kalleh',200.000,NULL,'Sweet milk caramel spread',210),
('prd-0024','MEAL-001','Frozen Pizza Stroganoff 450g','Kalleh',450.000,NULL,'Ready-to-bake frozen pizza',90),
('prd-0025','JUS-001','Orange Juice 1L','Kalleh',1000.000,NULL,'Fresh non-citrus juice from concentrate',150),
('prd-0026','WHEY-001','Whey Protein Powder 1800g','Kalleh',1800.000,NULL,'High-quality whey protein for athletes',60),
('prd-0027','BRD-001','Barbari Bread','Kalleh',400.000,NULL,'Traditional Iranian flatbread',100),
('prd-0028','BRD-002','Sandwich Bread 500g','Kalleh',500.000,NULL,'Soft sliced bread for sandwiches',130),
('prd-0029','DOUGH-001','Pizza Dough 300g','Kalleh',300.000,NULL,'Ready-to-use pizza dough',110),
('prd-0030','MEAT-001','Burger Patties 400g','Kalleh',400.000,NULL,'Prepared minced red meat burger',95);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommendation_history`
--

DROP TABLE IF EXISTS `recommendation_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommendation_history` (
  `id` char(36) NOT NULL,
  `shopping_plan_id` char(36) NOT NULL,
  `algorithm_version_id` char(36) NOT NULL,
  `generated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `execution_time_ms` int(11) NOT NULL,
  `total_products_considered` int(11) NOT NULL DEFAULT 0,
  `total_products_selected` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_recommendation_history_algorithm` (`algorithm_version_id`),
  KEY `idx_recommendation_history_plan` (`shopping_plan_id`),
  CONSTRAINT `fk_recommendation_history_algorithm` FOREIGN KEY (`algorithm_version_id`) REFERENCES `algorithm_versions` (`id`),
  CONSTRAINT `fk_recommendation_history_plan` FOREIGN KEY (`shopping_plan_id`) REFERENCES `shopping_plans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `CONSTRAINT_1` CHECK (`execution_time_ms` >= 0),
  CONSTRAINT `CONSTRAINT_2` CHECK (`total_products_considered` >= 0),
  CONSTRAINT `CONSTRAINT_3` CHECK (`total_products_selected` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommendation_history`
--

LOCK TABLES `recommendation_history` WRITE;
/*!40000 ALTER TABLE `recommendation_history` DISABLE KEYS */;
INSERT INTO `recommendation_history` VALUES
('rec-0001','plan-0001','alg-0001','2026-08-10 06:30:00',42,5,5);
/*!40000 ALTER TABLE `recommendation_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommendation_reasons`
--

DROP TABLE IF EXISTS `recommendation_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommendation_reasons` (
  `id` char(36) NOT NULL,
  `recommendation_history_id` char(36) NOT NULL,
  `product_id` char(36) NOT NULL,
  `reason_type` smallint(6) NOT NULL,
  `reason_text` text NOT NULL,
  `score` decimal(6,2) DEFAULT NULL,
  `priority` smallint(6) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_recommendation_reasons_history` (`recommendation_history_id`),
  KEY `idx_recommendation_reasons_product` (`product_id`),
  CONSTRAINT `fk_recommendation_reasons_history` FOREIGN KEY (`recommendation_history_id`) REFERENCES `recommendation_history` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_recommendation_reasons_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommendation_reasons`
--

LOCK TABLES `recommendation_reasons` WRITE;
/*!40000 ALTER TABLE `recommendation_reasons` DISABLE KEYS */;
INSERT INTO `recommendation_reasons` VALUES
('reason-0001','rec-0001','prd-0005',1,'High protein and fiber relative to price',92.00,1),
('reason-0002','rec-0001','prd-0004',2,'Good protein source within budget',88.00,2),
('reason-0003','rec-0001','prd-0001',3,'Low-cost staple food',85.00,3);
/*!40000 ALTER TABLE `recommendation_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_items`
--

DROP TABLE IF EXISTS `shopping_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_items` (
  `id` char(36) NOT NULL,
  `shopping_plan_id` char(36) NOT NULL,
  `product_id` char(36) NOT NULL,
  `quantity` decimal(10,3) NOT NULL,
  `unit_price` decimal(18,2) NOT NULL,
  `score` decimal(6,2) DEFAULT NULL,
  `subtotal` decimal(18,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_shopping_items_plan_product` (`shopping_plan_id`,`product_id`),
  KEY `idx_shopping_items_plan_id` (`shopping_plan_id`),
  KEY `idx_shopping_items_product_id` (`product_id`),
  CONSTRAINT `fk_shopping_items_plan` FOREIGN KEY (`shopping_plan_id`) REFERENCES `shopping_plans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_shopping_items_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`quantity` > 0),
  CONSTRAINT `CONSTRAINT_2` CHECK (`unit_price` >= 0),
  CONSTRAINT `CONSTRAINT_3` CHECK (`subtotal` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_items`
--

LOCK TABLES `shopping_items` WRITE;
/*!40000 ALTER TABLE `shopping_items` DISABLE KEYS */;
INSERT INTO `shopping_items` VALUES
('item-0001','plan-0001','prd-0001',2.000,1350000.00,85.00,2700000.00),
('item-0002','plan-0001','prd-0002',1.000,650000.00,75.00,650000.00),
('item-0003','plan-0001','prd-0003',1.000,450000.00,70.00,450000.00),
('item-0004','plan-0001','prd-0004',1.000,850000.00,88.00,850000.00),
('item-0005','plan-0001','prd-0005',1.000,900000.00,92.00,900000.00);
/*!40000 ALTER TABLE `shopping_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_plans`
--

DROP TABLE IF EXISTS `shopping_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_plans` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `budget` decimal(18,2) NOT NULL,
  `total_cost` decimal(18,2) NOT NULL DEFAULT 0.00,
  `nutrition_score` decimal(10,2) DEFAULT NULL,
  `generated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `algorithm_version_id` char(36) NOT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_shopping_plans_user_id` (`user_id`),
  KEY `idx_shopping_plans_algorithm_version_id` (`algorithm_version_id`),
  CONSTRAINT `fk_shopping_plans_algorithm` FOREIGN KEY (`algorithm_version_id`) REFERENCES `algorithm_versions` (`id`),
  CONSTRAINT `fk_shopping_plans_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chk_shopping_plans_budget` CHECK (`budget` >= 0),
  CONSTRAINT `chk_shopping_plans_total_cost` CHECK (`total_cost` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_plans`
--

LOCK TABLES `shopping_plans` WRITE;
/*!40000 ALTER TABLE `shopping_plans` DISABLE KEYS */;
INSERT INTO `shopping_plans` VALUES
('plan-0001','usr-0001',5000000.00,4850000.00,82.50,'2026-08-10 06:30:00','alg-0001','Initial test shopping plan');
/*!40000 ALTER TABLE `shopping_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `family_id` char(36) NOT NULL,
  `email` varchar(160) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `role` smallint(6) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_users_email` (`email`),
  KEY `idx_users_family_id` (`family_id`),
  CONSTRAINT `fk_users_family` FOREIGN KEY (`family_id`) REFERENCES `families` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
('usr-0001','fam-0001','ali@example.com','$2b$12$TEST_HASH_ALI','Ali Ahmadi','09120000001',1,'2026-08-10 05:40:00'),
('usr-0002','fam-0002','reza@example.com','$2b$12$TEST_HASH_REZA','Reza Rahimi','09120000002',1,'2026-08-10 05:41:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-15 19:51:51
