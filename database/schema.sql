CREATE DATABASE  IF NOT EXISTS `storecourse` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `storecourse`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: storecourse
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `categories_id` int NOT NULL AUTO_INCREMENT,
  `categories_name` varchar(144) NOT NULL,
  PRIMARY KEY (`categories_id`),
  UNIQUE KEY `categories_id_UNIQUE` (`categories_id`),
  UNIQUE KEY `categories_name_UNIQUE` (`categories_name`),
  CONSTRAINT `categories_id` FOREIGN KEY (`categories_id`) REFERENCES `courses` (`courses_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `contacts_id` int NOT NULL AUTO_INCREMENT,
  `contacts_name` varchar(255) NOT NULL,
  `contacts_subject` varchar(255) NOT NULL,
  `contacts_email` varchar(255) NOT NULL,
  `contacts_message` varchar(1000) NOT NULL,
  `contacts_check` tinyint(1) DEFAULT '1',
  `contacts_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`contacts_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `courses_id` int NOT NULL AUTO_INCREMENT,
  `courses_title` varchar(144) NOT NULL,
  `courses_content` longtext,
  `courses_image` varchar(255) DEFAULT NULL,
  `courses_price` decimal(10,2) NOT NULL,
  `courses_discounted_price` decimal(10,0) DEFAULT NULL,
  `courses_professor_id` int NOT NULL,
  `courses_studycenter_id` int DEFAULT NULL,
  `courses_category_id` int NOT NULL,
  `courses_active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`courses_id`),
  UNIQUE KEY `courses_id_UNIQUE` (`courses_id`),
  KEY `courses_professor_id_idx` (`courses_professor_id`),
  KEY `courses_center_id_idx` (`courses_studycenter_id`),
  KEY `courses_category_id_idx` (`courses_category_id`),
  CONSTRAINT `courses_professor_id` FOREIGN KEY (`courses_professor_id`) REFERENCES `professors` (`professors_id`),
  CONSTRAINT `courses_studycenter_id` FOREIGN KEY (`courses_studycenter_id`) REFERENCES `studycenters` (`studyCenters_id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollments` (
  `enrollments_id` int NOT NULL AUTO_INCREMENT,
  `enrollments_student_id` int NOT NULL,
  `enrollments_course_id` int NOT NULL,
  `enrollments_start_date` datetime NOT NULL,
  `enrollments_end_date` datetime NOT NULL,
  `enrollments_finalized` tinyint NOT NULL DEFAULT '0',
  `enrollments_code` varchar(20) NOT NULL,
  `enrollments_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`enrollments_id`),
  UNIQUE KEY `enrollments_od_UNIQUE` (`enrollments_id`),
  KEY `enrollments_students_id_idx` (`enrollments_student_id`),
  KEY `enrollments_courses_id_idx` (`enrollments_course_id`),
  CONSTRAINT `enrollments_courses_id` FOREIGN KEY (`enrollments_course_id`) REFERENCES `courses` (`courses_id`) ON DELETE CASCADE,
  CONSTRAINT `enrollments_students_id` FOREIGN KEY (`enrollments_student_id`) REFERENCES `students` (`students_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `favorites_user_id` int NOT NULL,
  `favorites_course_id` int NOT NULL,
  PRIMARY KEY (`favorites_user_id`,`favorites_course_id`),
  KEY `favorites_course_id` (`favorites_course_id`),
  CONSTRAINT `favorites_course_id` FOREIGN KEY (`favorites_course_id`) REFERENCES `courses` (`courses_id`),
  CONSTRAINT `favorites_user_id` FOREIGN KEY (`favorites_user_id`) REFERENCES `users` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `professor_student`
--

DROP TABLE IF EXISTS `professor_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor_student` (
  `professor_student_id` int NOT NULL AUTO_INCREMENT,
  `professor_student_professor_id` int NOT NULL,
  `professor_student_student_id` int NOT NULL,
  PRIMARY KEY (`professor_student_id`,`professor_student_professor_id`,`professor_student_student_id`),
  UNIQUE KEY `professor_student_id_UNIQUE` (`professor_student_id`),
  KEY `professor_student_professor_id_idx` (`professor_student_professor_id`),
  KEY `professor_student_student_id_idx` (`professor_student_student_id`),
  CONSTRAINT `professor_student_professor_id` FOREIGN KEY (`professor_student_professor_id`) REFERENCES `professors` (`professors_id`),
  CONSTRAINT `professor_student_student_id` FOREIGN KEY (`professor_student_student_id`) REFERENCES `students` (`students_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `professor_studycenter`
--

DROP TABLE IF EXISTS `professor_studycenter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor_studycenter` (
  `studyCenter_id` int NOT NULL,
  `professor_id` int NOT NULL,
  PRIMARY KEY (`studyCenter_id`,`professor_id`),
  KEY `professor_id_idx` (`professor_id`),
  CONSTRAINT `professor_id` FOREIGN KEY (`professor_id`) REFERENCES `professors` (`professors_id`) ON DELETE CASCADE,
  CONSTRAINT `studycenter_id` FOREIGN KEY (`studyCenter_id`) REFERENCES `studycenters` (`studyCenters_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `professors`
--

DROP TABLE IF EXISTS `professors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professors` (
  `professors_id` int NOT NULL AUTO_INCREMENT,
  `professors_first_name` varchar(144) NOT NULL,
  `professors_last_name` varchar(144) DEFAULT NULL,
  `professors_email` varchar(80) NOT NULL,
  `professors_user_id` int NOT NULL,
  `professors_dni` varchar(9) NOT NULL,
  `professors_address` varchar(255) NOT NULL,
  `professors_city` varchar(50) NOT NULL,
  `professors_postal` int NOT NULL,
  `professors_number_card` varchar(16) NOT NULL,
  `professors_exp_date` varchar(5) NOT NULL,
  `professors_cvc` int NOT NULL,
  PRIMARY KEY (`professors_id`),
  UNIQUE KEY `professors_id_UNIQUE` (`professors_id`),
  UNIQUE KEY `professors_email_UNIQUE` (`professors_email`),
  UNIQUE KEY `professors_user_id_UNIQUE` (`professors_user_id`),
  UNIQUE KEY `professors_dni_UNIQUE` (`professors_dni`),
  KEY `professors_user_id_idx` (`professors_user_id`),
  CONSTRAINT `professors_user_id` FOREIGN KEY (`professors_user_id`) REFERENCES `users` (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rols`
--

DROP TABLE IF EXISTS `rols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rols` (
  `rols_id` int NOT NULL AUTO_INCREMENT,
  `rols_name` varchar(20) NOT NULL,
  PRIMARY KEY (`rols_id`),
  UNIQUE KEY `rols_id_UNIQUE` (`rols_id`),
  UNIQUE KEY `rols_name_UNIQUE` (`rols_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `students_id` int NOT NULL AUTO_INCREMENT,
  `students_first_name` varchar(144) NOT NULL,
  `students_last_name` varchar(144) NOT NULL,
  `students_email` varchar(80) NOT NULL,
  `students_user_id` int NOT NULL,
  `students_dni` varchar(9) NOT NULL,
  `students_address` varchar(255) NOT NULL,
  `students_city` varchar(50) NOT NULL,
  `students_postal` int NOT NULL,
  `students_number_card` varchar(16) NOT NULL,
  `students_exp_date` varchar(5) NOT NULL,
  `students_cvc` int NOT NULL,
  PRIMARY KEY (`students_id`),
  UNIQUE KEY `students_id_UNIQUE` (`students_id`),
  UNIQUE KEY `students_user_id_UNIQUE` (`students_user_id`),
  UNIQUE KEY `students_dni_UNIQUE` (`students_dni`),
  UNIQUE KEY `students_email_UNIQUE` (`students_email`),
  KEY `students_user_id_idx` (`students_user_id`),
  CONSTRAINT `students_user_id` FOREIGN KEY (`students_user_id`) REFERENCES `users` (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `studycenter_student`
--

DROP TABLE IF EXISTS `studycenter_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studycenter_student` (
  `studycenter_student_id` int NOT NULL AUTO_INCREMENT,
  `studycenter_student_student_id` int NOT NULL,
  `studycenter_student_center_id` int NOT NULL,
  PRIMARY KEY (`studycenter_student_id`,`studycenter_student_student_id`,`studycenter_student_center_id`),
  UNIQUE KEY `center_student_id_UNIQUE` (`studycenter_student_id`),
  KEY `center_student_student_id_idx` (`studycenter_student_student_id`),
  KEY `center_student_center_id_idx` (`studycenter_student_center_id`),
  CONSTRAINT `studycenter_student_center_id` FOREIGN KEY (`studycenter_student_center_id`) REFERENCES `studycenters` (`studyCenters_id`),
  CONSTRAINT `studycenter_student_student_id` FOREIGN KEY (`studycenter_student_student_id`) REFERENCES `students` (`students_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `studycenters`
--

DROP TABLE IF EXISTS `studycenters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studycenters` (
  `studyCenters_id` int NOT NULL AUTO_INCREMENT,
  `studyCenters_name` varchar(144) NOT NULL,
  `studycenters_email` varchar(80) NOT NULL,
  `studyCenters_user_id` int NOT NULL,
  `studyCenters_address` varchar(255) NOT NULL,
  `studyCenters_city` varchar(50) NOT NULL,
  `studyCenters_postal` int NOT NULL,
  `studyCenters_number_card` varchar(16) NOT NULL,
  `studyCenters_exp_date` varchar(5) NOT NULL,
  `studyCenters_cvc` int NOT NULL,
  `studyCenters_cif` varchar(9) NOT NULL,
  `studyCenters_active` tinyint DEFAULT '1',
  PRIMARY KEY (`studyCenters_id`),
  UNIQUE KEY `center_id_UNIQUE` (`studyCenters_id`),
  UNIQUE KEY `studycenters_email_UNIQUE` (`studycenters_email`),
  UNIQUE KEY `studyCenters_cif_UNIQUE` (`studyCenters_cif`),
  KEY `studyCenters_user_id_idx` (`studyCenters_user_id`),
  CONSTRAINT `studyCenters_user_id` FOREIGN KEY (`studyCenters_user_id`) REFERENCES `users` (`users_id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_rol`
--

DROP TABLE IF EXISTS `user_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_rol` (
  `user_id` int NOT NULL,
  `rol_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`rol_id`),
  KEY `rol_id_idx` (`rol_id`),
  CONSTRAINT `rol_id` FOREIGN KEY (`rol_id`) REFERENCES `rols` (`rols_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `users_id` int NOT NULL AUTO_INCREMENT,
  `users_name` varchar(100) NOT NULL,
  `users_email` varchar(80) NOT NULL,
  `users_password` varchar(64) NOT NULL,
  PRIMARY KEY (`users_id`),
  UNIQUE KEY `users_id_UNIQUE` (`users_id`),
  UNIQUE KEY `users_email_UNIQUE` (`users_email`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-15 18:39:58
