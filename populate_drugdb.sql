-- Creating the database
CREATE DATABASE IF NOT EXISTS drugdb /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE drugdb;

-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
-- Host: 127.0.0.1    Database: drugdb
-- Server version 8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
!/40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
!/40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
!/50503 SET NAMES utf8 */;
!/40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
!/40103 SET TIME_ZONE='+00:00' */;
!/40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
!/40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
!/40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
!/40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Table structure for table admins
DROP TABLE IF EXISTS admins;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE admins (
    admin_id int NOT NULL AUTO_INCREMENT,
    admin_ssn int NOT NULL,
    admin_fname varchar(15) NOT NULL,
    admin_lname varchar(20) NOT NULL,
    admin_image varchar(50) DEFAULT NULL,
    admin_email varchar(25) NOT NULL,
    admin_password varchar(25) NOT NULL,
    admin_mobile varchar(25) NOT NULL,
    admin_created_on datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (admin_id)
);
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dumping data for table admins
LOCK TABLES admins WRITE;
/*!40000 ALTER TABLE admins DISABLE KEYS */;
INSERT INTO admins VALUES (1,10266636,'Davis','Green','./uploads/profiles/10266636.jpg','davisgreen@gmail.com','12345678','0111461078','2023-06-19 07:04:02'),(3,42984924,'admin1','test','./uploads/profiles/42984924.jpg','admin1test@gmail.com','12345678','04284824','2023-07-21 19:57:45');
/*!40000 ALTER TABLE admins ENABLE KEYS */;
UNLOCK TABLES;

-- Table structure for table api_keys
DROP TABLE IF EXISTS api_keys;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE api_keys (
    id int NOT NULL AUTO_INCREMENT,
    key varchar(32) NOT NULL,
    user int NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY key (key),
    KEY user (user),
    CONSTRAINT api_keys_ibfk_1 FOREIGN KEY (user) REFERENCES api_users (id)
);
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dumping data for table api_keys
LOCK TABLES api_keys WRITE;
/*!40000 ALTER TABLE api_keys DISABLE KEYS */;
INSERT INTO api_keys VALUES (5,'b9748a88d395481aa7061ad59b5f74e6',10),(6,'05036c6ec50f44149c54c3540c98cbd8',11),(7,'a7f2d85c545e4fea9a3503bd725b140c',12),(8,'7ab5198712674d548914df19609c5b44',13);
/*!40000 ALTER TABLE api_keys ENABLE KEYS */;
UNLOCK TABLES;

-- Table structure for table api_users
DROP TABLE IF EXISTS api_users;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE api_users (
    id int NOT NULL AUTO_INCREMENT,
    fname varchar(45) NOT NULL,
    lname varchar(45) NOT NULL,
    registered_on datetime DEFAULT CURRENT_TIMESTAMP,
    email varchar(45) NOT NULL,
    password varchar(45) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY email (email)
);
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dumping data for table api_users
LOCK TABLES api_users WRITE;
/*!40000 ALTER TABLE api_users DISABLE KEYS */;
INSERT INTO api_users VALUES (10,'David','Manufor','2023-11-23 13:04:17','davemanufor@gmail.com','12345678'),(11,'test','tester','2023-11-24 15:39:12','davemanufor1@gmail.com','12345678'),(12,'firstname','lastname','2023-11-30 19:53:51','example@gmail.com','12345678'),(13,'firstname','lastname','2023-11-30 21:09:17','example1@gmail.com','12345678');
/*!40000 ALTER TABLE api_users ENABLE KEYS */;
UNLOCK TABLES;

-- Table structure for table dispenses
DROP TABLE IF EXISTS dispenses;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE dispenses (
    drug_id int NOT NULL,
    patient_id int NOT NULL,
    dispersed_on datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id int NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id),
    KEY drug_id (drug_id),
    KEY patient_id (patient_id),
    CONSTRAINT dispenses_ibfk_1 FOREIGN KEY (drug_id) REFERENCES drugs (drug_id),
    CONSTRAINT dispenses_ibfk_2 FOREIGN KEY (patient_id) REFERENCES patients (patient_id)
);
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dumping data for table dispenses
LOCK TABLES dispenses WRITE;
/*!40000 ALTER TABLE dispenses DISABLE KEYS */;
INSERT INTO dispenses VALUES (5,50,'2023-07-21 20:07:15',1),(4,50,'2023-07-21 20:07:36',2),(3,51,'2023-07-21 20:07:41',3);
/*!40000 ALTER TABLE dispenses ENABLE KEYS */;
UNLOCK TABLES;

