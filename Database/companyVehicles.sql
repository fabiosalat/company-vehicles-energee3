CREATE DATABASE  IF NOT EXISTS `company_vehicle` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `company_vehicle`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: company_vehicle
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `vehicle_id` varchar(7) NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT (now()),
  `end_date` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`),
  KEY `vehicle_id` (`vehicle_id`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`license_plate`),
  CONSTRAINT `bookings_chk_1` CHECK ((`start_date` < `end_date`))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,1,'WG123GJ','2022-06-09 14:00:00','2022-06-11 14:00:00'),(2,2,'OL456YG','2022-06-01 10:00:00','2022-06-01 16:00:00'),(3,3,'WG159HR','2022-05-26 07:00:00','2022-06-06 16:00:00'),(4,3,'WG159HR','2022-06-25 07:00:00','2022-06-25 08:00:00'),(5,2,'OL456YG','2022-07-18 10:42:00','2022-07-22 10:42:00'),(6,2,'WG123GJ','2022-07-19 11:55:00','2022-07-21 11:55:00'),(7,2,'TH789LK','2022-07-19 15:24:00','2022-07-22 15:24:00'),(8,4,'AB543FG','2022-07-18 09:10:00','2022-07-21 09:10:00');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `sex` enum('M','F','non_binary') NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `tax_code` varchar(16) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `tax_code` (`tax_code`),
  UNIQUE KEY `phone_number_UNIQUE` (`phone_number`),
  CONSTRAINT `employees_chk_1` CHECK ((`email` like _utf8mb4'%@%.%')),
  CONSTRAINT `employees_chk_2` CHECK ((length(`tax_code`) = 16))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Mario','Rossi','M','1234567890','mario.rossi@energee3.com','erdfrevgbhuilkns',1),(2,'Sara','Verdi','F','9654789112','sara.verdi@energee3.com','erfgtyhjloiujnkl',1),(3,'Michele','Neri','non_binary','3405345345','michele.neri@energee3.com','erghyjnbgfvghyuj',1),(4,'Fabio','Salatino','M','3801987756','fabio.salatino@energee3.com','sltxxx98x09x122b',1),(5,'Luca','Polimeni','M','1234567891','Luca.Polimeni@energee3.com','PLMLCU78X45A366N',1),(6,'Alessandra','Nicoli','F','1234567892','Alessandra.Nicoli@energee3.com','PLMLCU78X45A366H',1),(7,'Mario','Giordano','non_binary','1234567893','mario.giordano@energee3.com','PLMLCU78X45A366E',1);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (3,'Fiat'),(1,'Ford'),(2,'Opel');
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `year_prod` year NOT NULL,
  `manufacturer_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manufacturer_id` (`manufacturer_id`),
  CONSTRAINT `model_ibfk_1` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
INSERT INTO `model` VALUES (1,'Fiesta',2011,1),(2,'Astra',2019,2),(3,'Panda',2018,3),(4,'Corsa',2019,2);
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilization`
--

DROP TABLE IF EXISTS `utilization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilization` (
  `id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT (now()),
  `end_date` timestamp NOT NULL,
  `km` decimal(10,2) NOT NULL,
  `note` text,
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`),
  CONSTRAINT `utilization_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilization`
--

