-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: board
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.20.04.1

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
INSERT INTO `course_user` VALUES (2,1),(2,2),(2,3),(3,2),(3,3),(3,5),(2,4),(2,5),(4,2),(5,21),(5,22),(6,21),(7,21),(9,25),(11,4),(11,40),(11,39),(9,39),(17,46),(18,41),(19,41),(19,46),(15,51),(20,57),(21,59),(20,58),(13,58),(23,42),(23,63),(27,71);
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
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `start_at` timestamp NULL DEFAULT NULL,
  `end_at` timestamp NULL DEFAULT NULL,
  `status` int DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_user_id_foreign` (`user_id`),
  CONSTRAINT `courses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (9,'тест курс','<p>тест описание</p>','2022-08-27 15:44:04','2022-08-31 15:44:06',1,26,'2022-08-27 13:44:13','2022-08-27 13:44:13'),(10,'тест 2','<p>тест 2</p>','2022-09-01 15:44:27','2022-09-02 15:44:29',2,26,'2022-08-27 13:44:32','2022-08-27 13:44:32'),(11,'физика',NULL,'2022-08-28 17:01:38',NULL,1,39,'2022-08-28 14:01:55','2022-10-11 15:38:44'),(12,'Собственники',NULL,'2022-10-18 15:25:06',NULL,NULL,43,'2022-10-18 12:25:12','2022-10-18 12:25:12'),(13,'1С',NULL,'2022-10-18 15:25:28',NULL,NULL,43,'2022-10-18 12:25:33','2022-10-18 12:25:33'),(14,'Сайт',NULL,'2022-10-18 15:25:43',NULL,NULL,43,'2022-10-18 12:25:45','2022-10-18 12:25:45'),(15,'Интеграция',NULL,'2022-10-18 22:30:41','2023-10-18 22:30:00',NULL,43,'2022-10-18 19:30:25','2022-10-18 19:30:57'),(16,'тест ссылки',NULL,'2022-10-19 08:46:00','2022-10-19 09:46:00',NULL,44,'2022-10-19 05:47:31','2022-10-19 05:47:31'),(17,'Колл центр',NULL,'2022-10-19 14:23:02',NULL,NULL,43,'2022-10-19 11:23:06','2022-10-19 11:23:06'),(18,'Семья',NULL,'2022-10-19 15:51:38',NULL,NULL,43,'2022-10-19 12:51:43','2022-10-19 12:51:43'),(19,'Соискатели',NULL,'2022-10-26 16:09:47','2022-10-26 16:09:50',NULL,43,'2022-10-26 13:09:56','2022-10-26 13:09:56'),(20,'Пробный период 1С партнеры',NULL,'2022-10-27 22:11:42',NULL,NULL,43,'2022-10-27 14:34:58','2022-10-27 19:11:47'),(21,'Тестовая','<p>Тестовая группа</p>','2022-10-27 18:49:03',NULL,0,51,'2022-10-27 15:50:45','2022-10-27 15:50:45'),(22,'тест',NULL,'2022-11-01 17:45:35',NULL,NULL,59,'2022-11-01 14:45:40','2022-11-01 14:45:40'),(23,'55555',NULL,'2022-11-02 15:52:55',NULL,NULL,53,'2022-11-02 12:53:25','2022-11-02 12:53:25'),(25,'111',NULL,'2022-11-02 17:04:26','2022-11-03 17:04:27',NULL,42,'2022-11-02 14:04:40','2022-11-02 14:04:40'),(26,'Николай тест',NULL,'2022-11-03 13:47:23','2022-11-04 13:47:24',1,65,'2022-11-03 10:47:33','2022-11-03 10:47:33'),(27,'Сергей тест',NULL,'2022-11-03 13:59:20','2022-11-24 13:59:21',0,67,'2022-11-03 10:59:30','2022-11-03 10:59:30');
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
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `lesson_user` VALUES (23,3),(29,21),(22,21),(15,21),(14,2),(14,3),(14,4),(30,1),(30,3),(30,6),(30,7),(30,8),(30,9),(30,13),(30,15),(30,16),(30,18),(30,20),(30,21),(30,22),(29,23),(31,21),(32,23),(32,21),(34,1),(35,23),(37,25),(38,25),(39,25),(40,25),(42,39),(42,40),(41,4),(42,4),(44,1),(44,4),(44,39),(53,46),(54,41),(55,4),(55,40),(55,45),(56,41),(56,46),(48,51),(48,52),(57,57),(57,58),(45,59),(63,42),(63,63),(65,64),(67,71);
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
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `start_at` timestamp NULL DEFAULT NULL,
  `status` int DEFAULT NULL,
  `course_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `pad_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pad_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `lessons_course_id_foreign` (`course_id`),
  KEY `lessons_user_id_foreign` (`user_id`),
  CONSTRAINT `lessons_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `lessons_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessons`
--

LOCK TABLES `lessons` WRITE;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
INSERT INTO `lessons` VALUES (41,'Лекция 1','cGZETFr5J',NULL,'2022-08-28 12:44:25',1,11,39,NULL,NULL,'2022-08-28 09:44:44','2022-08-28 14:02:11'),(42,'Лекция 2','fAqmZVMib',NULL,'2022-10-11 18:33:21',1,11,39,NULL,NULL,'2022-10-11 15:33:35','2022-10-11 15:33:35'),(43,'тестовая встеча Анна','DlQ1eIf1a','<p>Проверяем как работает версия в новом интерфейсе</p>','2022-10-13 17:51:07',1,NULL,39,NULL,NULL,'2022-10-13 14:52:12','2022-10-13 14:52:12'),(44,'Встреча по обсуждению вкс','02ESoSmPd',NULL,'2022-10-17 22:04:08',1,9,1,NULL,NULL,'2022-10-17 19:03:48','2022-10-17 19:04:22'),(45,'Тест','rbUQe4YN0','<p>Тест опис</p>','2022-10-18 14:50:01',1,10,1,NULL,NULL,'2022-10-18 11:50:32','2022-10-18 11:50:32'),(47,'Рабочая ВИДЕО КОНТУР','comJwfyls',NULL,'2022-10-18 15:26:09',1,12,43,NULL,NULL,'2022-10-18 12:26:14','2022-10-18 12:26:14'),(48,'Интеграция','xfldWXeAn',NULL,NULL,1,NULL,43,NULL,NULL,'2022-10-18 19:31:51','2022-10-18 19:31:51'),(49,'1С','TxRf3LMN4',NULL,'2022-10-18 22:36:19',1,13,43,NULL,NULL,'2022-10-18 19:36:31','2022-10-18 19:36:31'),(50,'Сайт','LPmwQKHi1',NULL,'2022-10-18 22:36:52',1,14,43,NULL,NULL,'2022-10-18 19:37:02','2022-10-18 19:37:02'),(51,'тест ссылки','rtn9FNRKz',NULL,'2022-10-19 08:47:57',1,NULL,44,NULL,NULL,'2022-10-19 05:48:06','2022-10-19 05:48:06'),(53,'Колл центр','Dh4CzR6uD',NULL,'2022-10-19 14:23:30',1,17,43,NULL,NULL,'2022-10-19 11:23:40','2022-10-19 11:23:40'),(54,'Семья','bxKi2ehDW',NULL,'2022-10-19 15:51:13',1,NULL,43,NULL,NULL,'2022-10-19 12:51:20','2022-10-19 12:51:20'),(55,'Test','13MAiFMpf',NULL,'2022-10-19 16:00:00',1,NULL,1,NULL,NULL,'2022-10-19 12:52:16','2022-10-20 17:55:50'),(56,'Собеседование разработчиков','kNFLFeUCG',NULL,NULL,1,19,43,NULL,NULL,'2022-10-26 13:11:42','2022-10-26 13:11:42'),(57,'Конференция 1С','VMuZdxxaT',NULL,'2022-10-27 17:36:08',1,20,43,NULL,NULL,'2022-10-27 14:35:25','2022-10-27 14:36:13'),(58,'тестовая','PQM1oUV33','<p>тестовая</p>','2022-10-27 18:51:20',1,21,51,NULL,NULL,'2022-10-27 15:51:41','2022-10-27 15:51:41'),(59,'тест','FYhkpnN7n',NULL,NULL,1,NULL,59,NULL,NULL,'2022-11-01 14:46:37','2022-11-01 14:46:37'),(60,'123','0jxY0uI8D',NULL,NULL,1,NULL,58,NULL,NULL,'2022-11-01 18:36:22','2022-11-01 18:36:22'),(61,'123','OcNly770G',NULL,NULL,1,NULL,1,NULL,NULL,'2022-11-02 08:10:12','2022-11-02 08:10:12'),(62,'ТЕСТ ВАСЯ','lg8KZeq6d',NULL,'2022-11-02 15:00:14',1,NULL,61,NULL,NULL,'2022-11-02 12:00:41','2022-11-02 12:00:41'),(63,'555','i2D8miOIN','<p>666</p>','2022-11-02 15:33:39',1,NULL,53,NULL,NULL,'2022-11-02 12:33:50','2022-11-02 12:33:50'),(65,'тест посл','apDOTT0hV','<p>тест посл</p>','2022-11-04 11:08:49',1,NULL,4,NULL,NULL,'2022-11-03 10:09:07','2022-11-03 10:09:07'),(66,'Николай тест встреча','C3EGH9ns4',NULL,'2022-11-03 13:47:50',1,26,65,NULL,NULL,'2022-11-03 10:48:06','2022-11-03 10:48:06'),(67,'Сергей тест','tcE6m8OkR',NULL,'2022-11-03 14:00:00',1,27,67,NULL,NULL,'2022-11-03 11:02:38','2022-11-03 11:02:38');
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
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `pupils` int DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `board` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licence_types`
--

