-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: axedrez
-- ------------------------------------------------------
-- Server version	8.0.22

CREATE DATABASE  IF NOT EXISTS `axedrez` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `axedrez`;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `direccion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `telefono` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`),
  CONSTRAINT `chk_hotel_nombre` CHECK ((char_length(`nome`) >= 3)),
  CONSTRAINT `chk_hotel_telefono` CHECK ((`telefono` between 100000000 and 999999999))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (4,'Hotel El dormilón','C/ del Dormilón nº1',912323982),(5,'Hotel Las Lagunas','C/ de las Lagunas Nº2',932323987),(6,'Hotel O Peregrino','C/ del Peregrino Nº3',981243276),(7,'Hotel A Ría','C/ de la Ría Nº4',986454321);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_participante`
--

DROP TABLE IF EXISTS `hotel_participante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel_participante` (
  `id_hotel` int NOT NULL,
  `id_participante` int NOT NULL,
  `f_entrada` date NOT NULL,
  `f_saida` date DEFAULT NULL,
  PRIMARY KEY (`id_hotel`,`id_participante`,`f_entrada`),
  KEY `fk_hotelparticip_participante_idx` (`id_participante`),
  CONSTRAINT `fk_hotelparticip_hotel` FOREIGN KEY (`id_hotel`) REFERENCES `hotel` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_hotelparticip_participante` FOREIGN KEY (`id_participante`) REFERENCES `participante` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `chk_datainicio` CHECK ((`f_saida` > `f_entrada`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_participante`
--

LOCK TABLES `hotel_participante` WRITE;
/*!40000 ALTER TABLE `hotel_participante` DISABLE KEYS */;
INSERT INTO `hotel_participante` VALUES (4,7,'2000-01-01','2000-07-01'),(4,8,'2000-01-01','2000-06-01'),(4,9,'2000-01-01','2000-07-01'),(4,11,'2021-03-02',NULL),(4,15,'2021-03-02',NULL),(4,17,'2021-02-01',NULL),(4,18,'2021-02-01',NULL),(5,7,'2002-02-02','2002-09-02'),(5,8,'2002-02-02','2002-08-02'),(5,10,'2002-03-02','2002-09-02'),(5,17,'2001-03-01','2001-03-07'),(6,7,'2004-04-04','2004-09-04'),(6,11,'2004-04-04','2004-10-04'),(7,7,'2021-01-01',NULL),(7,8,'2021-01-01',NULL),(7,13,'2021-01-01',NULL),(7,16,'2021-03-01',NULL);
/*!40000 ALTER TABLE `hotel_participante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugador_partida`
--

DROP TABLE IF EXISTS `jugador_partida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugador_partida` (
  `id_partida` int NOT NULL,
  `id_participante` int NOT NULL,
  `color` enum('blanca','negra') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT 'blanca',
  PRIMARY KEY (`id_partida`,`id_participante`),
  KEY `fk_partida_has_participante_participante1_idx` (`id_participante`),
  KEY `fk_partida_has_participante_partida1_idx` (`id_partida`),
  CONSTRAINT `fk_partida_has_participante_participante1` FOREIGN KEY (`id_participante`) REFERENCES `participante` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_partida_has_participante_partida1` FOREIGN KEY (`id_partida`) REFERENCES `partida` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugador_partida`
--

LOCK TABLES `jugador_partida` WRITE;
/*!40000 ALTER TABLE `jugador_partida` DISABLE KEYS */;
INSERT INTO `jugador_partida` VALUES (1,7,'blanca'),(1,8,'negra'),(3,7,'negra'),(3,15,'blanca');
/*!40000 ALTER TABLE `jugador_partida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimiento`
--

DROP TABLE IF EXISTS `movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimiento` (
  `id_partida` int NOT NULL,
  `id_mov` tinyint NOT NULL,
  `movimiento` tinyint NOT NULL,
  `comentario` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `jugada` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id_partida`,`id_mov`),
  KEY `fk_movimiento_partida1_idx` (`id_partida`),
  CONSTRAINT `fk_movimiento_partida1` FOREIGN KEY (`id_partida`) REFERENCES `partida` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimiento`
--

LOCK TABLES `movimiento` WRITE;
/*!40000 ALTER TABLE `movimiento` DISABLE KEYS */;
INSERT INTO `movimiento` VALUES (1,1,1,'Inicio','Cf3'),(1,2,2,'Clásica','Cf6'),(1,3,3,'Nada nuevo','d4'),(1,4,4,'Clásica','e6');
/*!40000 ALTER TABLE `movimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `n_clubes` smallint NOT NULL,
  `id_pais_representado` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`),
  KEY `fk_pais_pais_idx` (`id_pais_representado`),
  CONSTRAINT `fk_pais_pais` FOREIGN KEY (`id_pais_representado`) REFERENCES `pais` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `chk_pais_nclubes` CHECK ((`n_clubes` between 1 and 999))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (6,'España',350,NULL),(7,'Galiza',54,6),(8,'País Vasco',37,6),(9,'Cataluña',98,6),(10,'Francia',460,NULL),(11,'Holanda',127,NULL),(12,'Italia',468,NULL);
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participante`
--

DROP TABLE IF EXISTS `participante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participante` (
  `id` int NOT NULL AUTO_INCREMENT,
  `apelidos` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `nome` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `telefono` int DEFAULT NULL,
  `tipo` enum('xogador','arbitro') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT 'xogador',
  `nivel` tinyint DEFAULT NULL,
  `id_pais_envia` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nomecompleto` (`apelidos`,`nome`),
  KEY `fk_participante_pais_idx` (`id_pais_envia`),
  CONSTRAINT `fk_participante_pais` FOREIGN KEY (`id_pais_envia`) REFERENCES `pais` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `chk_participante_nivel` CHECK (((`nivel` >= 1) and (`nivel` <= 10))),
  CONSTRAINT `chk_participante_tipo` CHECK ((((`tipo` = _utf8mb4'xogador') and (`nivel` is not null)) or ((`tipo` = _utf8mb4'arbitro') and (`nivel` is null))))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participante`
--

LOCK TABLES `participante` WRITE;
/*!40000 ALTER TABLE `participante` DISABLE KEYS */;
INSERT INTO `participante` VALUES (7,'Acacia Dragó','Luis',937382783,'xogador',3,6),(8,'Aciein Zuruta ','Rosa',931212989,'xogador',7,6),(9,'Alonso Becerra','Jose',918765678,'xogador',5,6),(10,'Amate Garrido','Irene',916453664,'xogador',2,6),(11,'Holanda Pérez','Natalia',91909786,'xogador',3,11),(12,'Holanda Amate','María',981343765,'xogador',7,6),(13,'Díaz Segura','María',986872346,'xogador',8,11),(14,'Fernández López','María',972326768,'xogador',6,6),(15,'Abbadie Lombrad','Danielle',32736789,'xogador',9,10),(16,'Curie Aubriot','Helene',565253728,'xogador',5,10),(17,'Abbado Rossi','Anabele',65766545,'arbitro',NULL,11),(18,'Parisi Adamo','Elma',43654567,'arbitro',NULL,12),(19,'Fernández Gonz Parisi','Tina',98737232,'arbitro',NULL,12),(20,'Gomez Ulla','Tino',984838374,'arbitro',NULL,6);
/*!40000 ALTER TABLE `participante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participante_campeonato`
--

DROP TABLE IF EXISTS `participante_campeonato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participante_campeonato` (
  `id_participante` int NOT NULL,
  `nome_campeonato` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `tipo` enum('local','nacional','internacional','mundial') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT 'nacional',
  PRIMARY KEY (`id_participante`,`nome_campeonato`),
  CONSTRAINT `fk_participcampeonato_participante` FOREIGN KEY (`id_participante`) REFERENCES `participante` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participante_campeonato`
--

LOCK TABLES `participante_campeonato` WRITE;
/*!40000 ALTER TABLE `participante_campeonato` DISABLE KEYS */;
INSERT INTO `participante_campeonato` VALUES (7,'Nacional de A Coruña','nacional'),(7,'Nacional Madrid','nacional'),(8,'Internacional París','internacional'),(8,'Local San Luis','local'),(15,'International Viena','internacional'),(15,'Nacional de A Coruña','nacional'),(16,'Local Hamburgo','local');
/*!40000 ALTER TABLE `participante_campeonato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partida`
--

DROP TABLE IF EXISTS `partida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partida` (
  `id` int NOT NULL AUTO_INCREMENT,
  `anho` smallint NOT NULL,
  `mes` tinyint NOT NULL,
  `dia` tinyint NOT NULL,
  `entradas` smallint NOT NULL,
  `id_sala` int NOT NULL,
  `id_arbitro` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_partida_sala1_idx` (`id_sala`),
  KEY `fk_partida_participante1_idx` (`id_arbitro`),
  CONSTRAINT `fk_partida_arbitro` FOREIGN KEY (`id_arbitro`) REFERENCES `participante` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_partida_sala1` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partida`
--

LOCK TABLES `partida` WRITE;
/*!40000 ALTER TABLE `partida` DISABLE KEYS */;
INSERT INTO `partida` VALUES (1,2000,1,1,120,7,17),(2,2000,2,1,230,8,19),(3,2001,3,15,130,9,19);
/*!40000 ALTER TABLE `partida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sala` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cod_sala` smallint NOT NULL,
  `id_hotel` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sala_hotel1_idx` (`id_hotel`),
  CONSTRAINT `fk_sala_hotel1` FOREIGN KEY (`id_hotel`) REFERENCES `hotel` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` VALUES (7,1,4),(8,2,4),(9,3,4),(10,1,5),(11,2,5),(12,1,6);
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala_medios`
--

DROP TABLE IF EXISTS `sala_medios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sala_medios` (
  `id_sala` int NOT NULL,
  `medio` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id_sala`,`medio`),
  KEY `fk_sala_medios_sala1_idx` (`id_sala`),
  CONSTRAINT `fk_sala_medios_sala1` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala_medios`
--

LOCK TABLES `sala_medios` WRITE;
/*!40000 ALTER TABLE `sala_medios` DISABLE KEYS */;
INSERT INTO `sala_medios` VALUES (7,'INTERNET'),(7,'PROYECTOR'),(7,'TV'),(8,'INTERNET'),(10,'INTERNET'),(11,'INTERNET'),(11,'SALA JUNTAS'),(11,'TV'),(12,'INTERNET');
/*!40000 ALTER TABLE `sala_medios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-21 17:01:39
