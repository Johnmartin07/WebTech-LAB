-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2018 at 10:17 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `musify`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `custid` int(11) NOT NULL,
  `lastname` varchar(10) NOT NULL,
  `firstname` varchar(10) NOT NULL,
  `middlleinitial` varchar(10) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(16) NOT NULL,
  `age` tinyint(100) NOT NULL DEFAULT '18',
  `email` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `cust_status` enum('active','pedning') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `pack_id` int(11) NOT NULL,
  `pack_name` varchar(45) DEFAULT NULL,
  `pack_desc` varchar(45) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `com_name` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `custlast_name` varchar(45) NOT NULL,
  `custfirst_name` varchar(45) NOT NULL,
  `pack_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `pay_status` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `provider`
--

CREATE TABLE `provider` (
  `comp_id` int(11) NOT NULL,
  `comp_name` varchar(40) NOT NULL,
  `comp_username` varchar(16) NOT NULL,
  `comp_pass` varchar(16) NOT NULL,
  `comp_cn` tinyint(15) NOT NULL,
  `comp_ea` varchar(30) NOT NULL,
  `comp_addr` varchar(100) NOT NULL,
  `permit_bir` blob NOT NULL,
  `permit_mayor` blob,
  `permit_business` blob NOT NULL,
  `permit_barang` blob,
  `logo` tinyblob NOT NULL,
  `comp_status` enum('active','pending') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rentals`
--

CREATE TABLE `rentals` (
  `custlastname` varchar(45) NOT NULL,
  `custfirstname` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `time` time(6) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `com_name` varchar(45) NOT NULL,
  `status` enum('accepted','declined','cancelled','done') DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`custid`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`pack_id`),
  ADD KEY `comp_name_idx` (`com_name`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`pack_id`),
  ADD KEY `custlast_name_idx` (`custlast_name`),
  ADD KEY `custfirst_name_idx` (`custfirst_name`);

--
-- Indexes for table `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`comp_id`),
  ADD UNIQUE KEY `company_name` (`comp_name`),
  ADD UNIQUE KEY `comp_ea` (`comp_ea`),
  ADD UNIQUE KEY `comp_username` (`comp_username`);

--
-- Indexes for table `rentals`
--
ALTER TABLE `rentals`
  ADD PRIMARY KEY (`custlastname`,`com_name`),
  ADD KEY `comp_name_idx` (`com_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `custid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `provider`
--
ALTER TABLE `provider`
  MODIFY `comp_id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
