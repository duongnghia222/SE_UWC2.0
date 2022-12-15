-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2022 at 02:42 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `se_asm`
--
create schema se_asm;
use se_asm;
-- --------------------------------------------------------

--
-- Table structure for table `assign_vehicle`
--
CREATE TABLE `assign_vehicle` (
  `emp_username` varchar(50) NOT NULL,
  `vehicle_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assign_vehicle`
--

INSERT INTO `assign_vehicle` (`emp_username`, `vehicle_id`) VALUES
('baotien', '1001'),
('hoainam', '2001'),
('hoangluong', '2003'),
('khanhhung', '2004'),
('trantien', '1003');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `chat_id` int(11) NOT NULL,
  `from_id` varchar(50) NOT NULL,
  `to_id` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`chat_id`, `from_id`, `to_id`, `message`, `time`) VALUES
(15, 'congthanh', 'BO', 'xin chao', '2022-12-14 03:02:45'),
(17, 'congthanh', 'BO', 'hom nay co nhiem vu nao', '2022-12-14 03:04:45'),
(18, 'BO', 'congthanh', 'co mot nhiem vu', '2022-12-14 03:05:45'),
(19, 'congthanh', 'BO', 'nhiem vu nao', '2022-12-14 03:04:45');

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `conversation_id` int(11) NOT NULL,
  `user_1` varchar(50) NOT NULL,
  `user_2` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`conversation_id`, `user_1`, `user_2`) VALUES
(3, 'BO', 'congthanh'),
(4, 'BO', 'khanhhung'),
(6, 'BO', 'trumtuan'),
(7, 'BO', 'baotien'),
(8, 'BO', 'minhquan');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT '123',
  `name` varchar(50) DEFAULT NULL,
  `role` enum('janitor','collector') DEFAULT NULL,
  `status` enum('assigned','unassigned') NOT NULL DEFAULT 'unassigned',
  `email` varchar(50) DEFAULT NULL,
  `phone_num` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`username`, `password`, `name`, `role`, `status`, `email`, `phone_num`) VALUES
('baotien', 'admin', 'BAO TIEN', 'collector', 'unassigned', 'bt@gmail.com', 794888879),
('BO', 'admin', 'BO', 'collector', 'unassigned', 'BO@gmail.com', 530984395),
('congthanh', 'admin', 'CONG THANH', 'collector', 'assigned', 'ctgmail.com', 952507267),
('ducnghia', 'admin', 'DUC NGHIA', 'collector', 'unassigned', 'ducnghia@gmail.com', 317671993),
('hoainam', 'admin', 'hoainam', 'janitor', 'assigned', 'hn@gmail.com', 379290087),
('hoangluong', 'admin', 'hoang luong', 'janitor', 'assigned', 'hl@gmail.com', 131115640),
('huy', 'admin', 'huy', 'janitor', 'assigned', 'huy@gmail.com', 589244125),
('khanhhung', 'admin', 'KHANH HUNG', 'janitor', 'unassigned', 'kh@gmail.com', 589244125),
('minhquan', 'admin', 'MINH QUAN', 'collector', 'assigned', 'mq@gmail.com', 629299202),
('trantien', 'admin', 'tran tien', 'collector', 'assigned', 'tt@gmail.com', 885960212),
('trumtuan', 'admin', 'MINH TUAN', 'janitor', 'assigned', 'bv@gmail.com', 830556961);

-- --------------------------------------------------------

--
-- Table structure for table `mcp`
--

