-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: Board
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `course_user`
--

DROP TABLE IF EXISTS `course_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_user` (
  `course_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_user`
--

LOCK TABLES `course_user` WRITE;
/*!40000 ALTER TABLE `course_user` DISABLE KEYS */;
INSERT INTO `course_user` VALUES (2,1),(2,2),(2,3),(3,2),(3,3),(3,5),(2,4),(2,5),(4,2),(5,21),(5,22),(6,21),(7,21),(9,25);
/*!40000 ALTER TABLE `course_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` longtext COLLATE utf8mb4_unicode_ci,
  `start_at` timestamp NULL DEFAULT NULL,
  `end_at` timestamp NULL DEFAULT NULL,
  `status` int DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_user_id_foreign` (`user_id`),
  CONSTRAINT `courses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (8,'test course',NULL,NULL,NULL,NULL,10,'2022-08-27 12:21:10','2022-08-27 12:21:10'),(9,'тест курс','<p>тест описание</p>','2022-08-27 15:44:04','2022-08-31 15:44:06',1,26,'2022-08-27 13:44:13','2022-08-27 13:44:13'),(10,'тест 2','<p>тест 2</p>','2022-09-01 15:44:27','2022-09-02 15:44:29',2,26,'2022-08-27 13:44:32','2022-08-27 13:44:32');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_user`
--

DROP TABLE IF EXISTS `lesson_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lesson_user` (
  `lesson_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_user`
--

LOCK TABLES `lesson_user` WRITE;
/*!40000 ALTER TABLE `lesson_user` DISABLE KEYS */;
INSERT INTO `lesson_user` VALUES (23,3),(29,21),(22,21),(15,21),(14,2),(14,3),(14,4),(30,1),(30,3),(30,6),(30,7),(30,8),(30,9),(30,13),(30,15),(30,16),(30,18),(30,20),(30,21),(30,22),(29,23),(31,21),(32,23),(32,21),(34,1),(35,23),(37,25),(38,25),(39,25),(40,25);
/*!40000 ALTER TABLE `lesson_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` longtext COLLATE utf8mb4_unicode_ci,
  `start_at` timestamp NULL DEFAULT NULL,
  `status` int DEFAULT NULL,
  `course_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `pad_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pad_json` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `lessons_course_id_foreign` (`course_id`),
  KEY `lessons_user_id_foreign` (`user_id`),
  CONSTRAINT `lessons_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `lessons_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessons`
--

LOCK TABLES `lessons` WRITE;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
INSERT INTO `lessons` VALUES (33,'Eum veritatis conseq','f4hJeRXHY',NULL,NULL,1,NULL,1,NULL,NULL,'2022-08-27 12:08:51','2022-08-27 12:08:51'),(34,'Omnis elit ab sed s','28eNESKYK',NULL,NULL,1,NULL,1,NULL,NULL,'2022-08-27 12:08:56','2022-08-27 12:08:56'),(36,'test lesson','7PZK5Bvva',NULL,NULL,1,NULL,10,NULL,NULL,'2022-08-27 12:20:52','2022-08-27 12:21:01'),(40,'Ut facilis nostrud q','44ElnIBDZ',NULL,NULL,1,10,26,NULL,NULL,'2022-08-27 18:50:29','2022-08-27 18:50:29');
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licence_types`
--

DROP TABLE IF EXISTS `licence_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `licence_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` longtext COLLATE utf8mb4_unicode_ci,
  `pupils` int DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `board` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licence_types`
--

LOCK TABLES `licence_types` WRITE;
/*!40000 ALTER TABLE `licence_types` DISABLE KEYS */;
INSERT INTO `licence_types` VALUES (1,'10 p','<p>desc</p>',5,1,1000.00,'2022-08-08 18:19:48','2022-08-26 19:49:59',0),(2,'122 p',NULL,20,1,2000.00,'2022-08-08 18:49:34','2022-08-14 13:21:15',NULL);
/*!40000 ALTER TABLE `licence_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licence_user`
--

DROP TABLE IF EXISTS `licence_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `licence_user` (
  `licence_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licence_user`
--

LOCK TABLES `licence_user` WRITE;
/*!40000 ALTER TABLE `licence_user` DISABLE KEYS */;
INSERT INTO `licence_user` VALUES (18,3),(18,4),(19,3),(20,3),(20,6),(21,2),(21,6),(22,21),(21,1),(22,23),(23,25),(23,25);
/*!40000 ALTER TABLE `licence_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licences`
--

DROP TABLE IF EXISTS `licences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `licences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `licence_type_id` bigint unsigned NOT NULL,
  `start_at` timestamp NULL DEFAULT NULL,
  `end_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `licences_user_id_foreign` (`user_id`),
  KEY `licences_licence_type_id_foreign` (`licence_type_id`),
  CONSTRAINT `licences_licence_type_id_foreign` FOREIGN KEY (`licence_type_id`) REFERENCES `licence_types` (`id`),
  CONSTRAINT `licences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licences`
--

LOCK TABLES `licences` WRITE;
/*!40000 ALTER TABLE `licences` DISABLE KEYS */;
INSERT INTO `licences` VALUES (18,4,1,'2022-08-15 22:31:00','2022-09-15 22:31:00',1,'2022-08-09 04:32:48','2022-08-15 20:32:02'),(19,1,1,'2022-08-15 23:54:00','2022-09-16 23:54:00',1,'2022-08-15 21:54:39','2022-08-15 22:23:21'),(20,1,1,'1978-07-01 04:03:00','2009-04-12 06:27:00',0,'2022-08-25 09:58:04','2022-08-25 09:58:04'),(21,1,1,'1989-04-07 01:56:00','2014-08-27 01:36:00',1,'2022-08-25 09:58:09','2022-08-25 09:58:09'),(22,10,1,'2022-08-26 18:41:00','2022-08-31 18:42:00',1,'2022-08-26 16:42:12','2022-08-26 16:42:12'),(23,26,1,'2022-08-27 16:01:00','2022-09-27 16:01:00',1,'2022-08-27 14:01:27','2022-08-27 14:01:27');
/*!40000 ALTER TABLE `licences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `links` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `course_id` bigint unsigned DEFAULT NULL,
  `lesson_id` bigint unsigned DEFAULT NULL,
  `limit` int DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `links_slug_unique` (`slug`),
  KEY `links_user_id_foreign` (`user_id`),
  CONSTRAINT `links_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
INSERT INTO `links` VALUES (10,'2022-08-26 15:02:39','2022-08-26 15:03:07','rwUYJP4tY',1,4,10,NULL,1),(11,'2022-08-26 15:02:58','2022-08-26 15:03:03','W7Xbz0PaP',1,NULL,NULL,NULL,1),(12,'2022-08-26 16:16:18','2022-08-27 12:22:35','dSbEGjFxb',1,8,36,NULL,1);
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2020_03_31_114745_remove_backpackuser_model',1),(6,'2022_07_19_105136_create_permission_tables',1),(7,'2022_08_08_183538_create_licences_table',1),(8,'2022_08_08_183539_create_licence_types_table',1),(9,'2022_08_08_183540_create_courses_table',1),(10,'2022_08_08_183541_create_lessons_table',1),(11,'2022_08_08_183542_create_transactions_table',1),(12,'2022_08_08_183543_create_licence_user_table',1),(13,'2022_08_08_183544_create_course_user_table',1),(14,'2022_08_08_183545_create_lesson_user_table',1),(15,'2022_08_16_124711_add_board_to_licence_type_table',2),(16,'2022_08_16_132642_create_links_table',3),(22,'2022_08_26_132815_add_request_table',4),(24,'2022_08_26_132817_add_request_table',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (3,'App\\Models\\User',1),(2,'App\\Models\\User',2),(2,'App\\Models\\User',3),(1,'App\\Models\\User',4),(2,'App\\Models\\User',5),(2,'App\\Models\\User',6),(2,'App\\Models\\User',7),(2,'App\\Models\\User',8),(2,'App\\Models\\User',9),(1,'App\\Models\\User',10),(2,'App\\Models\\User',11),(2,'App\\Models\\User',12),(2,'App\\Models\\User',13),(2,'App\\Models\\User',14),(2,'App\\Models\\User',15),(2,'App\\Models\\User',16),(2,'App\\Models\\User',17),(2,'App\\Models\\User',18),(2,'App\\Models\\User',19),(2,'App\\Models\\User',20),(2,'App\\Models\\User',21),(2,'App\\Models\\User',22),(2,'App\\Models\\User',23),(2,'App\\Models\\User',24),(2,'App\\Models\\User',25),(1,'App\\Models\\User',26),(2,'App\\Models\\User',27),(2,'App\\Models\\User',28),(2,'App\\Models\\User',29),(2,'App\\Models\\User',30),(2,'App\\Models\\User',31),(2,'App\\Models\\User',32),(2,'App\\Models\\User',33),(2,'App\\Models\\User',34),(2,'App\\Models\\User',35),(2,'App\\Models\\User',36),(1,'App\\Models\\User',37),(2,'App\\Models\\User',38);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `link_id` bigint unsigned NOT NULL,
  `status` enum('new','accepted','ignored') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `requests_owner_id_foreign` (`owner_id`),
  KEY `requests_user_id_foreign` (`user_id`),
  KEY `requests_link_id_foreign` (`link_id`),
  CONSTRAINT `requests_link_id_foreign` FOREIGN KEY (`link_id`) REFERENCES `links` (`id`) ON DELETE CASCADE,
  CONSTRAINT `requests_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`),
  CONSTRAINT `requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'owner','web','2022-08-08 19:16:58','2022-08-14 13:12:40'),(2,'user','web','2022-08-08 19:17:12','2022-08-15 11:40:26'),(3,'admin','web','2022-08-08 19:17:22','2022-08-15 11:40:12');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `amount` decimal(8,2) DEFAULT NULL,
  `tx` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('deposit','buy') COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `licence_id` bigint unsigned DEFAULT NULL,
  `status` enum('pending','successful','failed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_user_id_foreign` (`user_id`),
  KEY `transactions_licence_id_foreign` (`licence_id`),
  CONSTRAINT `transactions_licence_id_foreign` FOREIGN KEY (`licence_id`) REFERENCES `licences` (`id`),
  CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@admin.com',NULL,'$2y$10$a15aSxgKojGWXrIPdRkwkeeL6bgW54zj9papqq563BLuv1UfxqvZi',NULL,'2022-08-08 16:51:58','2022-08-09 04:27:20'),(2,'Zia Steele','admin1@admin.com',NULL,'$2y$10$YxXg/42FMhIbkdkBEjasoeWEoXoLPg5i9MBoToAQMfhIpy5HTsqSe',NULL,'2022-08-08 18:49:06','2022-08-08 18:49:06'),(3,'Jackson Hendricks','hukag@mailinator.com',NULL,'$2y$10$gqFbsU12nO/Dt1g/alDQp.brUq5vqBiIG8MMadUkP5X5n./dvljLK',NULL,'2022-08-08 18:49:18','2022-08-08 18:49:18'),(4,'test','test@admin.com',NULL,'$2y$10$whOgHF7QhfPisJRXCesy3OZZVHKThQHoEcMayYn2jYVz74BHWdUHu',NULL,'2022-08-09 03:34:04','2022-08-09 03:34:04'),(5,'demo','admin@demo.com',NULL,'$2y$10$.yXVoFoBc0Z1vyetNyw1jOFujnVLe.Uf23BDV/kA4MTgjuY.Rf6ym',NULL,'2022-08-15 22:51:24','2022-08-15 22:51:24'),(6,'demo2','admin@demo2.com',NULL,'$2y$10$T/rwvzmOR3CjFnwcaRebmeRrUGMGFGbOT78EdYq79I3ZonLU9hHFS',NULL,'2022-08-15 23:45:52','2022-08-15 23:45:52'),(7,'demo3','admin@demo3.com',NULL,'$2y$10$C8MfoGq5VlbG..XX.17LHuZzGv1aJDdExllvH5YuzlBPE24DOqKGG',NULL,'2022-08-15 23:46:59','2022-08-15 23:46:59'),(8,'demo4','admin@demo4.com',NULL,'$2y$10$AQeH.3LoQyqtwVxTVvr1JeV0u/bFm3uBTrEJY.9m0Gz/s/.OLMGqu',NULL,'2022-08-15 23:48:24','2022-08-15 23:48:24'),(9,'demo5','admin@demo5.com',NULL,'$2y$10$mShHNGeV9glqbAA.w9Xbg.UNcxp3hf1dOQECJHXKuALoVLfKZgStu',NULL,'2022-08-15 23:49:56','2022-08-15 23:49:56'),(10,'test2','test2@admin.com',NULL,'$2y$10$9q0mJ42s5JCI9J0cXwoQhO33Z4zZsgM7iM0tRvw9iQ8hgAmV.ST0W',NULL,'2022-08-16 00:00:51','2022-08-16 00:00:51'),(11,'demo','demo@admin.com',NULL,'$2y$10$Qzpt3pfgm20fR9Kb7A9Ni.BA7DwvLcZjHDUgjCmiWuNQQJmefVcm2',NULL,'2022-08-26 13:19:56','2022-08-26 13:19:56'),(12,'demo2','demo2@admin.com',NULL,'$2y$10$UhDvXhD.gb03EPgr6ds9MuaBgrhxMn/4A.TNiZEo2LfJyFgmvUZze',NULL,'2022-08-26 13:39:43','2022-08-26 13:39:43'),(13,'demo3','demo3@admin.com',NULL,'$2y$10$1PTLleB2QMyf3VJXs3Y9/ONIZ96gdIGMBtD.C/QQVbxin2Fz.umta',NULL,'2022-08-26 13:51:29','2022-08-26 13:51:29'),(14,'demo4','demo4@admin.com',NULL,'$2y$10$HeTOIO2ZCOJIwFk717sQvu3d/vramnoJxbq0.k0k8SE02vR5KBjGy',NULL,'2022-08-26 13:52:26','2022-08-26 13:52:26'),(15,'demo5','demo5@admin.com',NULL,'$2y$10$QNCWWrfGpeBSarGlyhw/reAS.6wr5GT1LGpJtvS452Mwuc0xyTphi',NULL,'2022-08-26 13:53:45','2022-08-26 13:53:45'),(16,'demo6','demo6@admin.com',NULL,'$2y$10$YcJ7FPiyoCJAuT11daGaH.i7v/1/FhxtTVpNrLdoBQDxek542oKGO',NULL,'2022-08-26 13:55:15','2022-08-26 13:55:15'),(17,'demo7','demo7@admin.com',NULL,'$2y$10$WamIyNU8hi06w1ef2D8hl.sjzOyWP4nTKjiUXqruRB9bj1tqhVOMm',NULL,'2022-08-26 13:55:40','2022-08-26 13:55:40'),(18,'demo8','demo8@admin.com',NULL,'$2y$10$vk7tjU6S7jWLwuXz4Jeyg.6Cwz3NtbRaKoaADGvahQE8EJu8ni65S',NULL,'2022-08-26 13:57:08','2022-08-26 13:57:08'),(19,'demo9','demo9@admin.com',NULL,'$2y$10$K3QAGjx0rCUhm4ZrDkpBP.8sxSulQvxrvoAG/YQUwHqSPaoT5/GXW',NULL,'2022-08-26 13:58:27','2022-08-26 13:58:27'),(20,'demo10','demo10@admin.com',NULL,'$2y$10$0h/hAn8B9GGe3Vwvli23degyDIg1i9P2YYaUQ1hEi68ZZF9ow8ufy',NULL,'2022-08-26 13:59:43','2022-08-26 13:59:43'),(21,'demo11','demo11@admin.com',NULL,'$2y$10$.6JJbFGUmXAhvGAUc8Vtke1h.JQnQsU5p1m2emTVapU8GH/QMH3nK',NULL,'2022-08-26 14:04:13','2022-08-26 14:04:13'),(22,'Jillian Mclean','demo33@admin.com',NULL,'$2y$10$RZjqH0qWXfC.IEsjQiteOOe59pIX7RTCt0BdE69SuoNki6RtSTrKW',NULL,'2022-08-26 14:06:11','2022-08-26 14:06:11'),(23,'demo34','demo34@admin.com',NULL,'$2y$10$IpX7WiM6O4x0N1sxsOh7Se2zVHQuj8J83W5iqN85AGWsEGN5tWs6K',NULL,'2022-08-26 14:31:38','2022-08-26 14:31:38'),(24,'demo111','demo111@admin.com',NULL,'$2y$10$teMd.7DMEc9faAFgdTfE8uLnKlPctitYC4RMGb8ENKkbPzRynQRrG',NULL,'2022-08-26 19:40:50','2022-08-26 19:40:50'),(25,'user1','user1@admin.com',NULL,'$2y$10$s7hKUqhNE9Wq2HjzBI174.JmIS3vg0JMnecqQBk4WLvIP0W1bvyhi',NULL,'2022-08-27 12:13:35','2022-08-27 12:13:35'),(26,'owner','owner@admin.com',NULL,'$2y$10$Ajh.RmsIygNcG.Bu9QQQVeaCl/2rfjafF5mGn821yKVpJk1rAbSri',NULL,'2022-08-27 13:04:01','2022-08-27 13:04:01'),(27,'hello@admin.com','hello@admin.com',NULL,'$2y$10$g5zSP.0lSvLqKMW563NigeoQ2GmRjsuwC8JCjwsBBso91v21SMXl.',NULL,'2022-08-27 19:43:00','2022-08-27 19:43:00'),(28,'India Hartman','rabeb@mailinator.com',NULL,'$2y$10$jkOaY6U84nRp1v7s7bqHa.I2SeYO6T5ktQk32uz5yqFR.dWGBgmVi',NULL,'2022-08-27 19:51:25','2022-08-27 19:51:25'),(29,'Nerea Mendoza','lotoqapyf@mailinator.com',NULL,'$2y$10$g74Fhkqp8lvEW9uxCRLv7O5Dgmbf5VndaksyBaBX1NmMwfpPPF4mS',NULL,'2022-08-27 19:54:57','2022-08-27 19:54:57'),(30,'Charde Santos','leralyku@mailinator.com',NULL,'$2y$10$vboqH8Y0hdLH09RZorw96emhBTRXuMVGXzUuckd5/gachBlsuz.e6',NULL,'2022-08-27 19:55:39','2022-08-27 19:55:39'),(31,'Faith Day','sagy@mailinator.com',NULL,'$2y$10$5HgS2sBVvcRRKPDgz6irN.fqso8i6qx/K.I2DUQnX92SO.lqiXPgy',NULL,'2022-08-27 19:57:43','2022-08-27 19:57:43'),(32,'Omar Beck','diriqo@mailinator.com',NULL,'$2y$10$c4TciWbA7lHwsy5NI7KMg.Kt9dStm27adWHxBMpx9Eoo.ZZojh07O',NULL,'2022-08-27 20:00:42','2022-08-27 20:00:42'),(33,'Kirby Lucas','lopomof@mailinator.com',NULL,'$2y$10$hbrPLSX8hXPDX7XPBplVOuB5sp/nt6uROjCtdRU5ShwsPGmswJKlK',NULL,'2022-08-27 20:03:26','2022-08-27 20:03:26'),(34,'Darius Jones','pitakik@mailinator.com',NULL,'$2y$10$l0w/s.v7dhzcht.IudoeMef/EMPIeCN9kJeYrH.i3oLRWseLwLFtu',NULL,'2022-08-27 20:21:31','2022-08-27 20:21:31'),(35,'Caesar Moss','valoxaxube@mailinator.com',NULL,'$2y$10$qJjNuXLoLxeFsBaOP5u33uRUM4.rqVoKV5EIL92B.EcEkEyi5dVeq',NULL,'2022-08-27 20:22:04','2022-08-27 20:22:04'),(36,'Caesar Moss','wocyvyfejo@mailinator.com',NULL,'$2y$10$c0O9t3K84nqNoiTNEMZXhOuLL3maA1qJ.b9j57HI6zl9LJRVR0auq',NULL,'2022-08-27 20:22:36','2022-08-27 20:22:36'),(37,'Cairo Dennis','verukov@mailinator.com',NULL,'$2y$10$wy9bcEvlHOTswbzQKk4lIOfaImKQ4o.tY/yr0A5GLL/t.oUF67vLG',NULL,'2022-08-27 20:24:56','2022-08-27 20:24:56'),(38,'Lyle Wood','buco@mailinator.com',NULL,'$2y$10$bOW2lnJJzFmYzX66FxhgGeGrMUwdi8wmeVU0LphsmD9kvAVRKrtSC',NULL,'2022-08-27 20:25:14','2022-08-27 20:25:14');
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

-- Dump completed on 2022-08-28  0:28:05
