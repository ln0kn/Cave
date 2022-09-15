-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: wendsome
-- ------------------------------------------------------
-- Server version	5.7.21-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ajustements`
--

DROP TABLE IF EXISTS `ajustements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ajustements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stockNumerique` int(11) NOT NULL,
  `stockPhysique` int(11) NOT NULL,
  `users_id` int(10) unsigned NOT NULL,
  `produits_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ajustements_users_id_foreign` (`users_id`),
  KEY `ajustements_produits_id_foreign` (`produits_id`),
  CONSTRAINT `ajustements_produits_id_foreign` FOREIGN KEY (`produits_id`) REFERENCES `produits` (`id`),
  CONSTRAINT `ajustements_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ajustements`
--

LOCK TABLES `ajustements` WRITE;
/*!40000 ALTER TABLE `ajustements` DISABLE KEYS */;
/*!40000 ALTER TABLE `ajustements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approvissionnement_produits`
--

DROP TABLE IF EXISTS `approvissionnement_produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approvissionnement_produits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prixUnitaire` int(11) DEFAULT NULL,
  `quantite` int(11) NOT NULL,
  `prixTotal` int(11) NOT NULL,
  `conditionnement` int(11) NOT NULL COMMENT '12 pack ,6 demi pack ,1 bouteille',
  `fournisseurs_id` int(10) unsigned NOT NULL,
  `produits_id` int(10) unsigned NOT NULL,
  `approvissionnements_id` int(10) unsigned NOT NULL,
  `users_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `approvissionnement_produits_fournisseurs_id_foreign` (`fournisseurs_id`),
  KEY `approvissionnement_produits_produits_id_foreign` (`produits_id`),
  KEY `approvissionnement_produits_approvissionnements_id_foreign` (`approvissionnements_id`),
  KEY `approvissionnement_produits_users_id_foreign` (`users_id`),
  CONSTRAINT `approvissionnement_produits_approvissionnements_id_foreign` FOREIGN KEY (`approvissionnements_id`) REFERENCES `approvissionnements` (`id`),
  CONSTRAINT `approvissionnement_produits_fournisseurs_id_foreign` FOREIGN KEY (`fournisseurs_id`) REFERENCES `fournisseurs` (`id`),
  CONSTRAINT `approvissionnement_produits_produits_id_foreign` FOREIGN KEY (`produits_id`) REFERENCES `produits` (`id`),
  CONSTRAINT `approvissionnement_produits_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approvissionnement_produits`
--

