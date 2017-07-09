CREATE DATABASE  IF NOT EXISTS `springmvcproducts` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `springmvcproducts`;
-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: springmvcproducts
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

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
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorie` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES (1,'Books','created  by script',1),(2,'Books','created  by script',1),(3,'Beauty','created  by script',1),(4,'Business Products (B2B)','created  by script',1),(5,'Clothing & Accessories','created  by script',1),(6,'Collectible Coins','created  by script',1),(7,'Electronics (Accessories)','created  by script',1),(8,'Electronics (Consumer)','created  by script',1),(9,'Fine Art','created  by script',1),(10,'Grocery & Gourmet Food','created  by script',1),(11,'Handmade','created  by script',1);
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  `idCategorie` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CategorieProduct` (`idCategorie`),
  CONSTRAINT `FK_CategorieProduct` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (3,'Product 01','created by script',0,10.55,3),(4,'Product 02','created by script',0,10.55,4),(5,'Product 03','created by script',0,10.55,4),(6,'Product 04','created by script',0,10.55,3),(7,'Product 05','created by script',0,10.55,4),(8,'Product 06','created by script',0,10.55,3),(9,'Product 07','created by script',0,10.55,3),(10,'Product 08','created by script',0,10.55,3),(11,'Product 09','created by script',0,10.55,3),(12,'Product 10','created by script',1,10.55,3),(13,'Product 11','created by script',1,10.55,3),(14,'Product 12','created by script',1,10.55,3),(15,'Product 13','created by script',1,10.55,3),(16,'Product 14','created by script',1,10.55,3),(17,'Product 15','created by script',1,10.55,3),(18,'Product 16','created by script',1,10.55,3),(19,'Product 17','created by script',1,10.55,3),(20,'Product 19','created by script',1,10.55,3);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-09 13:51:18
