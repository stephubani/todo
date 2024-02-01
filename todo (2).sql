-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2024 at 09:30 AM
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
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `completed_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `todo`
--

INSERT INTO `todo` (`id`, `name`, `is_completed`, `created_at`, `updated_at`, `completed_at`) VALUES
(5, 'buy ferarri', 1, '2024-01-31 07:07:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'buy macbook', 1, '2024-01-31 07:56:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Wash Clothes', 1, '2024-01-31 07:58:08', '0000-00-00 00:00:00', '2024-02-01 07:40:05'),
(8, 'slap samuel', 1, '2024-02-01 07:41:22', '2024-02-01 08:07:03', '2024-02-01 07:41:33'),
(9, 'pay samuels school fees', 1, '2024-02-01 08:27:33', '0000-00-00 00:00:00', '2024-02-01 08:27:42'),
(10, 'fix bugs', 0, '2024-02-01 09:07:21', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'get a book', 1, '2024-02-01 09:08:03', '0000-00-00 00:00:00', '2024-02-01 09:15:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `todo`
--
ALTER TABLE `todo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Todo` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `todo`
--
ALTER TABLE `todo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
