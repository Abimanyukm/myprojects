-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 02, 2021 at 09:15 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sngc`
--

-- --------------------------------------------------------

--
-- Table structure for table `agent_registration`
--

CREATE TABLE IF NOT EXISTS `agent_registration` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `district` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `agent_registration`
--

INSERT INTO `agent_registration` (`aid`, `name`, `district`, `location`, `phone`, `email`) VALUES
(20, 'abi', 'thrissur', 'Thriprayar', '09645545352', 'abi@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE IF NOT EXISTS `donations` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  `oid` int(11) NOT NULL,
  `donate_date` date NOT NULL,
  `donation_time` varchar(11) NOT NULL,
  `donate_description` varchar(300) NOT NULL,
  `donate_status` varchar(20) NOT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `donations`
--

INSERT INTO `donations` (`did`, `uid`, `aid`, `oid`, `donate_date`, `donation_time`, `donate_description`, `donate_status`) VALUES
(8, 24, 20, 7, '2021-01-06', '11AM', 'donating on behalf of father', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `logid` int(20) NOT NULL AUTO_INCREMENT,
  `uid` int(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=77 ;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`logid`, `uid`, `username`, `password`, `type`, `status`) VALUES
(19, 0, 'admin@gmail.com', 'admin', 'admin', 'approved'),
(74, 20, 'abi@gmail.com', 'abi123', 'agent', 'approved'),
(75, 24, 'jibin@gmail.com', 'jibin123', 'user', 'approved'),
(76, 7, 'orphanage1@gmail.com', 'orph123', 'orphanage', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `orphanage`
--

CREATE TABLE IF NOT EXISTS `orphanage` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(200) NOT NULL,
  `district` varchar(30) NOT NULL,
  `no_orphans` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(11) NOT NULL,
  `need_status` varchar(30) NOT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `orphanage`
--

INSERT INTO `orphanage` (`oid`, `aid`, `name`, `address`, `district`, `no_orphans`, `phone`, `email`, `password`, `need_status`) VALUES
(7, 20, 'orphanage 1', 'orph1 address', 'thrissur', '21', '9877665676', 'orphanage1@gmail.com', 'orph123', 'needed');

-- --------------------------------------------------------

--
-- Table structure for table `orphanage_complaint`
--

CREATE TABLE IF NOT EXISTS `orphanage_complaint` (
  `ocid` int(11) NOT NULL AUTO_INCREMENT,
  `oid` int(11) NOT NULL,
  `complaint_date` date NOT NULL,
  `complaint_description` varchar(400) NOT NULL,
  PRIMARY KEY (`ocid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `orphanage_complaint`
--


-- --------------------------------------------------------

--
-- Table structure for table `orphanage_response`
--

CREATE TABLE IF NOT EXISTS `orphanage_response` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `oid` int(11) NOT NULL,
  `did` int(11) NOT NULL,
  `date` date NOT NULL,
  `response` varchar(400) NOT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `orphanage_response`
--


-- --------------------------------------------------------

--
-- Table structure for table `user_complaint`
--

CREATE TABLE IF NOT EXISTS `user_complaint` (
  `ucid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `complaint_date` date NOT NULL,
  `complaint_description` varchar(400) NOT NULL,
  PRIMARY KEY (`ucid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `user_complaint`
--


-- --------------------------------------------------------

--
-- Table structure for table `user_registration`
--

CREATE TABLE IF NOT EXISTS `user_registration` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `user_registration`
--

INSERT INTO `user_registration` (`uid`, `name`, `address`, `phone`, `email`, `password`) VALUES
(24, 'Jibin', 'jibin address', '09645548765', 'jibin@gmail.com', 'jibin123');
