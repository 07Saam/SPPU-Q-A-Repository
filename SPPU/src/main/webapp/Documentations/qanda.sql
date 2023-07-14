-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2023 at 08:31 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qanda`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `A_ID` int(5) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `Password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `Q_Id` int(5) NOT NULL,
  `F_Id` int(5) NOT NULL,
  `Answer` varchar(3000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `F_id` int(5) NOT NULL,
  `First_name` varchar(10) NOT NULL,
  `Last_name` varchar(10) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`F_id`, `First_name`, `Last_name`, `mobile`, `email`, `password`) VALUES
(1, 'Sumit', 'Dhore', '8208507034', 'saam.dhore7@gmail.com', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `Q_Id` int(5) NOT NULL,
  `Question` varchar(1000) NOT NULL,
  `Subject` varchar(40) NOT NULL,
  `Year` varchar(4) NOT NULL,
  `Winter/Summer` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`Q_Id`, `Question`, `Subject`, `Year`, `Winter/Summer`) VALUES
(1, 'Write a java program to design the following GUI [6marks]', 'Java Programing', '2022', 1),
(2, ' Explain wrapper classes in java [4marks]', 'Java Programing', '2022', 1),
(3, 'Different types of layout managers with examples [6marks]', 'Java Programing', '2022', 1),
(4, 'Explain Action Listener class [4marks]', 'Java Programing', '2022', 1),
(5, 'Write a JDBC application to insert update and delete record [8marks]', 'Java Programing', '2022', 1),
(6, 'What is Request Dispatcher ? [4marks]', 'Java Programing', '2022', 1),
(7, 'What is Request Dispatcher ? [4marks]', 'Java Programing', '2022', 1),
(8, 'Explain servlet life-cycle. [4marks]', 'Java Programing', '2022', 1),
(9, 'What is the difference between the Enumeration and Iterator interface? [5marks]', 'Java Programing', '2022', 1),
(10, 'Differentiate between method and constructor [3marks]', 'Java Programing', '2022', 1),
(11, 'What is difference between Iterator and ListIterator? [5marks]', 'Java Programing', '2022', 1),
(12, 'Explain \'this\' keyword [3marks]', 'Java Programing', '2022', 1),
(13, 'Explain the concept of overloading [4marks]', 'Java Programing', '2022', 1),
(14, 'Explain thread life cycle [3marks]', 'Java Programing', '2022', 1),
(15, 'List any four methods of file class [3marks]', 'Java Programing', '2022', 1),
(16, 'Explain Abstract class and Interfaces [4marks]', 'Java Programing', '2022', 1),
(17, 'Explain Thread Synchronization [3marks]', 'Java Programing', '2022', 1),
(18, 'plain InputstreamReader and OutputStream Writer [3marks]', 'Java Programing', '2022', 1);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Stu_Id` int(5) NOT NULL,
  `First_name` varchar(10) NOT NULL,
  `Last_name` varchar(10) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`A_ID`),
  ADD UNIQUE KEY `mobile` (`mobile`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`F_id`),
  ADD UNIQUE KEY `mobile` (`mobile`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`Q_Id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Stu_Id`),
  ADD UNIQUE KEY `mobile` (`mobile`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `A_ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `F_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `Q_Id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `Stu_Id` int(5) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
