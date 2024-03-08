-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2024 at 07:41 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `todo`
--

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `roles_id` int(11) NOT NULL,
  `roles_name` varchar(150) DEFAULT NULL,
  `roles_isActive` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`roles_id`, `roles_name`, `roles_isActive`) VALUES
(6, 'Janitor', 0),
(7, 'Secretary', 0),
(8, 'Architect', 0),
(9, 'Bartender', 1),
(10, 'Receptionist', 0),
(11, 'Software Development', 1),
(12, 'React Developer', 1);

-- --------------------------------------------------------

--
-- Table structure for table `todo`
--

CREATE TABLE `todo` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `todo`
--

INSERT INTO `todo` (`id`, `name`, `is_completed`, `created_at`, `updated_at`, `completed_at`, `users_id`) VALUES
(403, 'Wash Clothes', 0, '2024-03-02 10:54:42', NULL, NULL, NULL),
(404, 'Attend Meeting', 0, '2024-03-02 10:58:10', NULL, NULL, 83),
(405, 'Study Magazines', 0, '2024-03-02 11:00:00', '2024-03-02 11:00:07', NULL, 83),
(406, 'Study Watchtowerr', 0, '2024-03-02 11:00:16', '2024-03-04 08:05:03', NULL, 86),
(407, 'Iron Cllothes', 0, '2024-03-02 11:01:28', '2024-03-04 09:23:49', NULL, 83),
(408, 'Water Plants', 0, '2024-03-04 09:37:20', NULL, NULL, 82),
(409, 'Catch Fishes', 0, '2024-03-04 09:38:25', NULL, NULL, 82),
(410, 'Driving School', 0, '2024-03-04 10:02:44', NULL, NULL, 82),
(411, 'Hug Harry', 0, '2024-03-04 10:03:06', '2024-03-04 10:03:23', NULL, 86);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `users_id` int(11) NOT NULL,
  `users_name` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `roles_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`users_id`, `users_name`, `is_active`, `roles_id`) VALUES
(82, 'Ubani Emmanuella Ijeomga ', 0, 0),
(83, 'Ubani Sithri', 0, 0),
(85, 'steph', 0, 0),
(86, 'Ubani E', 0, 0),
(89, 'Jehovah Witneses', 0, 0),
(90, 'hhi', 1, 0),
(91, 'Ubani Samuel', 0, 9),
(92, 'Fowl', 0, 9),
(93, 'ji', 0, 11),
(94, 'stepha', 0, 11),
(95, 'Ubani Emmanuella ', 0, 11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`roles_id`),
  ADD UNIQUE KEY `roles_name` (`roles_name`);

--
-- Indexes for table `todo`
--
ALTER TABLE `todo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Todo` (`name`),
  ADD KEY `users_id` (`users_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`users_id`),
  ADD UNIQUE KEY `name` (`users_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `roles_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `todo`
--
ALTER TABLE `todo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=412;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `users_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `todo`
--
ALTER TABLE `todo`
  ADD CONSTRAINT `todo_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