LOCK TABLES `licence_types` WRITE;
/*!40000 ALTER TABLE `licence_types` DISABLE KEYS */;
INSERT INTO `licence_types` VALUES (1,'10 p','<p>desc</p>',5,1,1000.00,'2022-08-08 18:19:48','2022-10-11 15:31:38',1),(2,'122 p',NULL,20,1,2000.00,'2022-08-08 18:49:34','2022-08-14 13:21:15',NULL),(3,'2','<p>2</p>',2,1,200.00,'2022-11-03 04:46:31','2022-11-03 04:46:31',0),(4,'Демо',NULL,10,1,0.00,'2022-11-03 05:21:55','2022-11-03 05:21:55',1),(5,'Группа','<p>месячная</p>',120,1,900.00,'2022-11-03 06:03:52','2022-11-03 06:03:52',0);
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
INSERT INTO `licence_user` VALUES (20,6),(21,2),(21,6),(22,21),(21,1),(22,23),(23,25),(23,25),(24,39),(25,40),(18,18),(25,39),(24,56),(24,58),(24,59),(28,58),(27,6),(27,7),(27,8),(27,9),(18,4),(18,10),(18,15),(18,64),(24,59),(21,59),(30,71),(30,71),(30,71),(30,71),(30,68);
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licences`
--

LOCK TABLES `licences` WRITE;
/*!40000 ALTER TABLE `licences` DISABLE KEYS */;
INSERT INTO `licences` VALUES (18,4,1,'2022-08-15 22:31:00','2022-11-15 22:31:00',1,'2022-08-09 04:32:48','2022-10-20 17:57:17'),(19,1,1,'2022-08-15 23:54:00','2022-09-16 23:54:00',1,'2022-08-15 21:54:39','2022-08-15 22:23:21'),(20,1,1,'1978-07-01 04:03:00','2009-04-12 06:27:00',0,'2022-08-25 09:58:04','2022-08-25 09:58:04'),(21,1,1,'1989-04-07 01:56:00','2014-08-27 01:36:00',1,'2022-08-25 09:58:09','2022-08-25 09:58:09'),(22,10,1,'2022-08-26 18:41:00','2022-08-31 18:42:00',1,'2022-08-26 16:42:12','2022-08-26 16:42:12'),(23,26,1,'2022-08-27 16:01:00','2022-09-27 16:01:00',1,'2022-08-27 14:01:27','2022-08-27 14:01:27'),(24,1,1,'2022-08-28 12:40:00','2022-08-29 12:40:00',1,'2022-08-28 09:40:53','2022-08-28 09:40:53'),(25,39,1,'2022-08-28 16:55:00','2022-08-30 16:55:00',1,'2022-08-28 09:43:32','2022-08-28 13:56:00'),(26,43,1,'2022-10-17 15:22:00','2028-10-31 15:28:00',1,'2022-10-18 12:22:59','2022-10-18 12:22:59'),(27,58,1,'2022-11-01 17:57:00','2022-11-01 00:09:00',1,'2022-11-01 14:57:30','2022-11-01 21:09:30'),(29,69,4,'2022-11-02 14:25:00','2022-11-04 14:25:00',1,'2022-11-03 11:26:04','2022-11-03 11:39:49'),(30,67,1,'2022-11-02 14:49:00','2022-11-10 14:49:00',1,'2022-11-03 11:47:49','2022-11-03 11:53:13');
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
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `course_id` bigint unsigned DEFAULT NULL,
  `lesson_id` bigint unsigned DEFAULT NULL,
  `limit` int DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `links_slug_unique` (`slug`),
  KEY `links_user_id_foreign` (`user_id`),
  CONSTRAINT `links_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
