-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2017 at 11:33 AM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vijueshmeria`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllFNamesFrmSched`()
    NO SQL
SELECT sch.schedule_id, sch.start_time, sch.end_time, g.group, h.hall, l.lush, u.name, sub.subject FROM scheduler sch INNER JOIN groups g ON g.group_id=sch.group_id INNER JOIN halls h ON h.hall_id=sch.hall_id INNER JOIN lush l ON l.lush_id=sch.lush_id INNER JOIN users u ON u.user_id=sch.user_id INNER JOIN subjects sub ON sub.subject_id=sch.subject_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllTodaySubs`()
SELECT `sch`.`schedule_id`, IF(sub.start_time IS NOT NULL AND sub.schedule_id=sch.schedule_id, sub.start_time, sch.start_time) AS start_time,
IF(sub.start_time IS NOT NULL AND sub.schedule_id=sch.schedule_id, sub.end_time, sch.end_time) AS end_time, `sch`.`group_id`, `sch`.`hall_id`, `sch`.`lush_id`, `sch`.`user_id`, `sch`.`subject_id` FROM substitution AS sub RIGHT JOIN scheduler AS sch ON sub.schedule_id=sch.schedule_id
WHERE DATE_FORMAT(IF(sub.start_time IS NOT NULL AND sub.schedule_id=sch.schedule_id, sub.start_time, sch.start_time), '%Y-%m-%d') = CURRENT_DATE()
ORDER BY IF(sub.start_time IS NOT NULL AND sub.schedule_id=sch.schedule_id, sub.start_time, sch.start_time)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getFNamesFrmSched`(IN `p_schedule_id` INT(11))
SELECT g.group, h.hall, l.lush, u.username, s.subject
FROM
  scheduler sch
INNER JOIN groups g ON g.group_id=sch.group_id
INNER JOIN halls h ON h.hall_id=sch.hall_id
INNER JOIN lush l ON l.lush_id=sch.lush_id
INNER JOIN users u ON u.user_id=sch.user_id
INNER JOIN subjects s ON s.subject_id=sch.subject_id
WHERE
  sch.schedule_id = p_schedule_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Reports`(IN `p_user_id` INT)
    NO SQL
SELECT l.*, sch.user_id, sch.start_time AS strt_tm, sch.end_time AS ed_tm FROM lecturetime l INNER JOIN scheduler sch ON l.schedule_id=sch.schedule_id WHERE sch.user_id=p_user_id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cds`
--

