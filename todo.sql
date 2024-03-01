-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2024 at 10:53 AM
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
(344, 'hhe', 1, '2024-02-14 03:15:27', NULL, '2024-02-14 03:15:42', NULL),
(345, 'i jsmet tyu', 1, '2024-02-14 03:15:35', NULL, '2024-02-14 03:15:37', NULL),
(346, 'hiyah', 1, '2024-02-14 03:15:49', '2024-02-14 03:16:17', '2024-02-14 03:16:19', NULL),
(347, 'hello', 1, '2024-02-14 03:15:54', '2024-02-14 03:16:01', '2024-02-14 03:16:04', NULL),
(354, 'Harry Anele Jebericiah', 1, '2024-02-14 06:51:33', '2024-02-14 06:51:44', '2024-02-14 06:52:15', NULL),
(356, 'hey', 1, '2024-02-18 08:09:26', '2024-02-18 08:09:44', '2024-02-18 08:10:14', NULL),
(357, 'hi', 1, '2024-02-19 02:37:10', NULL, '2024-02-19 02:39:13', NULL),
(358, 'hellow', 1, '2024-02-19 02:39:26', '2024-02-19 02:39:34', '2024-02-19 02:39:36', NULL),
(360, 'never mind', 1, '2024-02-27 08:19:32', '2024-02-27 12:50:08', '2024-02-28 05:40:24', NULL),
(362, 'jj okochaaa', 0, '2024-02-28 05:40:29', '2024-02-28 05:44:42', NULL, NULL),
(363, 'jjjjjccc', 0, '2024-02-28 05:55:38', NULL, NULL, NULL),
(364, 'xx', 0, '2024-02-29 02:51:28', NULL, NULL, NULL),
(382, 'Pound Pepper', 0, '2024-02-29 06:42:58', NULL, NULL, 83),
(383, 'Cook Plantain and Eggs', 1, '2024-02-29 06:43:16', '2024-02-29 06:43:34', '2024-02-29 06:43:40', 81),
(384, 'Pick My Children', 0, '2024-03-01 08:24:55', NULL, NULL, 87);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `users_id` int(11) NOT NULL,
  `users_name` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`users_id`, `users_name`, `is_active`) VALUES
(81, 'Ubani Stephanie Ugonnaia', 1),
(82, 'Ubani Emmanuella Ijeoma', 1),
(83, 'Ubani Sithri', 1),
(84, 'Ubani Emmanuella', 0),
(85, 'steph', 0),
(86, 'Ubani E', 0),
(87, 'Anele Emeka Mekus', 1);

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `todo`
--
ALTER TABLE `todo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=385;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `users_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

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
