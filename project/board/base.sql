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
INSERT INTO `course_user` VALUES (2,1),(2,2),(2,3),(3,2),(3,3),(3,5),(2,4),(2,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (2,'Libero ratione non e','Magni ut incididunt','2022-08-16 00:35:00','2022-08-18 00:35:00',47,3,'2022-08-08 19:33:18','2022-08-15 22:35:29'),(3,'test1','desc','2022-08-16 00:49:00','2022-08-17 00:50:00',NULL,4,'2022-08-15 22:50:17','2022-08-15 22:50:17');
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
INSERT INTO `lesson_user` VALUES (1,1),(1,2),(1,3),(1,4),(3,4),(3,5),(3,6),(3,9),(3,10),(4,3),(4,5),(4,9),(5,3),(5,8),(6,1),(6,3),(6,7),(6,8),(7,1),(7,3),(7,5),(7,7),(7,8),(7,10),(8,4),(9,1),(9,2),(9,3),(9,4),(9,7),(9,9),(10,2),(10,6),(10,7),(10,8),(10,9),(11,1),(11,3),(11,4),(11,8),(11,9),(15,2),(15,3),(15,6),(15,7),(15,8),(15,9),(15,10),(16,3),(17,1),(17,6),(18,1),(18,3),(18,4),(18,5),(18,6),(18,7),(18,8),(18,10),(19,1),(19,2),(19,3),(19,5),(19,7),(19,8),(19,10),(21,5),(21,6),(22,2),(22,3),(22,5),(22,6),(22,9),(23,1),(23,2),(23,3),(23,4),(23,5),(23,6);
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessons`
--

LOCK TABLES `lessons` WRITE;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
INSERT INTO `lessons` VALUES (1,'test lessson','sdsf','desl',NULL,1,NULL,1,NULL,NULL,'2022-08-08 19:32:41','2022-08-08 19:32:41'),(2,'Nihil nesciunt modi','Officiis non nostrum','Quisquam debitis id',NULL,69,2,1,'Ad rerum quos fugiat','Dolore quo sint nul','2022-08-14 14:04:45','2022-08-14 14:05:54'),(3,'Enim debitis lorem m','Explicabo Culpa com','Eos autem pariatur',NULL,91,3,NULL,'Illum ipsum beatae','Sed Nam et dolorum a','2022-08-16 00:10:55','2022-08-16 00:18:43'),(4,'In et consequatur i','Sunt quasi eiusmod s','Quas aut eius earum',NULL,89,3,NULL,'Dicta officia dolore','Autem aliqua Magnam','2022-08-16 00:15:24','2022-08-16 00:21:32'),(6,'Occaecat adipisicing','Id rerum ex dolorem','Aperiam quia esse c','1976-07-14 14:11:00',79,3,7,'Corporis vel veniam','Reiciendis vel ratio','2022-08-16 00:23:38','2022-08-16 00:23:38'),(7,'Quas optio quae in','Qui facilis aspernat','Consequatur est ma','2022-05-15 18:32:00',21,3,2,'Rerum nulla anim ali','Non alias magna culp','2022-08-16 00:25:24','2022-08-16 00:25:25'),(8,'Sint ut cupiditate','Non earum vitae sunt','Modi qui quis quia q','1989-08-21 21:09:00',90,3,5,'Quos voluptas culpa','Quia adipisicing vit','2022-08-16 00:25:51','2022-08-16 00:26:03'),(9,'Natus porro sit nemo','Ratione quisquam eli','Ullamco sunt laudant','2006-07-18 19:16:00',62,3,9,'Ullam aut voluptas e','Eos est qui ut a co','2022-08-16 00:26:15','2022-08-16 00:26:15'),(10,'Maiores quia enim mi','Reprehenderit eius','Ad voluptatem labori','1975-04-01 04:59:00',51,3,10,'Ea veritatis est acc','Voluptas molestiae i','2022-08-16 00:27:10','2022-08-16 00:27:10'),(11,'Pariatur Non sapien','Ratione repudiandae','Sit fugiat consequa','1972-02-12 21:00:00',41,3,5,'Eius ipsum unde sed','Dicta dolor dolore i','2022-08-16 00:27:18','2022-08-16 00:27:18'),(12,'Et facilis commodo u','Obcaecati porro tota','Consequatur Iste ea','2005-07-25 11:02:00',18,3,4,'Iusto aliquam quo ea','Ea reprehenderit of','2022-08-16 00:27:45','2022-08-16 00:27:45'),(13,'Aperiam obcaecati vo','Sint consectetur la','Excepturi rem aut te','2011-04-24 21:01:00',26,3,4,'Ea eum animi velit','Porro omnis sed volu','2022-08-16 00:28:33','2022-08-16 00:28:33'),(14,'Eum vero et mollitia','Nam non incidunt mo','Rem qui ratione et i','2018-06-27 01:49:00',58,3,4,'Dignissimos vero fug','Aut sed cumque do ni','2022-08-16 00:28:47','2022-08-16 00:28:47'),(15,'Atque deserunt eius','Id ut omnis possimus','Voluptates exercitat','1988-06-18 04:11:00',51,3,5,'Aut voluptas consequ','Earum aut voluptatem','2022-08-16 00:29:04','2022-08-16 00:29:04'),(16,'Laborum Incididunt','Sequi quasi tempora','Quia vel enim exerci','2000-02-14 11:17:00',49,3,2,'Aut in qui aliquip a','Quaerat sunt volupta','2022-08-16 00:29:10','2022-08-16 00:29:10'),(17,'Consectetur in modi','Ea nulla quod dicta','Minus aliquam quae q','2016-11-18 07:38:00',54,3,3,'Quidem voluptatem M','Incididunt placeat','2022-08-16 00:31:24','2022-08-16 00:31:24'),(18,'Tempore aut qui ita','Nulla dolore elit d','Nostrud excepteur vo','1977-12-24 13:23:00',19,3,NULL,'Fugiat necessitatibu','Quisquam voluptatibu','2022-08-16 00:31:30','2022-08-16 00:31:30'),(19,'Quae dolores dolores','Neque suscipit cumqu','Rem ea quis iure qui','2014-02-18 12:44:00',96,3,NULL,'Corrupti dolore vol','Qui accusantium volu','2022-08-16 00:31:53','2022-08-16 00:31:53'),(22,'Minima id libero et','Voluptatem perspicia','Ut qui quaerat dolor','1989-11-15 22:34:00',15,3,4,NULL,NULL,'2022-08-16 00:37:54','2022-08-16 00:37:54'),(23,'Deserunt praesentium','Sunt nobis amet qu','Ex expedita esse al','1985-12-09 08:40:00',1,3,4,NULL,NULL,'2022-08-16 00:38:00','2022-08-16 00:38:00');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licence_types`
--

LOCK TABLES `licence_types` WRITE;
/*!40000 ALTER TABLE `licence_types` DISABLE KEYS */;
INSERT INTO `licence_types` VALUES (1,'10 p','desc',10,1,1000.00,'2022-08-08 18:19:48','2022-08-08 18:19:48'),(2,'122 p',NULL,20,1,2000.00,'2022-08-08 18:49:34','2022-08-14 13:21:15');
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
INSERT INTO `licence_user` VALUES (18,3),(18,4),(19,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licences`
--

LOCK TABLES `licences` WRITE;
/*!40000 ALTER TABLE `licences` DISABLE KEYS */;
INSERT INTO `licences` VALUES (18,4,1,'2022-08-15 22:31:00','2022-09-15 22:31:00',1,'2022-08-09 04:32:48','2022-08-15 20:32:02'),(19,1,1,'2022-08-15 23:54:00','2022-09-16 23:54:00',1,'2022-08-15 21:54:39','2022-08-15 22:23:21');
/*!40000 ALTER TABLE `licences` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2020_03_31_114745_remove_backpackuser_model',1),(6,'2022_07_19_105136_create_permission_tables',1),(7,'2022_08_08_183538_create_licences_table',1),(8,'2022_08_08_183539_create_licence_types_table',1),(9,'2022_08_08_183540_create_courses_table',1),(10,'2022_08_08_183541_create_lessons_table',1),(11,'2022_08_08_183542_create_transactions_table',1),(12,'2022_08_08_183543_create_licence_user_table',1),(13,'2022_08_08_183544_create_course_user_table',1),(14,'2022_08_08_183545_create_lesson_user_table',1);
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
INSERT INTO `model_has_roles` VALUES (3,'App\\Models\\User',1),(2,'App\\Models\\User',2),(2,'App\\Models\\User',3),(1,'App\\Models\\User',4),(2,'App\\Models\\User',5),(2,'App\\Models\\User',6),(2,'App\\Models\\User',7),(2,'App\\Models\\User',8),(2,'App\\Models\\User',9),(2,'App\\Models\\User',10);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@admin.com',NULL,'$2y$10$a15aSxgKojGWXrIPdRkwkeeL6bgW54zj9papqq563BLuv1UfxqvZi',NULL,'2022-08-08 16:51:58','2022-08-09 04:27:20'),(2,'Zia Steele','admin1@admin.com',NULL,'$2y$10$YxXg/42FMhIbkdkBEjasoeWEoXoLPg5i9MBoToAQMfhIpy5HTsqSe',NULL,'2022-08-08 18:49:06','2022-08-08 18:49:06'),(3,'Jackson Hendricks','hukag@mailinator.com',NULL,'$2y$10$gqFbsU12nO/Dt1g/alDQp.brUq5vqBiIG8MMadUkP5X5n./dvljLK',NULL,'2022-08-08 18:49:18','2022-08-08 18:49:18'),(4,'test','test@admin.com',NULL,'$2y$10$whOgHF7QhfPisJRXCesy3OZZVHKThQHoEcMayYn2jYVz74BHWdUHu',NULL,'2022-08-09 03:34:04','2022-08-09 03:34:04'),(5,'demo','admin@demo.com',NULL,'$2y$10$.yXVoFoBc0Z1vyetNyw1jOFujnVLe.Uf23BDV/kA4MTgjuY.Rf6ym',NULL,'2022-08-15 22:51:24','2022-08-15 22:51:24'),(6,'demo2','admin@demo2.com',NULL,'$2y$10$T/rwvzmOR3CjFnwcaRebmeRrUGMGFGbOT78EdYq79I3ZonLU9hHFS',NULL,'2022-08-15 23:45:52','2022-08-15 23:45:52'),(7,'demo3','admin@demo3.com',NULL,'$2y$10$C8MfoGq5VlbG..XX.17LHuZzGv1aJDdExllvH5YuzlBPE24DOqKGG',NULL,'2022-08-15 23:46:59','2022-08-15 23:46:59'),(8,'demo4','admin@demo4.com',NULL,'$2y$10$AQeH.3LoQyqtwVxTVvr1JeV0u/bFm3uBTrEJY.9m0Gz/s/.OLMGqu',NULL,'2022-08-15 23:48:24','2022-08-15 23:48:24'),(9,'demo5','admin@demo5.com',NULL,'$2y$10$mShHNGeV9glqbAA.w9Xbg.UNcxp3hf1dOQECJHXKuALoVLfKZgStu',NULL,'2022-08-15 23:49:56','2022-08-15 23:49:56'),(10,'test2','test2@admin.com',NULL,'$2y$10$9q0mJ42s5JCI9J0cXwoQhO33Z4zZsgM7iM0tRvw9iQ8hgAmV.ST0W',NULL,'2022-08-16 00:00:51','2022-08-16 00:00:51');
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

-- Dump completed on 2022-08-16  5:32:20
