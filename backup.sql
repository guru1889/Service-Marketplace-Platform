-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: localhost    Database: localservice_provider
-- ------------------------------------------------------
-- Server version	8.0.43-0ubuntu0.22.04.2

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
-- Table structure for table `Api_booking`
--

DROP TABLE IF EXISTS `Api_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Api_booking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `customer_id` int NOT NULL,
  `service_provider_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Api_booking_customer_id_1d2c39c5_fk_auth_user_id` (`customer_id`),
  KEY `Api_booking_service_provider_id_ffc0dc46_fk_Api_provider_id` (`service_provider_id`),
  CONSTRAINT `Api_booking_customer_id_1d2c39c5_fk_auth_user_id` FOREIGN KEY (`customer_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `Api_booking_service_provider_id_ffc0dc46_fk_Api_provider_id` FOREIGN KEY (`service_provider_id`) REFERENCES `Api_provider` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Api_booking`
--

LOCK TABLES `Api_booking` WRITE;
/*!40000 ALTER TABLE `Api_booking` DISABLE KEYS */;
INSERT INTO `Api_booking` VALUES (1,'2026-02-13','11:00:00.000000','pending','2026-02-13 15:56:56.734048',9,3),(2,'2026-02-12','11:00:00.000000','pending','2026-02-13 15:57:53.485798',9,3),(3,'2026-02-13','15:00:00.000000','pending','2026-02-13 16:01:16.661437',11,3),(4,'2026-02-15','11:00:00.000000','completed','2026-02-15 08:36:23.180840',9,10),(5,'2026-02-15','09:00:00.000000','canceled','2026-02-15 08:38:19.321572',9,10),(6,'2026-02-15','09:00:00.000000','pending','2026-02-15 08:38:36.946651',9,3),(7,'2026-02-15','11:00:00.000000','pending','2026-02-15 08:39:09.096177',9,3),(8,'2026-02-14','09:00:00.000000','pending','2026-02-15 09:09:20.886957',9,3),(9,'2026-02-17','11:00:00.000000','pending','2026-02-17 16:37:33.173694',9,3),(10,'2026-02-17','09:00:00.000000','pending','2026-02-17 16:40:34.627621',9,3),(11,'2026-02-17','15:00:00.000000','pending','2026-02-17 16:41:10.615977',9,3),(12,'2026-02-17','09:00:00.000000','canceled','2026-02-18 16:46:23.747538',9,10),(13,'2026-02-18','09:00:00.000000','work pending','2026-02-19 09:12:12.600339',9,11),(14,'2026-02-18','11:00:00.000000','work pending','2026-02-19 09:12:16.175441',9,11),(15,'2026-02-21','11:00:00.000000','work pending','2026-02-21 15:34:03.325640',9,15);
/*!40000 ALTER TABLE `Api_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Api_provider`
--

DROP TABLE IF EXISTS `Api_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Api_provider` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `approved` tinyint(1) NOT NULL,
  `salary` varchar(100) NOT NULL,
  `provider_id` int NOT NULL,
  `service_id` bigint NOT NULL,
  `image` varchar(100) NOT NULL,
  `location` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `provider_id` (`provider_id`),
  KEY `Api_provider_service_id_515c51c6_fk_Api_services_id` (`service_id`),
  CONSTRAINT `Api_provider_provider_id_6b3381dc_fk_auth_user_id` FOREIGN KEY (`provider_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `Api_provider_service_id_515c51c6_fk_Api_services_id` FOREIGN KEY (`service_id`) REFERENCES `Api_services` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Api_provider`
--

LOCK TABLES `Api_provider` WRITE;
/*!40000 ALTER TABLE `Api_provider` DISABLE KEYS */;
INSERT INTO `Api_provider` VALUES (3,1,'Based on Work',7,2,'localservice.jpg',NULL),(10,1,'Based on Work',24,2,'localservice.jpg','Thisayanvilai'),(11,1,'1000 per day',26,4,'localservice.jpg','Tirunelveli'),(12,0,'Based on Work',27,5,'localservice.jpg','Tirunelveli'),(13,0,'Based on Work',28,3,'localservice.jpg','Thoothukudi'),(14,1,'Based on Work',29,5,'localservice.jpg','Tenkasi'),(15,1,'Based on Work',30,3,'providers/plumber.jpg','Thisayanvilai');
/*!40000 ALTER TABLE `Api_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Api_provideravailability`
--

DROP TABLE IF EXISTS `Api_provideravailability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Api_provideravailability` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `day` varchar(10) NOT NULL,
  `start_time` time(6) NOT NULL,
  `end_time` time(6) NOT NULL,
  `provider_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Api_provideravailability_provider_id_9a3f49e3_fk_Api_provider_id` (`provider_id`),
  CONSTRAINT `Api_provideravailability_provider_id_9a3f49e3_fk_Api_provider_id` FOREIGN KEY (`provider_id`) REFERENCES `Api_provider` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Api_provideravailability`