CREATE TABLE `mcp` (
  `id` int(11) NOT NULL,
  `capacity` int(10) DEFAULT NULL,
  `current` int(10) NOT NULL,
  `status` enum('full','available') DEFAULT 'available',
  `location` varchar(50) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longtitude` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mcp`
--

INSERT INTO `mcp` (`id`, `capacity`, `current`, `status`, `location`, `latitude`, `longtitude`) VALUES
(9001, 100, 75, 'full', 'KTX khu A DHQG TPHCM', '10.8782158', '106.8060595'),
(9002, 120, 110, 'full', 'Dai hoc Bach khoa TPHCM', '10.772075', '106.6535244'),
(9003, 80, 75, 'full', 'Vincom', '10.850153', '106.7649212'),
(9004, 100, 20, 'full', 'Dai hoc SPKT TPHCM', '10.8507214', '106.7697336'),
(9005, 150, 10, 'available', 'Dam Sen', '10.7662', '106.642');

-- --------------------------------------------------------

--
-- Table structure for table `task_collector-collector`
--

CREATE TABLE `task_collector-collector` (
  `id` int(11) NOT NULL,
  `emp_username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `task_collector-collector`
--

INSERT INTO `task_collector-collector` (`id`, `emp_username`) VALUES
(10012, 'minhquan'),
(10012, 'trantien'),
(10013, 'congthanh');

-- --------------------------------------------------------

--
-- Table structure for table `task_collector-info`
--

CREATE TABLE `task_collector-info` (
  `id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT addtime(curtime(),'1:0:0'),
  `endtime` datetime DEFAULT addtime(`time`,'3:0:0')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `task_collector-info`
--

INSERT INTO `task_collector-info` (`id`, `description`, `time`, `endtime`) VALUES
(10012, 'Nhiệm vụ 2', '2022-12-01 15:56:00', '2022-12-01 18:56:00'),
(10013, 'Nhiệm vụ 3', '2022-12-15 06:57:00', '2022-12-15 09:57:00');

-- --------------------------------------------------------

--
-- Table structure for table `task_collector-mcp`
--

CREATE TABLE `task_collector-mcp` (
  `id` int(11) NOT NULL,
  `mcp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `task_collector-mcp`
--

INSERT INTO `task_collector-mcp` (`id`, `mcp_id`) VALUES
(10012, 9001),
(10012, 9002),
(10012, 9003),
(10012, 9004),
(10013, 9001);

-- --------------------------------------------------------

--
-- Table structure for table `task_janitor`
--

CREATE TABLE `task_janitor` (
  `id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT addtime(curtime(),'1:0:0'),
  `endtime` datetime DEFAULT addtime(`time`,'3:0:0'),
  `emp_username` varchar(50) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `task_janitor`
--

INSERT INTO `task_janitor` (`id`, `description`, `time`, `endtime`, `emp_username`, `area`) VALUES
(20006, 'Nhiệm vụ 1', '2022-12-10 05:58:00', '2022-12-10 08:58:00', 'hoainam', 'DAI HOC BACH KHOA'),
(20007, 'Nhiệm vụ 2', '2022-12-09 05:58:00', '2022-12-09 08:58:00', 'huy', 'Suoi Cac'),
(20008, 'Nhiệm vụ 3', '2022-12-17 05:58:00', '2022-12-17 08:58:00', 'trumtuan', 'KTX KHU A');

-- --------------------------------------------------------

--
-- Table structure for table `troller`
--

CREATE TABLE `troller` (
  `troller_id` varchar(50) NOT NULL,
  `area` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `troller`
--

INSERT INTO `troller` (`troller_id`, `area`) VALUES
('2001', 'Quan Thu Duc'),
('2002', 'Quan 2'),
('2003', 'Quan 9'),
('2004', 'Quan 1'),
('2005', 'Quan 10');

-- --------------------------------------------------------

--
-- Table structure for table `truck`
--

CREATE TABLE `truck` (
  `truck_id` varchar(50) NOT NULL,
  `fuel` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `truck`
--

INSERT INTO `truck` (`truck_id`, `fuel`) VALUES
('1001', 80),
('1002', 70),
('1003', 70),
('1004', 85);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `id` varchar(50) NOT NULL,
  `type` enum('truck','troller') DEFAULT NULL,
  `status` enum('unassigned','assigned') DEFAULT 'unassigned'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`id`, `type`, `status`) VALUES
('1001', 'truck', 'unassigned'),
('1002', 'truck', 'unassigned'),
('1003', 'truck', 'unassigned'),
('1004', 'truck', 'unassigned'),
('2001', 'troller', 'unassigned'),
('2002', 'troller', 'unassigned'),
('2003', 'troller', 'unassigned'),
('2004', 'troller', 'unassigned'),
('2005', 'troller', 'unassigned');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assign_vehicle`
--
ALTER TABLE `assign_vehicle`
  ADD PRIMARY KEY (`emp_username`,`vehicle_id`),
  ADD KEY `vehicle_id` (`vehicle_id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`chat_id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`conversation_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `mcp`
--
ALTER TABLE `mcp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_collector-collector`
--
ALTER TABLE `task_collector-collector`
  ADD PRIMARY KEY (`id`,`emp_username`),
  ADD KEY `emp_username` (`emp_username`);

--
-- Indexes for table `task_collector-info`
--
ALTER TABLE `task_collector-info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_collector-mcp`
--
ALTER TABLE `task_collector-mcp`
  ADD PRIMARY KEY (`id`,`mcp_id`),
  ADD KEY `mcp_id` (`mcp_id`);

--
-- Indexes for table `task_janitor`
--
ALTER TABLE `task_janitor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emp_username` (`emp_username`);

--
-- Indexes for table `troller`
--
ALTER TABLE `troller`
  ADD PRIMARY KEY (`troller_id`);

--
-- Indexes for table `truck`
--
ALTER TABLE `truck`
  ADD PRIMARY KEY (`truck_id`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `chat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `conversation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mcp`
--
ALTER TABLE `mcp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9006;

--
-- AUTO_INCREMENT for table `task_collector-info`
--
ALTER TABLE `task_collector-info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10014;

--
-- AUTO_INCREMENT for table `task_janitor`
--
ALTER TABLE `task_janitor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20010;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assign_vehicle`
--
ALTER TABLE `assign_vehicle`
  ADD CONSTRAINT `assign_vehicle_ibfk_1` FOREIGN KEY (`emp_username`) REFERENCES `employee` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assign_vehicle_ibfk_2` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_collector-collector`
--
ALTER TABLE `task_collector-collector`
  ADD CONSTRAINT `task_collector-collector_ibfk_1` FOREIGN KEY (`id`) REFERENCES `task_collector-info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_collector-collector_ibfk_2` FOREIGN KEY (`emp_username`) REFERENCES `employee` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_collector-mcp`
--
ALTER TABLE `task_collector-mcp`
  ADD CONSTRAINT `task_collector-mcp_ibfk_1` FOREIGN KEY (`id`) REFERENCES `task_collector-info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_collector-mcp_ibfk_2` FOREIGN KEY (`mcp_id`) REFERENCES `mcp` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_janitor`
--
ALTER TABLE `task_janitor`
  ADD CONSTRAINT `task_janitor_ibfk_1` FOREIGN KEY (`emp_username`) REFERENCES `employee` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `troller`
--
ALTER TABLE `troller`
  ADD CONSTRAINT `troller_ibfk_1` FOREIGN KEY (`troller_id`) REFERENCES `vehicle` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `truck`
--
ALTER TABLE `truck`
  ADD CONSTRAINT `truck_ibfk_1` FOREIGN KEY (`truck_id`) REFERENCES `vehicle` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;