LOCK TABLES `approvissionnement_produits` WRITE;
/*!40000 ALTER TABLE `approvissionnement_produits` DISABLE KEYS */;
INSERT INTO `approvissionnement_produits` VALUES (1,NULL,50,50,12,1,1,1,1,NULL,'2019-09-06 20:50:54','2019-09-06 20:50:54'),(2,NULL,50,50,12,1,2,1,1,NULL,'2019-09-06 20:50:55','2019-09-06 20:50:55'),(3,NULL,50,50,12,1,3,1,1,NULL,'2019-09-06 20:50:55','2019-09-06 20:50:55'),(4,NULL,50,50,12,2,4,1,1,NULL,'2019-09-06 20:50:55','2019-09-06 20:50:55'),(5,NULL,50,50,12,2,6,1,1,NULL,'2019-09-06 20:50:56','2019-09-06 20:50:56');
/*!40000 ALTER TABLE `approvissionnement_produits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approvissionnements`
--

DROP TABLE IF EXISTS `approvissionnements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approvissionnements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifiant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `users_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `approvissionnements_identifiant_unique` (`identifiant`),
  KEY `approvissionnements_users_id_foreign` (`users_id`),
  CONSTRAINT `approvissionnements_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approvissionnements`
--

LOCK TABLES `approvissionnements` WRITE;
/*!40000 ALTER TABLE `approvissionnements` DISABLE KEYS */;
INSERT INTO `approvissionnements` VALUES (1,'2019-09-06 20:50:54','App/06/09/19/1',1,NULL,'2019-09-06 20:50:54','2019-09-06 20:50:54');
/*!40000 ALTER TABLE `approvissionnements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audits`
--

DROP TABLE IF EXISTS `audits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_id` int(10) unsigned NOT NULL,
  `auditable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_values` text COLLATE utf8mb4_unicode_ci,
  `new_values` text COLLATE utf8mb4_unicode_ci,
  `url` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audits_auditable_id_auditable_type_index` (`auditable_id`,`auditable_type`),
  KEY `audits_user_id_user_type_index` (`user_id`,`user_type`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audits`
--

LOCK TABLES `audits` WRITE;
/*!40000 ALTER TABLE `audits` DISABLE KEYS */;
INSERT INTO `audits` VALUES (1,NULL,NULL,'created',1,'App\\Poste','[]','{\"designationPostes\":\"chauffeur\",\"id\":1}','http://localhost:8000/addPostes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 00:34:29','2019-09-02 00:34:29'),(2,NULL,NULL,'created',2,'App\\Poste','[]','{\"designationPostes\":\"caisier\",\"id\":2}','http://localhost:8000/addPostes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 00:34:43','2019-09-02 00:34:43'),(3,NULL,NULL,'created',3,'App\\Poste','[]','{\"designationPostes\":\"comptable\",\"id\":3}','http://localhost:8000/addPostes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 00:34:55','2019-09-02 00:34:55'),(4,NULL,NULL,'created',4,'App\\Poste','[]','{\"designationPostes\":\"magasinier\",\"id\":4}','http://localhost:8000/addPostes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 00:35:02','2019-09-02 00:35:02'),(5,NULL,NULL,'deleted',1,'App\\Poste','{\"id\":1,\"designationPostes\":\"chauffeur\"}','[]','http://localhost:8000/deletePostes?','127.0.0.1','Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Mobile Safari/537.36',NULL,'2019-09-02 00:35:26','2019-09-02 00:35:26'),(6,NULL,NULL,'restored',1,'App\\Poste','[]','{\"id\":1,\"designationPostes\":\"chauffeur\"}','http://localhost:8000/deletePostes?','127.0.0.1','Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Mobile Safari/537.36',NULL,'2019-09-02 00:35:44','2019-09-02 00:35:44'),(7,NULL,NULL,'deleted',1,'App\\Poste','{\"id\":1,\"designationPostes\":\"chauffeur\"}','[]','http://localhost:8000/deletePostes?','127.0.0.1','Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Mobile Safari/537.36',NULL,'2019-09-02 00:36:20','2019-09-02 00:36:20'),(8,NULL,NULL,'restored',1,'App\\Poste','[]','{\"id\":1,\"designationPostes\":\"chauffeur\"}','http://localhost:8000/deletePostes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 00:40:37','2019-09-02 00:40:37'),(9,NULL,NULL,'updated',2,'App\\Poste','{\"designationPostes\":\"caisier\"}','{\"designationPostes\":\"caissier\"}','http://localhost:8000/updatePostes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 00:40:46','2019-09-02 00:40:46'),(10,NULL,NULL,'created',1,'App\\Enrollement','[]','{\"nomEnrolle\":\"usernom1\",\"prenomEnrolle\":\"userprenom1\",\"telephoneEnrolle\":\"707070\",\"sexeEnrolle\":\"0\",\"postes_id\":\"1\",\"id\":1}','http://localhost:8000/addEnrolles?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 00:43:36','2019-09-02 00:43:36'),(11,NULL,NULL,'created',2,'App\\Enrollement','[]','{\"nomEnrolle\":\"usernom2\",\"prenomEnrolle\":\"userprenom2\",\"telephoneEnrolle\":\"70707070\",\"sexeEnrolle\":\"1\",\"postes_id\":\"2\",\"id\":2}','http://localhost:8000/addEnrolles?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 00:45:52','2019-09-02 00:45:52'),(12,NULL,NULL,'updated',1,'App\\Enrollement','{\"telephoneEnrolle\":707070}','{\"telephoneEnrolle\":\"70707071\"}','http://localhost:8000/updateEnrolles?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 00:47:46','2019-09-02 00:47:46'),(13,NULL,NULL,'deleted',1,'App\\Enrollement','{\"id\":1,\"nomEnrolle\":\"usernom1\",\"prenomEnrolle\":\"userprenom1\",\"telephoneEnrolle\":70707071,\"sexeEnrolle\":0,\"statut\":0,\"users_id\":null,\"postes_id\":1}','[]','http://localhost:8000/deleteEnrolles?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 00:47:55','2019-09-02 00:47:55'),(14,NULL,NULL,'restored',1,'App\\Enrollement','[]','{\"id\":1,\"nomEnrolle\":\"usernom1\",\"prenomEnrolle\":\"userprenom1\",\"telephoneEnrolle\":70707071,\"sexeEnrolle\":0,\"statut\":0,\"users_id\":null,\"postes_id\":1}','http://localhost:8000/deleteEnrolles?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 00:48:00','2019-09-02 00:48:00'),(15,NULL,NULL,'updated',4,'App\\Poste','{\"designationPostes\":\"magasinier\"}','{\"designationPostes\":\"magasiniers\"}','http://localhost:8000/updatePostes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 01:17:51','2019-09-02 01:17:51'),(16,NULL,NULL,'updated',4,'App\\Poste','{\"designationPostes\":\"magasiniers\"}','{\"designationPostes\":\"magasinier\"}','http://localhost:8000/updatePostes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 01:18:01','2019-09-02 01:18:01'),(17,NULL,NULL,'deleted',2,'App\\Poste','{\"id\":2,\"designationPostes\":\"caissier\"}','[]','http://localhost:8000/deletePostes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 01:18:05','2019-09-02 01:18:05'),(18,NULL,NULL,'restored',2,'App\\Poste','[]','{\"id\":2,\"designationPostes\":\"caissier\"}','http://localhost:8000/deletePostes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 01:18:08','2019-09-02 01:18:08'),(19,NULL,NULL,'updated',2,'App\\Enrollement','{\"nomEnrolle\":\"usernom2\",\"prenomEnrolle\":\"userprenom2\",\"telephoneEnrolle\":70707070,\"sexeEnrolle\":1,\"postes_id\":2}','{\"nomEnrolle\":\"usernom\",\"prenomEnrolle\":\"userprenom\",\"telephoneEnrolle\":\"70707072\",\"sexeEnrolle\":\"0\",\"postes_id\":\"3\"}','http://localhost:8000/updateEnrolles?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 01:20:33','2019-09-02 01:20:33'),(20,NULL,NULL,'updated',2,'App\\Enrollement','{\"nomEnrolle\":\"usernom\",\"prenomEnrolle\":\"userprenom\",\"telephoneEnrolle\":70707072,\"sexeEnrolle\":0,\"postes_id\":3}','{\"nomEnrolle\":\"usernom2\",\"prenomEnrolle\":\"userprenom2\",\"telephoneEnrolle\":\"70707070\",\"sexeEnrolle\":\"1\",\"postes_id\":\"2\"}','http://localhost:8000/updateEnrolles?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 01:20:51','2019-09-02 01:20:51'),(21,NULL,NULL,'deleted',2,'App\\Enrollement','{\"id\":2,\"nomEnrolle\":\"usernom2\",\"prenomEnrolle\":\"userprenom2\",\"telephoneEnrolle\":70707070,\"sexeEnrolle\":1,\"statut\":0,\"users_id\":null,\"postes_id\":2}','[]','http://localhost:8000/deleteEnrolles?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 01:20:56','2019-09-02 01:20:56'),(22,NULL,NULL,'restored',2,'App\\Enrollement','[]','{\"id\":2,\"nomEnrolle\":\"usernom2\",\"prenomEnrolle\":\"userprenom2\",\"telephoneEnrolle\":70707070,\"sexeEnrolle\":1,\"statut\":0,\"users_id\":null,\"postes_id\":2}','http://localhost:8000/deleteEnrolles?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 01:20:59','2019-09-02 01:20:59'),(23,NULL,NULL,'created',3,'App\\Enrollement','[]','{\"nomEnrolle\":\"usernom3\",\"prenomEnrolle\":\"userprenom3\",\"telephoneEnrolle\":\"70707073\",\"sexeEnrolle\":\"0\",\"postes_id\":\"3\",\"id\":3}','http://localhost:8000/addEnrolles?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 01:26:40','2019-09-02 01:26:40'),(24,NULL,NULL,'created',4,'App\\Enrollement','[]','{\"nomEnrolle\":\"usernom4\",\"prenomEnrolle\":\"userprenom4\",\"telephoneEnrolle\":\"70707074\",\"sexeEnrolle\":\"1\",\"postes_id\":\"4\",\"id\":4}','http://localhost:8000/addEnrolles?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 01:27:06','2019-09-02 01:27:06'),(25,NULL,NULL,'updated',1,'App\\Enrollement','{\"statut\":0}','{\"statut\":1}','http://localhost:8000/register?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 01:28:25','2019-09-02 01:28:25'),(26,NULL,NULL,'created',1,'App\\User','[]','{\"username\":\"username1\",\"email\":\"bb@bb.b1\",\"droit\":7,\"enrolle_id\":\"1\",\"autorisation\":\"3\",\"password\":\"$2y$10$CljyN.iQNe24s12YLLSVBOlQuP8kdezBPITw12i7WvH7lsx6RD8kq\",\"id\":1}','http://localhost:8000/register?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 01:28:25','2019-09-02 01:28:25'),(27,'App\\User',1,'updated',2,'App\\Enrollement','{\"statut\":0}','{\"statut\":1}','http://localhost:8000/register?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 01:29:16','2019-09-02 01:29:16'),(28,'App\\User',1,'created',2,'App\\User','[]','{\"username\":\"username2\",\"email\":\"bb@bb.b2\",\"droit\":3,\"enrolle_id\":\"2\",\"autorisation\":\"2\",\"password\":\"$2y$10$rliDH.FpWm0y1MxIwfnemu7S0K3DSMe4dhSonqtvo5\\/ovJQbdNOuq\",\"id\":2}','http://localhost:8000/register?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 01:29:16','2019-09-02 01:29:16'),(29,'App\\User',2,'updated',3,'App\\Enrollement','{\"statut\":0}','{\"statut\":1}','http://localhost:8000/register?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 01:29:37','2019-09-02 01:29:37'),(30,'App\\User',2,'created',3,'App\\User','[]','{\"username\":\"username3\",\"email\":\"bb@bb.b3\",\"droit\":1,\"enrolle_id\":\"3\",\"autorisation\":\"1\",\"password\":\"$2y$10$vIbJ.Esu7BJKM08ElOwP6.GGXVLNu1ZzKOFWxv3J71Vi\\/PrxikYVu\",\"id\":3}','http://localhost:8000/register?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 01:29:37','2019-09-02 01:29:37'),(31,'App\\User',3,'updated',4,'App\\Enrollement','{\"statut\":0}','{\"statut\":1}','http://localhost:8000/register?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 01:29:59','2019-09-02 01:29:59'),(32,'App\\User',3,'created',4,'App\\User','[]','{\"username\":\"username4\",\"email\":\"bb@bb.b4\",\"droit\":5,\"enrolle_id\":\"4\",\"autorisation\":\"3\",\"password\":\"$2y$10$ALWwKtB4eqvHQPSuaY9lROjcHGCf6.RpGBJRHgKDyCCoBDR2tlH6C\",\"id\":4}','http://localhost:8000/register?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 01:30:00','2019-09-02 01:30:00'),(33,NULL,NULL,'deleted',4,'App\\User','{\"id\":4,\"username\":\"username4\",\"email\":\"bb@bb.b4\",\"password\":\"$2y$10$ALWwKtB4eqvHQPSuaY9lROjcHGCf6.RpGBJRHgKDyCCoBDR2tlH6C\",\"droit\":5,\"autorisation\":3,\"statut\":0,\"enrolle_id\":4,\"remember_token\":null,\"deleted_at\":null}','[]','http://localhost:8000/deleteUser?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 01:40:02','2019-09-02 01:40:02'),(34,NULL,NULL,'updated',3,'App\\User','{\"statut\":0}','{\"statut\":1}','http://localhost:8000/deleteUser?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 06:02:15','2019-09-02 06:02:15'),(35,NULL,NULL,'updated',3,'App\\Enrollement','{\"statut\":1}','{\"statut\":0}','http://localhost:8000/deleteUser?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 06:02:15','2019-09-02 06:02:15'),(36,NULL,NULL,'updated',3,'App\\User','{\"statut\":1}','{\"statut\":0}','http://localhost:8000/deleteUser?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 06:04:17','2019-09-02 06:04:17'),(37,NULL,NULL,'updated',3,'App\\User','{\"statut\":0}','{\"statut\":1}','http://localhost:8000/deleteUser?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 06:04:22','2019-09-02 06:04:22'),(38,NULL,NULL,'updated',3,'App\\User','{\"statut\":1}','{\"statut\":0}','http://localhost:8000/deleteUser?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 06:11:05','2019-09-02 06:11:05'),(39,NULL,NULL,'updated',3,'App\\User','{\"statut\":0}','{\"statut\":1}','http://localhost:8000/deleteUser?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 06:11:22','2019-09-02 06:11:22'),(40,NULL,NULL,'updated',3,'App\\User','{\"statut\":1}','{\"statut\":0}','http://localhost:8000/deleteUser?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 06:12:34','2019-09-02 06:12:34'),(41,NULL,NULL,'updated',3,'App\\User','{\"username\":\"username3\",\"email\":\"bb@bb.b3\",\"droit\":1,\"autorisation\":1}','{\"username\":\"username31\",\"email\":\"bb@bb.b31\",\"droit\":7,\"autorisation\":\"3\"}','http://localhost:8000/updateUser?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 06:13:57','2019-09-02 06:13:57'),(42,NULL,NULL,'updated',3,'App\\User','{\"username\":\"username31\",\"email\":\"bb@bb.b31\",\"password\":\"$2y$10$vIbJ.Esu7BJKM08ElOwP6.GGXVLNu1ZzKOFWxv3J71Vi\\/PrxikYVu\",\"droit\":7,\"autorisation\":3}','{\"username\":\"username3\",\"email\":\"bb@bb.b3\",\"password\":\"$2y$10$MmK7SFL8UAYTiXh8baF6ae9OKaZ9DtB5YNJcPNyUTdlrQVE4btADW\",\"droit\":1,\"autorisation\":\"2\"}','http://localhost:8000/updateUser?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 06:14:39','2019-09-02 06:14:39'),(43,NULL,NULL,'updated',3,'App\\User','{\"password\":\"$2y$10$MmK7SFL8UAYTiXh8baF6ae9OKaZ9DtB5YNJcPNyUTdlrQVE4btADW\"}','{\"password\":\"$2y$10$xOYxpSjsm\\/ji60dkgmqQEuTAlh4ZXph\\/5lLl6g646cmdKbPEPo3jW\"}','http://localhost:8000/updateUser?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-02 06:16:15','2019-09-02 06:16:15'),(44,'App\\User',1,'created',1,'App\\MarqueProduit','[]','{\"nomMarqueProduits\":\"pleisner\",\"users_id\":1,\"id\":1}','http://localhost:8000/addMarqueProduits?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 10:23:49','2019-09-03 10:23:49'),(45,'App\\User',1,'updated',1,'App\\MarqueProduit','{\"nomMarqueProduits\":\"pleisner\"}','{\"nomMarqueProduits\":\"pleisners\"}','http://localhost:8000/updateMarqueProduits?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 10:24:08','2019-09-03 10:24:08'),(46,'App\\User',1,'created',2,'App\\MarqueProduit','[]','{\"nomMarqueProduits\":\"pleisner\",\"users_id\":1,\"id\":2}','http://localhost:8000/addMarqueProduits?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 10:26:38','2019-09-03 10:26:38'),(47,'App\\User',1,'updated',2,'App\\MarqueProduit','{\"nomMarqueProduits\":\"pleisner\"}','{\"nomMarqueProduits\":\"vichy\"}','http://localhost:8000/updateMarqueProduits?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 10:35:20','2019-09-03 10:35:20'),(48,'App\\User',1,'created',3,'App\\MarqueProduit','[]','{\"nomMarqueProduits\":\"sodibo\",\"users_id\":1,\"id\":3}','http://localhost:8000/addMarqueProduits?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 10:36:19','2019-09-03 10:36:19'),(49,'App\\User',1,'created',1,'App\\FamilleProduit','[]','{\"nomFamilleProduits\":\"boissons alcolis\\u00e9e\",\"users_id\":1,\"id\":1}','http://localhost:8000/addFamilleProduits?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 10:43:53','2019-09-03 10:43:53'),(50,'App\\User',1,'created',2,'App\\FamilleProduit','[]','{\"nomFamilleProduits\":\"boissons non alcolis\\u00e9es\",\"users_id\":1,\"id\":2}','http://localhost:8000/addFamilleProduits?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 10:44:14','2019-09-03 10:44:14'),(51,'App\\User',1,'created',3,'App\\FamilleProduit','[]','{\"nomFamilleProduits\":\"eaux\",\"users_id\":1,\"id\":3}','http://localhost:8000/addFamilleProduits?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 10:44:29','2019-09-03 10:44:29'),(52,'App\\User',1,'created',4,'App\\FamilleProduit','[]','{\"nomFamilleProduits\":\"lact\\u00e9e\",\"users_id\":1,\"id\":4}','http://localhost:8000/addFamilleProduits?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 10:45:02','2019-09-03 10:45:02'),(53,'App\\User',1,'deleted',4,'App\\FamilleProduit','{\"id\":4,\"nomFamilleProduits\":\"lact\\u00e9e\",\"users_id\":1}','[]','http://localhost:8000/deleteFamilleProduits?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 10:45:17','2019-09-03 10:45:17'),(54,'App\\User',1,'created',1,'App\\Produit','[]','{\"designationProduits\":\"sprite\",\"famille_produits_id\":\"2\",\"marque_produits_id\":\"3\",\"seuilAlerte\":\"1200\",\"users_id\":1,\"id\":1}','http://localhost:8000/addProduits?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 10:46:27','2019-09-03 10:46:27'),(55,'App\\User',1,'created',2,'App\\Produit','[]','{\"designationProduits\":\"fanta\",\"famille_produits_id\":\"2\",\"marque_produits_id\":\"3\",\"seuilAlerte\":\"1500\",\"users_id\":1,\"id\":2}','http://localhost:8000/addProduits?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 10:47:21','2019-09-03 10:47:21'),(56,'App\\User',1,'created',3,'App\\Produit','[]','{\"designationProduits\":\"castel\",\"famille_produits_id\":\"2\",\"marque_produits_id\":\"1\",\"seuilAlerte\":\"1700\",\"users_id\":1,\"id\":3}','http://localhost:8000/addProduits?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 10:48:16','2019-09-03 10:48:16'),(57,'App\\User',1,'created',4,'App\\Produit','[]','{\"designationProduits\":\"guiness\",\"famille_produits_id\":\"1\",\"marque_produits_id\":\"1\",\"seuilAlerte\":\"1800\",\"users_id\":1,\"id\":4}','http://localhost:8000/addProduits?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 10:48:51','2019-09-03 10:48:51'),(58,'App\\User',1,'created',5,'App\\Produit','[]','{\"designationProduits\":\"lafi\",\"famille_produits_id\":\"3\",\"marque_produits_id\":\"2\",\"seuilAlerte\":\"700\",\"users_id\":1,\"id\":5}','http://localhost:8000/addProduits?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 10:49:21','2019-09-03 10:49:21'),(59,'App\\User',1,'created',6,'App\\Produit','[]','{\"designationProduits\":\"babali\",\"famille_produits_id\":\"3\",\"marque_produits_id\":\"2\",\"seuilAlerte\":\"850\",\"users_id\":1,\"id\":6}','http://localhost:8000/addProduits?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 10:49:45','2019-09-03 10:49:45'),(60,'App\\User',1,'updated',1,'App\\Produit','{\"designationProduits\":\"sprite\",\"seuilAlerte\":1200}','{\"designationProduits\":\"sprites\",\"seuilAlerte\":\"1201\"}','http://localhost:8000/updateProduits?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 10:54:42','2019-09-03 10:54:42'),(61,'App\\User',1,'deleted',1,'App\\Produit','{\"id\":1,\"designationProduits\":\"sprites\",\"seuilAlerte\":1201,\"famille_produits_id\":2,\"users_id\":1,\"marque_produits_id\":3}','[]','http://localhost:8000/deleteProduits?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 10:54:52','2019-09-03 10:54:52'),(62,'App\\User',1,'restored',1,'App\\Produit','[]','{\"id\":1,\"designationProduits\":\"sprites\",\"seuilAlerte\":1201,\"famille_produits_id\":2,\"users_id\":1,\"marque_produits_id\":3}','http://localhost:8000/deleteProduits?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 10:54:54','2019-09-03 10:54:54'),(63,'App\\User',1,'created',1,'App\\ClientTypes','[]','{\"designationClientTypes\":\"client ordinaires\",\"users_id\":1,\"id\":1}','http://localhost:8000/addClientTypes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 16:05:47','2019-09-03 16:05:47'),(64,'App\\User',1,'created',2,'App\\ClientTypes','[]','{\"designationClientTypes\":\"client semi-grossiste\",\"users_id\":1,\"id\":2}','http://localhost:8000/addClientTypes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 16:06:16','2019-09-03 16:06:16'),(65,'App\\User',1,'created',3,'App\\ClientTypes','[]','{\"designationClientTypes\":\"client grossiste\",\"users_id\":1,\"id\":3}','http://localhost:8000/addClientTypes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 16:06:27','2019-09-03 16:06:27'),(66,'App\\User',1,'updated',1,'App\\ClientTypes','{\"designationClientTypes\":\"client ordinaires\"}','{\"designationClientTypes\":\"clients ordinaires\"}','http://localhost:8000/updateClientTypes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 16:06:41','2019-09-03 16:06:41'),(67,'App\\User',1,'created',4,'App\\ClientTypes','[]','{\"designationClientTypes\":\"client ordinaires\",\"users_id\":1,\"id\":4}','http://localhost:8000/addClientTypes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 16:06:50','2019-09-03 16:06:50'),(68,'App\\User',1,'created',1,'App\\ClientTypes','[]','{\"designationClientTypes\":\"client ordinaire\",\"users_id\":1,\"id\":1}','http://localhost:8000/addClientTypes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 16:10:50','2019-09-03 16:10:50'),(69,'App\\User',1,'created',2,'App\\ClientTypes','[]','{\"designationClientTypes\":\"client semi-grossiste\",\"users_id\":1,\"id\":2}','http://localhost:8000/addClientTypes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 16:11:17','2019-09-03 16:11:17'),(70,'App\\User',1,'created',3,'App\\ClientTypes','[]','{\"designationClientTypes\":\"client grossiste\",\"users_id\":1,\"id\":3}','http://localhost:8000/addClientTypes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 16:11:26','2019-09-03 16:11:26'),(71,'App\\User',1,'deleted',3,'App\\ClientTypes','{\"id\":3,\"designationClientTypes\":\"client grossiste\",\"users_id\":1}','[]','http://localhost:8000/deleteClientTypes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 16:11:29','2019-09-03 16:11:29'),(72,'App\\User',1,'restored',3,'App\\ClientTypes','[]','{\"id\":3,\"designationClientTypes\":\"client grossiste\",\"users_id\":1}','http://localhost:8000/deleteClientTypes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 16:11:33','2019-09-03 16:11:33'),(73,'App\\User',1,'created',1,'App\\Client','[]','{\"nomClients\":\"client un\",\"telephoneClients\":\"70707070\",\"emailClients\":null,\"clientTypes_id\":\"2\",\"users_id\":1,\"id\":1}','http://localhost:8000/addClients?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 16:39:28','2019-09-03 16:39:28'),(74,'App\\User',1,'created',2,'App\\Client','[]','{\"nomClients\":\"client deux\",\"telephoneClients\":\"70077007\",\"emailClients\":null,\"clientTypes_id\":\"1\",\"users_id\":1,\"id\":2}','http://localhost:8000/addClients?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 16:40:03','2019-09-03 16:40:03'),(75,'App\\User',1,'updated',2,'App\\Client','{\"nomClients\":\"client deux\"}','{\"nomClients\":\"client deu\"}','http://localhost:8000/updateClients?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 16:40:14','2019-09-03 16:40:14'),(76,'App\\User',1,'deleted',2,'App\\Client','{\"id\":2,\"nomClients\":\"client deu\",\"telephoneClients\":70077007,\"emailClients\":null,\"achatTotalClients\":0,\"frequenceClients\":0,\"clientTypes_id\":1,\"users_id\":1}','[]','http://localhost:8000/deleteClients?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 16:40:30','2019-09-03 16:40:30'),(77,'App\\User',1,'restored',2,'App\\Client','[]','{\"id\":2,\"nomClients\":\"client deu\",\"telephoneClients\":70077007,\"emailClients\":null,\"achatTotalClients\":0,\"frequenceClients\":0,\"clientTypes_id\":1,\"users_id\":1}','http://localhost:8000/deleteClients?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 16:40:33','2019-09-03 16:40:33'),(78,'App\\User',1,'created',1,'App\\Fournisseur','[]','{\"nomFournisseurs\":\"fournisseur 1\",\"emailFournisseurs\":\"fou@four.un\",\"users_id\":1,\"id\":1}','http://localhost:8000/addFournisseurs?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 16:50:34','2019-09-03 16:50:34'),(79,'App\\User',1,'created',1,'App\\FournisseurTelephones','[]','{\"numeroFournisseurTelephone\":\"70077007\",\"fournisseurs_id\":1,\"users_id\":1,\"id\":1}','http://localhost:8000/addFournisseurs?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 16:50:34','2019-09-03 16:50:34'),(80,'App\\User',1,'created',2,'App\\FournisseurTelephones','[]','{\"numeroFournisseurTelephone\":\"70077070\",\"fournisseurs_id\":1,\"users_id\":1,\"id\":2}','http://localhost:8000/addFournisseurs?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 16:50:34','2019-09-03 16:50:34'),(81,'App\\User',1,'created',2,'App\\Fournisseur','[]','{\"nomFournisseurs\":\"fournisseur deux\",\"emailFournisseurs\":null,\"users_id\":1,\"id\":2}','http://localhost:8000/addFournisseurs?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 16:51:20','2019-09-03 16:51:20'),(82,'App\\User',1,'created',3,'App\\FournisseurTelephones','[]','{\"numeroFournisseurTelephone\":\"70727170\",\"fournisseurs_id\":2,\"users_id\":1,\"id\":3}','http://localhost:8000/addFournisseurs?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 16:51:20','2019-09-03 16:51:20'),(83,'App\\User',1,'deleted',2,'App\\Fournisseur','{\"id\":2,\"nomFournisseurs\":\"fournisseur deux\",\"emailFournisseurs\":null,\"users_id\":1}','[]','http://localhost:8000/deleteFournisseurs?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 16:57:22','2019-09-03 16:57:22'),(84,'App\\User',1,'restored',2,'App\\Fournisseur','[]','{\"id\":2,\"nomFournisseurs\":\"fournisseur deux\",\"emailFournisseurs\":null,\"users_id\":1}','http://localhost:8000/deleteFournisseurs?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 16:57:29','2019-09-03 16:57:29'),(85,'App\\User',1,'updated',1,'App\\Fournisseur','{\"nomFournisseurs\":\"fournisseur 1\",\"emailFournisseurs\":\"fou@four.un\"}','{\"nomFournisseurs\":\"fournisseur 11\",\"emailFournisseurs\":\"fou@four.une\"}','http://localhost:8000/updateFournisseurs?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 17:00:40','2019-09-03 17:00:40'),(86,'App\\User',1,'created',4,'App\\FournisseurTelephones','[]','{\"numeroFournisseurTelephone\":\"70717171\",\"fournisseurs_id\":1,\"users_id\":1,\"id\":4}','http://localhost:8000/updateFournisseurs?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 17:00:41','2019-09-03 17:00:41'),(87,'App\\User',1,'created',5,'App\\FournisseurTelephones','[]','{\"numeroFournisseurTelephone\":\"72717171\",\"fournisseurs_id\":1,\"users_id\":1,\"id\":5}','http://localhost:8000/updateFournisseurs?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 17:00:41','2019-09-03 17:00:41'),(88,'App\\User',1,'updated',1,'App\\Fournisseur','{\"nomFournisseurs\":\"fournisseur 11\",\"emailFournisseurs\":\"fou@four.une\"}','{\"nomFournisseurs\":\"fournisseur 1\",\"emailFournisseurs\":\"fou@four.un\"}','http://localhost:8000/updateFournisseurs?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 17:01:37','2019-09-03 17:01:37'),(89,'App\\User',1,'created',6,'App\\FournisseurTelephones','[]','{\"numeroFournisseurTelephone\":\"70717171\",\"fournisseurs_id\":1,\"users_id\":1,\"id\":6}','http://localhost:8000/updateFournisseurs?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 17:01:38','2019-09-03 17:01:38'),(90,'App\\User',1,'created',7,'App\\FournisseurTelephones','[]','{\"numeroFournisseurTelephone\":\"72717171\",\"fournisseurs_id\":1,\"users_id\":1,\"id\":7}','http://localhost:8000/updateFournisseurs?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 17:01:38','2019-09-03 17:01:38'),(91,'App\\User',1,'created',1,'App\\Remise','[]','{\"designationRemises\":\"remise 5%\",\"pourcentageRemises\":\"5\",\"frequences\":null,\"minimumAchatRemises\":\"5000\",\"users_id\":1,\"id\":1}','http://localhost:8000/addRemises?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 17:15:38','2019-09-03 17:15:38'),(92,'App\\User',1,'created',2,'App\\Remise','[]','{\"designationRemises\":\"remise 10\",\"pourcentageRemises\":\"10\",\"frequences\":null,\"minimumAchatRemises\":\"10000\",\"users_id\":1,\"id\":2}','http://localhost:8000/addRemises?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 17:15:39','2019-09-03 17:15:39'),(93,'App\\User',1,'created',3,'App\\Remise','[]','{\"designationRemises\":\"remises 15%\",\"pourcentageRemises\":\"15\",\"frequences\":\"3\",\"minimumAchatRemises\":null,\"users_id\":1,\"id\":3}','http://localhost:8000/addRemises?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 17:17:15','2019-09-03 17:17:15'),(94,'App\\User',1,'updated',3,'App\\Remise','{\"pourcentageRemises\":15,\"frequences\":3}','{\"pourcentageRemises\":\"16\",\"frequences\":\"4\"}','http://localhost:8000/updateRemises?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-03 17:17:59','2019-09-03 17:17:59'),(95,'App\\User',1,'created',1,'App\\Approvissionnement','[]','{\"date\":{\"date\":\"2019-09-06 20:50:54.627298\",\"timezone_type\":3,\"timezone\":\"UTC\"},\"identifiant\":\"App\\/06\\/09\\/19\\/1\",\"users_id\":1,\"id\":1}','http://localhost:8000/addApprovissionnements?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-06 20:50:54','2019-09-06 20:50:54'),(96,'App\\User',1,'created',1,'App\\ApprovissionnementFournisseurProduit','[]','{\"prixUnitaire\":null,\"quantite\":\"50\",\"prixTotal\":50,\"fournisseurs_id\":\"1\",\"produits_id\":\"1\",\"conditionnement\":\"12\",\"approvissionnements_id\":1,\"users_id\":1,\"id\":1}','http://localhost:8000/addApprovissionnements?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-06 20:50:54','2019-09-06 20:50:54'),(97,'App\\User',1,'created',1,'App\\Stock','[]','{\"quantiteAnterieur\":0,\"quantiteActuel\":600,\"variationQuantite\":600,\"dateApprovissionnement\":{\"date\":\"2019-09-06 20:50:54.837229\",\"timezone_type\":3,\"timezone\":\"UTC\"},\"produits_id\":\"1\",\"approvissionnements_id\":1,\"users_id\":1,\"id\":1}','http://localhost:8000/addApprovissionnements?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-06 20:50:54','2019-09-06 20:50:54'),(98,'App\\User',1,'created',2,'App\\ApprovissionnementFournisseurProduit','[]','{\"prixUnitaire\":null,\"quantite\":\"50\",\"prixTotal\":50,\"fournisseurs_id\":\"1\",\"produits_id\":\"2\",\"conditionnement\":\"12\",\"approvissionnements_id\":1,\"users_id\":1,\"id\":2}','http://localhost:8000/addApprovissionnements?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-06 20:50:55','2019-09-06 20:50:55'),(99,'App\\User',1,'created',2,'App\\Stock','[]','{\"quantiteAnterieur\":0,\"quantiteActuel\":600,\"variationQuantite\":600,\"dateApprovissionnement\":{\"date\":\"2019-09-06 20:50:55.315797\",\"timezone_type\":3,\"timezone\":\"UTC\"},\"produits_id\":\"2\",\"approvissionnements_id\":1,\"users_id\":1,\"id\":2}','http://localhost:8000/addApprovissionnements?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-06 20:50:55','2019-09-06 20:50:55'),(100,'App\\User',1,'created',3,'App\\ApprovissionnementFournisseurProduit','[]','{\"prixUnitaire\":null,\"quantite\":\"50\",\"prixTotal\":50,\"fournisseurs_id\":\"1\",\"produits_id\":\"3\",\"conditionnement\":\"12\",\"approvissionnements_id\":1,\"users_id\":1,\"id\":3}','http://localhost:8000/addApprovissionnements?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-06 20:50:55','2019-09-06 20:50:55'),(101,'App\\User',1,'created',3,'App\\Stock','[]','{\"quantiteAnterieur\":0,\"quantiteActuel\":600,\"variationQuantite\":600,\"dateApprovissionnement\":{\"date\":\"2019-09-06 20:50:55.761588\",\"timezone_type\":3,\"timezone\":\"UTC\"},\"produits_id\":\"3\",\"approvissionnements_id\":1,\"users_id\":1,\"id\":3}','http://localhost:8000/addApprovissionnements?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-06 20:50:55','2019-09-06 20:50:55'),(102,'App\\User',1,'created',4,'App\\ApprovissionnementFournisseurProduit','[]','{\"prixUnitaire\":null,\"quantite\":\"50\",\"prixTotal\":50,\"fournisseurs_id\":\"2\",\"produits_id\":\"4\",\"conditionnement\":\"12\",\"approvissionnements_id\":1,\"users_id\":1,\"id\":4}','http://localhost:8000/addApprovissionnements?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-06 20:50:56','2019-09-06 20:50:56'),(103,'App\\User',1,'created',4,'App\\Stock','[]','{\"quantiteAnterieur\":0,\"quantiteActuel\":600,\"variationQuantite\":600,\"dateApprovissionnement\":{\"date\":\"2019-09-06 20:50:56.076618\",\"timezone_type\":3,\"timezone\":\"UTC\"},\"produits_id\":\"4\",\"approvissionnements_id\":1,\"users_id\":1,\"id\":4}','http://localhost:8000/addApprovissionnements?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-06 20:50:56','2019-09-06 20:50:56'),(104,'App\\User',1,'created',5,'App\\ApprovissionnementFournisseurProduit','[]','{\"prixUnitaire\":null,\"quantite\":\"50\",\"prixTotal\":50,\"fournisseurs_id\":\"2\",\"produits_id\":\"6\",\"conditionnement\":\"12\",\"approvissionnements_id\":1,\"users_id\":1,\"id\":5}','http://localhost:8000/addApprovissionnements?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-06 20:50:56','2019-09-06 20:50:56'),(105,'App\\User',1,'created',5,'App\\Stock','[]','{\"quantiteAnterieur\":0,\"quantiteActuel\":600,\"variationQuantite\":600,\"dateApprovissionnement\":{\"date\":\"2019-09-06 20:50:56.310702\",\"timezone_type\":3,\"timezone\":\"UTC\"},\"produits_id\":\"6\",\"approvissionnements_id\":1,\"users_id\":1,\"id\":5}','http://localhost:8000/addApprovissionnements?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-06 20:50:56','2019-09-06 20:50:56'),(106,'App\\User',1,'created',1,'App\\Vente','[]','{\"identifiantVentes\":\"Vte\\/06\\/09\\/19\\/1\",\"dateVentes\":{\"date\":\"2019-09-06 20:52:50.150279\",\"timezone_type\":3,\"timezone\":\"UTC\"},\"nomClients\":\"client un ( 70707070 )\",\"clients_id\":1,\"client_types_id\":\"2\",\"remises_id\":null,\"sommePayer\":\"14400\",\"sommeAPayer\":\"14400\",\"sommeRestante\":\"0\",\"infoVersement\":null,\"versement\":\"1\",\"montantVente\":\"14400\",\"users_id\":1,\"id\":1}','http://localhost:8000/addVentes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-06 20:52:50','2019-09-06 20:52:50'),(107,'App\\User',1,'created',1,'App\\Caisse','[]','{\"typeVersment\":\"1\",\"sommeAnterieurCaisse\":0,\"sommeActuelCaisse\":\"14400\",\"variatioCaisse\":\"14400\",\"dateOperation\":{\"date\":\"2019-09-06 20:52:50.329207\",\"timezone_type\":3,\"timezone\":\"UTC\"},\"ventes_id\":1,\"users_id\":1,\"id\":1}','http://localhost:8000/addVentes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-06 20:52:50','2019-09-06 20:52:50'),(108,'App\\User',1,'created',1,'App\\ClientCompte','[]','{\"sommeAnterieur\":0,\"sommeActuel\":\"0\",\"variation\":\"0\",\"typeVersement\":\"1\",\"date\":{\"date\":\"2019-09-06 20:52:50.420619\",\"timezone_type\":3,\"timezone\":\"UTC\"},\"ventes_id\":1,\"clients_id\":1,\"users_id\":1,\"id\":1}','http://localhost:8000/addVentes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-06 20:52:50','2019-09-06 20:52:50'),(109,'App\\User',1,'created',1,'App\\ProduitVente','[]','{\"prixUnitaireProduitVentes\":\"1300\",\"quantiteProduitVentes\":\"3\",\"prixTotalProduitVentes\":3900,\"conditionnement\":\"12\",\"produits_id\":\"4\",\"ventes_id\":1,\"users_id\":1,\"id\":1}','http://localhost:8000/addVentes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-06 20:52:50','2019-09-06 20:52:50'),(110,'App\\User',1,'created',6,'App\\Stock','[]','{\"quantiteAnterieur\":600,\"quantiteActuel\":564,\"variationquantite\":36,\"dateApprovissionnement\":{\"date\":\"2019-09-06 20:52:50.777952\",\"timezone_type\":3,\"timezone\":\"UTC\"},\"produits_id\":\"4\",\"ventes_id\":1,\"users_id\":1,\"id\":6}','http://localhost:8000/addVentes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-06 20:52:50','2019-09-06 20:52:50'),(111,'App\\User',1,'created',2,'App\\ProduitVente','[]','{\"prixUnitaireProduitVentes\":\"3500\",\"quantiteProduitVentes\":\"3\",\"prixTotalProduitVentes\":10500,\"conditionnement\":\"1\",\"produits_id\":\"3\",\"ventes_id\":1,\"users_id\":1,\"id\":2}','http://localhost:8000/addVentes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-06 20:52:51','2019-09-06 20:52:51'),(112,'App\\User',1,'created',7,'App\\Stock','[]','{\"quantiteAnterieur\":600,\"quantiteActuel\":597,\"variationquantite\":3,\"dateApprovissionnement\":{\"date\":\"2019-09-06 20:52:51.156966\",\"timezone_type\":3,\"timezone\":\"UTC\"},\"produits_id\":\"3\",\"ventes_id\":1,\"users_id\":1,\"id\":7}','http://localhost:8000/addVentes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-06 20:52:51','2019-09-06 20:52:51'),(113,'App\\User',1,'created',2,'App\\Vente','[]','{\"identifiantVentes\":\"Vte\\/06\\/09\\/19\\/2\",\"dateVentes\":{\"date\":\"2019-09-06 20:54:00.091935\",\"timezone_type\":3,\"timezone\":\"UTC\"},\"nomClients\":\"client un ( 70707070 )\",\"clients_id\":1,\"client_types_id\":\"2\",\"remises_id\":null,\"sommePayer\":\"45000\",\"sommeAPayer\":\"45000\",\"sommeRestante\":\"0\",\"infoVersement\":null,\"versement\":\"1\",\"montantVente\":\"45000\",\"users_id\":1,\"id\":2}','http://localhost:8000/addVentes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-06 20:54:00','2019-09-06 20:54:00'),(114,'App\\User',1,'created',2,'App\\Caisse','[]','{\"typeVersment\":\"1\",\"sommeAnterieurCaisse\":14400,\"sommeActuelCaisse\":59400,\"variatioCaisse\":\"45000\",\"dateOperation\":{\"date\":\"2019-09-06 20:54:00.257673\",\"timezone_type\":3,\"timezone\":\"UTC\"},\"ventes_id\":2,\"users_id\":1,\"id\":2}','http://localhost:8000/addVentes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-06 20:54:00','2019-09-06 20:54:00'),(115,'App\\User',1,'created',2,'App\\ClientCompte','[]','{\"sommeAnterieur\":0,\"sommeActuel\":0,\"variation\":\"0\",\"typeVersement\":\"1\",\"date\":{\"date\":\"2019-09-06 20:54:00.407068\",\"timezone_type\":3,\"timezone\":\"UTC\"},\"ventes_id\":2,\"clients_id\":1,\"users_id\":1,\"id\":2}','http://localhost:8000/addVentes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-06 20:54:00','2019-09-06 20:54:00'),(116,'App\\User',1,'created',3,'App\\ProduitVente','[]','{\"prixUnitaireProduitVentes\":\"4500\",\"quantiteProduitVentes\":\"3\",\"prixTotalProduitVentes\":13500,\"conditionnement\":\"12\",\"produits_id\":\"4\",\"ventes_id\":2,\"users_id\":1,\"id\":3}','http://localhost:8000/addVentes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-06 20:54:00','2019-09-06 20:54:00'),(117,'App\\User',1,'created',8,'App\\Stock','[]','{\"quantiteAnterieur\":564,\"quantiteActuel\":528,\"variationquantite\":36,\"dateApprovissionnement\":{\"date\":\"2019-09-06 20:54:00.676769\",\"timezone_type\":3,\"timezone\":\"UTC\"},\"produits_id\":\"4\",\"ventes_id\":2,\"users_id\":1,\"id\":8}','http://localhost:8000/addVentes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-06 20:54:00','2019-09-06 20:54:00'),(118,'App\\User',1,'created',4,'App\\ProduitVente','[]','{\"prixUnitaireProduitVentes\":\"3500\",\"quantiteProduitVentes\":\"4\",\"prixTotalProduitVentes\":14000,\"conditionnement\":\"12\",\"produits_id\":\"2\",\"ventes_id\":2,\"users_id\":1,\"id\":4}','http://localhost:8000/addVentes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-06 20:54:01','2019-09-06 20:54:01'),(119,'App\\User',1,'created',9,'App\\Stock','[]','{\"quantiteAnterieur\":600,\"quantiteActuel\":552,\"variationquantite\":48,\"dateApprovissionnement\":{\"date\":\"2019-09-06 20:54:01.175953\",\"timezone_type\":3,\"timezone\":\"UTC\"},\"produits_id\":\"2\",\"ventes_id\":2,\"users_id\":1,\"id\":9}','http://localhost:8000/addVentes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-06 20:54:01','2019-09-06 20:54:01'),(120,'App\\User',1,'created',5,'App\\ProduitVente','[]','{\"prixUnitaireProduitVentes\":\"3500\",\"quantiteProduitVentes\":\"5\",\"prixTotalProduitVentes\":17500,\"conditionnement\":\"12\",\"produits_id\":\"6\",\"ventes_id\":2,\"users_id\":1,\"id\":5}','http://localhost:8000/addVentes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-06 20:54:01','2019-09-06 20:54:01'),(121,'App\\User',1,'created',10,'App\\Stock','[]','{\"quantiteAnterieur\":600,\"quantiteActuel\":540,\"variationquantite\":60,\"dateApprovissionnement\":{\"date\":\"2019-09-06 20:54:01.578072\",\"timezone_type\":3,\"timezone\":\"UTC\"},\"produits_id\":\"6\",\"ventes_id\":2,\"users_id\":1,\"id\":10}','http://localhost:8000/addVentes?','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36 OPR/63.0.3368.43',NULL,'2019-09-06 20:54:01','2019-09-06 20:54:01');
/*!40000 ALTER TABLE `audits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caisses`
--

DROP TABLE IF EXISTS `caisses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caisses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeVersment` int(11) NOT NULL,
  `SommeAnterieurCaisse` int(11) NOT NULL,
  `sommeActuelCaisse` int(11) NOT NULL,
  `VariatioCaisse` int(11) NOT NULL,
  `dateOperation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ventes_id` int(10) unsigned DEFAULT NULL,
  `versements_id` int(10) unsigned DEFAULT NULL,
  `users_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `caisses_ventes_id_foreign` (`ventes_id`),
  KEY `caisses_versements_id_foreign` (`versements_id`),
  KEY `caisses_users_id_foreign` (`users_id`),
  CONSTRAINT `caisses_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `caisses_ventes_id_foreign` FOREIGN KEY (`ventes_id`) REFERENCES `ventes` (`id`),
  CONSTRAINT `caisses_versements_id_foreign` FOREIGN KEY (`versements_id`) REFERENCES `versements` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caisses`
--

LOCK TABLES `caisses` WRITE;
/*!40000 ALTER TABLE `caisses` DISABLE KEYS */;
INSERT INTO `caisses` VALUES (1,1,0,14400,14400,'2019-09-06 20:52:50',1,NULL,1,NULL,'2019-09-06 20:52:50','2019-09-06 20:52:50'),(2,1,14400,59400,45000,'2019-09-06 20:54:00',2,NULL,1,NULL,'2019-09-06 20:54:00','2019-09-06 20:54:00');
/*!40000 ALTER TABLE `caisses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_comptes`
--

DROP TABLE IF EXISTS `client_comptes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_comptes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sommeActuel` int(11) NOT NULL,
  `sommeAnterieur` int(11) NOT NULL,
  `variation` int(11) NOT NULL,
  `typeVersement` int(11) NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ventes_id` int(10) unsigned DEFAULT NULL,
  `clients_id` int(10) unsigned DEFAULT NULL,
  `versements_id` int(10) unsigned DEFAULT NULL,
  `users_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_comptes_ventes_id_foreign` (`ventes_id`),
  KEY `client_comptes_clients_id_foreign` (`clients_id`),
  KEY `client_comptes_versements_id_foreign` (`versements_id`),
  KEY `client_comptes_users_id_foreign` (`users_id`),
  CONSTRAINT `client_comptes_clients_id_foreign` FOREIGN KEY (`clients_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `client_comptes_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `client_comptes_ventes_id_foreign` FOREIGN KEY (`ventes_id`) REFERENCES `ventes` (`id`),
  CONSTRAINT `client_comptes_versements_id_foreign` FOREIGN KEY (`versements_id`) REFERENCES `versements` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_comptes`
--

LOCK TABLES `client_comptes` WRITE;
/*!40000 ALTER TABLE `client_comptes` DISABLE KEYS */;
INSERT INTO `client_comptes` VALUES (1,0,0,0,1,'2019-09-06 20:52:50',1,1,NULL,1,NULL,'2019-09-06 20:52:50','2019-09-06 20:52:50'),(2,0,0,0,1,'2019-09-06 20:54:00',2,1,NULL,1,NULL,'2019-09-06 20:54:00','2019-09-06 20:54:00');
/*!40000 ALTER TABLE `client_comptes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_types`
--

DROP TABLE IF EXISTS `client_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designationClientTypes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `users_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_types_designationclienttypes_unique` (`designationClientTypes`),
  KEY `client_types_users_id_foreign` (`users_id`),
  CONSTRAINT `client_types_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_types`
--

LOCK TABLES `client_types` WRITE;
/*!40000 ALTER TABLE `client_types` DISABLE KEYS */;
INSERT INTO `client_types` VALUES (1,'client ordinaire',1,'2019-09-03 16:10:50','2019-09-03 16:10:50',NULL),(2,'client semi-grossiste',1,'2019-09-03 16:11:17','2019-09-03 16:11:17',NULL),(3,'client grossiste',1,'2019-09-03 16:11:26','2019-09-03 16:11:33',NULL);
/*!40000 ALTER TABLE `client_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nomClients` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephoneClients` int(11) DEFAULT NULL,
  `emailClients` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `achatTotalClients` int(11) NOT NULL DEFAULT '0',
  `frequenceClients` int(11) NOT NULL DEFAULT '0',
  `clientTypes_id` int(10) unsigned NOT NULL,
  `users_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients_telephoneclients_unique` (`telephoneClients`),
  UNIQUE KEY `clients_emailclients_unique` (`emailClients`),
  KEY `clients_clienttypes_id_foreign` (`clientTypes_id`),
  KEY `clients_users_id_foreign` (`users_id`),
  CONSTRAINT `clients_clienttypes_id_foreign` FOREIGN KEY (`clientTypes_id`) REFERENCES `client_types` (`id`),
  CONSTRAINT `clients_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'client un',70707070,NULL,59400,2,2,1,'2019-09-03 16:39:28','2019-09-06 20:54:00',NULL),(2,'client deu',70077007,NULL,0,0,1,1,'2019-09-03 16:40:03','2019-09-03 16:40:33',NULL);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloture_journees`
--

DROP TABLE IF EXISTS `cloture_journees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cloture_journees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idenfiantClotures` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateJourneeClotures` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `users_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cloture_journees_idenfiantclotures_unique` (`idenfiantClotures`),
  KEY `cloture_journees_users_id_foreign` (`users_id`),
  CONSTRAINT `cloture_journees_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloture_journees`
--

LOCK TABLES `cloture_journees` WRITE;
/*!40000 ALTER TABLE `cloture_journees` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloture_journees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devi_produits`
--

DROP TABLE IF EXISTS `devi_produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devi_produits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prixUnitaireDevis` int(11) NOT NULL,
  `quantiteDevis` int(11) NOT NULL,
  `prixTotalDevis` int(11) NOT NULL,
  `conditionnement` int(11) NOT NULL COMMENT '12 pack ,6 demi pack ,1 bouteille',
  `users_id` int(10) unsigned DEFAULT NULL,
  `produits_id` int(10) unsigned DEFAULT NULL,
  `devis_id` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `devi_produits_users_id_foreign` (`users_id`),
  KEY `devi_produits_produits_id_foreign` (`produits_id`),
  KEY `devi_produits_devis_id_foreign` (`devis_id`),
  CONSTRAINT `devi_produits_devis_id_foreign` FOREIGN KEY (`devis_id`) REFERENCES `devis` (`id`),
  CONSTRAINT `devi_produits_produits_id_foreign` FOREIGN KEY (`produits_id`) REFERENCES `produits` (`id`),
  CONSTRAINT `devi_produits_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devi_produits`
--

LOCK TABLES `devi_produits` WRITE;
/*!40000 ALTER TABLE `devi_produits` DISABLE KEYS */;
/*!40000 ALTER TABLE `devi_produits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devis`
--

DROP TABLE IF EXISTS `devis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifiantDevis` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateDevis` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomClients` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sommeAPayer` int(11) NOT NULL,
  `montantDevis` int(11) NOT NULL COMMENT 'montant Devis sans la remise',
  `users_id` int(10) unsigned NOT NULL,
  `remises_id` int(10) unsigned DEFAULT NULL,
  `client_types_id` int(10) unsigned NOT NULL,
  `clients_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `devis_identifiantdevis_unique` (`identifiantDevis`),
  KEY `devis_users_id_foreign` (`users_id`),
  KEY `devis_remises_id_foreign` (`remises_id`),
  KEY `devis_client_types_id_foreign` (`client_types_id`),
  KEY `devis_clients_id_foreign` (`clients_id`),
  CONSTRAINT `devis_client_types_id_foreign` FOREIGN KEY (`client_types_id`) REFERENCES `client_types` (`id`),
  CONSTRAINT `devis_clients_id_foreign` FOREIGN KEY (`clients_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `devis_remises_id_foreign` FOREIGN KEY (`remises_id`) REFERENCES `remises` (`id`),
  CONSTRAINT `devis_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devis`
--

LOCK TABLES `devis` WRITE;
/*!40000 ALTER TABLE `devis` DISABLE KEYS */;
/*!40000 ALTER TABLE `devis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `don_produits`
--

DROP TABLE IF EXISTS `don_produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `don_produits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantiteProduitDons` int(11) NOT NULL,
  `conditionnement` int(11) NOT NULL COMMENT '12 pack ,6 demi pack ,1 bouteille',
  `users_id` int(10) unsigned NOT NULL,
  `produits_id` int(10) unsigned DEFAULT NULL,
  `dons_id` int(10) unsigned NOT NULL,
  `clients_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `don_produits_users_id_foreign` (`users_id`),
  KEY `don_produits_produits_id_foreign` (`produits_id`),
  KEY `don_produits_dons_id_foreign` (`dons_id`),
  KEY `don_produits_clients_id_foreign` (`clients_id`),
  CONSTRAINT `don_produits_clients_id_foreign` FOREIGN KEY (`clients_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `don_produits_dons_id_foreign` FOREIGN KEY (`dons_id`) REFERENCES `dons` (`id`),
  CONSTRAINT `don_produits_produits_id_foreign` FOREIGN KEY (`produits_id`) REFERENCES `produits` (`id`),
  CONSTRAINT `don_produits_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `don_produits`
--

LOCK TABLES `don_produits` WRITE;
/*!40000 ALTER TABLE `don_produits` DISABLE KEYS */;
/*!40000 ALTER TABLE `don_produits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dons`
--

DROP TABLE IF EXISTS `dons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifiantDons` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateDons` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `users_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dons_identifiantdons_unique` (`identifiantDons`),
  KEY `dons_users_id_foreign` (`users_id`),
  CONSTRAINT `dons_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dons`
--

LOCK TABLES `dons` WRITE;
/*!40000 ALTER TABLE `dons` DISABLE KEYS */;
/*!40000 ALTER TABLE `dons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollements`
--

DROP TABLE IF EXISTS `enrollements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrollements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nomEnrolle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenomEnrolle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephoneEnrolle` int(11) NOT NULL,
  `sexeEnrolle` int(11) NOT NULL,
  `statut` int(11) NOT NULL DEFAULT '0' COMMENT '0 non user ,1 users',
  `users_id` int(11) DEFAULT NULL,
  `postes_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `enrollements_postes_id_foreign` (`postes_id`),
  CONSTRAINT `enrollements_postes_id_foreign` FOREIGN KEY (`postes_id`) REFERENCES `postes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollements`
--

LOCK TABLES `enrollements` WRITE;
/*!40000 ALTER TABLE `enrollements` DISABLE KEYS */;
INSERT INTO `enrollements` VALUES (1,'usernom1','userprenom1',70707071,0,1,NULL,1,NULL,'2019-09-02 00:43:36','2019-09-02 01:28:25'),(2,'usernom2','userprenom2',70707070,1,1,NULL,2,NULL,'2019-09-02 00:45:52','2019-09-02 01:29:16'),(3,'usernom3','userprenom3',70707073,0,0,NULL,3,NULL,'2019-09-02 01:26:40','2019-09-02 06:02:15'),(4,'usernom4','userprenom4',70707074,1,1,NULL,4,NULL,'2019-09-02 01:27:06','2019-09-02 01:29:59');
/*!40000 ALTER TABLE `enrollements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
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
-- Table structure for table `famille_produits`
--

DROP TABLE IF EXISTS `famille_produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `famille_produits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nomFamilleProduits` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `users_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `famille_produits_nomfamilleproduits_unique` (`nomFamilleProduits`),
  KEY `famille_produits_users_id_foreign` (`users_id`),
  CONSTRAINT `famille_produits_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `famille_produits`
--

LOCK TABLES `famille_produits` WRITE;
/*!40000 ALTER TABLE `famille_produits` DISABLE KEYS */;
INSERT INTO `famille_produits` VALUES (1,'boissons alcolisée',1,'2019-09-03 10:43:53','2019-09-03 10:43:53',NULL),(2,'boissons non alcolisées',1,'2019-09-03 10:44:14','2019-09-03 10:44:14',NULL),(3,'eaux',1,'2019-09-03 10:44:29','2019-09-03 10:44:29',NULL),(4,'lactée',1,'2019-09-03 10:45:02','2019-09-03 10:45:17','2019-09-03 10:45:17');
/*!40000 ALTER TABLE `famille_produits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fournisseur_produits`
--

DROP TABLE IF EXISTS `fournisseur_produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fournisseur_produits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fournisseurs_id` int(10) unsigned DEFAULT NULL,
  `produits_id` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fournisseur_produits_fournisseurs_id_foreign` (`fournisseurs_id`),
  KEY `fournisseur_produits_produits_id_foreign` (`produits_id`),
  CONSTRAINT `fournisseur_produits_fournisseurs_id_foreign` FOREIGN KEY (`fournisseurs_id`) REFERENCES `fournisseurs` (`id`),
  CONSTRAINT `fournisseur_produits_produits_id_foreign` FOREIGN KEY (`produits_id`) REFERENCES `produits` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fournisseur_produits`
--

LOCK TABLES `fournisseur_produits` WRITE;
/*!40000 ALTER TABLE `fournisseur_produits` DISABLE KEYS */;
INSERT INTO `fournisseur_produits` VALUES (1,1,1,NULL,NULL,NULL),(2,1,3,NULL,NULL,NULL),(4,2,2,NULL,NULL,NULL),(5,2,4,NULL,NULL,NULL),(6,2,6,NULL,NULL,NULL),(7,1,2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `fournisseur_produits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fournisseur_telephones`
--

DROP TABLE IF EXISTS `fournisseur_telephones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fournisseur_telephones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `numeroFournisseurTelephone` int(11) NOT NULL,
  `fournisseurs_id` int(10) unsigned NOT NULL,
  `users_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fournisseur_telephones_fournisseurs_id_foreign` (`fournisseurs_id`),
  KEY `fournisseur_telephones_users_id_foreign` (`users_id`),
  CONSTRAINT `fournisseur_telephones_fournisseurs_id_foreign` FOREIGN KEY (`fournisseurs_id`) REFERENCES `fournisseurs` (`id`),
  CONSTRAINT `fournisseur_telephones_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fournisseur_telephones`
--

LOCK TABLES `fournisseur_telephones` WRITE;
/*!40000 ALTER TABLE `fournisseur_telephones` DISABLE KEYS */;
INSERT INTO `fournisseur_telephones` VALUES (3,70727170,2,1,'2019-09-03 16:51:20','2019-09-03 16:51:20'),(6,70717171,1,1,'2019-09-03 17:01:38','2019-09-03 17:01:38'),(7,72717171,1,1,'2019-09-03 17:01:38','2019-09-03 17:01:38');
/*!40000 ALTER TABLE `fournisseur_telephones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fournisseurs`
--

DROP TABLE IF EXISTS `fournisseurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fournisseurs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nomFournisseurs` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emailFournisseurs` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fournisseurs_users_id_foreign` (`users_id`),
  CONSTRAINT `fournisseurs_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fournisseurs`
--

LOCK TABLES `fournisseurs` WRITE;
/*!40000 ALTER TABLE `fournisseurs` DISABLE KEYS */;
INSERT INTO `fournisseurs` VALUES (1,'fournisseur 1','fou@four.un',1,NULL,'2019-09-03 16:50:34','2019-09-03 17:01:37'),(2,'fournisseur deux',NULL,1,NULL,'2019-09-03 16:51:20','2019-09-03 16:57:29');
/*!40000 ALTER TABLE `fournisseurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'default','{\"displayName\":\"App\\\\Notifications\\\\Stock\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":3:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:23:\\\"App\\\\Notifications\\\\Stock\\\":9:{s:32:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000details\\\";s:7:\\\"sprites\\\";s:29:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000pros\\\";i:600;s:2:\\\"id\\\";s:36:\\\"78419e02-0cda-4f81-9c3e-86433f446077\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1567803054,1567803054),(2,'default','{\"displayName\":\"App\\\\Notifications\\\\Stock\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":3:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:23:\\\"App\\\\Notifications\\\\Stock\\\":9:{s:32:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000details\\\";s:7:\\\"sprites\\\";s:29:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000pros\\\";i:600;s:2:\\\"id\\\";s:36:\\\"78419e02-0cda-4f81-9c3e-86433f446077\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1567803054,1567803054),(3,'default','{\"displayName\":\"App\\\\Notifications\\\\Stock\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":3:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:23:\\\"App\\\\Notifications\\\\Stock\\\":9:{s:32:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000details\\\";s:5:\\\"fanta\\\";s:29:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000pros\\\";i:600;s:2:\\\"id\\\";s:36:\\\"b778812a-2c2b-4c62-a91a-360d5b33c3e4\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1567803055,1567803055),(4,'default','{\"displayName\":\"App\\\\Notifications\\\\Stock\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":3:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:23:\\\"App\\\\Notifications\\\\Stock\\\":9:{s:32:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000details\\\";s:5:\\\"fanta\\\";s:29:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000pros\\\";i:600;s:2:\\\"id\\\";s:36:\\\"b778812a-2c2b-4c62-a91a-360d5b33c3e4\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1567803055,1567803055),(5,'default','{\"displayName\":\"App\\\\Notifications\\\\Stock\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":3:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:23:\\\"App\\\\Notifications\\\\Stock\\\":9:{s:32:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000details\\\";s:6:\\\"castel\\\";s:29:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000pros\\\";i:600;s:2:\\\"id\\\";s:36:\\\"5b1b472d-da65-451e-a20e-b86a48b74dce\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1567803055,1567803055),(6,'default','{\"displayName\":\"App\\\\Notifications\\\\Stock\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":3:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:23:\\\"App\\\\Notifications\\\\Stock\\\":9:{s:32:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000details\\\";s:6:\\\"castel\\\";s:29:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000pros\\\";i:600;s:2:\\\"id\\\";s:36:\\\"5b1b472d-da65-451e-a20e-b86a48b74dce\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1567803055,1567803055),(7,'default','{\"displayName\":\"App\\\\Notifications\\\\Stock\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":3:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:23:\\\"App\\\\Notifications\\\\Stock\\\":9:{s:32:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000details\\\";s:7:\\\"guiness\\\";s:29:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000pros\\\";i:600;s:2:\\\"id\\\";s:36:\\\"cb5b36db-a8c8-419a-af09-40b7a5b3fe41\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1567803056,1567803056),(8,'default','{\"displayName\":\"App\\\\Notifications\\\\Stock\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":3:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:23:\\\"App\\\\Notifications\\\\Stock\\\":9:{s:32:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000details\\\";s:7:\\\"guiness\\\";s:29:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000pros\\\";i:600;s:2:\\\"id\\\";s:36:\\\"cb5b36db-a8c8-419a-af09-40b7a5b3fe41\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1567803056,1567803056),(9,'default','{\"displayName\":\"App\\\\Notifications\\\\Stock\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":3:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:23:\\\"App\\\\Notifications\\\\Stock\\\":9:{s:32:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000details\\\";s:6:\\\"babali\\\";s:29:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000pros\\\";i:600;s:2:\\\"id\\\";s:36:\\\"0fffe64c-476f-4fd7-a4c2-8d0878c1348f\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1567803056,1567803056),(10,'default','{\"displayName\":\"App\\\\Notifications\\\\Stock\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":3:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:23:\\\"App\\\\Notifications\\\\Stock\\\":9:{s:32:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000details\\\";s:6:\\\"babali\\\";s:29:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000pros\\\";i:600;s:2:\\\"id\\\";s:36:\\\"0fffe64c-476f-4fd7-a4c2-8d0878c1348f\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1567803056,1567803056),(11,'default','{\"displayName\":\"App\\\\Notifications\\\\Stock\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":3:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:23:\\\"App\\\\Notifications\\\\Stock\\\":9:{s:32:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000details\\\";s:7:\\\"guiness\\\";s:29:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000pros\\\";i:564;s:2:\\\"id\\\";s:36:\\\"523331e0-5f89-4467-926a-866fd633a60a\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1567803170,1567803170),(12,'default','{\"displayName\":\"App\\\\Notifications\\\\Stock\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":3:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:23:\\\"App\\\\Notifications\\\\Stock\\\":9:{s:32:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000details\\\";s:7:\\\"guiness\\\";s:29:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000pros\\\";i:564;s:2:\\\"id\\\";s:36:\\\"523331e0-5f89-4467-926a-866fd633a60a\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1567803170,1567803170),(13,'default','{\"displayName\":\"App\\\\Notifications\\\\Stock\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":3:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:23:\\\"App\\\\Notifications\\\\Stock\\\":9:{s:32:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000details\\\";s:6:\\\"castel\\\";s:29:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000pros\\\";i:597;s:2:\\\"id\\\";s:36:\\\"14c1c76c-2378-4457-86da-cabf8d090106\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1567803171,1567803171),(14,'default','{\"displayName\":\"App\\\\Notifications\\\\Stock\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":3:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:23:\\\"App\\\\Notifications\\\\Stock\\\":9:{s:32:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000details\\\";s:6:\\\"castel\\\";s:29:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000pros\\\";i:597;s:2:\\\"id\\\";s:36:\\\"14c1c76c-2378-4457-86da-cabf8d090106\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1567803171,1567803171),(15,'default','{\"displayName\":\"App\\\\Notifications\\\\Stock\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":3:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:23:\\\"App\\\\Notifications\\\\Stock\\\":9:{s:32:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000details\\\";s:7:\\\"guiness\\\";s:29:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000pros\\\";i:528;s:2:\\\"id\\\";s:36:\\\"3327da7d-eed9-4d2b-ad23-57a47fdd5a4f\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1567803240,1567803240),(16,'default','{\"displayName\":\"App\\\\Notifications\\\\Stock\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":3:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:23:\\\"App\\\\Notifications\\\\Stock\\\":9:{s:32:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000details\\\";s:7:\\\"guiness\\\";s:29:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000pros\\\";i:528;s:2:\\\"id\\\";s:36:\\\"3327da7d-eed9-4d2b-ad23-57a47fdd5a4f\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1567803240,1567803240),(17,'default','{\"displayName\":\"App\\\\Notifications\\\\Stock\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":3:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:23:\\\"App\\\\Notifications\\\\Stock\\\":9:{s:32:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000details\\\";s:5:\\\"fanta\\\";s:29:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000pros\\\";i:552;s:2:\\\"id\\\";s:36:\\\"b5dfb15c-9bcc-49dd-bedf-3cb30181d653\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1567803241,1567803241),(18,'default','{\"displayName\":\"App\\\\Notifications\\\\Stock\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":3:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:23:\\\"App\\\\Notifications\\\\Stock\\\":9:{s:32:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000details\\\";s:5:\\\"fanta\\\";s:29:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000pros\\\";i:552;s:2:\\\"id\\\";s:36:\\\"b5dfb15c-9bcc-49dd-bedf-3cb30181d653\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1567803241,1567803241),(19,'default','{\"displayName\":\"App\\\\Notifications\\\\Stock\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":3:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:23:\\\"App\\\\Notifications\\\\Stock\\\":9:{s:32:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000details\\\";s:6:\\\"babali\\\";s:29:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000pros\\\";i:540;s:2:\\\"id\\\";s:36:\\\"08c12ecf-8b25-4a38-95e8-00143d272de5\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1567803241,1567803241),(20,'default','{\"displayName\":\"App\\\\Notifications\\\\Stock\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":9:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":3:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:23:\\\"App\\\\Notifications\\\\Stock\\\":9:{s:32:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000details\\\";s:6:\\\"babali\\\";s:29:\\\"\\u0000App\\\\Notifications\\\\Stock\\u0000pros\\\";i:540;s:2:\\\"id\\\";s:36:\\\"08c12ecf-8b25-4a38-95e8-00143d272de5\\\";s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1567803241,1567803241);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marque_produits`
--

DROP TABLE IF EXISTS `marque_produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marque_produits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nomMarqueProduits` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `users_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `marque_produits_nommarqueproduits_unique` (`nomMarqueProduits`),
  KEY `marque_produits_users_id_foreign` (`users_id`),
  CONSTRAINT `marque_produits_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marque_produits`
--

LOCK TABLES `marque_produits` WRITE;
/*!40000 ALTER TABLE `marque_produits` DISABLE KEYS */;
INSERT INTO `marque_produits` VALUES (1,'pleisners',1,'2019-09-03 10:23:49','2019-09-03 10:24:08',NULL),(2,'vichy',1,'2019-09-03 10:26:37','2019-09-03 10:35:20',NULL),(3,'sodibo',1,'2019-09-03 10:36:19','2019-09-03 10:36:19',NULL);
/*!40000 ALTER TABLE `marque_produits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_08_08_223813_create_audits_table',1),(2,'2014_08_12_100000_create_password_resets_table',1),(3,'2019_06_02_041445_create_postes_table',1),(4,'2019_06_02_041603_create_enrollements_table',1),(5,'2019_06_02_050000_create_users_table',1),(6,'2019_06_02_122525_create_marque_produits_table',1),(7,'2019_06_27_110153_create_famille_produits_table',1),(8,'2019_06_27_112053_create_produits_table',1),(9,'2019_07_04_093613_create_type_clients_table',1),(10,'2019_07_04_094338_create_clients_table',1),(11,'2019_07_04_230200_create_fournisseurs_table',1),(12,'2019_07_05_092533_create_fournisseur_telephones_table',1),(13,'2019_07_05_092841_create_fournisseur_produits_table',1),(14,'2019_07_07_223040_create_remises_table',1),(15,'2019_07_07_223040_create_ventes_table',1),(16,'2019_07_07_223041_create_approvissionnements_table',1),(17,'2019_07_07_223041_create_produit_ventes_table',1),(18,'2019_07_07_223130_create_approvissionnement_fournisseur_produits_table',1),(19,'2019_07_08_151745_create_dons_table',1),(20,'2019_07_08_151823_create_don_produits_table',1),(21,'2019_07_08_210332_create_rebuts_table',1),(22,'2019_07_08_223316_create_stocks_table',1),(23,'2019_07_20_100527_create_versements_table',1),(24,'2019_07_20_113453_create_caisses_table',1),(25,'2019_07_20_113529_create_client_comptes_table',1),(26,'2019_07_22_102706_create_devis_table',1),(27,'2019_07_22_103515_create_devi_produits_table',1),(28,'2019_07_23_092016_create_cloture_journees_table',1),(29,'2019_07_26_141034_create_ajustements_table',1),(30,'2019_08_26_171702_create_jobs_table',1),(31,'2019_08_27_001725_create_notifications_table',1),(32,'2019_08_27_111610_create_failed_jobs_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) unsigned NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
-- Table structure for table `postes`
--

DROP TABLE IF EXISTS `postes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designationPostes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postes`
--

LOCK TABLES `postes` WRITE;
/*!40000 ALTER TABLE `postes` DISABLE KEYS */;
INSERT INTO `postes` VALUES (1,'chauffeur',NULL,'2019-09-02 00:34:28','2019-09-02 00:40:37'),(2,'caissier',NULL,'2019-09-02 00:34:43','2019-09-02 01:18:08'),(3,'comptable',NULL,'2019-09-02 00:34:55','2019-09-02 00:34:55'),(4,'magasinier',NULL,'2019-09-02 00:35:02','2019-09-02 01:18:01');
/*!40000 ALTER TABLE `postes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit_ventes`
--

DROP TABLE IF EXISTS `produit_ventes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produit_ventes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prixUnitaireProduitVentes` int(11) NOT NULL,
  `quantiteProduitVentes` int(11) NOT NULL,
  `prixTotalProduitVentes` int(11) NOT NULL,
  `conditionnement` int(11) NOT NULL COMMENT '12 pack ,6 demi pack ,1 bouteille',
  `users_id` int(10) unsigned NOT NULL,
  `produits_id` int(10) unsigned NOT NULL,
  `ventes_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produit_ventes_users_id_foreign` (`users_id`),
  KEY `produit_ventes_produits_id_foreign` (`produits_id`),
  KEY `produit_ventes_ventes_id_foreign` (`ventes_id`),
  CONSTRAINT `produit_ventes_produits_id_foreign` FOREIGN KEY (`produits_id`) REFERENCES `produits` (`id`),
  CONSTRAINT `produit_ventes_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `produit_ventes_ventes_id_foreign` FOREIGN KEY (`ventes_id`) REFERENCES `ventes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit_ventes`
--

LOCK TABLES `produit_ventes` WRITE;
/*!40000 ALTER TABLE `produit_ventes` DISABLE KEYS */;
INSERT INTO `produit_ventes` VALUES (1,1300,3,3900,12,1,4,1,NULL,'2019-09-06 20:52:50','2019-09-06 20:52:50'),(2,3500,3,10500,1,1,3,1,NULL,'2019-09-06 20:52:51','2019-09-06 20:52:51'),(3,4500,3,13500,12,1,4,2,NULL,'2019-09-06 20:54:00','2019-09-06 20:54:00'),(4,3500,4,14000,12,1,2,2,NULL,'2019-09-06 20:54:00','2019-09-06 20:54:00'),(5,3500,5,17500,12,1,6,2,NULL,'2019-09-06 20:54:01','2019-09-06 20:54:01');
/*!40000 ALTER TABLE `produit_ventes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produits`
--

DROP TABLE IF EXISTS `produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designationProduits` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seuilAlerte` int(11) NOT NULL,
  `famille_produits_id` int(10) unsigned NOT NULL,
  `users_id` int(10) unsigned NOT NULL,
  `marque_produits_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `produits_designationproduits_unique` (`designationProduits`),
  KEY `produits_famille_produits_id_foreign` (`famille_produits_id`),
  KEY `produits_users_id_foreign` (`users_id`),
  KEY `produits_marque_produits_id_foreign` (`marque_produits_id`),
  CONSTRAINT `produits_famille_produits_id_foreign` FOREIGN KEY (`famille_produits_id`) REFERENCES `famille_produits` (`id`),
  CONSTRAINT `produits_marque_produits_id_foreign` FOREIGN KEY (`marque_produits_id`) REFERENCES `marque_produits` (`id`),
  CONSTRAINT `produits_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produits`
--

LOCK TABLES `produits` WRITE;
/*!40000 ALTER TABLE `produits` DISABLE KEYS */;
INSERT INTO `produits` VALUES (1,'sprites',1201,2,1,3,'2019-09-03 10:46:27','2019-09-03 10:54:54',NULL),(2,'fanta',1500,2,1,3,'2019-09-03 10:47:21','2019-09-03 10:47:21',NULL),(3,'castel',1700,2,1,1,'2019-09-03 10:48:16','2019-09-03 10:48:16',NULL),(4,'guiness',1800,1,1,1,'2019-09-03 10:48:51','2019-09-03 10:48:51',NULL),(5,'lafi',700,3,1,2,'2019-09-03 10:49:20','2019-09-03 10:49:20',NULL),(6,'babali',850,3,1,2,'2019-09-03 10:49:45','2019-09-03 10:49:45',NULL);
/*!40000 ALTER TABLE `produits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rebuts`
--

DROP TABLE IF EXISTS `rebuts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rebuts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifiantVentes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conditionnementRebuts` int(11) NOT NULL,
  `quantiteRebuts` int(11) NOT NULL,
  `users_id` int(10) unsigned DEFAULT NULL,
  `produits_id` int(10) unsigned NOT NULL,
  `Ventes_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rebuts_users_id_foreign` (`users_id`),
  KEY `rebuts_produits_id_foreign` (`produits_id`),
  KEY `rebuts_ventes_id_foreign` (`Ventes_id`),
  CONSTRAINT `rebuts_produits_id_foreign` FOREIGN KEY (`produits_id`) REFERENCES `produits` (`id`),
  CONSTRAINT `rebuts_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `rebuts_ventes_id_foreign` FOREIGN KEY (`Ventes_id`) REFERENCES `ventes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rebuts`
--

LOCK TABLES `rebuts` WRITE;
/*!40000 ALTER TABLE `rebuts` DISABLE KEYS */;
/*!40000 ALTER TABLE `rebuts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remises`
--

DROP TABLE IF EXISTS `remises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remises` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designationRemises` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pourcentageRemises` int(11) NOT NULL,
  `minimumAchatRemises` int(11) NOT NULL,
  `maximumAchatRemises` int(11) NOT NULL,
  `typeRemises` int(11) NOT NULL COMMENT '0 appli sur l montant,1 sur l nb achat ',
  `users_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `remises_users_id_foreign` (`users_id`),
  CONSTRAINT `remises_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remises`
--

LOCK TABLES `remises` WRITE;
/*!40000 ALTER TABLE `remises` DISABLE KEYS */;
/*!40000 ALTER TABLE `remises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stocks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantiteAnterieur` int(11) NOT NULL,
  `quantiteActuel` int(11) NOT NULL,
  `variationQuantite` int(11) NOT NULL,
  `quantitePhysique` int(11) DEFAULT NULL,
  `dateApprovissionnement` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `produits_id` int(10) unsigned NOT NULL,
  `users_id` int(10) unsigned NOT NULL,
  `approvissionnements_id` int(10) unsigned DEFAULT NULL,
  `rebuts_id` int(10) unsigned DEFAULT NULL,
  `dons_id` int(10) unsigned DEFAULT NULL,
  `ventes_id` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stocks_produits_id_foreign` (`produits_id`),
  KEY `stocks_users_id_foreign` (`users_id`),
  KEY `stocks_approvissionnements_id_foreign` (`approvissionnements_id`),
  KEY `stocks_rebuts_id_foreign` (`rebuts_id`),
  KEY `stocks_dons_id_foreign` (`dons_id`),
  KEY `stocks_ventes_id_foreign` (`ventes_id`),
  CONSTRAINT `stocks_approvissionnements_id_foreign` FOREIGN KEY (`approvissionnements_id`) REFERENCES `approvissionnements` (`id`),
  CONSTRAINT `stocks_dons_id_foreign` FOREIGN KEY (`dons_id`) REFERENCES `dons` (`id`),
  CONSTRAINT `stocks_produits_id_foreign` FOREIGN KEY (`produits_id`) REFERENCES `produits` (`id`),
  CONSTRAINT `stocks_rebuts_id_foreign` FOREIGN KEY (`rebuts_id`) REFERENCES `rebuts` (`id`),
  CONSTRAINT `stocks_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `stocks_ventes_id_foreign` FOREIGN KEY (`ventes_id`) REFERENCES `ventes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
INSERT INTO `stocks` VALUES (1,0,600,600,NULL,'2019-09-06 20:50:54',1,1,1,NULL,NULL,NULL,NULL,'2019-09-06 20:50:54','2019-09-06 20:50:54'),(2,0,600,600,NULL,'2019-09-06 20:50:55',2,1,1,NULL,NULL,NULL,NULL,'2019-09-06 20:50:55','2019-09-06 20:50:55'),(3,0,600,600,NULL,'2019-09-06 20:50:55',3,1,1,NULL,NULL,NULL,NULL,'2019-09-06 20:50:55','2019-09-06 20:50:55'),(4,0,600,600,NULL,'2019-09-06 20:50:56',4,1,1,NULL,NULL,NULL,NULL,'2019-09-06 20:50:56','2019-09-06 20:50:56'),(5,0,600,600,NULL,'2019-09-06 20:50:56',6,1,1,NULL,NULL,NULL,NULL,'2019-09-06 20:50:56','2019-09-06 20:50:56'),(6,600,564,36,NULL,'2019-09-06 20:52:50',4,1,NULL,NULL,NULL,1,NULL,'2019-09-06 20:52:50','2019-09-06 20:52:50'),(7,600,597,3,NULL,'2019-09-06 20:52:51',3,1,NULL,NULL,NULL,1,NULL,'2019-09-06 20:52:51','2019-09-06 20:52:51'),(8,564,528,36,NULL,'2019-09-06 20:54:00',4,1,NULL,NULL,NULL,2,NULL,'2019-09-06 20:54:00','2019-09-06 20:54:00'),(9,600,552,48,NULL,'2019-09-06 20:54:01',2,1,NULL,NULL,NULL,2,NULL,'2019-09-06 20:54:01','2019-09-06 20:54:01'),(10,600,540,60,NULL,'2019-09-06 20:54:01',6,1,NULL,NULL,NULL,2,NULL,'2019-09-06 20:54:01','2019-09-06 20:54:01');
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `droit` int(11) NOT NULL COMMENT '1 ajout , 2 modif , 4 desactiver',
  `autorisation` int(11) NOT NULL,
  `statut` int(11) NOT NULL DEFAULT '0' COMMENT '0 pour actif , 1 pour inactif',
  `enrolle_id` int(10) unsigned NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`),
  KEY `users_enrolle_id_foreign` (`enrolle_id`),
  CONSTRAINT `users_enrolle_id_foreign` FOREIGN KEY (`enrolle_id`) REFERENCES `enrollements` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'username1','bb@bb.b1','$2y$10$CljyN.iQNe24s12YLLSVBOlQuP8kdezBPITw12i7WvH7lsx6RD8kq',7,3,0,1,NULL,'2019-09-02 01:28:25','2019-09-02 01:28:25',NULL),(2,'username2','bb@bb.b2','$2y$10$rliDH.FpWm0y1MxIwfnemu7S0K3DSMe4dhSonqtvo5/ovJQbdNOuq',3,2,0,2,NULL,'2019-09-02 01:29:16','2019-09-02 01:29:16',NULL),(3,'username3','bb@bb.b3','$2y$10$xOYxpSjsm/ji60dkgmqQEuTAlh4ZXph/5lLl6g646cmdKbPEPo3jW',1,2,0,3,NULL,'2019-09-02 01:29:37','2019-09-02 06:16:15',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventes`
--

DROP TABLE IF EXISTS `ventes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifiantVentes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateVentes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomClients` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sommePayer` int(11) NOT NULL COMMENT 'montant facture avec la remise si y en a',
  `sommeAPayer` int(11) NOT NULL,
  `sommeRestante` int(11) NOT NULL,
  `infoVersement` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'info sur le versement ,tel id virement bancaire',
  `versement` int(11) NOT NULL COMMENT 'entre cash , check, virement banquaire',
  `montantVente` int(11) NOT NULL COMMENT 'montant facture sans la remise',
  `users_id` int(10) unsigned NOT NULL,
  `remises_id` int(10) unsigned DEFAULT NULL,
  `client_types_id` int(10) unsigned NOT NULL,
  `clients_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ventes_identifiantventes_unique` (`identifiantVentes`),
  KEY `ventes_users_id_foreign` (`users_id`),
  KEY `ventes_remises_id_foreign` (`remises_id`),
  KEY `ventes_client_types_id_foreign` (`client_types_id`),
  KEY `ventes_clients_id_foreign` (`clients_id`),
  CONSTRAINT `ventes_client_types_id_foreign` FOREIGN KEY (`client_types_id`) REFERENCES `client_types` (`id`),
  CONSTRAINT `ventes_clients_id_foreign` FOREIGN KEY (`clients_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `ventes_remises_id_foreign` FOREIGN KEY (`remises_id`) REFERENCES `remises` (`id`),
  CONSTRAINT `ventes_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventes`
--

LOCK TABLES `ventes` WRITE;
/*!40000 ALTER TABLE `ventes` DISABLE KEYS */;
INSERT INTO `ventes` VALUES (1,'Vte/06/09/19/1','2019-09-06 20:52:50','client un ( 70707070 )',14400,14400,0,NULL,1,14400,1,NULL,2,1,'2019-09-06 20:52:50','2019-09-06 20:52:50',NULL),(2,'Vte/06/09/19/2','2019-09-06 20:54:00','client un ( 70707070 )',45000,45000,0,NULL,1,45000,1,NULL,2,1,'2019-09-06 20:54:00','2019-09-06 20:54:00',NULL);
/*!40000 ALTER TABLE `ventes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versements`
--

DROP TABLE IF EXISTS `versements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `montantVersement` int(11) NOT NULL,
  `dateVersements` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `typeVersements_id` int(11) NOT NULL,
  `infoVerseur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clients_id` int(10) unsigned DEFAULT NULL,
  `users_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `versements_clients_id_foreign` (`clients_id`),
  KEY `versements_users_id_foreign` (`users_id`),
  CONSTRAINT `versements_clients_id_foreign` FOREIGN KEY (`clients_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `versements_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versements`
--

LOCK TABLES `versements` WRITE;
/*!40000 ALTER TABLE `versements` DISABLE KEYS */;
/*!40000 ALTER TABLE `versements` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-06 20:54:07