INSERT INTO `links` VALUES (10,'2022-08-26 15:02:39','2022-08-26 15:03:07','rwUYJP4tY',1,4,10,NULL,1),(11,'2022-08-26 15:02:58','2022-08-26 15:03:03','W7Xbz0PaP',1,NULL,NULL,NULL,1),(12,'2022-08-26 16:16:18','2022-08-27 12:22:35','dSbEGjFxb',1,8,36,NULL,1),(15,'2022-08-28 13:56:53','2022-08-28 13:56:53','lek1',39,NULL,41,2,0),(16,'2022-10-18 12:26:42','2022-10-18 12:26:42','Un4MCkSzV',43,12,47,10,0),(17,'2022-10-18 19:32:28','2022-10-18 19:32:28','TtWq8Md5y',43,15,NULL,15,0),(18,'2022-10-18 19:32:50','2022-10-18 19:32:50','b2zl79Vjj',43,13,NULL,15,0),(19,'2022-10-18 19:33:17','2022-10-27 15:40:18','FDjM0I6Mt',43,14,NULL,15,1),(20,'2022-10-19 05:48:18','2022-10-19 05:48:25','TyQIMY6hK',44,NULL,51,1,1),(21,'2022-10-19 11:24:56','2022-10-19 11:27:41','eSix0U22Y',43,17,NULL,15,0),(22,'2022-10-19 12:52:14','2022-10-19 12:52:14','mUi42D2pq',43,18,54,15,0),(23,'2022-10-26 13:12:23','2022-10-26 13:12:23','9uhS3JJr9',43,19,56,NULL,0),(24,'2022-10-27 14:36:41','2022-10-27 14:43:36','h9K5wd2lr',43,20,57,100,1),(25,'2022-10-27 15:54:32','2022-10-27 15:54:32','h1SVZnrhT',51,21,58,NULL,0),(26,'2022-11-01 13:12:34','2022-11-01 13:12:41','Gf967oFul',1,21,45,1,1),(27,'2022-11-01 21:29:06','2022-11-01 21:29:13','IL6G54eBq',58,NULL,NULL,1,1),(28,'2022-11-02 12:01:34','2022-11-02 12:01:34','V5cWtOuxK',61,NULL,62,NULL,0),(29,'2022-11-02 12:34:10','2022-11-02 12:34:10','GgqXQBvcE',53,NULL,63,NULL,0),(30,'2022-11-02 14:08:12','2022-11-02 14:08:24','dhwI2fmfd',42,25,64,NULL,1),(31,'2022-11-03 09:40:16','2022-11-03 09:40:23','wArbmznxV',4,NULL,NULL,NULL,1),(32,'2022-11-03 10:48:30','2022-11-03 10:48:30','bR6sDuy1X',65,26,66,4,0),(33,'2022-11-03 11:02:51','2022-11-03 11:02:56','Qv9C0PmhT',67,27,67,1,1),(34,'2022-11-03 11:28:12','2022-11-03 11:28:17','zFnRA2zEP',67,27,67,1,1),(35,'2022-11-03 11:55:07','2022-11-03 11:55:13','JHiK9ttlG',67,27,67,1,1);
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
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `model_has_roles` VALUES (3,'App\\Models\\User',1),(1,'App\\Models\\User',4),(2,'App\\Models\\User',5),(2,'App\\Models\\User',6),(2,'App\\Models\\User',7),(2,'App\\Models\\User',8),(2,'App\\Models\\User',9),(1,'App\\Models\\User',10),(2,'App\\Models\\User',11),(2,'App\\Models\\User',12),(2,'App\\Models\\User',13),(2,'App\\Models\\User',14),(2,'App\\Models\\User',15),(2,'App\\Models\\User',16),(2,'App\\Models\\User',17),(2,'App\\Models\\User',18),(2,'App\\Models\\User',19),(2,'App\\Models\\User',20),(2,'App\\Models\\User',21),(2,'App\\Models\\User',23),(2,'App\\Models\\User',24),(2,'App\\Models\\User',25),(1,'App\\Models\\User',26),(2,'App\\Models\\User',27),(2,'App\\Models\\User',28),(2,'App\\Models\\User',29),(2,'App\\Models\\User',30),(2,'App\\Models\\User',31),(2,'App\\Models\\User',32),(2,'App\\Models\\User',33),(2,'App\\Models\\User',34),(2,'App\\Models\\User',35),(2,'App\\Models\\User',36),(1,'App\\Models\\User',37),(2,'App\\Models\\User',38),(1,'App\\Models\\User',39),(2,'App\\Models\\User',40),(1,'App\\Models\\User',41),(1,'App\\Models\\User',42),(1,'App\\Models\\User',43),(1,'App\\Models\\User',44),(2,'App\\Models\\User',46),(2,'App\\Models\\User',47),(3,'App\\Models\\User',48),(2,'App\\Models\\User',49),(1,'App\\Models\\User',51),(2,'App\\Models\\User',52),(1,'App\\Models\\User',53),(2,'App\\Models\\User',54),(2,'App\\Models\\User',56),(2,'App\\Models\\User',57),(1,'App\\Models\\User',59),(2,'App\\Models\\User',60),(1,'App\\Models\\User',61),(2,'App\\Models\\User',62),(2,'App\\Models\\User',64),(1,'App\\Models\\User',65),(2,'App\\Models\\User',66),(1,'App\\Models\\User',67),(2,'App\\Models\\User',68),(1,'App\\Models\\User',69),(1,'App\\Models\\User',70),(2,'App\\Models\\User',71);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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
  `status` enum('new','accepted','ignored') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `requests_owner_id_foreign` (`owner_id`),
  KEY `requests_user_id_foreign` (`user_id`),
  KEY `requests_link_id_foreign` (`link_id`),
  CONSTRAINT `requests_link_id_foreign` FOREIGN KEY (`link_id`) REFERENCES `links` (`id`) ON DELETE CASCADE,
  CONSTRAINT `requests_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`),
  CONSTRAINT `requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
INSERT INTO `requests` VALUES (12,39,40,15,'accepted','2022-08-28 13:58:31','2022-10-06 19:07:19'),(13,39,4,15,'new','2022-10-11 15:36:22','2022-10-18 12:31:29'),(14,44,45,20,'new','2022-10-19 05:52:13','2022-10-24 05:30:47'),(15,43,46,21,'accepted','2022-10-19 11:35:36','2022-10-19 11:38:14'),(16,43,46,21,'accepted','2022-10-19 12:02:12','2022-10-19 12:04:35'),(17,43,41,22,'accepted','2022-10-19 12:53:10','2022-10-20 18:11:34'),(18,43,41,22,'accepted','2022-10-19 12:54:35','2022-10-19 12:55:19'),(19,44,47,20,'accepted','2022-10-24 06:22:09','2022-10-24 06:23:50'),(20,43,43,24,'accepted','2022-10-27 14:45:22','2022-10-27 14:45:29'),(21,43,50,24,'accepted','2022-10-27 15:04:33','2022-10-27 15:04:46'),(22,51,43,25,'new','2022-10-27 15:54:50','2022-10-27 15:54:50'),(23,43,51,17,'accepted','2022-10-27 15:56:31','2022-10-27 15:56:36'),(24,43,51,17,'accepted','2022-10-27 15:57:29','2022-10-27 15:57:49'),(25,43,53,24,'accepted','2022-10-27 18:28:23','2022-10-27 18:29:36'),(26,43,53,24,'accepted','2022-10-27 18:34:49','2022-10-27 18:46:17'),(27,43,50,24,'accepted','2022-10-27 18:43:31','2022-10-27 18:43:58'),(28,43,54,24,'accepted','2022-10-27 18:55:12','2022-10-27 18:58:10'),(29,1,56,26,'accepted','2022-11-01 13:14:22','2022-11-01 13:14:36'),(30,43,57,24,'accepted','2022-11-01 14:25:16','2022-11-01 14:25:34'),(31,1,58,26,'accepted','2022-11-01 14:32:42','2022-11-01 14:32:57'),(32,1,59,26,'accepted','2022-11-01 14:42:34','2022-11-03 10:30:01'),(33,58,60,27,'new','2022-11-01 21:30:16','2022-11-03 06:07:37'),(34,61,62,28,'new','2022-11-02 12:07:48','2022-11-02 12:07:48'),(35,53,63,29,'new','2022-11-02 12:37:14','2022-11-02 12:37:14'),(36,53,48,29,'new','2022-11-02 12:59:30','2022-11-02 12:59:30'),(37,53,48,29,'new','2022-11-02 13:00:00','2022-11-02 13:00:00'),(38,53,42,29,'new','2022-11-02 13:05:00','2022-11-02 13:05:00'),(39,42,1,30,'new','2022-11-02 14:09:11','2022-11-02 14:09:11'),(40,4,64,31,'accepted','2022-11-03 09:42:34','2022-11-03 10:08:22'),(41,65,66,32,'new','2022-11-03 10:52:55','2022-11-03 10:52:55'),(42,67,68,33,'ignored','2022-11-03 11:04:28','2022-11-03 11:43:33'),(43,67,68,33,'ignored','2022-11-03 11:05:39','2022-11-03 11:43:36'),(44,67,68,33,'ignored','2022-11-03 11:27:36','2022-11-03 11:43:37'),(45,67,68,34,'ignored','2022-11-03 11:28:31','2022-11-03 11:43:39'),(46,67,68,33,'ignored','2022-11-03 11:28:51','2022-11-03 11:43:40'),(47,67,68,34,'accepted','2022-11-03 11:51:32','2022-11-03 11:51:40'),(48,67,68,34,'accepted','2022-11-03 11:52:24','2022-11-03 11:56:25'),(49,67,68,34,'accepted','2022-11-03 11:53:55','2022-11-03 11:56:29'),(50,67,68,35,'ignored','2022-11-03 11:55:19','2022-11-03 11:56:51'),(51,67,68,35,'accepted','2022-11-03 11:57:40','2022-11-03 12:00:07'),(52,67,71,35,'accepted','2022-11-03 11:58:52','2022-11-03 11:59:04'),(53,67,71,35,'accepted','2022-11-03 11:59:34','2022-11-03 11:59:51'),(54,67,71,35,'new','2022-11-03 11:59:35','2022-11-03 11:59:35'),(55,67,71,35,'accepted','2022-11-03 11:59:37','2022-11-03 12:00:42'),(56,67,71,35,'accepted','2022-11-03 11:59:40','2022-11-03 12:00:13'),(57,67,71,35,'accepted','2022-11-03 11:59:41','2022-11-03 12:00:04'),(58,67,71,35,'new','2022-11-03 11:59:42','2022-11-03 11:59:42'),(59,67,71,35,'accepted','2022-11-03 11:59:45','2022-11-03 11:59:59'),(60,67,71,35,'accepted','2022-11-03 11:59:48','2022-11-03 11:59:55');
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `tx` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('deposit','buy') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `licence_id` bigint unsigned DEFAULT NULL,
  `status` enum('pending','successful','failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@admin.com',NULL,'$2y$10$a15aSxgKojGWXrIPdRkwkeeL6bgW54zj9papqq563BLuv1UfxqvZi','eLfJw0OT8bEEnlNEuEd0LxQBxOGLEoSIUtovXnNJXchsBaivZZDkIFbKb9gn','2022-08-08 16:51:58','2022-08-09 04:27:20'),(4,'test','test@admin.com',NULL,'$2y$10$whOgHF7QhfPisJRXCesy3OZZVHKThQHoEcMayYn2jYVz74BHWdUHu','SbDs7sh5zWUtzQQ8bm1aZPgYoyb3fJIAbws6PeLbjCNeJcS1LeW8Jn0VU2Xn','2022-08-09 03:34:04','2022-08-09 03:34:04'),(5,'demo','admin@demo.com',NULL,'$2y$10$.yXVoFoBc0Z1vyetNyw1jOFujnVLe.Uf23BDV/kA4MTgjuY.Rf6ym',NULL,'2022-08-15 22:51:24','2022-08-15 22:51:24'),(6,'demo2','admin@demo2.com',NULL,'$2y$10$T/rwvzmOR3CjFnwcaRebmeRrUGMGFGbOT78EdYq79I3ZonLU9hHFS',NULL,'2022-08-15 23:45:52','2022-08-15 23:45:52'),(7,'demo3','admin@demo3.com',NULL,'$2y$10$C8MfoGq5VlbG..XX.17LHuZzGv1aJDdExllvH5YuzlBPE24DOqKGG',NULL,'2022-08-15 23:46:59','2022-08-15 23:46:59'),(8,'demo4','admin@demo4.com',NULL,'$2y$10$AQeH.3LoQyqtwVxTVvr1JeV0u/bFm3uBTrEJY.9m0Gz/s/.OLMGqu',NULL,'2022-08-15 23:48:24','2022-08-15 23:48:24'),(9,'demo5','admin@demo5.com',NULL,'$2y$10$mShHNGeV9glqbAA.w9Xbg.UNcxp3hf1dOQECJHXKuALoVLfKZgStu',NULL,'2022-08-15 23:49:56','2022-08-15 23:49:56'),(10,'test2','test2@admin.com',NULL,'$2y$10$9q0mJ42s5JCI9J0cXwoQhO33Z4zZsgM7iM0tRvw9iQ8hgAmV.ST0W',NULL,'2022-08-16 00:00:51','2022-08-16 00:00:51'),(11,'demo','demo@admin.com',NULL,'$2y$10$Qzpt3pfgm20fR9Kb7A9Ni.BA7DwvLcZjHDUgjCmiWuNQQJmefVcm2',NULL,'2022-08-26 13:19:56','2022-08-26 13:19:56'),(12,'demo2','demo2@admin.com',NULL,'$2y$10$UhDvXhD.gb03EPgr6ds9MuaBgrhxMn/4A.TNiZEo2LfJyFgmvUZze',NULL,'2022-08-26 13:39:43','2022-08-26 13:39:43'),(13,'demo3','demo3@admin.com',NULL,'$2y$10$1PTLleB2QMyf3VJXs3Y9/ONIZ96gdIGMBtD.C/QQVbxin2Fz.umta',NULL,'2022-08-26 13:51:29','2022-08-26 13:51:29'),(14,'demo4','demo4@admin.com',NULL,'$2y$10$HeTOIO2ZCOJIwFk717sQvu3d/vramnoJxbq0.k0k8SE02vR5KBjGy',NULL,'2022-08-26 13:52:26','2022-08-26 13:52:26'),(15,'demo5','demo5@admin.com',NULL,'$2y$10$QNCWWrfGpeBSarGlyhw/reAS.6wr5GT1LGpJtvS452Mwuc0xyTphi',NULL,'2022-08-26 13:53:45','2022-08-26 13:53:45'),(16,'demo6','demo6@admin.com',NULL,'$2y$10$YcJ7FPiyoCJAuT11daGaH.i7v/1/FhxtTVpNrLdoBQDxek542oKGO',NULL,'2022-08-26 13:55:15','2022-08-26 13:55:15'),(17,'demo7','demo7@admin.com',NULL,'$2y$10$WamIyNU8hi06w1ef2D8hl.sjzOyWP4nTKjiUXqruRB9bj1tqhVOMm',NULL,'2022-08-26 13:55:40','2022-08-26 13:55:40'),(18,'demo8','demo8@admin.com',NULL,'$2y$10$vk7tjU6S7jWLwuXz4Jeyg.6Cwz3NtbRaKoaADGvahQE8EJu8ni65S',NULL,'2022-08-26 13:57:08','2022-08-26 13:57:08'),(19,'demo9','demo9@admin.com',NULL,'$2y$10$K3QAGjx0rCUhm4ZrDkpBP.8sxSulQvxrvoAG/YQUwHqSPaoT5/GXW',NULL,'2022-08-26 13:58:27','2022-08-26 13:58:27'),(20,'demo10','demo10@admin.com',NULL,'$2y$10$0h/hAn8B9GGe3Vwvli23degyDIg1i9P2YYaUQ1hEi68ZZF9ow8ufy',NULL,'2022-08-26 13:59:43','2022-08-26 13:59:43'),(21,'demo11','demo11@admin.com',NULL,'$2y$10$.6JJbFGUmXAhvGAUc8Vtke1h.JQnQsU5p1m2emTVapU8GH/QMH3nK',NULL,'2022-08-26 14:04:13','2022-08-26 14:04:13'),(23,'demo34','demo34@admin.com',NULL,'$2y$10$IpX7WiM6O4x0N1sxsOh7Se2zVHQuj8J83W5iqN85AGWsEGN5tWs6K',NULL,'2022-08-26 14:31:38','2022-08-26 14:31:38'),(24,'demo111','demo111@admin.com',NULL,'$2y$10$teMd.7DMEc9faAFgdTfE8uLnKlPctitYC4RMGb8ENKkbPzRynQRrG',NULL,'2022-08-26 19:40:50','2022-08-26 19:40:50'),(25,'user1','user1@admin.com',NULL,'$2y$10$s7hKUqhNE9Wq2HjzBI174.JmIS3vg0JMnecqQBk4WLvIP0W1bvyhi',NULL,'2022-08-27 12:13:35','2022-08-27 12:13:35'),(26,'owner','owner@admin.com',NULL,'$2y$10$Ajh.RmsIygNcG.Bu9QQQVeaCl/2rfjafF5mGn821yKVpJk1rAbSri',NULL,'2022-08-27 13:04:01','2022-08-27 13:04:01'),(27,'hello@admin.com','hello@admin.com',NULL,'$2y$10$g5zSP.0lSvLqKMW563NigeoQ2GmRjsuwC8JCjwsBBso91v21SMXl.',NULL,'2022-08-27 19:43:00','2022-08-27 19:43:00'),(28,'India Hartman','rabeb@mailinator.com',NULL,'$2y$10$jkOaY6U84nRp1v7s7bqHa.I2SeYO6T5ktQk32uz5yqFR.dWGBgmVi',NULL,'2022-08-27 19:51:25','2022-08-27 19:51:25'),(29,'Nerea Mendoza','lotoqapyf@mailinator.com',NULL,'$2y$10$g74Fhkqp8lvEW9uxCRLv7O5Dgmbf5VndaksyBaBX1NmMwfpPPF4mS',NULL,'2022-08-27 19:54:57','2022-08-27 19:54:57'),(30,'Charde Santos','leralyku@mailinator.com',NULL,'$2y$10$vboqH8Y0hdLH09RZorw96emhBTRXuMVGXzUuckd5/gachBlsuz.e6',NULL,'2022-08-27 19:55:39','2022-08-27 19:55:39'),(31,'Faith Day','sagy@mailinator.com',NULL,'$2y$10$5HgS2sBVvcRRKPDgz6irN.fqso8i6qx/K.I2DUQnX92SO.lqiXPgy',NULL,'2022-08-27 19:57:43','2022-08-27 19:57:43'),(32,'Omar Beck','diriqo@mailinator.com',NULL,'$2y$10$c4TciWbA7lHwsy5NI7KMg.Kt9dStm27adWHxBMpx9Eoo.ZZojh07O',NULL,'2022-08-27 20:00:42','2022-08-27 20:00:42'),(33,'Kirby Lucas','lopomof@mailinator.com',NULL,'$2y$10$hbrPLSX8hXPDX7XPBplVOuB5sp/nt6uROjCtdRU5ShwsPGmswJKlK',NULL,'2022-08-27 20:03:26','2022-08-27 20:03:26'),(34,'Darius Jones','pitakik@mailinator.com',NULL,'$2y$10$l0w/s.v7dhzcht.IudoeMef/EMPIeCN9kJeYrH.i3oLRWseLwLFtu',NULL,'2022-08-27 20:21:31','2022-08-27 20:21:31'),(35,'Caesar Moss','valoxaxube@mailinator.com',NULL,'$2y$10$qJjNuXLoLxeFsBaOP5u33uRUM4.rqVoKV5EIL92B.EcEkEyi5dVeq',NULL,'2022-08-27 20:22:04','2022-08-27 20:22:04'),(36,'Caesar Moss','wocyvyfejo@mailinator.com',NULL,'$2y$10$c0O9t3K84nqNoiTNEMZXhOuLL3maA1qJ.b9j57HI6zl9LJRVR0auq',NULL,'2022-08-27 20:22:36','2022-08-27 20:22:36'),(37,'Cairo Dennis','verukov@mailinator.com',NULL,'$2y$10$wy9bcEvlHOTswbzQKk4lIOfaImKQ4o.tY/yr0A5GLL/t.oUF67vLG',NULL,'2022-08-27 20:24:56','2022-08-27 20:24:56'),(38,'Lyle Wood','buco@mailinator.com',NULL,'$2y$10$bOW2lnJJzFmYzX66FxhgGeGrMUwdi8wmeVU0LphsmD9kvAVRKrtSC',NULL,'2022-08-27 20:25:14','2022-08-27 20:25:14'),(39,'Модератор','teach@admin.com',NULL,'$2y$10$acycmKjXtEBXUbJ5AZAkMe0iyvn3ijJ14hthQfCiusss4Uk7.ATF6','tMG4ghsCkdr4716gbn8uUtiMVRgVumfcaDabkORx6Y9L0GOHlNofIbKHu7pa','2022-08-28 09:39:58','2022-10-17 19:08:08'),(40,'Тестовый ученик','test1@admin.com',NULL,'$2y$10$XmlDxa9UD9nl97dWIsn0GOLKx94rT2GvYy78XRo1x3iM4QLya2IIe',NULL,'2022-08-28 13:58:01','2022-10-11 15:42:44'),(41,'Мария Давыдова','marishevch@gmail.com',NULL,'$2y$10$RqbcX7D1U/MEyQLSQJKn4.mnC/wstKFMxBpJmAsk97o6yKpFbHsIW',NULL,'2022-10-18 12:19:00','2022-10-18 12:19:00'),(42,'Александра Александровна','Ovaleksandra@yandex.ru',NULL,'$2y$10$KhNhSxb73EaXZ79sH4nHr.fCJ570N2H0SR8/XeeI2iOWJ2ZTX1E1S',NULL,'2022-10-18 12:19:07','2022-11-02 12:50:24'),(43,'Анна Шевченко','shev_am@mail.ru',NULL,'$2y$10$NoHanN3e4iZW3eOf9AGokOiJiXBdLCxW2lN23BgX2Ww7SNsXFszV6','DZFKB7FeFtCqcoDoyez8NnsXlPn9eB0qssz6LzMJBmk2uNE61JFcwHrvmLdT','2022-10-18 12:19:35','2022-10-18 12:19:35'),(44,'Тест ссылки','tests@admin.com',NULL,'$2y$10$1u1QMUATjmyAodkHJ0TXw.VrX.CuN/Eqg3u7iVKJDPy2iNJDtb.4y',NULL,'2022-10-19 05:46:05','2022-10-19 05:46:05'),(45,'Ss','ss@ss.ru',NULL,'$2y$10$uLxHr9xRbtX/TY2BemxMO.Z1foML1985LDLsEPA1CKfkNcjt7Luz.',NULL,'2022-10-19 05:50:49','2022-10-19 05:50:49'),(46,'Игорь','5817729@nord-sky.ru',NULL,'$2y$10$x6I9x343UX6d4kGD2U0ubufaP/ECaAG8LQEK48nl6R20K0vz0z4Ia','2WfF3WoXMcXJlsl2oXtF1l6aeeXkNafUlLoA8PnLzjqEepQwsAqOWhtKzZmw','2022-10-19 11:34:51','2022-10-19 11:34:51'),(47,'tests','tests@tests.ru',NULL,'$2y$10$WUB0rQ4yZzi2RJva6md34enqP7xjKaPHIfEHzOVdauNTuGNpE0AQe',NULL,'2022-10-24 06:18:45','2022-10-24 06:18:45'),(48,'АШ, Администратор','shevchenko@videocontour.ru',NULL,'$2y$10$AcVgEaT04MsvpFrvEezr0ejvJ7lPKHsvXGvMGaZZ.xRMWcd2E8uhW',NULL,'2022-10-27 14:51:35','2022-11-02 14:32:45'),(49,'Test1c','test1c@ru.ru',NULL,'$2y$10$QVVF/L.y95SQw/zCCQYC4.0ggqe5m8BlBb5bObqCQYG9vn1eG5jCS',NULL,'2022-10-27 15:00:18','2022-10-27 15:00:18'),(50,'Test','shev4am1@gmail.com',NULL,'$2y$10$1cTZw7F9DjiJY15.yrjttuiSueO6Q/dFTq07XhTDjJPfabVh5Mik2',NULL,'2022-10-27 15:04:02','2022-10-27 15:04:02'),(51,'павел','admin@seo-paul.ru',NULL,'$2y$10$f1h7fMlagNcr4I/ktNX3mebG6gTVygc1WHOq/p5XQWhyqDeDSzB72',NULL,'2022-10-27 15:41:38','2022-10-27 15:41:38'),(52,'павел2','admin2@seo-paul.ru',NULL,'$2y$10$4yOVRM8xKFKj9IRfN8dAOOaHUx9gDnjMTkhpB1VE65Ea0BQfhMGGO',NULL,'2022-10-27 15:43:06','2022-10-27 15:43:06'),(53,'Denis','samsonov@slb2b.ru',NULL,'$2y$10$Y.woUtc1XEg.Zn2kuSJ8LOpMFdlPUeqHybK4CwFZogKV.9j.djosK',NULL,'2022-10-27 18:27:36','2022-10-27 18:27:36'),(54,'Мари','nehama@mail.ru',NULL,'$2y$10$ZogtHRnkGQ1DrxlGsPHPkOUgvFomxXuu53jVMLjb88ULiTbvqpdX6','agbuax0TiNkOskRLezI75GJh6OJ6pwfAqjupEZgCgYE1fDUQST9NEtTNoNvP','2022-10-27 18:54:44','2022-10-27 18:54:44'),(56,'Сергей Маненков','s@s.ru',NULL,'$2y$10$xoSNcsJsivXes3QM.Zurz.FW6YXGj9rGqLzHIODCMN9n1VwNhdTbu',NULL,'2022-11-01 13:14:07','2022-11-01 13:14:07'),(57,'Сергей Тест 1с','t@t.ru',NULL,'$2y$10$po4pI8TPsKSayYFKUcwg7.PShwkT0JyeHPVqMHRyASvyxDnjA9DBO',NULL,'2022-11-01 14:24:51','2022-11-01 14:24:51'),(58,'Организатор тест 1с','1c@1c.ru',NULL,'$2y$10$oqWPnseUBTZxEiG5EamVDeZw96kE7FYr1kSMUT/WRmlYDr1smdS7K',NULL,'2022-11-01 14:32:21','2022-11-01 14:32:21'),(59,'Maria','maridmmm@mail.ru',NULL,'$2y$10$y89qQBXJ2b7yWWYumkfrreQUkMQh8Xdxa1TdOmoMOCdjf0ImJxw4S',NULL,'2022-11-01 14:41:24','2022-11-01 14:41:24'),(60,'userfor1c','2@2.ru',NULL,'$2y$10$JYK59TTsy6wagfv47MWzfOKt9HOwtkolQRm51lYL38wwfsvKS1k16',NULL,'2022-11-01 21:29:59','2022-11-01 21:29:59'),(61,'ВАСЯ','LS53@YANDEX.RU',NULL,'$2y$10$vMG.HwiN/uZqMplWMnU.LuuKyf9SxnpJweNRkclPL5ACZAAInS3Ly',NULL,'2022-11-02 11:58:11','2022-11-02 11:58:11'),(62,'денис тест','123@123.ru',NULL,'$2y$10$OOBkJEVep47Yhqs1qHr3oeS8hBt72.SwJlAi6UL94pmD7joj0Ofmm',NULL,'2022-11-02 12:07:18','2022-11-02 12:07:18'),(63,'Шевченко Анна  тест','shev4am@gmail.com',NULL,'$2y$10$xGVTgBQ7OAeBbhfnl.GiYutwiLBo.JMAsBV/VYMy5Lp1TXvD8L19O',NULL,'2022-11-02 12:36:20','2022-11-02 12:36:20'),(64,'Liberty Burns','diwymodabo@mailinator.com',NULL,'$2y$10$XRXQJ.hEtRRUq2edLJ2psOTGWfUluPeaJ8v7mEvja09zWhGuHtV.q',NULL,'2022-11-03 09:41:40','2022-11-03 09:41:40'),(65,'Николай Е.','niemni@yandex.ru',NULL,'$2y$10$8zeZGdPubFyXx4EVL4IxZOofGTsHUS5w9SbNtgHTk9ZHLRC.mKYIi',NULL,'2022-11-03 10:46:35','2022-11-03 10:46:35'),(66,'TEST','niemni1@yandex.ru',NULL,'$2y$10$c0.eHmWqlARBHV3kZH/7VO/tLKXqlF5C1AF189IRznRRxlifjN24i',NULL,'2022-11-03 10:52:25','2022-11-03 10:52:25'),(67,'Сергей Маненков','info@aasystem.ru',NULL,'$2y$10$rKpTRv9FdBplQsoKgpKxiO3YfAhGb2zrWWx85qqerqVWUM9XpgHqO',NULL,'2022-11-03 10:57:21','2022-11-03 10:57:21'),(68,'Сергей юзер','mail@aasystem.ru',NULL,'$2y$10$1P7ztLtD6OdQs8Ah3y0.PO77d8yf/byzkZ1JLCD0DGUuZ2AEmEJ7C',NULL,'2022-11-03 11:04:09','2022-11-03 11:04:09'),(69,'Сергей Владелец','0@0.ru',NULL,'$2y$10$fppVKv3R2hy1cGNfuye8/u4Myh5vELVAvBFLwGgDvXlrVjG9E9B3a',NULL,'2022-11-03 11:34:38','2022-11-03 11:34:38'),(70,'Veda Hardin','ropogy@mailinator.com',NULL,'$2y$10$qQ7uc1gowz3U1XnFkXz6v.rTb9G7e13j9PCWM2e0TuKPGDI037FQ6',NULL,'2022-11-03 11:47:04','2022-11-03 11:47:04'),(71,'Сергей 2','9@9.ru',NULL,'$2y$10$CosfSnqFYy/TJ/blWn3freHuyikfLOn2z3LdzHCHJyeBfegxSR0T2',NULL,'2022-11-03 11:58:34','2022-11-03 11:58:34');
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

-- Dump completed on 2022-11-03 12:06:21
