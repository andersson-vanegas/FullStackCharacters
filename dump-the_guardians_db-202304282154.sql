-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: the_guardians_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.24-MariaDB

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
-- Table structure for table `battle`
--

DROP TABLE IF EXISTS `battle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `battle` (
  `battle_id` int(11) NOT NULL,
  `date_battle` date NOT NULL,
  `site` varchar(255) NOT NULL,
  `team_winner` varchar(255) NOT NULL,
  PRIMARY KEY (`battle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_teams`
--

DROP TABLE IF EXISTS `battle_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `battle_teams` (
  `battle_teams_id` int(11) NOT NULL,
  `battle_id` int(11) NOT NULL,
  `character_id` int(11) NOT NULL,
  `team` varchar(255) NOT NULL,
  PRIMARY KEY (`battle_teams_id`),
  KEY `battle_teams_FK` (`battle_id`),
  KEY `battle_teams_FK_1` (`character_id`),
  CONSTRAINT `battle_teams_FK` FOREIGN KEY (`battle_id`) REFERENCES `battle` (`battle_id`),
  CONSTRAINT `battle_teams_FK_1` FOREIGN KEY (`character_id`) REFERENCES `characters` (`character_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_personal_relationships`
--

DROP TABLE IF EXISTS `character_personal_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_personal_relationships` (
  `character_id_primary` int(11) NOT NULL,
  `character_id_secundary` int(11) NOT NULL,
  PRIMARY KEY (`character_id_primary`,`character_id_secundary`),
  KEY `character_personal_relationships_FK_1` (`character_id_secundary`),
  CONSTRAINT `character_personal_relationships_FK` FOREIGN KEY (`character_id_primary`) REFERENCES `characters` (`character_id`),
  CONSTRAINT `character_personal_relationships_FK_1` FOREIGN KEY (`character_id_secundary`) REFERENCES `characters` (`character_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_types`
--

DROP TABLE IF EXISTS `character_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_types` (
  `character_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`character_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `character_weaknesses`
--

DROP TABLE IF EXISTS `character_weaknesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_weaknesses` (
  `character_id` int(11) NOT NULL,
  `weakness_id` int(11) NOT NULL,
  PRIMARY KEY (`character_id`,`weakness_id`),
  KEY `character_weaknesses_FK` (`weakness_id`),
  CONSTRAINT `character_weaknesses_FK` FOREIGN KEY (`weakness_id`) REFERENCES `weakness` (`weakness_id`),
  CONSTRAINT `character_weaknesses_FK_1` FOREIGN KEY (`character_id`) REFERENCES `characters` (`character_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characters` (
  `character_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `alias` varchar(100) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `planet_id` int(11) NOT NULL,
  `date_of_dead` date DEFAULT NULL,
  `is_student` tinyint(1) NOT NULL,
  `character_type_id` int(11) NOT NULL,
  `is_guardians` tinyint(1) NOT NULL,
  PRIMARY KEY (`character_id`),
  KEY `characters_FK` (`planet_id`),
  KEY `characters_FK_1` (`character_type_id`),
  CONSTRAINT `characters_FK` FOREIGN KEY (`planet_id`) REFERENCES `planets` (`planet_id`),
  CONSTRAINT `characters_FK_1` FOREIGN KEY (`character_type_id`) REFERENCES `character_types` (`character_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `characters_skills`
--

DROP TABLE IF EXISTS `characters_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characters_skills` (
  `character_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  PRIMARY KEY (`character_id`,`skill_id`),
  KEY `characters_skills_FK` (`skill_id`),
  CONSTRAINT `characters_skills_FK` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`),
  CONSTRAINT `characters_skills_FK_1` FOREIGN KEY (`character_id`) REFERENCES `characters` (`character_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `characters_sponsors`
--

DROP TABLE IF EXISTS `characters_sponsors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characters_sponsors` (
  `character_id` int(11) NOT NULL,
  `sponsor_id` int(11) NOT NULL,
  `amount_money` double NOT NULL,
  PRIMARY KEY (`character_id`,`sponsor_id`),
  KEY `characters_sponsors_FK` (`sponsor_id`),
  CONSTRAINT `characters_sponsors_FK` FOREIGN KEY (`sponsor_id`) REFERENCES `sponsors` (`sponsor_id`),
  CONSTRAINT `characters_sponsors_FK_1` FOREIGN KEY (`character_id`) REFERENCES `characters` (`character_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `planets`
--

DROP TABLE IF EXISTS `planets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planets` (
  `planet_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`planet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `skill_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sponsors`
--

DROP TABLE IF EXISTS `sponsors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sponsors` (
  `sponsor_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money_origin` float NOT NULL,
  `is_reliable` tinyint(1) NOT NULL,
  PRIMARY KEY (`sponsor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `weakness`
--

DROP TABLE IF EXISTS `weakness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weakness` (
  `weakness_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`weakness_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'the_guardians_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-28 21:54:02
