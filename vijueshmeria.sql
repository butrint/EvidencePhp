-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: vijueshmeria
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

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
-- Table structure for table `cds`
--

DROP TABLE IF EXISTS `cds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cds` (
  `dep_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  KEY `cds_departaments_fk` (`dep_id`),
  KEY `cds_subjects_fk` (`subject_id`),
  CONSTRAINT `cds_departaments_fk` FOREIGN KEY (`dep_id`) REFERENCES `departments` (`dep_id`),
  CONSTRAINT `cds_subjects_fk` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cds`
--

LOCK TABLES `cds` WRITE;
/*!40000 ALTER TABLE `cds` DISABLE KEYS */;
/*!40000 ALTER TABLE `cds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfd`
--

DROP TABLE IF EXISTS `cfd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfd` (
  `faculty_id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  KEY `cfd_faculties_fk` (`faculty_id`),
  KEY `cfd_departments_fk` (`dep_id`),
  CONSTRAINT `cfd_departments_fk` FOREIGN KEY (`dep_id`) REFERENCES `departments` (`dep_id`),
  CONSTRAINT `cfd_faculties_fk` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`faculty_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfd`
--

LOCK TABLES `cfd` WRITE;
/*!40000 ALTER TABLE `cfd` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cps`
--

DROP TABLE IF EXISTS `cps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cps` (
  `user_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  KEY `cps_users_fk` (`user_id`),
  KEY `cps_subjects_fk` (`subject_id`),
  CONSTRAINT `cps_subjects_fk` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  CONSTRAINT `cps_users_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cps`
--

LOCK TABLES `cps` WRITE;
/*!40000 ALTER TABLE `cps` DISABLE KEYS */;
INSERT INTO `cps` VALUES (1,1),(1,2),(2,3),(3,4);
/*!40000 ALTER TABLE `cps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cslgs`
--

DROP TABLE IF EXISTS `cslgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cslgs` (
  `subject_id` int(11) NOT NULL,
  `lush_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  KEY `cslg_subjects_fk` (`subject_id`),
  KEY `cslg_lush_fk` (`lush_id`),
  KEY `cslg_groups_fk` (`group_id`),
  KEY `cslgs_students_fk` (`student_id`),
  CONSTRAINT `cslg_groups_fk` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`),
  CONSTRAINT `cslg_lush_fk` FOREIGN KEY (`lush_id`) REFERENCES `lush` (`lush_id`),
  CONSTRAINT `cslg_subjects_fk` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  CONSTRAINT `cslgs_students_fk` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cslgs`
--

LOCK TABLES `cslgs` WRITE;
/*!40000 ALTER TABLE `cslgs` DISABLE KEYS */;
INSERT INTO `cslgs` VALUES (1,1,1,1),(1,2,1,1),(2,1,2,1),(2,2,2,1),(1,1,1,2),(1,2,1,2),(2,1,2,2),(2,2,2,2),(1,1,1,3),(1,2,1,3),(2,1,2,3),(2,2,1,3);
/*!40000 ALTER TABLE `cslgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `dep_id` int(11) NOT NULL AUTO_INCREMENT,
  `departament` varchar(50) NOT NULL,
  PRIMARY KEY (`dep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devicereg`
--

DROP TABLE IF EXISTS `devicereg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devicereg` (
  `devicereg_id` int(11) NOT NULL AUTO_INCREMENT,
  `device1` varchar(50) DEFAULT NULL,
  `device2` varchar(50) DEFAULT NULL,
  `device3` varchar(50) DEFAULT NULL,
  `password` varchar(125) NOT NULL,
  PRIMARY KEY (`devicereg_id`),
  UNIQUE KEY `device1` (`device1`),
  UNIQUE KEY `device2` (`device2`),
  UNIQUE KEY `device3` (`device3`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devicereg`
--

LOCK TABLES `devicereg` WRITE;
/*!40000 ALTER TABLE `devicereg` DISABLE KEYS */;
INSERT INTO `devicereg` VALUES (4,NULL,NULL,NULL,'fcea920f7412b5da7be0cf42b8c93759'),(5,'fe984f036252c6cb',NULL,NULL,'fcea920f7412b5da7be0cf42b8c93759');
/*!40000 ALTER TABLE `devicereg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evidence`
--

DROP TABLE IF EXISTS `evidence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evidence` (
  `dep_id` int(11) NOT NULL AUTO_INCREMENT,
  `departament` varchar(100) NOT NULL,
  PRIMARY KEY (`dep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evidence`
--

LOCK TABLES `evidence` WRITE;
/*!40000 ALTER TABLE `evidence` DISABLE KEYS */;
/*!40000 ALTER TABLE `evidence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculties`
--

DROP TABLE IF EXISTS `faculties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculties` (
  `faculty_id` int(11) NOT NULL AUTO_INCREMENT,
  `faculty` varchar(100) NOT NULL,
  PRIMARY KEY (`faculty_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculties`
--

LOCK TABLES `faculties` WRITE;
/*!40000 ALTER TABLE `faculties` DISABLE KEYS */;
/*!40000 ALTER TABLE `faculties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group` varchar(8) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'1'),(2,'2'),(3,'3');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `halls`
--

DROP TABLE IF EXISTS `halls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `halls` (
  `hall_id` int(11) NOT NULL AUTO_INCREMENT,
  `hall` varchar(10) NOT NULL,
  `capacity` int(11) DEFAULT NULL,
  PRIMARY KEY (`hall_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `halls`
--

LOCK TABLES `halls` WRITE;
/*!40000 ALTER TABLE `halls` DISABLE KEYS */;
INSERT INTO `halls` VALUES (1,'A25',100);
/*!40000 ALTER TABLE `halls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturetime`
--

DROP TABLE IF EXISTS `lecturetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lecturetime` (
  `lecturetime_id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `content_sub` varchar(150) DEFAULT NULL,
  `automatic_ended` tinyint(1) NOT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `schedule_id` int(11) NOT NULL,
  PRIMARY KEY (`lecturetime_id`),
  KEY `lecturetime_scheduler_fk` (`schedule_id`),
  CONSTRAINT `lecturetime_scheduler_fk` FOREIGN KEY (`schedule_id`) REFERENCES `scheduler` (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturetime`
--

LOCK TABLES `lecturetime` WRITE;
/*!40000 ALTER TABLE `lecturetime` DISABLE KEYS */;
INSERT INTO `lecturetime` VALUES (25,'2017-07-20 11:23:15','2017-07-20 12:14:27',NULL,0,0,6);
/*!40000 ALTER TABLE `lecturetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lush`
--

DROP TABLE IF EXISTS `lush`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lush` (
  `lush_id` int(11) NOT NULL AUTO_INCREMENT,
  `lush` varchar(10) NOT NULL,
  PRIMARY KEY (`lush_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lush`
--

LOCK TABLES `lush` WRITE;
/*!40000 ALTER TABLE `lush` DISABLE KEYS */;
INSERT INTO `lush` VALUES (1,'Ligjerate'),(2,'Ushtrime');
/*!40000 ALTER TABLE `lush` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(30) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Profesor'),(2,'Admin'),(3,'Dekan');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduler`
--

DROP TABLE IF EXISTS `scheduler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduler` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `group_id` int(11) NOT NULL,
  `hall_id` int(11) NOT NULL,
  `lush_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `fk_scheduler_groups` (`group_id`),
  KEY `fk_scheduler_lush` (`lush_id`),
  KEY `fk_scheduler_users` (`user_id`),
  KEY `fk_scheduler_halls` (`hall_id`),
  KEY `fk_scheduler_subjects` (`subject_id`),
  CONSTRAINT `fk_scheduler_groups` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`),
  CONSTRAINT `fk_scheduler_halls` FOREIGN KEY (`hall_id`) REFERENCES `halls` (`hall_id`),
  CONSTRAINT `fk_scheduler_lush` FOREIGN KEY (`lush_id`) REFERENCES `lush` (`lush_id`),
  CONSTRAINT `fk_scheduler_subjects` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  CONSTRAINT `fk_scheduler_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `scheduler_users_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduler`
--

LOCK TABLES `scheduler` WRITE;
/*!40000 ALTER TABLE `scheduler` DISABLE KEYS */;
INSERT INTO `scheduler` VALUES (1,'2017-06-20 15:37:00','2017-06-20 15:41:00',1,1,1,1,1),(2,'2017-06-15 18:53:00','2017-06-15 19:30:00',1,1,2,1,2),(4,'2017-06-20 08:19:00','2017-06-20 09:00:00',3,1,2,1,1),(5,'2017-06-20 13:30:00','2017-06-20 15:00:00',3,1,1,2,3),(6,'2017-07-20 16:30:00','2017-07-20 16:40:00',1,1,2,3,1);
/*!40000 ALTER TABLE `scheduler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `num_id` varchar(12) NOT NULL,
  `name` varchar(25) NOT NULL,
  `surname` varchar(25) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `birthday` date NOT NULL,
  `hash` varchar(128) DEFAULT NULL COMMENT 'login hash',
  `devicereg_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `num_id` (`num_id`),
  KEY `fk_students_devicereg` (`devicereg_id`),
  CONSTRAINT `fk_students_devicereg` FOREIGN KEY (`devicereg_id`) REFERENCES `devicereg` (`devicereg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'13','Butrint','Rashiti','rashiti.butrint@gmail.com','1996-07-06',NULL,NULL),(2,'222222','Yllka','Emini','yllkaaemini@gmail.com','1996-05-19','a3e1cb4ebc2d346b99f8e330d1cd10be',5),(3,'12345678','Eda','Agushi','edaagushi@gmail.com','1996-12-10','',NULL),(5,'1111','Jeton','Selimi','artan.dermaku@gmail.com','1982-06-07','4622617bb55b8fb751ab4560f727b9fd',4),(8,'22211','Yllka','Emini','yllkaaemini@gmail.com','1996-05-19','',NULL),(15,'2221111','Yllka','Emini','yllkaaemini@gmail.com','1996-05-19','',NULL),(17,'113','Butrinti','Rashitis','rashiti.butrint@gmail.com','1996-06-06','',NULL),(18,'1234567813','Eda','Agushi','edaagushi@gmail.com','1996-12-10','',NULL),(19,'12312','asdsadas','sadsa','dsadsasda','2017-12-13','',NULL);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(100) NOT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Algoritme'),(2,'Programim'),(3,'Multimedia'),(4,'Matematike');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `substitution`
--

DROP TABLE IF EXISTS `substitution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `substitution` (
  `substitute_id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `reason` text NOT NULL,
  `schedule_id` int(11) NOT NULL,
  PRIMARY KEY (`substitute_id`),
  KEY `fk_substitution_scheduler` (`schedule_id`),
  CONSTRAINT `fk_substitution_scheduler` FOREIGN KEY (`schedule_id`) REFERENCES `scheduler` (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `substitution`
--

LOCK TABLES `substitution` WRITE;
/*!40000 ALTER TABLE `substitution` DISABLE KEYS */;
INSERT INTO `substitution` VALUES (1,'2017-06-20 08:00:00','2017-06-20 08:05:00','',1),(2,'2017-06-16 06:53:00','2017-06-16 07:30:00','',2);
/*!40000 ALTER TABLE `substitution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_id` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'fe984f036252c6cb','Butrinti'),(2,'123456','Sali');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `prof_id` varchar(12) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  `name` varchar(25) NOT NULL,
  `surname` varchar(25) NOT NULL,
  `birthday` date DEFAULT NULL,
  `photo_path` varchar(255) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `users_roles_fk` (`role_id`),
  CONSTRAINT `users_roles_fk` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'122222','Artan','e10adc3949ba59abbe56e057f20f883e','Artan','Dermaku',NULL,NULL,1),(2,'2','Jeton','e10adc3949ba59abbe56e057f20f883e','Jeton','Selimi',NULL,NULL,3),(3,'12314','Butrint','e10adc3949ba59abbe56e057f20f883e','Butrint','Rashiti','2017-06-20',NULL,2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-25  0:11:42