--

LOCK TABLES `Api_provideravailability` WRITE;
/*!40000 ALTER TABLE `Api_provideravailability` DISABLE KEYS */;
/*!40000 ALTER TABLE `Api_provideravailability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Api_providerdaystatus`
--

DROP TABLE IF EXISTS `Api_providerdaystatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Api_providerdaystatus` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `is_full_day_busy` tinyint(1) NOT NULL,
  `provider_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Api_providerdaystatus_provider_id_0de554dc_fk_Api_provider_id` (`provider_id`),
  CONSTRAINT `Api_providerdaystatus_provider_id_0de554dc_fk_Api_provider_id` FOREIGN KEY (`provider_id`) REFERENCES `Api_provider` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Api_providerdaystatus`
--

LOCK TABLES `Api_providerdaystatus` WRITE;
/*!40000 ALTER TABLE `Api_providerdaystatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `Api_providerdaystatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Api_providerunavailable`
--

DROP TABLE IF EXISTS `Api_providerunavailable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Api_providerunavailable` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `provider_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Api_providerunavailable_provider_id_5e766574_fk_Api_provider_id` (`provider_id`),
  CONSTRAINT `Api_providerunavailable_provider_id_5e766574_fk_Api_provider_id` FOREIGN KEY (`provider_id`) REFERENCES `Api_provider` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Api_providerunavailable`
--

LOCK TABLES `Api_providerunavailable` WRITE;
/*!40000 ALTER TABLE `Api_providerunavailable` DISABLE KEYS */;
INSERT INTO `Api_providerunavailable` VALUES (1,'2026-02-26',10),(2,'2026-02-27',10),(3,'2026-02-27',10),(4,'2026-03-05',10),(5,'2026-03-06',10);
/*!40000 ALTER TABLE `Api_providerunavailable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Api_review`
--

DROP TABLE IF EXISTS `Api_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Api_review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rating` int NOT NULL,
  `comment` longtext NOT NULL,
  `booking_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `booking_id` (`booking_id`),
  CONSTRAINT `Api_review_booking_id_8f189da8_fk_Api_booking_id` FOREIGN KEY (`booking_id`) REFERENCES `Api_booking` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Api_review`
--

LOCK TABLES `Api_review` WRITE;
/*!40000 ALTER TABLE `Api_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `Api_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Api_services`
--

DROP TABLE IF EXISTS `Api_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Api_services` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category` varchar(30) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Api_services`
--

LOCK TABLES `Api_services` WRITE;
/*!40000 ALTER TABLE `Api_services` DISABLE KEYS */;
INSERT INTO `Api_services` VALUES (2,'Electrician','Electricians are skilled tradespeople who install, maintain, and repair electrical power, lighting, and control systems in buildings. They ensure compliance with safety codes for residential and commercial infrastructure. In Madurai, professional services are available for, but not limited to, wiring, lighting installation, and repair.'),(3,'Plumber','A plumber is a skilled tradesperson who installs, repairs, and maintains pipes, fixtures, and systems for water, gas, and drainage in residential, commercial, and industrial settings. They interpret blueprints, diagnose leaks or blockages, and ensure compliance with building codes and safety regulations.'),(4,'Painter','A painter prepares, cleans, and applies paint, stains, and finishes to surfaces on residential or commercial structures to improve their appearance and durability. They are responsible for selecting materials, filling cracks, mixing colors, and ensuring precise application using brushes, rollers, or sprayers.'),(5,'Ac Mechanic','An AC mechanic (or technician) installs, maintains, and repairs residential, commercial, or industrial HVAC systems. Key responsibilities include diagnosing electrical/mechanical faults, replacing broken components like compressors and motors, charging systems with refrigerant, and performing routine maintenance to ensure optimal performance. They ensure safety compliance, clean coils, and often work on-call, requiring technical knowledge, hand-tool proficiency, and strong customer service skills.');
/*!40000 ALTER TABLE `Api_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Api_userprofile`
--

DROP TABLE IF EXISTS `Api_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Api_userprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role` varchar(30) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `user_id` int NOT NULL,
  `address` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `Api_userprofile_user_id_775c0324_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Api_userprofile`
--

LOCK TABLES `Api_userprofile` WRITE;
/*!40000 ALTER TABLE `Api_userprofile` DISABLE KEYS */;
INSERT INTO `Api_userprofile` VALUES (1,'customer','5897456325',9,'Thisyanvilai'),(2,'customer','8974563258',10,'Tirunelveli'),(3,'customer','789456123',11,'Thisayanvilai'),(4,'service_provider','9874589652',13,'Tenkasi'),(5,'service_provider','9874563214',20,''),(9,'service_provider','9874589632',24,'Thisyanvilai'),(10,'customer','985632587',25,'Tirunelveli'),(11,'service_provider','9856987456',26,'Tirunelveli'),(12,'service_provider','895687452',27,'melapalayam'),(13,'service_provider','8523698569',28,'Thoothukudi'),(14,'service_provider','859745896',29,'Tenkasi'),(15,'service_provider','9856985231',30,'Kumaraburam'),(16,'admin','9876543210',31,'Chennai');
/*!40000 ALTER TABLE `Api_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add services',7,'add_services'),(26,'Can change services',7,'change_services'),(27,'Can delete services',7,'delete_services'),(28,'Can view services',7,'view_services'),(29,'Can add provider',8,'add_provider'),(30,'Can change provider',8,'change_provider'),(31,'Can delete provider',8,'delete_provider'),(32,'Can view provider',8,'view_provider'),(33,'Can add booking',9,'add_booking'),(34,'Can change booking',9,'change_booking'),(35,'Can delete booking',9,'delete_booking'),(36,'Can view booking',9,'view_booking'),(37,'Can add provider availability',10,'add_provideravailability'),(38,'Can change provider availability',10,'change_provideravailability'),(39,'Can delete provider availability',10,'delete_provideravailability'),(40,'Can view provider availability',10,'view_provideravailability'),(41,'Can add review',11,'add_review'),(42,'Can change review',11,'change_review'),(43,'Can delete review',11,'delete_review'),(44,'Can view review',11,'view_review'),(45,'Can add user profile',12,'add_userprofile'),(46,'Can change user profile',12,'change_userprofile'),(47,'Can delete user profile',12,'delete_userprofile'),(48,'Can view user profile',12,'view_userprofile'),(49,'Can add provider day status',13,'add_providerdaystatus'),(50,'Can change provider day status',13,'change_providerdaystatus'),(51,'Can delete provider day status',13,'delete_providerdaystatus'),(52,'Can view provider day status',13,'view_providerdaystatus'),(53,'Can add provider unavailable',14,'add_providerunavailable'),(54,'Can change provider unavailable',14,'change_providerunavailable'),(55,'Can delete provider unavailable',14,'delete_providerunavailable'),(56,'Can view provider unavailable',14,'view_providerunavailable');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (5,'pbkdf2_sha256$1000000$JCzT6RqS3wgKSouC4pfKDX$4Sw0D0j4LLasI36C2pDRy/17CZx5jImc6l/sepD0+n0=','2026-02-11 16:13:22.084753',1,'admin','','','',1,1,'2026-02-05 11:02:37.862831'),(6,'1234',NULL,0,'balaji','','','',0,1,'2026-02-05 11:08:14.534255'),(7,'!G4ZOW4tN8NvlHTaQbX2i6i4DYXBbJyfM6MwsOLFk',NULL,0,'saravanan','','','',0,1,'2026-02-05 11:09:48.369260'),(8,'1234',NULL,0,'rago','','','',0,1,'2026-02-06 17:08:43.893114'),(9,'pbkdf2_sha256$1000000$Z66TdgZhwVqVHubn4FW1bj$CFqtgWDDuOfM8QWGrpV4sKrmPsZQyWkacoLCApni0Zg=','2026-02-08 06:07:21.921550',0,'raman','','','abc@gmail.com',0,1,'2026-02-07 15:35:57.452663'),(10,'pbkdf2_sha256$1000000$scL6VNlvELUfiBX7kawnXE$0rWsdvD1m5ugbD1Ylvd74op8m+95XrctlhZ39m8rAHo=',NULL,0,'rajeash','','','rajeash@gmail.com',0,1,'2026-02-07 15:43:16.741240'),(11,'pbkdf2_sha256$1000000$Ln1mEy8TL59oGOkjsPJgRG$smbvdiwpdNIakM/HAWoFwCpsBgZ17CKBfmTxGS0sG9U=',NULL,0,'sathya','','','',0,1,'2026-02-08 16:02:09.324586'),(13,'pbkdf2_sha256$1000000$LWUYOCXHh2UC3KxQXOi4dB$OI9nHnxNuOt46Y6tXnRzf4HqSYV+y8qKBY26z+ZZ8Gg=',NULL,0,'Guru1234','','','',0,1,'2026-02-10 15:49:41.132852'),(20,'pbkdf2_sha256$1000000$k6GKGKfuNtGZ6svrOHarUc$VkJCxlyq2vXZ164CBEER8OE8u0N6aLpzQ3xk38REsLc=',NULL,0,'rageash','','','',0,1,'2026-02-10 16:05:56.874871'),(24,'pbkdf2_sha256$1000000$qqy2XNdaI2koO1XaQnx454$9RymV0C0gs8qlgX6Jc0rxlnBylIrkQXcWLmmqURBke0=',NULL,0,'muthuram','','','',0,1,'2026-02-11 16:12:04.984865'),(25,'pbkdf2_sha256$1000000$ZXciNR5kTdYu6DcKbbLZBX$0F5PAxLz44/qtSQ/c8ga3sVTeh5JBW+cDGpfiagg9QI=',NULL,0,'boominathan','','','',0,1,'2026-02-17 11:32:18.788072'),(26,'pbkdf2_sha256$1000000$ZCWF4otbYehszYr8tBuArR$8YRsYeKB6nyLxDSaiMlwzSc+jv2/yI0ztx+4vOaDckw=',NULL,0,'babu','','','',0,1,'2026-02-18 16:07:23.523635'),(27,'pbkdf2_sha256$1000000$ODBVIvRqRDb2YKpIKpN4oi$tJIqmU6kwHX3CltNQpmSVk1ou1mnIuICMmwTU1zQPqc=',NULL,0,'lakshmanan','','','',0,1,'2026-02-19 09:43:26.788185'),(28,'pbkdf2_sha256$1000000$NHmDadV9nr6yamMggGNN5X$kbqTkRi2/RGWojMp2aHCrHWY+/l7hyohY0oU1XhdDHk=',NULL,0,'saravanan M','','','',0,1,'2026-02-19 09:44:39.756404'),(29,'pbkdf2_sha256$1000000$7GbChtMQc8IQJv0Jaecid0$N2NFghmph5NNa/hew5dkjFXBTUvOqsGg/grfjd2Hgh4=',NULL,0,'Murugan','','','',0,1,'2026-02-19 09:45:20.613023'),(30,'pbkdf2_sha256$1000000$FprwlKDT6owoNHIQMS6Ay3$usqmecZXU2UrbHCZsyHmntyq92l9xCVPQ1xGpuPQUvY=',NULL,0,'samual','','','',0,1,'2026-02-21 15:29:54.261648'),(31,'pbkdf2_sha256$1000000$URSCtVX2SnUo5U1vKCwZ5m$SkjFRGH2a+O2AZ7O201qaTjdINcOUvduBV8sgpxcEHE=',NULL,0,'appadmin','','','',0,1,'2026-02-22 14:06:40.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-02-05 11:06:34.505386','1','Electrician',1,'[{\"added\": {}}]',7,5),(2,'2026-02-05 11:09:48.372319','7','saravanan',1,'[{\"added\": {}}]',4,5),(3,'2026-02-05 11:10:12.908375','2','Electrician',1,'[{\"added\": {}}]',7,5),(4,'2026-02-05 11:13:50.715130','3','saravanan',1,'[{\"added\": {}}]',8,5),(5,'2026-02-05 11:14:04.104747','3','saravanan',2,'[]',8,5),(6,'2026-02-05 11:14:17.858230','4','balaji',1,'[{\"added\": {}}]',8,5),(7,'2026-02-11 15:44:22.693026','3','Plumber',1,'[{\"added\": {}}]',7,5),(8,'2026-02-11 15:44:52.337312','4','Painter',1,'[{\"added\": {}}]',7,5),(9,'2026-02-11 15:45:36.963996','1','Electrician',3,'',7,5),(10,'2026-02-11 15:45:51.776317','5','Ac Mechanic',1,'[{\"added\": {}}]',7,5),(11,'2026-02-11 16:14:44.773231','21','babu',3,'',4,5),(12,'2026-02-11 16:15:08.960183','23','raja',3,'',4,5),(13,'2026-02-11 16:15:16.471142','22','murugan',3,'',4,5),(14,'2026-02-22 14:06:40.655786','31','appadmin',1,'[{\"added\": {}}]',4,5),(15,'2026-02-22 14:06:57.977610','31','appadmin',2,'[]',4,5),(16,'2026-02-22 14:08:19.399026','16','appadmin',1,'[{\"added\": {}}]',12,5);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(9,'Api','booking'),(8,'Api','provider'),(10,'Api','provideravailability'),(13,'Api','providerdaystatus'),(14,'Api','providerunavailable'),(11,'Api','review'),(7,'Api','services'),(12,'Api','userprofile'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-02-04 16:20:14.596341'),(2,'auth','0001_initial','2026-02-04 16:20:15.697476'),(3,'Api','0001_initial','2026-02-04 16:20:16.575378'),(4,'admin','0001_initial','2026-02-04 16:20:16.805079'),(5,'admin','0002_logentry_remove_auto_add','2026-02-04 16:20:16.818963'),(6,'admin','0003_logentry_add_action_flag_choices','2026-02-04 16:20:16.834344'),(7,'contenttypes','0002_remove_content_type_name','2026-02-04 16:20:16.993568'),(8,'auth','0002_alter_permission_name_max_length','2026-02-04 16:20:17.091021'),(9,'auth','0003_alter_user_email_max_length','2026-02-04 16:20:17.131871'),(10,'auth','0004_alter_user_username_opts','2026-02-04 16:20:17.144796'),(11,'auth','0005_alter_user_last_login_null','2026-02-04 16:20:17.237244'),(12,'auth','0006_require_contenttypes_0002','2026-02-04 16:20:17.242595'),(13,'auth','0007_alter_validators_add_error_messages','2026-02-04 16:20:17.256504'),(14,'auth','0008_alter_user_username_max_length','2026-02-04 16:20:17.373726'),(15,'auth','0009_alter_user_last_name_max_length','2026-02-04 16:20:17.478074'),(16,'auth','0010_alter_group_name_max_length','2026-02-04 16:20:17.508144'),(17,'auth','0011_update_proxy_permissions','2026-02-04 16:20:17.529144'),(18,'auth','0012_alter_user_first_name_max_length','2026-02-04 16:20:17.645728'),(19,'sessions','0001_initial','2026-02-04 16:20:17.709925'),(20,'Api','0002_alter_userprofile_role_providerdaystatus','2026-02-04 16:31:30.965533'),(21,'Api','0003_provider_image_alter_userprofile_role','2026-02-06 09:45:07.715002'),(22,'Api','0004_alter_provider_image','2026-02-06 09:56:09.047755'),(23,'Api','0005_alter_provider_image_alter_userprofile_role','2026-02-06 09:56:51.180315'),(24,'Api','0006_userprofile_address_alter_userprofile_role','2026-02-07 09:52:22.154905'),(25,'Api','0007_provider_location_alter_userprofile_role','2026-02-10 09:06:34.906660'),(26,'Api','0008_alter_userprofile_role','2026-02-11 15:59:12.893415'),(27,'Api','0009_alter_provider_salary_alter_userprofile_role','2026-02-11 16:06:31.876374'),(28,'Api','0010_alter_booking_status_alter_userprofile_role','2026-02-19 09:11:57.062564'),(29,'Api','0011_alter_userprofile_role_alter_userprofile_user','2026-02-20 15:37:14.035633'),(30,'Api','0012_providerunavailable','2026-02-26 14:35:58.485600');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('72k4nw279i699ibc76o9ce65rvhckcvu','.eJxVjMsOwiAQRf-FtSG8GVy69xvIwIBUDU1KuzL-uzbpQrf3nHNfLOK2triNssSJ2JkFdvrdEuZH6TugO_bbzPPc12VKfFf4QQe_zlSel8P9O2g42reWSWmZNHnwFpMTQRpCURWAy0pVKQAMBANKqGwrSJ0QiybjrAiZvGfvD79pNuY:1voxx3:9i7F-cFFEoFRat7u2G20IvHf4NIEu6pXtk32cd4i1qo','2026-02-22 06:07:21.928452'),('d9govi8vi34y458f75f1tbb2il5ay4p6','e30:1voxu3:4DYtQB-ocujLge6KRVMQKkfa_GlkmavbAmiEFIesqnw','2026-02-22 06:04:15.205543'),('eux0cuaq4t03kps6l3insgto2qhysi1m','e30:1vokt1:rQgFne2k_U2wanBurJwqUowVj8Ts4iXQpRcceNPaUYA','2026-02-21 16:10:19.761161'),('id7nim0urxfkfyyymcqgg72hpxtu2oyv','.eJxVjMEOwiAQRP-FsyHsYnHx6L3fQIClUjWQlPZk_Hdp0oPOaTJvZt7C-W3NbmtpcTOLqxjE6TcLPj5T2QE_fLlXGWtZlznIvSIP2uRYOb1uR_fvIPuW-9qSUhg0WTYYsctAivoyBQLWhobudWBA5GQIlD6DJqQJIQJ7b1l8vrKeNtU:1vqCqA:1LEW_aT1Qo0MXYGWWAJJ1KeUffj6Cp5TxFecOGPp2Do','2026-02-25 16:13:22.089443'),('lsv004rmjdnwfkwnh3pocgghizz9eaux','.eJxVjMsOwiAQRf-FtSG8GVy69xvIwIBUDU1KuzL-uzbpQrf3nHNfLOK2triNssSJ2JkFdvrdEuZH6TugO_bbzPPc12VKfFf4QQe_zlSel8P9O2g42reWSWmZNHnwFpMTQRpCURWAy0pVKQAMBANKqGwrSJ0QiybjrAiZvGfvD79pNuY:1vokWd:lJnahpGLSx-MWv-m878wedMqqQfltT6zS1yeHpLvS-4','2026-02-21 15:47:11.835805'),('vhz5nqbeue0ibd2kae2fhe88oy26f4cf','.eJxVjMEOwiAQRP-FsyHsYnHx6L3fQIClUjWQlPZk_Hdp0oPOaTJvZt7C-W3NbmtpcTOLqxjE6TcLPj5T2QE_fLlXGWtZlznIvSIP2uRYOb1uR_fvIPuW-9qSUhg0WTYYsctAivoyBQLWhobudWBA5GQIlD6DJqQJIQJ7b1l8vrKeNtU:1vnxAo:wu4clfHrxQXgso988HbOgnbsWVT7IB7w33M0KRr4wZk','2026-02-19 11:05:22.254318');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-13 12:08:06