-- Table structure for table doctors
DROP TABLE IF EXISTS doctors;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE doctors (
    doctor_id int NOT NULL AUTO_INCREMENT,
    doctor_ssn int DEFAULT NULL,
    speciality varchar(50) DEFAULT NULL,
    years_of_experience int DEFAULT NULL,
    doctor_fname varchar(15) DEFAULT NULL,
    doctor_lname varchar(15) DEFAULT NULL,
    opening_time time DEFAULT NULL,
    closing_time time DEFAULT NULL,
    doctor_image varchar(50) DEFAULT NULL,
    doctor_email varchar(25) NOT NULL,
    doctor_password varchar(25) NOT NULL,
    doctor_mobile varchar(25) NOT NULL,
    doctor_created_on datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (doctor_id)
);
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dumping data for table doctors
LOCK TABLES doctors WRITE;
/*!40000 ALTER TABLE doctors DISABLE KEYS */;
INSERT INTO doctors VALUES (1,10286634,'Optician',11,'Mike','Bridge','08:00:00','16:00:00','./uploads/profiles/10286634.jpg','mikebridge@gmail.com','12345678','0711461098','2023-07-20 10:29:15'),(2,4297424,'Gynacologist',12,'John','Donald','10:00:00','21:00:00','./uploads/profiles/4297424.jpg','johndonald@gmail.com','12345678','08492842','2023-07-20 20:40:39'),(3,428828842,'Optician',10,'doctor1','test','08:00:00','16:00:00','./uploads/profiles/428828842.jpg','doctor1test@gmail.com','12345678','04277424','2023-07-21 19:56:20');
/*!40000 ALTER TABLE doctors ENABLE KEYS */;
UNLOCK TABLES;

-- Table structure for table drugs
DROP TABLE IF EXISTS drugs;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE drugs (
    drug_id int NOT NULL AUTO_INCREMENT,
    drug_name varchar(30) NOT NULL,
    quantity int NOT NULL,
    drug_image varchar(45) DEFAULT NULL,
    created_on datetime DEFAULT CURRENT_TIMESTAMP,
    price double NOT NULL,
    category enum('PAINKILLER','ANTIBIOTICS','INHALANTS','STIMULANTS') DEFAULT NULL,
    PRIMARY KEY (drug_id)
);
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dumping data for table drugs
LOCK TABLES drugs WRITE;
/*!40000 ALTER TABLE drugs DISABLE KEYS */;
INSERT INTO drugs VALUES (3,'drug1 500mg',0,'./uploads/drug_images/drug1.jpg','2023-07-21 19:56:20',15.00,'PAINKILLER'),(4,'drug2 200mg',5,'./uploads/drug_images/drug2.jpg','2023-07-21 20:07:30',25.00,'ANTIBIOTICS'),(5,'drug3 100mg',7,'./uploads/drug_images/drug3.jpg','2023-07-21 20:07:41',30.00,'INHALANTS');
/*!40000 ALTER TABLE drugs ENABLE KEYS */;
UNLOCK TABLES;

-- Table structure for table patients
DROP TABLE IF EXISTS patients;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE patients (
    patient_id int NOT NULL AUTO_INCREMENT,
    patient_ssn int NOT NULL,
    patient_fname varchar(15) NOT NULL,
    patient_lname varchar(20) NOT NULL,
    patient_dob date NOT NULL,
    patient_email varchar(25) NOT NULL,
    patient_password varchar(25) NOT NULL,
    patient_mobile varchar(25) NOT NULL,
    patient_created_on datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (patient_id)
);
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dumping data for table patients
LOCK TABLES patients WRITE;
/*!40000 ALTER TABLE patients DISABLE KEYS */;
INSERT INTO patients VALUES (50,10566652,'David','Manufor','1997-09-13','davemanufor@gmail.com','12345678','0111461078','2023-06-19 07:04:02'),(51,12666962,'test','user','1998-12-10','testuser@gmail.com','12345678','04284824','2023-07-21 20:07:34');
/*!40000 ALTER TABLE patients ENABLE KEYS */;
UNLOCK TABLES;

-- More tables can be added following this structure.