CREATE TABLE IF NOT EXISTS `cds` (
  `dep_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cfd`
--

CREATE TABLE IF NOT EXISTS `cfd` (
  `faculty_id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cps`
--

CREATE TABLE IF NOT EXISTS `cps` (
  `user_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cps`
--

INSERT INTO `cps` (`user_id`, `subject_id`) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `cslgs`
--

CREATE TABLE IF NOT EXISTS `cslgs` (
  `subject_id` int(11) NOT NULL,
  `lush_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cslgs`
--

INSERT INTO `cslgs` (`subject_id`, `lush_id`, `group_id`, `student_id`) VALUES
(1, 1, 1, 1),
(1, 2, 1, 1),
(2, 1, 2, 1),
(2, 2, 2, 1),
(1, 1, 1, 2),
(1, 2, 1, 2),
(2, 1, 2, 2),
(2, 2, 2, 2),
(1, 1, 1, 3),
(1, 2, 1, 3),
(2, 1, 2, 3),
(2, 2, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
  `dep_id` int(11) NOT NULL,
  `departament` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `devicereg`
--

CREATE TABLE IF NOT EXISTS `devicereg` (
  `devicereg_id` int(11) NOT NULL,
  `device1` varchar(50) DEFAULT NULL,
  `device2` varchar(50) DEFAULT NULL,
  `device3` varchar(50) DEFAULT NULL,
  `password` varchar(125) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `devicereg`
--

INSERT INTO `devicereg` (`devicereg_id`, `device1`, `device2`, `device3`, `password`) VALUES
(2, 'fe984f036252c6cb', NULL, NULL, 'fcea920f7412b5da7be0cf42b8c93759');

-- --------------------------------------------------------

--
-- Table structure for table `evidence`
--

CREATE TABLE IF NOT EXISTS `evidence` (
  `dep_id` int(11) NOT NULL,
  `departament` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faculties`
--

CREATE TABLE IF NOT EXISTS `faculties` (
  `faculty_id` int(11) NOT NULL,
  `faculty` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `group_id` int(11) NOT NULL,
  `group` varchar(8) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`group_id`, `group`) VALUES
(1, '1'),
(2, '2'),
(3, '3');

-- --------------------------------------------------------

--
-- Table structure for table `halls`
--

CREATE TABLE IF NOT EXISTS `halls` (
  `hall_id` int(11) NOT NULL,
  `hall` varchar(10) NOT NULL,
  `capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `halls`
--

INSERT INTO `halls` (`hall_id`, `hall`, `capacity`) VALUES
(1, 'A25', 100);

-- --------------------------------------------------------

--
-- Table structure for table `lecturetime`
--

CREATE TABLE IF NOT EXISTS `lecturetime` (
  `lecturetime_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `content_sub` varchar(150) DEFAULT NULL,
  `automatic_ended` tinyint(1) NOT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `schedule_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lecturetime`
--

INSERT INTO `lecturetime` (`lecturetime_id`, `start_time`, `end_time`, `content_sub`, `automatic_ended`, `isActive`, `schedule_id`) VALUES
(25, '2017-07-20 11:23:15', '2017-07-20 12:14:27', NULL, 0, 0, 6);

-- --------------------------------------------------------

--
-- Table structure for table `lush`
--

CREATE TABLE IF NOT EXISTS `lush` (
  `lush_id` int(11) NOT NULL,
  `lush` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lush`
--

INSERT INTO `lush` (`lush_id`, `lush`) VALUES
(1, 'Ligjerate'),
(2, 'Ushtrime');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `role_id` int(11) NOT NULL,
  `role` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role`) VALUES
(1, 'Profesor'),
(2, 'Admin'),
(3, 'Dekan');

-- --------------------------------------------------------

--
-- Table structure for table `scheduler`
--

CREATE TABLE IF NOT EXISTS `scheduler` (
  `schedule_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `group_id` int(11) NOT NULL,
  `hall_id` int(11) NOT NULL,
  `lush_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `scheduler`
--

INSERT INTO `scheduler` (`schedule_id`, `start_time`, `end_time`, `group_id`, `hall_id`, `lush_id`, `user_id`, `subject_id`) VALUES
(1, '2017-06-20 15:37:00', '2017-06-20 15:41:00', 1, 1, 1, 1, 1),
(2, '2017-06-15 18:53:00', '2017-06-15 19:30:00', 1, 1, 2, 1, 2),
(4, '2017-06-20 08:19:00', '2017-06-20 09:00:00', 3, 1, 2, 1, 1),
(5, '2017-06-20 13:30:00', '2017-06-20 15:00:00', 3, 1, 1, 2, 3),
(6, '2017-07-20 16:30:00', '2017-07-20 16:40:00', 1, 1, 2, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE IF NOT EXISTS `students` (
  `student_id` int(11) NOT NULL,
  `num_id` varchar(12) NOT NULL,
  `name` varchar(25) NOT NULL,
  `surname` varchar(25) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `birthday` date NOT NULL,
  `devicereg_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `num_id`, `name`, `surname`, `email`, `birthday`, `devicereg_id`) VALUES
(1, '13', 'Butrint', 'Rashiti', 'rashiti.butrint@gmail.com', '1996-07-06', 2),
(2, '222222', 'Yllka', 'Emini', 'yllkaaemini@gmail.com', '1996-05-19', NULL),
(3, '12345678', 'Eda', 'Agushi', 'edaagushi@gmail.com', '1996-12-10', NULL),
(5, '1111', 'Jeton', 'Selimi', 'Jeton@gmail.com', '1982-06-07', NULL),
(8, '22211', 'Yllka', 'Emini', 'yllkaaemini@gmail.com', '1996-05-19', NULL),
(15, '2221111', 'Yllka', 'Emini', 'yllkaaemini@gmail.com', '1996-05-19', NULL),
(17, '113', 'Butrinti', 'Rashitis', 'rashiti.butrint@gmail.com', '1996-06-06', NULL),
(18, '1234567813', 'Eda', 'Agushi', 'edaagushi@gmail.com', '1996-12-10', NULL),
(19, '12312', 'asdsadas', 'sadsa', 'dsadsasda', '2017-12-13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE IF NOT EXISTS `subjects` (
  `subject_id` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject`) VALUES
(1, 'Algoritme'),
(2, 'Programim'),
(3, 'Multimedia'),
(4, 'Matematike');

-- --------------------------------------------------------

--
-- Table structure for table `substitution`
--

CREATE TABLE IF NOT EXISTS `substitution` (
  `substitute_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `reason` text NOT NULL,
  `schedule_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `substitution`
--

INSERT INTO `substitution` (`substitute_id`, `start_time`, `end_time`, `reason`, `schedule_id`) VALUES
(1, '2017-06-20 08:00:00', '2017-06-20 08:05:00', '', 1),
(2, '2017-06-16 06:53:00', '2017-06-16 07:30:00', '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `id` int(11) NOT NULL,
  `phone_id` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `phone_id`, `name`) VALUES
(1, 'fe984f036252c6cb', 'Butrinti'),
(2, '123456', 'Sali');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL,
  `prof_id` varchar(12) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  `name` varchar(25) NOT NULL,
  `surname` varchar(25) NOT NULL,
  `birthday` date DEFAULT NULL,
  `photo_path` varchar(255) DEFAULT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `prof_id`, `username`, `password`, `name`, `surname`, `birthday`, `photo_path`, `role_id`) VALUES
(1, '122222', 'Artan', 'e10adc3949ba59abbe56e057f20f883e', 'Artan', 'Dermaku', NULL, NULL, 1),
(2, '2', 'Jeton', 'e10adc3949ba59abbe56e057f20f883e', 'Jeton', 'Selimi', NULL, NULL, 3),
(3, '12314', 'Butrint', 'e10adc3949ba59abbe56e057f20f883e', 'Butrint', 'Rashiti', '2017-06-20', NULL, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cds`
--
ALTER TABLE `cds`
  ADD KEY `cds_departaments_fk` (`dep_id`), ADD KEY `cds_subjects_fk` (`subject_id`);

--
-- Indexes for table `cfd`
--
ALTER TABLE `cfd`
  ADD KEY `cfd_faculties_fk` (`faculty_id`), ADD KEY `cfd_departments_fk` (`dep_id`);

--
-- Indexes for table `cps`
--
ALTER TABLE `cps`
  ADD KEY `cps_users_fk` (`user_id`), ADD KEY `cps_subjects_fk` (`subject_id`);

--
-- Indexes for table `cslgs`
--
ALTER TABLE `cslgs`
  ADD KEY `cslg_subjects_fk` (`subject_id`), ADD KEY `cslg_lush_fk` (`lush_id`), ADD KEY `cslg_groups_fk` (`group_id`), ADD KEY `cslgs_students_fk` (`student_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`dep_id`);

--
-- Indexes for table `devicereg`
--
ALTER TABLE `devicereg`
  ADD PRIMARY KEY (`devicereg_id`);

--
-- Indexes for table `evidence`
--
ALTER TABLE `evidence`
  ADD PRIMARY KEY (`dep_id`);

--
-- Indexes for table `faculties`
--
ALTER TABLE `faculties`
  ADD PRIMARY KEY (`faculty_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `halls`
--
ALTER TABLE `halls`
  ADD PRIMARY KEY (`hall_id`);

--
-- Indexes for table `lecturetime`
--
ALTER TABLE `lecturetime`
  ADD PRIMARY KEY (`lecturetime_id`), ADD KEY `lecturetime_scheduler_fk` (`schedule_id`);

--
-- Indexes for table `lush`
--
ALTER TABLE `lush`
  ADD PRIMARY KEY (`lush_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `scheduler`
--
ALTER TABLE `scheduler`
  ADD PRIMARY KEY (`schedule_id`), ADD KEY `fk_scheduler_groups` (`group_id`), ADD KEY `fk_scheduler_lush` (`lush_id`), ADD KEY `fk_scheduler_users` (`user_id`), ADD KEY `fk_scheduler_halls` (`hall_id`), ADD KEY `fk_scheduler_subjects` (`subject_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`), ADD KEY `fk_students_devicereg` (`devicereg_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `substitution`
--
ALTER TABLE `substitution`
  ADD PRIMARY KEY (`substitute_id`), ADD KEY `fk_substitution_scheduler` (`schedule_id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`), ADD KEY `users_roles_fk` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `dep_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `devicereg`
--
ALTER TABLE `devicereg`
  MODIFY `devicereg_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `evidence`
--
ALTER TABLE `evidence`
  MODIFY `dep_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `faculties`
--
ALTER TABLE `faculties`
  MODIFY `faculty_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `halls`
--
ALTER TABLE `halls`
  MODIFY `hall_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `lecturetime`
--
ALTER TABLE `lecturetime`
  MODIFY `lecturetime_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `lush`
--
ALTER TABLE `lush`
  MODIFY `lush_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `scheduler`
--
ALTER TABLE `scheduler`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `substitution`
--
ALTER TABLE `substitution`
  MODIFY `substitute_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `cds`
--
ALTER TABLE `cds`
ADD CONSTRAINT `cds_departaments_fk` FOREIGN KEY (`dep_id`) REFERENCES `departments` (`dep_id`),
ADD CONSTRAINT `cds_subjects_fk` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`);

--
-- Constraints for table `cfd`
--
ALTER TABLE `cfd`
ADD CONSTRAINT `cfd_departments_fk` FOREIGN KEY (`dep_id`) REFERENCES `departments` (`dep_id`),
ADD CONSTRAINT `cfd_faculties_fk` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`faculty_id`);

--
-- Constraints for table `cps`
--
ALTER TABLE `cps`
ADD CONSTRAINT `cps_subjects_fk` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
ADD CONSTRAINT `cps_users_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `cslgs`
--
ALTER TABLE `cslgs`
ADD CONSTRAINT `cslg_groups_fk` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`),
ADD CONSTRAINT `cslg_lush_fk` FOREIGN KEY (`lush_id`) REFERENCES `lush` (`lush_id`),
ADD CONSTRAINT `cslg_subjects_fk` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
ADD CONSTRAINT `cslgs_students_fk` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Constraints for table `lecturetime`
--
ALTER TABLE `lecturetime`
ADD CONSTRAINT `lecturetime_scheduler_fk` FOREIGN KEY (`schedule_id`) REFERENCES `scheduler` (`schedule_id`);

--
-- Constraints for table `scheduler`
--
ALTER TABLE `scheduler`
ADD CONSTRAINT `fk_scheduler_groups` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`),
ADD CONSTRAINT `fk_scheduler_halls` FOREIGN KEY (`hall_id`) REFERENCES `halls` (`hall_id`),
ADD CONSTRAINT `fk_scheduler_lush` FOREIGN KEY (`lush_id`) REFERENCES `lush` (`lush_id`),
ADD CONSTRAINT `fk_scheduler_subjects` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
ADD CONSTRAINT `fk_scheduler_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
ADD CONSTRAINT `scheduler_users_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
ADD CONSTRAINT `fk_students_devicereg` FOREIGN KEY (`devicereg_id`) REFERENCES `devicereg` (`devicereg_id`);

--
-- Constraints for table `substitution`
--
ALTER TABLE `substitution`
ADD CONSTRAINT `fk_substitution_scheduler` FOREIGN KEY (`schedule_id`) REFERENCES `scheduler` (`schedule_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
ADD CONSTRAINT `users_roles_fk` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