LOCK TABLES `utilization` WRITE;
/*!40000 ALTER TABLE `utilization` DISABLE KEYS */;
INSERT INTO `utilization` VALUES (1,1,'2022-06-09 14:00:00','2022-06-09 16:00:00',20.50,'nessun commento'),(2,1,'2022-06-10 14:00:00','2022-06-10 16:00:00',40.60,'viaggio fino a Milano'),(3,2,'2022-06-01 10:00:00','2022-06-01 12:00:00',13.80,'lavoro da cliente'),(4,3,'2022-05-26 08:00:00','2022-05-30 07:00:00',50.20,'consulenza esterna'),(5,4,'2022-06-25 07:00:00','2022-06-25 08:00:00',10.00,'nuovo viaggio');
/*!40000 ALTER TABLE `utilization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles` (
  `license_plate` varchar(7) NOT NULL,
  `fuel` enum('Diesel','Benzina','GPL','Metano','Hybrid','Electric') NOT NULL,
  `model_id` int NOT NULL,
  `_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`license_plate`),
  KEY `model_id` (`model_id`),
  CONSTRAINT `vehicles_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES ('AB543FG','Diesel',4,1),('OL456YG','Metano',3,1),('TH789LK','Benzina',3,1),('WG123GJ','Diesel',2,1),('WG159HR','Benzina',1,1);
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'company_vehicle'
--
/*!50003 DROP PROCEDURE IF EXISTS `available` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `available`(start_date_to_check TIMESTAMP, end_date_to_check TIMESTAMP)
BEGIN
	SELECT *
	FROM vehicles
	WHERE _active = true AND license_plate NOT IN (
			SELECT vehicle_id
			FROM bookings
			WHERE (start_date_to_check BETWEEN start_date AND end_date) OR (end_date_to_check BETWEEN start_date AND end_date)
				OR 
				(start_date BETWEEN start_date_to_check AND end_date_to_check) OR (end_date BETWEEN start_date_to_check AND end_date_to_check));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `bookingsByPeriod` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bookingsByPeriod`(start_date_to_check TIMESTAMP, end_date_to_check TIMESTAMP)
BEGIN
SELECT *
			FROM bookings
			WHERE (start_date_to_check BETWEEN start_date AND end_date) OR (end_date_to_check BETWEEN start_date AND end_date)
				OR 
				(start_date BETWEEN start_date_to_check AND end_date_to_check) OR (end_date BETWEEN start_date_to_check AND end_date_to_check);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findBookingsByPeriod` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findBookingsByPeriod`(start_date_to_check TIMESTAMP, end_date_to_check TIMESTAMP)
BEGIN
SELECT *
			FROM bookings
			WHERE (start_date_to_check BETWEEN start_date AND end_date) OR (end_date_to_check BETWEEN start_date AND end_date)
				OR 
				(start_date BETWEEN start_date_to_check AND end_date_to_check) OR (end_date BETWEEN start_date_to_check AND end_date_to_check);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `history` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `history`(car_plate VARCHAR(7))
BEGIN
	SELECT vehicle_id, e.id AS "employee_id", first_name, last_name, b.start_date, b.end_date, km, note
    FROM bookings AS b INNER JOIN employees AS e ON b.employee_id = e.id 
    INNER JOIN utilization AS u ON b.id = u.booking_id
    WHERE vehicle_id = car_plate
    ORDER BY start_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_km_note` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_km_note`(booking int, km DECIMAL(10,2), note text)
BEGIN
	INSERT INTO utilization (booking_id, km, note)
	VALUES (
		booking,
		km,
		note
	  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `myStoredProcedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `myStoredProcedure`(in targa varchar(7))
BEGIN

SELECT * FROM vehicles WHERE license_plate = targa;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_booking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_booking`(employee int, vehicle varchar(7), start_d TIMESTAMP, end_d TIMESTAMP, OUT result TINYINT(1))
BEGIN
	DECLARE counter int;
	
	SELECT COUNT(*) INTO counter 
	FROM bookings 
	WHERE (vehicle_id = vehicle) AND 
		((start_d BETWEEN start_date AND end_date) OR (end_d BETWEEN start_date AND end_date) 
		OR 
		(start_date BETWEEN start_d AND end_d) OR (end_date BETWEEN start_d AND end_d));

	IF counter = 0 THEN
		INSERT INTO bookings (
            employee_id,
            vehicle_id,
            start_date,
            end_date
        )
        VALUES (
            employee,
            vehicle,
            start_d,
            end_d
        );
        
		SET result = 1;
    
	ELSE 
		SET result = 0;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-20  9:38:46
