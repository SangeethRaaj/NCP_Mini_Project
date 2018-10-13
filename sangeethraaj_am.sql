-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 13, 2018 at 12:38 PM
-- Server version: 10.1.35-MariaDB-cll-lve
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sangeethraaj_am`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendancelist`
--

CREATE TABLE `attendancelist` (
  `SlotNo` int(255) NOT NULL,
  `StudentId` varchar(256) NOT NULL,
  `AttendanceStatus` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendancelist`
--

INSERT INTO `attendancelist` (`SlotNo`, `StudentId`, `AttendanceStatus`) VALUES
(1, 'Raj@outlook.com', 'Present'),
(2, 'Raj@outlook.com', 'Present'),
(3, 'Raj@outlook.com', 'Absent'),
(4, 'Raj@outlook.com', 'Absent'),
(5, 'Raj@outlook.com', 'Present');

-- --------------------------------------------------------

--
-- Table structure for table `classlist`
--

CREATE TABLE `classlist` (
  `ClassId` varchar(256) NOT NULL,
  `UserName` varchar(256) NOT NULL,
  `Name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classlist`
--

INSERT INTO `classlist` (`ClassId`, `UserName`, `Name`) VALUES
('C0', 'itsme@for.ever', 'jill'),
('C1', 'Raj@outlook.com', 'CC'),
('C10', 'vasanth@js.com', 'fr'),
('C11', 'itsme@for.ever', 'classOne'),
('C2', 'abc@yahoo.com', 'EEE'),
('C3', 'atoz@gmail.com', 'Civil'),
('C7', 'itsme@for.ever', 'sas');

-- --------------------------------------------------------

--
-- Table structure for table `currstats`
--

CREATE TABLE `currstats` (
  `stat` varchar(50) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currstats`
--

INSERT INTO `currstats` (`stat`, `value`) VALUES
('classno', 12),
('slotno', 7);

-- --------------------------------------------------------

--
-- Table structure for table `slotslist`
--

CREATE TABLE `slotslist` (
  `Slotno` int(255) NOT NULL,
  `ClassID` varchar(256) NOT NULL,
  `StartTime` varchar(256) NOT NULL,
  `EndTime` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `slotslist`
--

INSERT INTO `slotslist` (`Slotno`, `ClassID`, `StartTime`, `EndTime`) VALUES
(1, 'c11', '2018-07-15 09:00:00', '2018-07-15 10:00:00'),
(2, 'c12', '2018-07-16 09:00:00', '2018-07-16 10:00:00'),
(2, 'c11', '2018-07-17 09:00:00', '2018-07-17 09:00:00'),
(3, 'c13', '2018-07-18 09:00:00', '2018-07-18 10:00:00'),
(1, 'c11', '2018-07-19 09:00:00', '2018-07-19 10:00:00'),
(8, 'null', '09.10.2018 15:03', '10.10.2018 15:03'),
(9, 'C0', '02.10.2018 15:00', '02.10.2018 16:00');

-- --------------------------------------------------------

--
-- Table structure for table `Studentslist`
--

CREATE TABLE `Studentslist` (
  `SID` varchar(255) NOT NULL,
  `ClassID` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Studentslist`
--

INSERT INTO `Studentslist` (`SID`, `ClassID`) VALUES
('1', 'c11'),
('2', 'c12'),
('2', 'c11'),
('3', 'c13'),
('1', 'c11'),
('Itsme@for.ever', 'C0'),
('Itsme@for.ever', 'C1'),
('itsme@for.ever', 'C7'),
('vasanth@js.com', 'C0'),
('itsme@for.ever', 'C11');

-- --------------------------------------------------------

--
-- Table structure for table `userlist`
--

CREATE TABLE `userlist` (
  `UserName` varchar(256) NOT NULL,
  `Password` varchar(256) NOT NULL,
  `Name` varchar(256) NOT NULL,
  `RollNo` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlist`
--

INSERT INTO `userlist` (`UserName`, `Password`, `Name`, `RollNo`) VALUES
('Arun@gmail.com', 'arun13', 'Arun', '9'),
('itsme@for.ever', 'gg', 'Its Me Forever', '747'),
('KPA@gmail.com', 'ram12', 'KPA', '1'),
('Raj@outlook.com', 'San42', 'Sangeeth', '42'),
('Senthil@gmail.com', 'MK123', 'Kumaran', '32'),
('Valli@yahoo.com', 'Appan', 'Valliyappan', '45'),
('vasanth@js.com', 'vasanth', 'Vasanth J S', '54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classlist`
--
ALTER TABLE `classlist`
  ADD PRIMARY KEY (`ClassId`);

--
-- Indexes for table `currstats`
--
ALTER TABLE `currstats`
  ADD PRIMARY KEY (`stat`);

--
-- Indexes for table `userlist`
--
ALTER TABLE `userlist`
  ADD PRIMARY KEY (`UserName`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
