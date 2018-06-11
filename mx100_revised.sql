-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2018 at 03:16 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mx100_revised`
--

-- --------------------------------------------------------

--
-- Table structure for table `employer`
--

CREATE TABLE `employer` (
  `employerId` int(255) NOT NULL,
  `account` text NOT NULL,
  `description` text NOT NULL,
  `joindate` date NOT NULL,
  `company` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employer`
--

INSERT INTO `employer` (`employerId`, `account`, `description`, `joindate`, `company`) VALUES
(1, 'andi', 'desc', '2018-06-01', 'company_a'),
(2, 'adi', 'desc', '2018-05-01', 'company_B');

-- --------------------------------------------------------

--
-- Table structure for table `freelancer`
--

CREATE TABLE `freelancer` (
  `freelancerId` int(255) NOT NULL,
  `account` text NOT NULL,
  `description` text NOT NULL,
  `joindate` date NOT NULL,
  `rank` text NOT NULL,
  `point` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `freelancer`
--

INSERT INTO `freelancer` (`freelancerId`, `account`, `description`, `joindate`, `rank`, `point`) VALUES
(1, 'anwar', 'desc', '2018-05-09', 'A', 40),
(2, 'safei', 'desc', '2018-06-02', 'B', 20);

-- --------------------------------------------------------

--
-- Table structure for table `jobpost`
--

CREATE TABLE `jobpost` (
  `jobpostId` int(11) NOT NULL,
  `employerId` int(11) NOT NULL,
  `description` text NOT NULL,
  `datePost` date NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jobpost`
--

INSERT INTO `jobpost` (`jobpostId`, `employerId`, `description`, `datePost`, `status`) VALUES
(1, 1, 'desc', '2018-06-09', 'draft'),
(2, 2, 'desc', '2018-06-06', 'publish'),
(3, 2, 'ooo', '2018-06-11', 'published'),
(6, 1, 'kh', '2018-06-11', 'draft');

-- --------------------------------------------------------

--
-- Table structure for table `jobposthistory`
--

CREATE TABLE `jobposthistory` (
  `jobhistoryId` int(11) NOT NULL,
  `empoyerId` int(11) NOT NULL,
  `description` text NOT NULL,
  `dateModified` date NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jobposthistory`
--

INSERT INTO `jobposthistory` (`jobhistoryId`, `empoyerId`, `description`, `dateModified`, `status`) VALUES
(1, 2, 'desc', '2018-06-09', 'finished');

-- --------------------------------------------------------

--
-- Table structure for table `pointusage`
--

CREATE TABLE `pointusage` (
  `pointId` int(11) NOT NULL,
  `freelancerId` int(11) NOT NULL,
  `dateModified` date NOT NULL,
  `totalPoint` int(11) NOT NULL,
  `reasonChange` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pointusage`
--

INSERT INTO `pointusage` (`pointId`, `freelancerId`, `dateModified`, `totalPoint`, `reasonChange`) VALUES
(1, 1, '2018-06-08', 38, 'applied job'),
(2, 2, '2018-06-08', 18, 'applied job');

-- --------------------------------------------------------

--
-- Table structure for table `submitdata`
--

CREATE TABLE `submitdata` (
  `submitdataId` int(11) NOT NULL,
  `jobpostId` int(11) NOT NULL,
  `freelancerId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `submitdata`
--

INSERT INTO `submitdata` (`submitdataId`, `jobpostId`, `freelancerId`) VALUES
(1, 2, 1),
(2, 2, 2),
(4, 1, 1),
(7, 1, 1),
(8, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employer`
--
ALTER TABLE `employer`
  ADD PRIMARY KEY (`employerId`);

--
-- Indexes for table `freelancer`
--
ALTER TABLE `freelancer`
  ADD PRIMARY KEY (`freelancerId`);

--
-- Indexes for table `jobpost`
--
ALTER TABLE `jobpost`
  ADD PRIMARY KEY (`jobpostId`),
  ADD KEY `employerId` (`employerId`) USING BTREE;

--
-- Indexes for table `jobposthistory`
--
ALTER TABLE `jobposthistory`
  ADD PRIMARY KEY (`jobhistoryId`),
  ADD UNIQUE KEY `employerId` (`empoyerId`);

--
-- Indexes for table `pointusage`
--
ALTER TABLE `pointusage`
  ADD PRIMARY KEY (`pointId`),
  ADD UNIQUE KEY `freelancerId` (`freelancerId`);

--
-- Indexes for table `submitdata`
--
ALTER TABLE `submitdata`
  ADD PRIMARY KEY (`submitdataId`),
  ADD KEY `jobpostId` (`jobpostId`) USING BTREE,
  ADD KEY `freelancerId` (`freelancerId`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employer`
--
ALTER TABLE `employer`
  MODIFY `employerId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `freelancer`
--
ALTER TABLE `freelancer`
  MODIFY `freelancerId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobpost`
--
ALTER TABLE `jobpost`
  MODIFY `jobpostId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `jobposthistory`
--
ALTER TABLE `jobposthistory`
  MODIFY `jobhistoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pointusage`
--
ALTER TABLE `pointusage`
  MODIFY `pointId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `submitdata`
--
ALTER TABLE `submitdata`
  MODIFY `submitdataId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jobpost`
--
ALTER TABLE `jobpost`
  ADD CONSTRAINT `jobpost_ibfk_1` FOREIGN KEY (`employerId`) REFERENCES `employer` (`employerId`);

--
-- Constraints for table `jobposthistory`
--
ALTER TABLE `jobposthistory`
  ADD CONSTRAINT `jobposthistory_ibfk_1` FOREIGN KEY (`empoyerId`) REFERENCES `jobpost` (`employerId`);

--
-- Constraints for table `pointusage`
--
ALTER TABLE `pointusage`
  ADD CONSTRAINT `pointusage_ibfk_1` FOREIGN KEY (`freelancerId`) REFERENCES `freelancer` (`freelancerId`);

--
-- Constraints for table `submitdata`
--
ALTER TABLE `submitdata`
  ADD CONSTRAINT `submitdata_ibfk_1` FOREIGN KEY (`freelancerId`) REFERENCES `freelancer` (`freelancerId`),
  ADD CONSTRAINT `submitdata_ibfk_2` FOREIGN KEY (`jobpostId`) REFERENCES `jobpost` (`jobpostId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
