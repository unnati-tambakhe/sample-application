-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 22, 2020 at 02:32 PM
-- Server version: 5.7.28-0ubuntu0.18.04.4
-- PHP Version: 7.2.24-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `match_tournament`
--

-- --------------------------------------------------------

--
-- Table structure for table `flyway_schema_history`
--

CREATE TABLE `flyway_schema_history` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flyway_schema_history`
--

INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES
(1, '1', 'Create player table', 'SQL', 'V1__Create_player_table.sql', 2064689280, 'root', '2020-01-22 08:43:28', 349, 1),
(2, '2', 'Create match table', 'SQL', 'V2__Create_match_table.sql', 1923786839, 'root', '2020-01-22 08:43:29', 323, 1),
(3, '3', 'Create player match mapping table', 'SQL', 'V3__Create_player_match_mapping_table.sql', -1834285077, 'root', '2020-01-22 08:43:29', 336, 1),
(4, '4', 'Create Foreign Key1', 'SQL', 'V4__Create_Foreign_Key1.sql', -315357842, 'root', '2020-01-22 08:43:30', 952, 1),
(5, '5', 'Create Foreign Key2', 'SQL', 'V5__Create_Foreign_Key2.sql', -1863686255, 'root', '2020-01-22 08:43:31', 826, 1),
(6, '6', 'Insert Records in tables', 'SQL', 'V6__Insert_Records_in_tables.sql', 2075582832, 'root', '2020-01-22 08:43:31', 108, 1);

-- --------------------------------------------------------

--
-- Table structure for table `match_details`
--

CREATE TABLE `match_details` (
  `match_id` int(11) NOT NULL,
  `series_name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `match_details`
--

INSERT INTO `match_details` (`match_id`, `series_name`, `location`) VALUES
(1, 'Asia Cup', 'Mumbai Stadium'),
(2, 'World Cup', 'Kolkata'),
(3, 'Ranji Trophy', 'Pune'),
(4, 'IPL', 'Mumbai Stadium');

-- --------------------------------------------------------

--
-- Table structure for table `player_details`
--

CREATE TABLE `player_details` (
  `player_id` int(11) NOT NULL,
  `player_name` varchar(100) NOT NULL,
  `cricket_team` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player_details`
--

INSERT INTO `player_details` (`player_id`, `player_name`, `cricket_team`) VALUES
(1, 'Brett Lee', 'Australia'),
(2, 'Virat Kohli', 'India'),
(3, 'M S Dhoni', 'Australia'),
(4, 'Kumar Sangakara', 'Sri Lanka');

-- --------------------------------------------------------

--
-- Table structure for table `player_match_mapping_details`
--

CREATE TABLE `player_match_mapping_details` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player_match_mapping_details`
--

INSERT INTO `player_match_mapping_details` (`id`, `player_id`, `match_id`, `score`) VALUES
(1, 1, 1, 33),
(2, 1, 3, 102),
(3, 2, 1, 78),
(4, 2, 2, 55),
(5, 3, 1, 65);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `flyway_schema_history`
--
ALTER TABLE `flyway_schema_history`
  ADD PRIMARY KEY (`installed_rank`),
  ADD KEY `flyway_schema_history_s_idx` (`success`);

--
-- Indexes for table `match_details`
--
ALTER TABLE `match_details`
  ADD PRIMARY KEY (`match_id`);

--
-- Indexes for table `player_details`
--
ALTER TABLE `player_details`
  ADD PRIMARY KEY (`player_id`);

--
-- Indexes for table `player_match_mapping_details`
--
ALTER TABLE `player_match_mapping_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Player_Id` (`player_id`),
  ADD KEY `FK_Match_Id` (`match_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `player_match_mapping_details`
--
ALTER TABLE `player_match_mapping_details`
  ADD CONSTRAINT `FK_Match_Id` FOREIGN KEY (`match_id`) REFERENCES `match_details` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Player_Id` FOREIGN KEY (`player_id`) REFERENCES `player_details` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
