CREATE DATABASE  IF NOT EXISTS `musify` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `musify`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: musify
-- ------------------------------------------------------
-- Server version	5.1.53-community-log

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `custid` int(11) NOT NULL,
  `lastname` varchar(10) NOT NULL,
  `firstname` varchar(10) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(16) NOT NULL,
  `age` tinyint(100) NOT NULL DEFAULT '18',
  `email` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `cust_status` enum('active','deactivate','pending') NOT NULL,
  PRIMARY KEY (`custid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Dela Druz','Juan','ako','ako',19,'ako@mail.com','09187567955','active'),(2,'Cruz','Migs','ikaw','ikaw',20,'ikaw@mail.com','09876125621','active'),(3,'Idos','Alec','alec','alec',18,'alec@gmail.com','09123546378','active'),(4,'Taasin','Jargon','dragon','dragon',18,'jargon@gmail.com','09696969698','pending');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `package` (
  `pack_id` int(11) NOT NULL AUTO_INCREMENT,
  `pack_name` varchar(45) NOT NULL,
  `pack_desc` varchar(900) NOT NULL,
  `pack_item` varchar(900) NOT NULL,
  `price` int(11) NOT NULL,
  `pack_status` enum('available','unavailable') NOT NULL,
  `comp_name` varchar(45) NOT NULL,
  PRIMARY KEY (`pack_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (13,'Multi-participant Meeting Style Sound Package','A package service that has more participants that promote different things to work on.The package gives microphone and soft speakers that will allow the people within the committee to communicate well and do things right.','(10) delegate microphone consoles (additional microphones can be added as needed)\r\n(1) delegate microphone base unit\r\n(1) moderator microphone console\r\n(2) speakers incorporates mixer and graphic EQ accommodates up to 100 people all required cabling and accessories onsite audio technician delivery, set-up & strike.',8000,'available','Songnify'),(14,'Panel Discussion Sound Package','Panel Discussion Package support produce effectively good sounds in the speakers from the participants, reproducing individual sounds not just around the listener, but inside the room, outside the room and overhead in any direction, placing acoustic objects accurately in three-dimensional space.','(2) speakers on stands\r\n(1) moderator microphone (wired or wireless handheld / lapel)\r\n(1) audience Q&A microphone\r\n(2-5) lapel or tabletop microphones for panel all required cabling delivery, set-up & strike on-site audio technician',6000,'available','Songnify'),(15,'Press Conferences Sound Package','Providing an equipment good for a press conference that gives good quality of sound with in a place or for announcement in a work and support many specifications in terms of its event.','Microphone (wireless lapel, handheld, or podium mounted), Sound system for amplification to group of up to 250\r\nPress box mult-box (enables direct audio patch by media into sound system), Podium All required cabling, Onsite technician support - Delivery, Setup and strike',7500,'available','Songnify'),(16,'Package NEW','wala lang','walang wala talaga',9999,'available','Songnify');
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider` (
  `comp_name` varchar(40) NOT NULL,
  `comp_username` varchar(16) NOT NULL,
  `comp_pass` varchar(16) NOT NULL,
  `comp_cn` varchar(15) NOT NULL,
  `comp_ea` varchar(30) NOT NULL,
  `comp_addr` varchar(100) NOT NULL,
  `comp_status` enum('active','deactivate','pending') NOT NULL,
  PRIMARY KEY (`comp_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES ('Songnify','songnify','songnify','09197656765','songnify@yahoo.com','Lower Session Road, Baguio City','active'),('Meister','meister','meister','09129878987','mester@yahoo.com','Upper Session Road, Baguio City','active'),('Mine','mine','mine','09212521163','mine@gmail.com','Upper Bonifacio Road, Baguio City','pending'),('Alec\'s Company','alec','alec','0912321312','alec@gmail.com','Sa Bundok','pending');
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentals`
--

DROP TABLE IF EXISTS `rentals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rentals` (
  `lastname` varchar(45) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `rent_time` varchar(45) NOT NULL,
  `rent_startdate` date NOT NULL,
  `rent_enddate` date NOT NULL,
  `pack_name` varchar(45) NOT NULL,
  `comp_name` varchar(45) NOT NULL,
  `rent_status` enum('pending','accepted','declined','canceled','paid','done') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentals`
--

LOCK TABLES `rentals` WRITE;
/*!40000 ALTER TABLE `rentals` DISABLE KEYS */;
INSERT INTO `rentals` VALUES ('Idos','Alec','Lower Bonifacio Road Baguio City','4:00 PM','2018-05-01','2018-05-03','Multi-participant Meeting Style Sound Package','Songnify','accepted'),('Dela Cruz','Juan','Lower Bonifacio Road Baguio City','4:00 PM','2018-05-14','2018-05-16','Panel Discussion Package support produce effe','Songnify','pending'),('Dela Cruz','Juan','Lower Bonifacio Road Baguio City','8:00 AM','2018-04-02','2018-04-06','Multi-participant Meeting Style Sound Package','Songnify','canceled'),('Dela Cruz','Juan','Lower Bonifacio Road Baguio City','9:00 AM','2018-03-01','2018-03-05','Multi-participant Meeting Style Sound Package','Songnify','done'),('Cruz','Migs','Camp 7 Montecillo, Baguio City ','8:00 AM','2018-05-22','2018-05-24','Press Conferences Sound Package','Songnify','paid');
/*!40000 ALTER TABLE `rentals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'musify'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-22 18:13:24
