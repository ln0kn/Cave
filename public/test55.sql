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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approvissionnement_produits`
--

LOCK TABLES `approvissionnement_produits` WRITE;
/*!40000 ALTER TABLE `approvissionnement_produits` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approvissionnements`
--

LOCK TABLES `approvissionnements` WRITE;
/*!40000 ALTER TABLE `approvissionnements` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audits`
--

LOCK TABLES `audits` WRITE;
/*!40000 ALTER TABLE `audits` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caisses`
--

LOCK TABLES `caisses` WRITE;
/*!40000 ALTER TABLE `caisses` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_comptes`
--

LOCK TABLES `client_comptes` WRITE;
/*!40000 ALTER TABLE `client_comptes` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
INSERT INTO `enrollements` VALUES (1,'usernom1','userprenom1',70707071,0,1,NULL,1,NULL,'2019-09-02 00:43:36','2019-09-02 01:28:25'),(2,'usernom2','userprenom2',70707070,1,1,NULL,2,NULL,'2019-09-02 00:45:52','2019-09-02 01:29:16'),(3,'usernom3','userprenom3',70707073,0,1,NULL,3,NULL,'2019-09-02 01:26:40','2019-10-02 16:09:37'),(4,'usernom4','userprenom4',70707074,1,1,NULL,4,NULL,'2019-09-02 01:27:06','2019-09-02 01:29:59');
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
INSERT INTO `famille_produits` VALUES (1,'boissons alcolisée',1,'2019-09-03 10:43:53','2019-09-03 10:43:53',NULL),(2,'boissons non alcolisées',1,'2019-09-03 10:44:14','2019-09-03 10:44:14',NULL),(3,'eaux',1,'2019-09-03 10:44:29','2019-09-03 10:44:29',NULL),(4,'lactée',1,'2019-09-03 10:45:02','2019-09-10 18:10:27',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marque_produits`
--

LOCK TABLES `marque_produits` WRITE;
/*!40000 ALTER TABLE `marque_produits` DISABLE KEYS */;
INSERT INTO `marque_produits` VALUES (1,'pleisners',1,'2019-09-03 10:23:49','2019-09-03 10:24:08',NULL),(2,'vichy',1,'2019-09-03 10:26:37','2019-09-03 10:35:20',NULL),(3,'sodibo',1,'2019-09-03 10:36:19','2019-09-03 10:36:19',NULL),(4,'firsty',1,'2019-10-02 09:34:43','2019-10-02 09:34:43',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit_ventes`
--

LOCK TABLES `produit_ventes` WRITE;
/*!40000 ALTER TABLE `produit_ventes` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remises`
--

LOCK TABLES `remises` WRITE;
/*!40000 ALTER TABLE `remises` DISABLE KEYS */;
INSERT INTO `remises` VALUES (1,'pr',5,10000,20000,0,1,NULL,'2019-10-03 09:47:53','2019-10-03 09:53:44'),(2,'prrr',10,1,3,1,1,NULL,'2019-10-03 21:11:47','2019-10-03 21:11:47');
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'username1','bb@bb.b1','$2y$10$CljyN.iQNe24s12YLLSVBOlQuP8kdezBPITw12i7WvH7lsx6RD8kq',7,3,0,1,'B31ri179pdLvcG1xmDXzpp5sKmYMKdTItElh5UJtJpPgiAe1jXFKDq2ZiEhS','2019-09-02 01:28:25','2019-09-02 01:28:25',NULL),(2,'username2','bb@bb.b2','$2y$10$rliDH.FpWm0y1MxIwfnemu7S0K3DSMe4dhSonqtvo5/ovJQbdNOuq',3,2,0,2,NULL,'2019-09-02 01:29:16','2019-09-02 01:29:16',NULL),(3,'username3','bb@bb.b3','$2y$10$xOYxpSjsm/ji60dkgmqQEuTAlh4ZXph/5lLl6g646cmdKbPEPo3jW',1,2,0,3,'LNjmfT3CFf8dXXO0O239R3QDOpnobmqjehgOP95trUCspwvmprqsWri0X5Gs','2019-09-02 01:29:37','2019-09-10 09:58:59',NULL),(4,'personnel','bbb@bbb.com','$2y$10$fcbO2dnC6a7JB5v7CAF/XOEuI.48GnuQpZ.P0xuOL5mFmZxOYZhuq',3,2,0,3,NULL,'2019-10-02 16:09:37','2019-10-02 16:09:37',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventes`
--

LOCK TABLES `ventes` WRITE;
/*!40000 ALTER TABLE `ventes` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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

-- Dump completed on 2019-10-18 14:45:46
