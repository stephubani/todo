-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2024 at 10:29 AM
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
-- Database: `birthday`
--
CREATE DATABASE IF NOT EXISTS `birthday` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `birthday`;

-- --------------------------------------------------------

--
-- Table structure for table `gift`
--

CREATE TABLE `gift` (
  `gift_id` int(11) NOT NULL,
  `gift_name` varchar(50) DEFAULT NULL,
  `guest_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `gift`
--

INSERT INTO `gift` (`gift_id`, `gift_name`, `guest_id`) VALUES
(1, 'Cash', 1),
(2, 'Blender', 1),
(3, 'Cloth', 3),
(4, 'Shoe', 7),
(5, 'Shoe', 1),
(6, 'Car', 4);

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE `guest` (
  `guest_id` int(11) NOT NULL,
  `guest_fullname` varchar(100) NOT NULL,
  `guest_phone` varchar(50) NOT NULL,
  `guest_email` varchar(50) NOT NULL,
  `guest_gender` enum('Female','Male') NOT NULL,
  `guest_state` int(11) NOT NULL,
  `guest_datereg` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `guest`
--

INSERT INTO `guest` (`guest_id`, `guest_fullname`, `guest_phone`, `guest_email`, `guest_gender`, `guest_state`, `guest_datereg`) VALUES
(1, 'Adedayo Kolawole', '0804564667', 'a@b.com', 'Female', 1, '2017-03-24 14:14:30'),
(2, 'Tijani Abayomi', '0892345688', 'x@y.com', 'Male', 5, '2017-08-24 14:14:59'),
(3, 'John Smith', '0802345667', 'john@yahoo.com', 'Male', 1, '2017-01-24 14:15:59'),
(4, 'JJ Okocha', '0803456677', 'jj@y.com', 'Male', 6, '2017-05-24 14:16:54'),
(5, 'Taribo West', '', 't@x.com', 'Male', 16, '2017-08-24 14:18:02'),
(6, 'Damilola Oni', '0802345678', 'd@y.com', 'Female', 36, '2017-08-24 14:21:01'),
(7, 'Tunde Ojo', '0804556788', 'tunde@yahoo.com', 'Male', 6, '2017-08-24 14:22:14'),
(8, 'Janet Jackson', '0832345678', 'jack@y.com', 'Female', 12, '2017-08-24 14:22:51');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `state_id` int(11) NOT NULL DEFAULT 0,
  `state_name` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`state_id`, `state_name`) VALUES
(1, 'Abia'),
(2, 'Adamawa'),
(3, 'Akwa Ibom'),
(4, 'Anambra'),
(5, 'Bauchi'),
(6, 'Bayelsa'),
(7, 'Benue'),
(8, 'Borno'),
(9, 'Cross River'),
(10, 'Delta'),
(11, 'Ebonyi'),
(12, 'Edo'),
(13, 'Ekiti'),
(14, 'Enugu'),
(15, 'Gombe'),
(16, 'Imo'),
(17, 'Jigawa'),
(18, 'Kaduna'),
(19, 'Kano'),
(20, 'Katsina'),
(21, 'Kebbi'),
(22, 'Kogi'),
(23, 'Kwara'),
(24, 'Lagos'),
(25, 'Nassarawa'),
(26, 'Niger'),
(27, 'Ogun'),
(28, 'Ondo'),
(29, 'Osun'),
(30, 'Oyo'),
(31, 'Plateau'),
(32, 'Rivers'),
(33, 'Sokoto'),
(34, 'Taraba'),
(35, 'Yobe'),
(36, 'Zamfara'),
(37, 'FCT'),
(38, 'Foreign');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gift`
--
ALTER TABLE `gift`
  ADD PRIMARY KEY (`gift_id`);

--
-- Indexes for table `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`guest_id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`state_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gift`
--
ALTER TABLE `gift`
  MODIFY `gift_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `guest`
--
ALTER TABLE `guest`
  MODIFY `guest_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Database: `demoapp`
--
CREATE DATABASE IF NOT EXISTS `demoapp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `demoapp`;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `cust_id` int(11) NOT NULL,
  `cust_fname` varchar(50) NOT NULL,
  `cust_lname` varchar(50) NOT NULL,
  `cust_dob` date NOT NULL,
  `cust_phone` varchar(50) NOT NULL,
  `cust_city` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='This table stores the information about our customers';

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`cust_id`, `cust_fname`, `cust_lname`, `cust_dob`, `cust_phone`, `cust_city`) VALUES
(1, 'Olawole', 'Ajao', '1990-03-07', '080123456', 'Lagos'),
(2, 'Saheed', 'Balogun', '1998-03-07', '0802345687', 'Ibadan'),
(3, 'Abiola', 'Lawal', '2007-03-07', '0236789997', 'Lagos'),
(4, 'Oluwole', 'Idowu', '2009-03-07', '0803467778', 'Akure'),
(5, 'Tola', 'Oni', '1983-03-07', '0804566456', 'Ibadan'),
(6, 'Tola', 'Oni', '2000-03-07', '0803564588', 'Ondo'),
(7, 'Stephanie', 'Ubani', '1990-02-13', '07061767554', 'Lagos'),
(8, 'Stephanie', 'Ubani', '1990-02-13', '07061767554', 'Lagos'),
(9, 'Stephanie', 'Ubani', '1990-02-13', '07061767554', 'Lagos'),
(10, 'Stephanie', 'Ubani', '1990-02-13', '07061767554', 'Lagos'),
(11, 'Stephanie', 'Ubani', '1990-02-13', '07061767554', 'Lagos'),
(12, 'Emmanuella', 'Ubani', '2002-12-03', '07061767554', 'Lagos');

-- --------------------------------------------------------

--
-- Table structure for table `customer_orders`
--

CREATE TABLE `customer_orders` (
  `order_id` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_amt` float NOT NULL,
  `order_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '=1 if paid, 0 if not paid',
  `order_customerid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='This table stores the orders made by the customers';

--
-- Dumping data for table `customer_orders`
--

INSERT INTO `customer_orders` (`order_id`, `order_date`, `order_amt`, `order_status`, `order_customerid`) VALUES
(1, '2017-01-07 09:55:05', 2000, 1, 1),
(2, '2017-03-02 09:55:24', 1000, 1, 2),
(3, '2017-03-04 09:55:43', 6000, 1, 1),
(4, '2017-03-04 09:55:57', 2300, 1, 3),
(5, '2017-03-05 09:56:09', 1500, 0, 2),
(6, '2017-03-06 09:56:19', 600, 0, 4),
(7, '2017-03-07 09:57:27', 4900, 1, 5),
(8, '2017-02-07 09:57:47', 7230, 1, 3),
(9, '2017-01-07 10:12:09', 2750, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE `newsletter` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `datereg` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `newsletter`
--

INSERT INTO `newsletter` (`id`, `email`, `datereg`) VALUES
(1, 'ubanisithri@gmail.com', '2023-12-22 09:34:17'),
(2, 'eziwaco4th@gmail.com', '2023-12-22 10:01:15'),
(3, 'ubaniellaa@gmail.com', '2023-12-22 10:03:02'),
(4, 'ubaniellaa@gmail.com', '2023-12-22 10:03:03'),
(5, 'ubaniellaa@gmail.com', '2023-12-22 10:04:06'),
(6, 'ubaniellaa@gmail.com', '2023-12-22 10:04:07'),
(7, 'eziwaco4th@gmail.com', '2023-12-22 10:04:32'),
(8, 'ubaniellaa@gmail.com', '2023-12-22 10:06:35'),
(9, 'ubaniellaa@gmail.com', '2023-12-22 11:02:05');

-- --------------------------------------------------------

--
-- Table structure for table `profile_images`
--

CREATE TABLE `profile_images` (
  `img_id` int(11) NOT NULL,
  `img_filename` varchar(255) NOT NULL,
  `img_date_uploaded` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `profile_images`
--

INSERT INTO `profile_images` (`img_id`, `img_filename`, `img_date_uploaded`) VALUES
(6, 'demo_app_1702478395_6579c23b78939_', '2023-12-13 14:39:55'),
(7, 'demo_app_1702478409_6579c249cd554_', '2023-12-13 14:40:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_fullname` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_datereg` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_fullname`, `user_email`, `user_password`, `user_datereg`) VALUES
(1, 'Ubani Stephanie', 'ubanistephanieugonna@gmail.com', '1234', '2023-12-14 09:14:54'),
(2, 'Ubani Samuel', 'ubaniellaa@gmail.com', '198976', '2023-12-14 09:38:09'),
(3, 'Ubani E', 'ubaniellaa@gmail.com', '198976', '2023-12-14 09:40:20'),
(4, 'Ezinwanyi Happiness', 'eziwaco4th@gmail.com', 'stephanie2003', '2023-12-14 09:40:57'),
(5, 'Ubani Sithri', 'eziwaco4th@gmail.com', '555245', '2023-12-14 10:03:25'),
(6, 'Ubani Sithri', 'eziwaco4th@gmail.com', '555245', '2023-12-14 10:05:21'),
(7, 'Anele Annabella', 'aneleruth@gmail.com', '2016', '2023-12-14 10:59:59'),
(8, 'Anele Jasmine', 'aneleemeka@gmail.com', '2016', '2023-12-14 11:00:51'),
(9, 'Anele Harry', 'aneleemeka@gmail.com', '2018', '2023-12-14 11:03:08'),
(10, 'Ubani Sithri', 'eziwaco4th@gmail.com', '1111', '2023-12-14 12:13:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indexes for table `customer_orders`
--
ALTER TABLE `customer_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile_images`
--
ALTER TABLE `profile_images`
  ADD PRIMARY KEY (`img_id`),
  ADD UNIQUE KEY `uniq_file` (`img_filename`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customer_orders`
--
ALTER TABLE `customer_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `profile_images`
--
ALTER TABLE `profile_images`
  MODIFY `img_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Database: `devconfdb`
--
CREATE DATABASE IF NOT EXISTS `devconfdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `devconfdb`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(45) DEFAULT NULL,
  `admin_email` varchar(200) NOT NULL,
  `admin_password` varchar(200) DEFAULT NULL,
  `admin_lastloggedin` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_email`, `admin_password`, `admin_lastloggedin`) VALUES
(1, 'admin one', 'adminone@gmail.com', '$2y$10$BZjtI78npzfEGlsk5jzur.OW2xdeaZJeAH6B3JzDxXKZyGHClZCqm', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `breakout_topics`
--

CREATE TABLE `breakout_topics` (
  `topic_id` int(11) NOT NULL,
  `topic_name` varchar(100) DEFAULT NULL,
  `topic_level` int(11) DEFAULT NULL,
  `topic_status` enum('1','0') DEFAULT NULL,
  `topic_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `breakout_topics`
--

INSERT INTO `breakout_topics` (`topic_id`, `topic_name`, `topic_level`, `topic_status`, `topic_image`) VALUES
(1, 'Software Engineering', 3, '1', 'devconf_1702997995_6581afebebeab_Image about food in Desene✏ by Daniela Olinic.jpg'),
(2, 'Software Development', 1, '0', 'devconf_1702998376_6581b1686afa7_div_wireframe[38].png'),
(3, 'Biology', 2, '0', 'devconf_1703012984_6581ea7865199_blueberry_cake.png'),
(4, 'Chemistry', 1, '0', 'devconf_1703013944_6581ee38388f9_cakes_images (3).jpeg'),
(5, 'PHP', 4, '1', 'devconf_1703071996_6582d0fc80daf_bakedwithlove.jpg'),
(6, 'Jamb', 4, '1', 'devconf_1703072028_6582d11cc83d6_chocolate_cake.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `comment_by` int(11) DEFAULT NULL,
  `comment_text` text DEFAULT NULL,
  `comment_postid` int(11) DEFAULT NULL,
  `comment_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donation`
--

CREATE TABLE `donation` (
  `don_id` int(11) NOT NULL,
  `don_amt` float NOT NULL,
  `don_userid` int(11) DEFAULT NULL,
  `don_date` timestamp NULL DEFAULT current_timestamp(),
  `don_status` enum('pending','failed','paid') NOT NULL DEFAULT 'pending',
  `don_fullname` varchar(100) DEFAULT NULL,
  `don_email` varchar(100) DEFAULT NULL,
  `don_reference` varchar(40) DEFAULT NULL,
  `don_paygate` text DEFAULT NULL,
  `don_dateupdated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donation`
--

INSERT INTO `donation` (`don_id`, `don_amt`, `don_userid`, `don_date`, `don_status`, `don_fullname`, `don_email`, `don_reference`, `don_paygate`, `don_dateupdated`) VALUES
(1, 5000, 22, '2024-01-10 12:10:12', 'pending', 'Alozie', 'chuddy@gmail.com', '2024659e89243252a', NULL, NULL),
(2, 10000, 22, '2024-01-10 12:23:33', 'pending', 'Alozie', 'chuddy@gmail.com', '2024659e8c457b095', NULL, NULL),
(3, 10000, 22, '2024-01-10 12:24:11', 'pending', 'Alozie', 'chuddy@gmail.com', '2024659e8c6be1f7e', NULL, NULL),
(4, 10000, 22, '2024-01-10 12:24:20', 'pending', 'Alozie', 'chuddy@gmail.com', '2024659e8c74707d7', NULL, NULL),
(5, 1000, 22, '2024-01-10 12:25:07', 'pending', 'Alozie', 'chuddy@gmail.com', '2024659e8ca35c23d', NULL, NULL),
(6, 800, 22, '2024-01-10 12:29:14', 'pending', 'Alozie', 'chuddy@gmail.com', '2024659e8d9ad8a46', NULL, NULL),
(7, 600, 22, '2024-01-10 12:29:30', 'pending', 'Alozie', 'chuddy@gmail.com', '2024659e8daa1d4cb', NULL, NULL),
(8, 200, 22, '2024-01-10 12:40:55', 'pending', 'Alozie', 'chuddy@gmail.com', '2024659e90573c7ca', NULL, NULL),
(9, 1000, 22, '2024-01-10 12:43:20', 'pending', 'Alozie', 'chuddy@gmail.com', '2024659e90e8411e6', NULL, NULL),
(10, 266, 22, '2024-01-10 12:44:58', 'pending', 'Alozie', 'chuddy@gmail.com', '2024659e914a6b89b', NULL, NULL),
(11, 1000000, 22, '2024-01-10 12:45:48', 'pending', 'Alozie', 'chuddy@gmail.com', '2024659e917c31836', NULL, NULL),
(12, 5000, 22, '2024-01-10 12:47:42', 'pending', 'Alozie', 'chuddy@gmail.com', '2024659e91ee4cadb', NULL, NULL),
(13, 5000, 22, '2024-01-10 12:48:15', 'pending', 'Alozie', 'chuddy@gmail.com', '2024659e920f9ae27', NULL, NULL),
(14, 6000, 22, '2024-01-10 12:50:02', 'pending', 'Alozie', 'chuddy@gmail.com', '2024659e927a19fd3', NULL, NULL),
(15, 5000, 22, '2024-01-10 13:53:26', 'pending', 'Alozie', 'chuddy@gmail.com', '2024659ea1560a306', NULL, NULL),
(16, 10000, 22, '2024-01-10 13:58:47', 'pending', 'Alozie', 'chuddy@gmail.com', '2024659ea297b09fe', NULL, NULL),
(17, 300, 22, '2024-01-10 14:16:12', 'pending', 'Alozie', 'chuddy@gmail.com', '2024659ea6ac1db49', NULL, NULL),
(18, 200, 22, '2024-01-10 14:33:38', 'pending', 'Alozie', 'chuddy@gmail.com', '2024659eaac2ec8aa', NULL, NULL),
(19, 1000, 22, '2024-01-10 14:46:09', 'pending', 'Alozie', 'chuddy@gmail.com', '2024659eadb171f8c', NULL, NULL),
(20, 1200, 22, '2024-01-10 14:48:46', 'pending', 'Alozie', 'chuddy@gmail.com', '2024659eae4e8f746', NULL, NULL),
(21, 5000, 23, '2024-01-25 05:04:35', 'pending', 'Stephanie', 'ubanistephanieugonna@gmail.com', '202465b1ebe3810e6', NULL, NULL),
(22, 50, 23, '2024-01-25 05:09:40', 'pending', 'Stephanie', 'ubanistephanieugonna@gmail.com', '202465b1ed144681d', NULL, NULL),
(23, 4000, 23, '2024-01-25 05:13:28', 'pending', 'Stephanie', 'ubanistephanieugonna@gmail.com', '202465b1edf89e4fe', NULL, NULL),
(24, 400, 23, '2024-01-25 05:14:33', 'pending', 'Stephanie', 'ubanistephanieugonna@gmail.com', '202465b1ee39d767d', NULL, NULL),
(25, 40, 23, '2024-01-25 05:15:02', 'pending', 'Stephanie', 'ubanistephanieugonna@gmail.com', '202465b1ee561e172', NULL, NULL),
(26, 120, 24, '2024-01-25 05:16:38', 'pending', 'Emmanuella', 'ubaniellaa@gmail.com', '202465b1eeb6d82a8', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `fees_id` int(11) NOT NULL,
  `fees_name` varchar(60) DEFAULT NULL,
  `fees_edition` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`fees_id`, `fees_name`, `fees_edition`) VALUES
(1, 'Conference Fees', 1);

-- --------------------------------------------------------

--
-- Table structure for table `fee_items`
--

CREATE TABLE `fee_items` (
  `item_id` int(11) NOT NULL,
  `fee_id` int(11) DEFAULT NULL,
  `item_name` varchar(60) DEFAULT NULL,
  `item_amt` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fee_items`
--

INSERT INTO `fee_items` (`item_id`, `fee_id`, `item_name`, `item_amt`) VALUES
(1, 1, 'Registration Fee', 50000),
(2, 1, 'Conference Bag', 2500),
(3, 1, 'T-Shirt', 5000),
(4, 1, 'Car Sticker', 500);

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `level_id` int(11) NOT NULL,
  `level_name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`level_id`, `level_name`) VALUES
(1, 'Junior'),
(2, 'Intermediate'),
(3, 'Senior'),
(4, 'General');

-- --------------------------------------------------------

--
-- Table structure for table `lga`
--

CREATE TABLE `lga` (
  `lga_id` int(11) NOT NULL,
  `lga_name` varchar(60) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `lga`
--

INSERT INTO `lga` (`lga_id`, `lga_name`, `state_id`) VALUES
(1, 'Aba North', 1),
(2, 'Aba South', 1),
(3, 'Arochukwu', 1),
(4, 'Bende', 1),
(5, 'Ikwuano', 1),
(6, 'Isiala-Ngwa North', 1),
(7, 'Isiala-Ngwa South', 1),
(8, 'Isikwuato', 1),
(9, 'Nneochi', 1),
(10, 'Obi-Ngwa', 1),
(11, 'Ohafia', 1),
(12, 'Osisioma', 1),
(13, 'Ugwunagbo', 1),
(14, 'Ukwa East', 1),
(15, 'Ukwa West', 1),
(16, 'Umuahia North', 1),
(17, 'Umuahia South', 1),
(18, 'Demsa', 2),
(19, 'Fufore', 2),
(20, 'Genye', 2),
(21, 'Girei', 2),
(22, 'Gombi', 2),
(23, 'guyuk', 2),
(24, 'Hong', 2),
(25, 'Jada', 2),
(26, 'Jimeta', 2),
(27, 'Lamurde', 2),
(28, 'Madagali', 2),
(29, 'Maiha', 2),
(30, 'Mayo Belwa', 2),
(31, 'Michika', 2),
(32, 'Mubi North', 2),
(33, 'Mubi South', 2),
(34, 'Numan', 2),
(35, 'Shelleng', 2),
(36, 'Song', 2),
(37, 'Toungo', 2),
(38, 'Yola', 2),
(39, 'Abak', 3),
(40, 'Eastern-Obolo', 3),
(41, 'Eket', 3),
(42, 'Ekpe-Atani', 3),
(43, 'Essien-Udim', 3),
(44, 'Esit Ekit', 3),
(45, 'Etim-Ekpo', 3),
(46, 'Etinam', 3),
(47, 'Ibeno', 3),
(48, 'Ibesikp-Asitan', 3),
(49, 'Ibiono-Ibom', 3),
(50, 'Ika', 3),
(51, 'Ikono', 3),
(52, 'Ikot-Abasi', 3),
(53, 'Ikot-Ekpene', 3),
(54, 'Ini', 3),
(55, 'Itu', 3),
(56, 'Mbo', 3),
(57, 'Mkpae-Enin', 3),
(58, 'Nsit-Ibom', 3),
(59, 'Nsit-Ubium', 3),
(60, 'Obot-Akara', 3),
(61, 'Okobo', 3),
(62, 'Onna', 3),
(63, 'Oron', 3),
(64, 'Oro-Anam', 3),
(65, 'Udung-Uko', 3),
(66, 'Ukanefun', 3),
(67, 'Uru Offong Oruko', 3),
(68, 'Uruan', 3),
(69, 'Uquo Ibene', 3),
(70, 'Uyo', 3),
(71, 'Aguata', 4),
(72, 'Anambra', 4),
(73, 'Anambra West', 4),
(74, 'Anocha', 4),
(75, 'Awka- North', 4),
(76, 'Awka-South', 4),
(77, 'Ayamelum', 4),
(78, 'Dunukofia', 4),
(79, 'Ekwusigo', 4),
(80, 'Idemili-North', 4),
(81, 'Idemili-South', 4),
(82, 'Ihiala', 4),
(83, 'Njikoka', 4),
(84, 'Nnewi-North', 4),
(85, 'Nnewi-South', 4),
(86, 'Ogbaru', 4),
(87, 'Onisha North', 4),
(88, 'Onitsha South', 4),
(89, 'Orumba North', 4),
(90, 'Orumba South', 4),
(91, 'Oyi', 4),
(92, 'Alkaleri', 5),
(93, 'Bauchi', 5),
(94, 'Bogoro', 5),
(95, 'Damban', 5),
(96, 'Darazo', 5),
(97, 'Dass', 5),
(98, 'Gamawa', 5),
(99, 'Ganjuwa', 5),
(100, 'Giade', 5),
(101, 'Itas/Gadau', 5),
(102, 'Jama\'are', 5),
(103, 'Katagum', 5),
(104, 'Kirfi', 5),
(105, 'Misau', 5),
(106, 'Ningi', 5),
(107, 'Shira', 5),
(108, 'Tafawa-Balewa', 5),
(109, 'Toro', 5),
(110, 'Warji', 5),
(111, 'Zaki', 5),
(112, 'Brass', 6),
(113, 'Ekerernor', 6),
(114, 'Kolokuma/Opokuma', 6),
(115, 'Nembe', 6),
(116, 'Ogbia', 6),
(117, 'Sagbama', 6),
(118, 'Southern-Ijaw', 6),
(119, 'Yenegoa', 6),
(120, 'Kembe', 6),
(121, 'Ado', 7),
(122, 'Agatu', 7),
(123, 'Apa', 7),
(124, 'Buruku', 7),
(125, 'Gboko', 7),
(126, 'Guma', 7),
(127, 'Gwer-East', 7),
(128, 'Gwer-West', 7),
(129, 'Katsina-Ala', 7),
(130, 'Konshisha', 7),
(131, 'Kwande', 7),
(132, 'Logo', 7),
(133, 'Makurdi', 7),
(134, 'Obi', 7),
(135, 'Ogbadibo', 7),
(136, 'Ohimini', 7),
(137, 'Oju', 7),
(138, 'Okpokwu', 7),
(139, 'Otukpo', 7),
(140, 'Tarkar', 7),
(141, 'Vandeikya', 7),
(142, 'Ukum', 7),
(143, 'Ushongo', 7),
(144, 'Abadan', 8),
(145, 'Askira-Uba', 8),
(146, 'Bama', 8),
(147, 'Bayo', 8),
(148, 'Biu', 8),
(149, 'Chibok', 8),
(150, 'Damboa', 8),
(151, 'Dikwa', 8),
(152, 'Gubio', 8),
(153, 'Guzamala', 8),
(154, 'Gwoza', 8),
(155, 'Hawul', 8),
(156, 'Jere', 8),
(157, 'Kaga', 8),
(158, 'Kala/Balge', 8),
(159, 'Kukawa', 8),
(160, 'Konduga', 8),
(161, 'Kwaya-Kusar', 8),
(162, 'Mafa', 8),
(163, 'Magumeri', 8),
(164, 'Maiduguri', 8),
(165, 'Marte', 8),
(166, 'Mobbar', 8),
(167, 'Monguno', 8),
(168, 'Ngala', 8),
(169, 'Nganzai', 8),
(170, 'Shani', 8),
(171, 'Abi', 9),
(172, 'Akamkpa', 9),
(173, 'Akpabuyo', 9),
(174, 'Bakassi', 9),
(175, 'Bekwara', 9),
(176, 'Biasi', 9),
(177, 'Boki', 9),
(178, 'Calabar-Municipal', 9),
(179, 'Calabar-South', 9),
(180, 'Etunk', 9),
(181, 'Ikom', 9),
(182, 'Obantiku', 9),
(183, 'Ogoja', 9),
(184, 'Ugep North', 9),
(185, 'Yakurr', 9),
(186, 'Yala', 9),
(187, 'Aniocha North', 10),
(188, 'Aniocha South', 10),
(189, 'Bomadi', 10),
(190, 'Burutu', 10),
(191, 'Ethiope East', 10),
(192, 'Ethiope West', 10),
(193, 'Ika North East', 10),
(194, 'Ika South', 10),
(195, 'Isoko North', 10),
(196, 'Isoko South', 10),
(197, 'Ndokwa East', 10),
(198, 'Ndokwa West', 10),
(199, 'Okpe', 10),
(200, 'Oshimili North', 10),
(201, 'Oshimili South', 10),
(202, 'Patani', 10),
(203, 'Sapele', 10),
(204, 'Udu', 10),
(205, 'Ughilli North', 10),
(206, 'Ughilli South', 10),
(207, 'Ukwuani', 10),
(208, 'Uvwie', 10),
(209, 'Warri Central', 10),
(210, 'Warri North', 10),
(211, 'Warri South', 10),
(212, 'Abakaliki', 11),
(213, 'Ofikpo North', 11),
(214, 'Ofikpo South', 11),
(215, 'Ebonyi', 11),
(216, 'Ezza North', 11),
(217, 'Ezza South', 11),
(218, 'ikwo', 11),
(219, 'Ishielu', 11),
(220, 'Ivo', 11),
(221, 'Izzi', 11),
(222, 'Ohaukwu', 11),
(223, 'Ohaozara', 11),
(224, 'Onicha', 11),
(225, 'Akoko Edo', 12),
(226, 'Egor', 12),
(227, 'Esan Central', 12),
(228, 'Esan North East', 12),
(229, 'Esan South East', 12),
(230, 'Esan West', 12),
(231, 'Etsako-Central', 12),
(232, 'Etsako-West', 12),
(233, 'Igueben', 12),
(234, 'Ikpoba-Okha', 12),
(235, 'Oredo', 12),
(236, 'Orhionmwon', 12),
(237, 'Ovia North East', 12),
(238, 'Ovia South West', 12),
(239, 'owan east', 12),
(240, 'Owan West', 12),
(241, 'Umunniwonde', 12),
(242, 'Ado Ekiti', 13),
(243, 'Aiyedire', 13),
(244, 'Efon', 13),
(245, 'Ekiti-East', 13),
(246, 'Ekiti-South West', 13),
(247, 'Ekiti West', 13),
(248, 'Emure', 13),
(249, 'Ido Osi', 13),
(250, 'Ijero', 13),
(251, 'Ikere', 13),
(252, 'Ikole', 13),
(253, 'Ilejemeta', 13),
(254, 'Irepodun/Ifelodun', 13),
(255, 'Ise Orun', 13),
(256, 'Moba', 13),
(257, 'Oye', 13),
(258, 'Aninri', 14),
(259, 'Awgu', 14),
(260, 'Enugu East', 14),
(261, 'Enugu North', 14),
(262, 'Enugu South', 14),
(263, 'Ezeagu', 14),
(264, 'Igbo Etiti', 14),
(265, 'Igbo Eze North', 14),
(266, 'Igbo Eze South', 14),
(267, 'Isi Uzo', 14),
(268, 'Nkanu East', 14),
(269, 'Nkanu West', 14),
(270, 'Nsukka', 14),
(271, 'Oji-River', 14),
(272, 'Udenu', 14),
(273, 'Udi', 14),
(274, 'Uzo Uwani', 14),
(275, 'Akko', 15),
(276, 'Balanga', 15),
(277, 'Billiri', 15),
(278, 'Dukku', 15),
(279, 'Funakaye', 15),
(280, 'Gombe', 15),
(281, 'Kaltungo', 15),
(282, 'Kwami', 15),
(283, 'Nafada/Bajoga', 15),
(284, 'Shomgom', 15),
(285, 'Yamltu/Deba', 15),
(286, 'Ahiazu-Mbaise', 16),
(287, 'Ehime-Mbano', 16),
(288, 'Ezinihtte', 16),
(289, 'Ideato North', 16),
(290, 'Ideato South', 16),
(291, 'Ihitte/Uboma', 16),
(292, 'Ikeduru', 16),
(293, 'Isiala-Mbano', 16),
(294, 'Isu', 16),
(295, 'Mbaitoli', 16),
(296, 'Ngor-Okpala', 16),
(297, 'Njaba', 16),
(298, 'Nkwerre', 16),
(299, 'Nwangele', 16),
(300, 'obowo', 16),
(301, 'Oguta', 16),
(302, 'Ohaji-Eggema', 16),
(303, 'Okigwe', 16),
(304, 'Onuimo', 16),
(305, 'Orlu', 16),
(306, 'Orsu', 16),
(307, 'Oru East', 16),
(308, 'Oru West', 16),
(309, 'Owerri Municipal', 16),
(310, 'Owerri North', 16),
(311, 'Owerri West', 16),
(312, 'Auyu', 17),
(313, 'Babura', 17),
(314, 'Birnin Kudu', 17),
(315, 'Birniwa', 17),
(316, 'Bosuwa', 17),
(317, 'Buji', 17),
(318, 'Dutse', 17),
(319, 'Gagarawa', 17),
(320, 'Garki', 17),
(321, 'Gumel', 17),
(322, 'Guri', 17),
(323, 'Gwaram', 17),
(324, 'Gwiwa', 17),
(325, 'Hadejia', 17),
(326, 'Jahun', 17),
(327, 'Kafin Hausa', 17),
(328, 'Kaugama', 17),
(329, 'Kazaure', 17),
(330, 'Kirikasanuma', 17),
(331, 'Kiyawa', 17),
(332, 'Maigatari', 17),
(333, 'Malam Maduri', 17),
(334, 'Miga', 17),
(335, 'Ringim', 17),
(336, 'Roni', 17),
(337, 'Sule Tankarkar', 17),
(338, 'Taura', 17),
(339, 'Yankwashi', 17),
(340, 'Birnin-Gwari', 18),
(341, 'Chikun', 18),
(342, 'Giwa', 18),
(343, 'Gwagwada', 18),
(344, 'Igabi', 18),
(345, 'Ikara', 18),
(346, 'Jaba', 18),
(347, 'Jema\'a', 18),
(348, 'Kachia', 18),
(349, 'Kaduna North', 18),
(350, 'Kagarko', 18),
(351, 'Kajuru', 18),
(352, 'Kaura', 18),
(353, 'Kauru', 18),
(354, 'Koka/Kawo', 18),
(355, 'Kubah', 18),
(356, 'Kudan', 18),
(357, 'Lere', 18),
(358, 'Makarfi', 18),
(359, 'Sabon Gari', 18),
(360, 'Sanga', 18),
(361, 'Sabo', 18),
(362, 'Tudun-Wada/Makera', 18),
(363, 'Zango-Kataf', 18),
(364, 'Zaria', 18),
(365, 'Ajingi', 19),
(366, ' Albasu', 19),
(367, 'Bagwai', 19),
(368, 'Bebeji', 19),
(369, 'Bichi', 19),
(370, 'Bunkure', 19),
(371, 'Dala', 19),
(372, 'Dambatta', 19),
(373, 'Dawakin Kudu', 19),
(374, 'Dawakin Tofa', 19),
(375, 'Doguwa', 19),
(376, 'Fagge', 19),
(377, 'Gabasawa', 19),
(378, 'Garko', 19),
(379, 'Garun-Mallam', 19),
(380, 'Gaya', 19),
(381, 'Gezawa', 19),
(382, 'Gwale', 19),
(383, 'Gwarzo', 19),
(384, 'Kabo', 19),
(385, 'Kano Municipal', 19),
(386, 'Karaye', 19),
(387, 'Kibiya', 19),
(388, 'Kiru', 19),
(389, 'Kumbotso', 19),
(390, 'Kunchi', 19),
(391, 'Kura', 19),
(392, 'Madobi', 19),
(393, 'Makoda', 19),
(394, 'Minjibir', 19),
(395, 'Nasarawa', 19),
(396, 'Rano', 19),
(397, 'Rimin Gado', 19),
(398, 'Rogo', 19),
(399, 'Shanono', 19),
(400, 'Sumaila', 19),
(401, 'Takai', 19),
(402, 'Tarauni', 19),
(403, 'Tofa', 19),
(404, 'Tsanyawa', 19),
(405, 'Tudun Wada', 19),
(406, 'Ngogo', 19),
(407, 'Warawa', 19),
(408, 'Wudil', 19),
(409, 'Bakori', 20),
(410, 'Batagarawa', 20),
(411, 'Batsari', 20),
(412, 'Baure', 20),
(413, 'Bindawa', 20),
(414, 'Charanchi', 20),
(415, 'Danja', 20),
(416, 'Danjume', 20),
(417, 'Dan-Musa', 20),
(418, 'Daura', 20),
(419, 'Dutsi', 20),
(420, 'Dutsinma', 20),
(421, 'Faskari', 20),
(422, 'Funtua', 20),
(423, 'Ingara', 20),
(424, 'Jibia', 20),
(425, 'Kafur', 20),
(426, 'Kaita', 20),
(427, 'Kankara', 20),
(428, 'Kankia', 20),
(429, 'Katsina', 20),
(430, 'Kurfi', 20),
(431, 'Kusada', 20),
(432, 'Mai Adua', 20),
(433, 'Malumfashi', 20),
(434, 'Mani', 20),
(435, 'Mashi', 20),
(436, 'Matazu', 20),
(437, 'Musawa', 20),
(438, 'Rimi', 20),
(439, 'Sabuwa', 20),
(440, 'Safana', 20),
(441, 'Sandamu', 20),
(442, 'Zango', 20),
(443, 'Aleira', 21),
(444, 'Arewa', 21),
(445, 'Argungu', 21),
(446, 'Augie', 21),
(447, 'Bagudo', 21),
(448, 'Birnin-Kebbi', 21),
(449, 'Bumza', 21),
(450, 'Dandi', 21),
(451, 'Danko', 21),
(452, 'Fakai', 21),
(453, 'Gwandu', 21),
(454, 'Jega', 21),
(455, 'Kalgo', 21),
(456, 'Koko-Besse', 21),
(457, 'Maiyama', 21),
(458, 'Ngaski', 21),
(459, 'Sakaba', 21),
(460, 'Shanga', 21),
(461, 'Suru', 21),
(462, 'Wasagu', 21),
(463, 'Yauri', 21),
(464, 'Zuru', 21),
(465, 'Adavi', 22),
(466, 'Ajaokuta', 22),
(467, 'Ankpa', 22),
(468, 'Bassa', 22),
(469, 'Dekina', 22),
(470, 'Ibaji', 22),
(471, 'Idah', 22),
(472, 'Igalamela', 22),
(473, 'Ijumu', 22),
(474, 'Kabba/Bunu', 22),
(475, 'Kogi', 22),
(476, 'Lokoja', 22),
(477, 'Mopa-Muro-Mopi', 22),
(478, 'Ofu', 22),
(479, 'Ogori/Magongo', 22),
(480, 'Okehi', 22),
(481, 'Okene', 22),
(482, 'Olamaboro', 22),
(483, 'Omala', 22),
(484, 'Oyi', 22),
(485, 'Yagba-East', 22),
(486, 'Yagba-West', 22),
(487, 'Asa', 23),
(488, 'Baruten', 23),
(489, 'Edu', 23),
(490, 'Ekiti', 23),
(491, 'Ifelodun', 23),
(492, 'Ilorin East', 23),
(493, 'Ilorin South', 23),
(494, 'Ilorin West', 23),
(495, 'Irepodun', 23),
(496, 'Isin', 23),
(497, 'Kaiama', 23),
(498, 'Moro', 23),
(499, 'Offa', 23),
(500, 'Oke-Ero', 23),
(501, 'Oyun', 23),
(502, 'Pategi', 23),
(503, 'Agege', 24),
(504, 'Ajeromi-Ifelodun', 24),
(505, 'Alimosho', 24),
(506, 'Amuwo-Odofin', 24),
(507, 'Apapa', 24),
(508, 'Bagagry', 24),
(509, 'Epe', 24),
(510, 'Eti-Osa', 24),
(511, 'Ibeju-Lekki', 24),
(512, 'Ifako-Ijaiye', 24),
(513, 'Ikeja', 24),
(514, 'Ikorodu', 24),
(515, 'Kosofe', 24),
(516, 'Lagos-Island', 24),
(517, 'Lagos-Mainland', 24),
(518, 'Mushin', 24),
(519, 'Ojo', 24),
(520, 'Oshodi-Isolo', 24),
(521, 'Shomolu', 24),
(522, 'Suru-Lere', 24),
(523, 'Akwanga', 25),
(524, 'Awe', 25),
(525, 'Doma', 25),
(526, 'Karu', 25),
(527, 'Keana', 25),
(528, 'Keffi', 25),
(529, 'Kokona', 25),
(530, 'Lafia', 25),
(531, 'Nassarawa', 25),
(532, 'Nassarawa Eggor', 25),
(533, 'Obi', 25),
(534, 'Toto', 25),
(535, 'Wamba', 25),
(536, 'Agaie', 26),
(537, 'Agwara', 26),
(538, 'Bida', 26),
(539, 'Borgu', 26),
(540, 'Bosso', 26),
(541, 'Chanchaga', 26),
(542, 'Edati', 26),
(543, 'Gbako', 26),
(544, 'Gurara', 26),
(545, 'Katcha', 26),
(546, 'Kontagora', 26),
(547, 'Lapai', 26),
(548, 'Lavum', 26),
(549, 'Magama', 26),
(550, 'Mariga', 26),
(551, 'Mashegu', 26),
(552, 'Mokwa', 26),
(553, 'Muya', 26),
(554, 'Paikoro', 26),
(555, 'Rafi', 26),
(556, 'Rajau', 26),
(557, 'Shiroro', 26),
(558, 'Suleja', 26),
(559, 'Tafa', 26),
(560, 'Wushishi', 26),
(561, 'Abeokuta -North', 27),
(562, 'Abeokuta -South', 27),
(563, 'Ado-Odu/Ota', 27),
(564, 'Yewa-North', 27),
(565, 'Yewa-South', 27),
(566, 'Ewekoro', 27),
(567, 'Ifo', 27),
(568, 'Ijebu East', 27),
(569, 'Ijebu North', 27),
(570, 'Ijebu North-East', 27),
(571, 'Ijebu-Ode', 27),
(572, 'Ikenne', 27),
(573, 'Imeko-Afon', 27),
(574, 'Ipokia', 27),
(575, 'Obafemi -Owode', 27),
(576, 'Odeda', 27),
(577, 'Odogbolu', 27),
(578, 'Ogun-Water Side', 27),
(579, 'Remo-North', 27),
(580, 'Shagamu', 27),
(581, 'Akoko-North-East', 28),
(582, 'Akoko-North-West', 28),
(583, 'Akoko-South-West', 28),
(584, 'Akoko-South-East', 28),
(585, 'Akure- South', 28),
(586, 'Akure-North', 28),
(587, 'Ese-Odo', 28),
(588, 'Idanre', 28),
(589, 'Ifedore', 28),
(590, 'Ilaje', 28),
(591, 'Ile-Oluji-Okeigbo', 28),
(592, 'Irele', 28),
(593, 'Odigbo', 28),
(594, 'Okitipupa', 28),
(595, 'Ondo-West', 28),
(596, 'Ondo East', 28),
(597, 'Ose', 28),
(598, 'Owo', 28),
(599, 'Atakumosa', 29),
(600, 'Atakumosa East', 29),
(601, 'Ayeda-Ade', 29),
(602, 'Ayedire', 29),
(603, 'Boluwaduro', 29),
(604, 'Boripe', 29),
(605, 'Ede', 29),
(606, 'Ede North', 29),
(607, 'Egbedore', 29),
(608, 'Ejigbo', 29),
(609, 'Ife', 29),
(610, 'Ife East', 29),
(611, 'Ife North', 29),
(612, 'Ife South', 29),
(613, 'Ifedayo', 29),
(614, 'Ifelodun', 29),
(615, 'Ila', 29),
(616, 'Ilesha', 29),
(617, 'Ilesha-West', 29),
(618, 'Irepodun', 29),
(619, 'Irewole', 29),
(620, 'Isokun', 29),
(621, 'Iwo', 29),
(622, 'Obokun', 29),
(623, 'Odo-Otin', 29),
(624, 'Ola Oluwa', 29),
(625, 'Olorunda', 29),
(626, 'Ori-Ade', 29),
(627, 'Orolu', 29),
(628, 'Osogbo', 29),
(629, 'Afijio', 30),
(630, 'Akinyele', 30),
(631, 'Atiba', 30),
(632, 'Atisbo', 30),
(633, 'Egbeda', 30),
(634, 'Ibadan-Central', 30),
(635, 'Ibadan-North-East', 30),
(636, 'Ibadan-North-West', 30),
(637, 'Ibadan-South-East', 30),
(638, 'Ibadan-South West', 30),
(639, 'Ibarapa-Central', 30),
(640, 'Ibarapa-East', 30),
(641, 'Ibarapa-North', 30),
(642, 'Ido', 30),
(643, 'Ifedayo', 30),
(644, 'Ifeloju', 30),
(645, 'Irepo', 30),
(646, 'Iseyin', 30),
(647, 'Itesiwaju', 30),
(648, 'Iwajowa', 30),
(649, 'Kajola', 30),
(650, 'Lagelu', 30),
(651, 'Odo-Oluwa', 30),
(652, 'Ogbomoso-North', 30),
(653, 'Ogbomosho-South', 30),
(654, 'Olorunsogo', 30),
(655, 'Oluyole', 30),
(656, 'Ona-Ara', 30),
(657, 'Orelope', 30),
(658, 'Ori-Ire', 30),
(659, 'Oyo East', 30),
(660, 'Oyo West', 30),
(661, 'saki east', 30),
(662, 'Saki West', 30),
(663, 'Surulere', 30),
(664, 'Barkin Ladi', 31),
(665, 'Bassa', 31),
(666, 'Bokkos', 31),
(667, 'Jos-East', 31),
(668, 'Jos-South', 31),
(669, 'Jos-North', 31),
(670, 'Kanam', 31),
(671, 'Kanke', 31),
(672, 'Langtang North', 31),
(673, 'Langtang South', 31),
(674, 'Mangu', 31),
(675, 'Mikang', 31),
(676, 'Pankshin', 31),
(677, 'Quan\'pan', 31),
(678, 'Riyom', 31),
(679, 'Shendam', 31),
(680, 'Wase', 31),
(681, 'Abua/Odual', 32),
(682, 'Ahoada East', 32),
(683, 'Ahoada West', 32),
(684, 'Akukutoru', 32),
(685, 'Andoni', 32),
(686, 'Asari-Toro', 32),
(687, 'Bonny', 32),
(688, 'Degema', 32),
(689, 'Eleme', 32),
(690, 'Emuoha', 32),
(691, 'Etche', 32),
(692, 'Gokana', 32),
(693, 'Ikwerre', 32),
(694, 'Khana', 32),
(695, 'Obio/Akpor', 32),
(696, 'Ogba/Egbama/Ndoni', 32),
(697, 'Ogu/Bolo', 32),
(698, 'Okrika', 32),
(699, 'Omuma', 32),
(700, 'Opobo/Nkoro', 32),
(701, 'Oyigbo', 32),
(702, 'Port-Harcourt', 32),
(703, 'Tai', 32),
(704, 'Binji', 33),
(705, 'Bodinga', 33),
(706, 'Dange-Shuni', 33),
(707, 'Gada', 33),
(708, 'Goronyo', 33),
(709, 'Gudu', 33),
(710, 'Gwadabawa', 33),
(711, 'Illela', 33),
(712, 'Isa', 33),
(713, 'Kebbe', 33),
(714, 'Kware', 33),
(715, 'Raba', 33),
(716, 'Sabon-Birni', 33),
(717, 'Shagari', 33),
(718, 'Silame', 33),
(719, 'Sokoto North', 33),
(720, 'Sokoto South', 33),
(721, 'Tambuwal', 33),
(722, 'Tanzaga', 33),
(723, 'Tureta', 33),
(724, 'Wamakko', 33),
(725, 'Wurno', 33),
(726, 'Yabo', 33),
(727, 'Ardo Kola', 34),
(728, 'Bali', 34),
(729, 'Donga', 34),
(730, 'Gashaka', 34),
(731, 'Gassol', 34),
(732, 'Ibi', 34),
(733, 'Jalingo', 34),
(734, 'Karim-Lamido', 34),
(735, 'Kurmi', 34),
(736, 'Lau', 34),
(737, 'Sardauna', 34),
(738, 'Takuni', 34),
(739, 'Ussa', 34),
(740, 'Wukari', 34),
(741, 'Yarro', 34),
(742, 'Zing', 34),
(743, 'Bade', 35),
(744, 'Bursali', 35),
(745, 'Damaturu', 35),
(746, 'Fuka', 35),
(747, 'Fune', 35),
(748, 'Geidam', 35),
(749, 'Gogaram', 35),
(750, 'Gujba', 35),
(751, 'Gulani', 35),
(752, 'Jakusko', 35),
(753, 'Karasuwa', 35),
(754, 'Machina', 35),
(755, 'Nangere', 35),
(756, 'Nguru', 35),
(757, 'Potiskum', 35),
(758, 'Tarmua', 35),
(759, 'Yunisari', 35),
(760, 'Yusufari', 35),
(761, 'Anka', 36),
(762, 'Bakure', 36),
(763, 'Bukkuyum', 36),
(764, 'Bungudo', 36),
(765, 'Gumi', 36),
(766, 'Gusau', 36),
(767, 'Isa', 36),
(768, 'Kaura-Namoda', 36),
(769, 'Kiyawa', 36),
(770, 'Maradun', 36),
(771, 'Marau', 36),
(772, 'Shinkafa', 36),
(773, 'Talata-Mafara', 36),
(774, 'Tsafe', 36),
(775, 'Zurmi', 36),
(776, 'Obudu', 9),
(777, 'Abaji', 37),
(778, 'Bwari', 37),
(779, 'Gwagwalada', 37),
(780, 'Kuje', 37),
(781, 'Kwali', 37),
(782, 'Municipal', 37),
(783, 'Etsako-East', 12),
(784, 'Ahiazu-Mbaise', 16),
(785, 'Foreign', 38),
(786, 'Kaduna South', 18),
(787, 'Aboh-Mbaise', 16),
(788, 'Odukpani', 9);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `pay_id` int(11) NOT NULL,
  `pay_amt` float DEFAULT NULL,
  `pay_userid` int(11) DEFAULT NULL,
  `pay_status` enum('pending','paid','failed') DEFAULT NULL,
  `pay_others` text DEFAULT NULL,
  `pay_date` timestamp NULL DEFAULT NULL,
  `pay_transid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `planguage`
--

CREATE TABLE `planguage` (
  `lang_id` int(11) NOT NULL,
  `lang_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `planguage`
--

INSERT INTO `planguage` (`lang_id`, `lang_name`) VALUES
(1, 'PHP'),
(2, 'Python'),
(3, 'Javascript'),
(4, 'Java');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `post_by` int(11) DEFAULT NULL,
  `post_title` text DEFAULT NULL,
  `post_content` text DEFAULT NULL,
  `post_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `state_id` int(11) NOT NULL,
  `state_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`state_id`, `state_name`) VALUES
(1, 'Abia'),
(2, 'Adamawa'),
(3, 'Akwa Ibom'),
(4, 'Anambra'),
(5, 'Bauchi'),
(6, 'Bayelsa'),
(7, 'Benue'),
(8, 'Borno'),
(9, 'Cross River'),
(10, 'Delta'),
(11, 'Ebonyi'),
(12, 'Edo'),
(13, 'Ekiti'),
(14, 'Enugu'),
(15, 'Gombe'),
(16, 'Imo'),
(17, 'Jigawa'),
(18, 'Kaduna'),
(19, 'Kano'),
(20, 'Katsina'),
(21, 'Kebbi'),
(22, 'Kogi'),
(23, 'Kwara'),
(24, 'Lagos'),
(25, 'Nassarawa'),
(26, 'Niger'),
(27, 'Ogun'),
(28, 'Ondo'),
(29, 'Osun'),
(30, 'Oyo'),
(31, 'Plateau'),
(32, 'Rivers'),
(33, 'Sokoto'),
(34, 'Taraba'),
(35, 'Yobe'),
(36, 'Zamfara'),
(37, 'Abuja (FCT)'),
(38, 'Foreign');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `trans_id` int(11) NOT NULL,
  `trans_ref` varchar(45) DEFAULT NULL,
  `trans_date` varchar(45) DEFAULT NULL,
  `trans_totamt` float DEFAULT NULL,
  `trans_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trans_details`
--

CREATE TABLE `trans_details` (
  `det_id` int(11) NOT NULL,
  `fee_itemid` int(11) DEFAULT NULL,
  `det_amt` float DEFAULT NULL,
  `det_transid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_fname` varchar(60) DEFAULT NULL,
  `user_lname` varchar(60) DEFAULT NULL,
  `user_email` varchar(60) DEFAULT NULL,
  `user_phone` varchar(15) DEFAULT NULL,
  `user_password` varchar(200) DEFAULT NULL,
  `user_stateid` int(11) DEFAULT NULL,
  `user_lgaid` int(11) DEFAULT NULL,
  `user_level` int(11) DEFAULT NULL,
  `user_datereg` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_fname`, `user_lname`, `user_email`, `user_phone`, `user_password`, `user_stateid`, `user_lgaid`, `user_level`, `user_datereg`) VALUES
(1, 'Ezra', 'Ojo', '@ella.com', NULL, '1234', NULL, NULL, NULL, NULL),
(2, 'Ezra', 'Ojo', '@ella.com', NULL, '1234', NULL, NULL, NULL, NULL),
(3, 'Stephanie', 'Ubani', 'ubanistephanieugonna@gmail.com', NULL, '2356', NULL, NULL, NULL, NULL),
(4, 'Emmanuella', 'Ubani', 'ubaniellaa@gmail.com', NULL, '1976', NULL, NULL, NULL, NULL),
(10, 'Anabella', 'Anele', 'aneleemeka@gmail.com', NULL, '1234', NULL, NULL, NULL, NULL),
(11, 'Jasmine', 'Anele', 'aneleemeka@gmail.com', NULL, '2016', NULL, NULL, NULL, NULL),
(12, 'Emmanuella', 'Ubani', 'ubanistephanieugonna@gmail.com', NULL, '123', NULL, NULL, NULL, NULL),
(13, 'Oscar', 'Ubani', 'oscaratuenye@gmail.com', NULL, '1948', NULL, NULL, NULL, NULL),
(14, 'Samuel', 'Ubani', 'ubanisamuel@gmail.com', NULL, '$2y$10$1KIvPwN3hle8yA3iwOI82.jjJgpNCcLvyheQfkMoGBQf3mq.CxcX2', NULL, NULL, NULL, NULL),
(15, 'Sithri', 'Ubani', 'ubanisithri@gmail.com', NULL, '$2y$10$LShQBB32AduSrx7UtTG7reuNczoHoMKiOAirasUmwl4OLvcNx36LK', NULL, NULL, NULL, NULL),
(16, 'Ella', 'Ubani', 'ubaniella@gmail.com', NULL, '$2y$10$gHt2G9vy/l55jS7xqUjf9OhhUJzzYFu6IuJyhSOcv0rIz.y59BFfG', NULL, NULL, NULL, NULL),
(17, 'steph', 'udume', 'steph@gmail.com', NULL, '$2y$10$vYKr1gCzXo/TWRXWzqYyo.1bacq0szZ.lbxDYM6M3qxpsjUgPpHSq', NULL, NULL, NULL, NULL),
(18, 'Olivia', 'Anonre', 'Olivia@gmail.com', NULL, '$2y$10$WcagIopPkOc9qrN2Fzuq7eFEhfy9cOVaSC.EEUOVQScXF7iZJm/62', NULL, NULL, NULL, NULL),
(19, 'Harry', 'Anele', 'aneleemeka@gmail.com', NULL, '$2y$10$BZjtI78npzfEGlsk5jzur.OW2xdeaZJeAH6B3JzDxXKZyGHClZCqm', NULL, NULL, NULL, NULL),
(20, 'Caleb', 'Okoye', 'rukayat@gmail.com', '08125618382', '$2y$10$mk0P6JJpl.bOXGXFvj/Ol.IHBq7bv5m.C51c0nGqmKNbOW9i1ELgm', NULL, NULL, 2, NULL),
(21, 'Stephanie', 'Ubani', 'ubanistephanieugonna@gmail.com', NULL, '$2y$10$zmmVGtQBSU8WTJnzqnOnQu5VdEgg8C.kMXqj63Z1KHXQV.Oc7NFlW', NULL, NULL, NULL, NULL),
(22, 'Alozie', 'Chuddy', 'chuddy@gmail.com', NULL, '$2y$10$kuuVQWkGB7ji9WCfUPYP6eguw.UM6lZfCTEBnFIPHA8HhQmSSEkrG', NULL, NULL, NULL, NULL),
(23, 'Stephanie', 'Ubani', 'ubanistephanieugonna@gmail.com', NULL, '$2y$10$m04zrlMEJmtKmNqav/cJ3.NzBdDaXADgywLjZ1TIrl1FtPK1SSXZe', NULL, NULL, NULL, NULL),
(24, 'Emmanuella', 'Ubani', 'ubaniellaa@gmail.com', NULL, '$2y$10$lhRmvX9DeFjDCTqKk5y9U.7F5UWmK68b7H92/27fQEYc0aXWW.XeG', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlang`
--

CREATE TABLE `userlang` (
  `userlang_id` int(11) NOT NULL,
  `userlang_langid` int(11) DEFAULT NULL,
  `userlang_userid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_breakout`
--

CREATE TABLE `user_breakout` (
  `breakout_id` int(11) NOT NULL,
  `breakout_topicid` int(11) DEFAULT NULL,
  `breakout_userid` int(11) DEFAULT NULL,
  `breakout_regdate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user_breakout`
--

INSERT INTO `user_breakout` (`breakout_id`, `breakout_topicid`, `breakout_userid`, `breakout_regdate`) VALUES
(1, 1, NULL, NULL),
(2, 5, NULL, NULL),
(3, 1, NULL, NULL),
(4, 5, NULL, NULL),
(5, 1, NULL, NULL),
(6, 5, NULL, NULL),
(7, 6, NULL, NULL),
(8, 1, NULL, NULL),
(9, 5, NULL, NULL),
(10, 6, NULL, NULL),
(11, 1, NULL, NULL),
(12, 5, NULL, NULL),
(13, 6, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `email` (`admin_email`);

--
-- Indexes for table `breakout_topics`
--
ALTER TABLE `breakout_topics`
  ADD PRIMARY KEY (`topic_id`),
  ADD UNIQUE KEY `unique_images` (`topic_image`),
  ADD KEY `FK_idx` (`topic_level`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `FKPOST_idx` (`comment_postid`),
  ADD KEY `FKUSER_idx` (`comment_by`);

--
-- Indexes for table `donation`
--
ALTER TABLE `donation`
  ADD PRIMARY KEY (`don_id`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`fees_id`);

--
-- Indexes for table `fee_items`
--
ALTER TABLE `fee_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `FK_ITEM_idx` (`fee_id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`level_id`);

--
-- Indexes for table `lga`
--
ALTER TABLE `lga`
  ADD PRIMARY KEY (`lga_id`),
  ADD KEY `FKSTLGA_idx` (`state_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`pay_id`),
  ADD KEY `FK2_idx` (`pay_userid`),
  ADD KEY `FK3_idx` (`pay_transid`);

--
-- Indexes for table `planguage`
--
ALTER TABLE `planguage`
  ADD PRIMARY KEY (`lang_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `FKPOSTBY_idx` (`post_by`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`trans_id`),
  ADD KEY `FKTRX_idx` (`trans_by`);

--
-- Indexes for table `trans_details`
--
ALTER TABLE `trans_details`
  ADD PRIMARY KEY (`det_id`),
  ADD KEY `FKDET_idx` (`det_transid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `FKLEV_idx` (`user_level`),
  ADD KEY `FKST_idx` (`user_stateid`),
  ADD KEY `FKLGA_idx` (`user_lgaid`);

--
-- Indexes for table `userlang`
--
ALTER TABLE `userlang`
  ADD PRIMARY KEY (`userlang_id`),
  ADD KEY `USER_LANG_idx` (`userlang_userid`),
  ADD KEY `USER_PROG_idx` (`userlang_langid`);

--
-- Indexes for table `user_breakout`
--
ALTER TABLE `user_breakout`
  ADD PRIMARY KEY (`breakout_id`),
  ADD KEY `FKTop_idx` (`breakout_topicid`),
  ADD KEY `FKUser_idx` (`breakout_userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `breakout_topics`
--
ALTER TABLE `breakout_topics`
  MODIFY `topic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donation`
--
ALTER TABLE `donation`
  MODIFY `don_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
  MODIFY `fees_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fee_items`
--
ALTER TABLE `fee_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `pay_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `planguage`
--
ALTER TABLE `planguage`
  MODIFY `lang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trans_details`
--
ALTER TABLE `trans_details`
  MODIFY `det_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `userlang`
--
ALTER TABLE `userlang`
  MODIFY `userlang_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_breakout`
--
ALTER TABLE `user_breakout`
  MODIFY `breakout_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `breakout_topics`
--
ALTER TABLE `breakout_topics`
  ADD CONSTRAINT `FK` FOREIGN KEY (`topic_level`) REFERENCES `level` (`level_id`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FKPOST` FOREIGN KEY (`comment_postid`) REFERENCES `posts` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKUSERCOM` FOREIGN KEY (`comment_by`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fee_items`
--
ALTER TABLE `fee_items`
  ADD CONSTRAINT `FK_ITEM` FOREIGN KEY (`fee_id`) REFERENCES `fees` (`fees_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lga`
--
ALTER TABLE `lga`
  ADD CONSTRAINT `FKSTLGA` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FK2` FOREIGN KEY (`pay_userid`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `FK3` FOREIGN KEY (`pay_transid`) REFERENCES `transaction` (`trans_id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `FKPOSTBY` FOREIGN KEY (`post_by`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `FKTRX` FOREIGN KEY (`trans_by`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `trans_details`
--
ALTER TABLE `trans_details`
  ADD CONSTRAINT `FKDET` FOREIGN KEY (`det_transid`) REFERENCES `transaction` (`trans_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FKLEV` FOREIGN KEY (`user_level`) REFERENCES `level` (`level_id`),
  ADD CONSTRAINT `FKLGA` FOREIGN KEY (`user_lgaid`) REFERENCES `lga` (`lga_id`),
  ADD CONSTRAINT `FKST` FOREIGN KEY (`user_stateid`) REFERENCES `state` (`state_id`);

--
-- Constraints for table `userlang`
--
ALTER TABLE `userlang`
  ADD CONSTRAINT `USER_LANG` FOREIGN KEY (`userlang_userid`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `USER_PROG` FOREIGN KEY (`userlang_langid`) REFERENCES `planguage` (`lang_id`);

--
-- Constraints for table `user_breakout`
--
ALTER TABLE `user_breakout`
  ADD CONSTRAINT `FKTop` FOREIGN KEY (`breakout_topicid`) REFERENCES `breakout_topics` (`topic_id`),
  ADD CONSTRAINT `FKUser` FOREIGN KEY (`breakout_userid`) REFERENCES `user` (`user_id`);
--
-- Database: `hoteldb`
--
CREATE DATABASE IF NOT EXISTS `hoteldb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hoteldb`;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`) VALUES
(1, 'Hotel'),
(2, 'Private'),
(3, 'Hostel');

-- --------------------------------------------------------

--
-- Table structure for table `merchants`
--

CREATE TABLE `merchants` (
  `merchant_id` int(11) NOT NULL,
  `merchant_username` varchar(100) NOT NULL,
  `merchant_password` varchar(255) NOT NULL,
  `merchant_type` enum('free','premium') NOT NULL DEFAULT 'free',
  `merchat_dateadded` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `merchants`
--

INSERT INTO `merchants` (`merchant_id`, `merchant_username`, `merchant_password`, `merchant_type`, `merchat_dateadded`) VALUES
(1, 'bookworm', 'cohort25', 'free', '2021-12-02 09:12:55'),
(2, 'devconf', 'cohort26', 'free', '2021-12-02 09:12:55');

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `property_id` int(11) NOT NULL,
  `property_category` int(11) NOT NULL DEFAULT 1,
  `property_contact` varchar(100) NOT NULL,
  `property_filename` varchar(255) NOT NULL,
  `property_price` float DEFAULT NULL,
  `property_name` varchar(200) NOT NULL,
  `property_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`property_id`, `property_category`, `property_contact`, `property_filename`, `property_price`, `property_name`, `property_date`) VALUES
(1, 1, 'Ibrahim Babangida', 'http://localhost/hotelsdotng/assets/uploads/h1.jpg', 75000, 'Hollyway Hotels', '2021-12-01 04:12:30'),
(2, 1, 'Alhaji Yar\'Adua', 'http://localhost/hotelsdotng/assets/uploads/h2.jpg', 120000, 'The Swan', '2021-12-01 04:12:30'),
(3, 2, 'Lawal lawan', 'http://localhost/hotelsdotng/assets/uploads/h3.jpg', 50000, '4-Bedroom Flat', '2021-12-01 04:14:59'),
(4, 3, 'its best machine', 'http://localhost/hotelsdotng/assets/uploads/h4.jpg', 80000, 'Duplex ', '2021-12-01 04:14:59'),
(5, 1, 'Pa James', 'http://localhost/hotelsdotng/assets/uploads/h5.jpg', 76000, 'Budeget Hotel', '2021-12-01 04:17:21'),
(6, 1, 'Hellen May', 'http://localhost/hotelsdotng/assets/uploads/h6.jpg', 100000, 'Castle Tower', '2021-12-01 04:17:21'),
(7, 2, 'Tofunmi Steven', 'http://localhost/hotelsdotng/assets/uploads/h7.jpg', 110000, '2 Bedroom Bungalow', '2021-12-01 04:18:37'),
(17, 1, 'Bola Tinubu', 'http://localhost/hotelsdotng/assets/uploads/h8.jpg', 20000, 'Square Castle Hotel', '2024-01-05 07:15:48'),
(18, 1, 'Prof Wole', 'http//localhost/create.php', 2000, 'Frontlake Hotel', '2024-01-09 12:36:01'),
(19, 1, 'Adewale', 'http//localhost/create.jpg', 20000, 'Square Castle Hotel', '2024-01-09 15:00:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `merchants`
--
ALTER TABLE `merchants`
  ADD PRIMARY KEY (`merchant_id`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`property_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `merchants`
--
ALTER TABLE `merchants`
  MODIFY `merchant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `property_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- Database: `latecommer`
--
CREATE DATABASE IF NOT EXISTS `latecommer` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `latecommer`;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `attendance_timein` datetime DEFAULT NULL,
  `participant_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gift`
--

CREATE TABLE `gift` (
  `gift_id` int(11) NOT NULL,
  `gift_name` varchar(50) DEFAULT NULL,
  `guest_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `gift`
--

INSERT INTO `gift` (`gift_id`, `gift_name`, `guest_id`) VALUES
(1, 'Cash', 1),
(2, 'Blender', 1),
(3, 'Cloth', 3),
(4, 'Shoe', 7),
(5, 'Shoe', 1),
(6, 'Car', 4);

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE `guest` (
  `guest_id` int(11) NOT NULL,
  `guest_fullname` varchar(100) NOT NULL,
  `guest_phone` varchar(50) NOT NULL,
  `guest_email` varchar(50) NOT NULL,
  `guest_gender` enum('Female','Male') NOT NULL,
  `guest_state` int(11) NOT NULL,
  `guest_datereg` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `guest`
--

INSERT INTO `guest` (`guest_id`, `guest_fullname`, `guest_phone`, `guest_email`, `guest_gender`, `guest_state`, `guest_datereg`) VALUES
(1, 'Adedayo Kolawole', '0804564667', 'a@b.com', 'Female', 1, '2017-03-24 14:14:30'),
(2, 'Tijani Abayomi', '0892345688', 'x@y.com', 'Male', 5, '2017-08-24 14:14:59'),
(3, 'John Smith', '0802345667', 'john@yahoo.com', 'Male', 1, '2017-01-24 14:15:59'),
(4, 'JJ Okocha', '0803456677', 'jj@y.com', 'Male', 6, '2017-05-24 14:16:54'),
(5, 'Taribo West', '', 't@x.com', 'Male', 16, '2017-08-24 14:18:02'),
(6, 'Damilola Oni', '0802345678', 'd@y.com', 'Female', 36, '2017-08-24 14:21:01'),
(7, 'Tunde Ojo', '0804556788', 'tunde@yahoo.com', 'Male', 6, '2017-08-24 14:22:14'),
(8, 'Janet Jackson', '0832345678', 'jack@y.com', 'Female', 12, '2017-08-24 14:22:51');

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `participants_id` int(11) NOT NULL,
  `participant_fullname` varchar(100) DEFAULT NULL,
  `participant_phone` varchar(15) DEFAULT NULL,
  `participant_emaill` varchar(45) DEFAULT NULL,
  `participant_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payement`
--

CREATE TABLE `payement` (
  `payement_id` int(11) NOT NULL,
  `payement_amt` float DEFAULT NULL,
  `payement_date` datetime DEFAULT NULL,
  `participant_id` int(11) DEFAULT NULL,
  `attendance_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `state_id` int(11) NOT NULL DEFAULT 0,
  `state_name` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`state_id`, `state_name`) VALUES
(1, 'Abia'),
(2, 'Adamawa'),
(3, 'Akwa Ibom'),
(4, 'Anambra'),
(5, 'Bauchi'),
(6, 'Bayelsa'),
(7, 'Benue'),
(8, 'Borno'),
(9, 'Cross River'),
(10, 'Delta'),
(11, 'Ebonyi'),
(12, 'Edo'),
(13, 'Ekiti'),
(14, 'Enugu'),
(15, 'Gombe'),
(16, 'Imo'),
(17, 'Jigawa'),
(18, 'Kaduna'),
(19, 'Kano'),
(20, 'Katsina'),
(21, 'Kebbi'),
(22, 'Kogi'),
(23, 'Kwara'),
(24, 'Lagos'),
(25, 'Nassarawa'),
(26, 'Niger'),
(27, 'Ogun'),
(28, 'Ondo'),
(29, 'Osun'),
(30, 'Oyo'),
(31, 'Plateau'),
(32, 'Rivers'),
(33, 'Sokoto'),
(34, 'Taraba'),
(35, 'Yobe'),
(36, 'Zamfara'),
(37, 'FCT'),
(38, 'Foreign');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `participant_id_idx` (`participant_id`);

--
-- Indexes for table `gift`
--
ALTER TABLE `gift`
  ADD PRIMARY KEY (`gift_id`);

--
-- Indexes for table `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`guest_id`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`participants_id`);

--
-- Indexes for table `payement`
--
ALTER TABLE `payement`
  ADD PRIMARY KEY (`payement_id`),
  ADD KEY `attendpay_idx` (`attendance_id`),
  ADD KEY `partpay_idx` (`participant_id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`state_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gift`
--
ALTER TABLE `gift`
  MODIFY `gift_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `guest`
--
ALTER TABLE `guest`
  MODIFY `guest_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `participants_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payement`
--
ALTER TABLE `payement`
  MODIFY `payement_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `participant_id` FOREIGN KEY (`participant_id`) REFERENCES `participants` (`participants_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payement`
--
ALTER TABLE `payement`
  ADD CONSTRAINT `attendpay` FOREIGN KEY (`attendance_id`) REFERENCES `attendance` (`attendance_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `partpay` FOREIGN KEY (`participant_id`) REFERENCES `participants` (`participants_id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `listic`
--
CREATE DATABASE IF NOT EXISTS `listic` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `listic`;

-- --------------------------------------------------------

--
-- Table structure for table `businesses`
--

CREATE TABLE `businesses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slogan` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `cover_image` varchar(200) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_published` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `businesses`
--

INSERT INTO `businesses` (`id`, `name`, `slogan`, `phone`, `address`, `description`, `website`, `cover_image`, `category_id`, `user_id`, `is_active`, `is_published`, `created_at`, `updated_at`) VALUES
(2, 'Esusu LTD', 'Helping people save money', '07060928213', 'Unity Road', 'Saving money equals saving life', 'https://ugonna20.github.io/', 'listic_17055047401.jpg', 5, 1, 0, 1, '2024-01-17 14:19:00', '2024-01-18 15:15:16'),
(3, 'Dev Fest ltd', 'Solving Mankind problem', '07060928213', 'Unity Estate', 'We aim at giving accurate solution to life threatening prolems using codes', 'https://ugonna20.github.io/', 'listic_17055866862.jpg', 4, 2, 1, 1, '2024-01-18 13:04:46', '2024-01-18 13:04:46');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Agriculture', NULL, NULL),
(2, 'Food', NULL, NULL),
(3, 'Health', NULL, NULL),
(4, 'Tech', NULL, NULL),
(5, 'Finance', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(7, '2014_10_12_000000_create_users_table', 1),
(8, '2014_10_12_100000_create_password_resets_table', 1),
(9, '2019_08_19_000000_create_failed_jobs_table', 1),
(10, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(11, '2024_01_16_111434_create_categories_table', 1),
(12, '2024_01_16_112131_create_skills_table', 1),
(13, '2024_01_17_121521_create_businesses_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `dp` varchar(255) DEFAULT NULL,
  `is_blocked` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `dp`, `is_blocked`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ubani Stephanie', 'steph@gmail.com', NULL, '$2y$10$0JFkaxjIDNHp7ltCHI42Buua/Ou1lcHU.XTrLadzQVZuYCDM5UwoW', 'user', 'listic_1.jpg', 0, 'TCop4p0LEXShXmPAzJ5iryvfEjSklsMciPM5M02ExxIBj0Sfe1OSPR7uUf7o', '2024-01-16 13:52:51', '2024-01-17 11:00:41'),
(2, 'admin one', 'harry@gmail.com', NULL, '$2y$10$KS.KaohuvHEuBBm2XuOKQ.naNL4mMTZcWcoit3diHL5MHj2.BmX4W', 'admin', NULL, 0, NULL, '2024-01-18 12:44:53', '2024-01-18 12:44:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `businesses`
--
ALTER TABLE `businesses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `businesses`
--
ALTER TABLE `businesses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `newsletter`
--
CREATE DATABASE IF NOT EXISTS `newsletter` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `newsletter`;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `sub_id` int(11) NOT NULL,
  `sub_fullname` varchar(255) NOT NULL,
  `sub_email` varchar(255) NOT NULL,
  `sub_gender` enum('female','male') NOT NULL,
  `sub_register` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`sub_id`, `sub_fullname`, `sub_email`, `sub_gender`, `sub_register`) VALUES
(1, 'Ubani Emmanuella', 'Eziwaco4th@gmail.com', '', '2023-12-12 10:27:30'),
(2, 'Ubani Stephanie', 'Ubanistephanieugonna@gmail.com', '', '2023-12-12 10:32:02'),
(3, 'Ubani Stephanie', 'Ubanistephanieugonna@gmail.com', 'female', '2023-12-12 10:55:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`sub_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `sub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `pastriesbysteph`
--
CREATE DATABASE IF NOT EXISTS `pastriesbysteph` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pastriesbysteph`;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `carts_id` int(11) NOT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `flavour_name` varchar(200) DEFAULT NULL,
  `product_price` int(100) DEFAULT NULL,
  `cart_quantity` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`carts_id`, `product_name`, `flavour_name`, `product_price`, `cart_quantity`, `customer_id`) VALUES
(1, 'Cake', 'Strawberry', 1200, 1, 2),
(2, 'Cake', 'Strawberry', 1200, 1, 2),
(3, 'Cinnamon Rolls', 'Vanilla', 1500, 2, 2),
(4, 'Cake', 'Strawberry', 1500, 2, 2),
(5, 'Cake', 'Strawberry', 1500, 1, 2),
(6, 'Cake', 'Strawberry', 1200, 1, 2),
(7, 'Cake', 'Strawberry', 1500, 1, 2),
(8, 'Cake', 'Strawberry', 1200, 1, 2),
(9, 'Cinnamon Rolls', 'Vanilla', 1500, 1, 2),
(10, 'Cake', 'Strawberry', 1200, 1, 2),
(11, 'Cake', 'Vanilla', 1400, 1, 2),
(12, 'Cake', 'Strawberry', 1200, 1, 2),
(13, 'Cake', 'Vanilla', 1400, 1, 2),
(14, 'Cake', 'Strawberry', 1200, 1, 2),
(15, 'Cake', 'Vanilla', 1400, 1, 2),
(16, 'Cake', 'Strawberry', 1200, 1, 2),
(17, 'Cake', 'Strawberry', 1500, 2, 6),
(18, 'Cake', 'Strawberry', 1200, 1, 6),
(19, 'Cake', 'Strawberry', 1500, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer_fullname` varchar(200) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_password` varchar(200) NOT NULL,
  `customer_phone` varchar(200) NOT NULL,
  `customer_address` varchar(200) NOT NULL,
  `customer_date_reg` timestamp NOT NULL DEFAULT current_timestamp(),
  `lga_id` int(11) NOT NULL,
  `customer_status` enum('logged_in','logged_out','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_fullname`, `customer_email`, `customer_password`, `customer_phone`, `customer_address`, `customer_date_reg`, `lga_id`, `customer_status`) VALUES
(1, 'Anele Ruth', 'aneleruth1@gmail.com', '$2y$10$nvrQZqVXDz37qd8l9VrsK.6jqecqj8xnxclOoTxC/Vzmiu6UfpUSq', '', '', '2023-12-29 20:36:21', 0, 'logged_in'),
(2, 'Ubani Stephanie', 'ubanistephanieugonna@gmail.com', '$2y$10$JqRa81dj5GYdwVIMZpBy/uwLeS6iI0oN/gl5CBpQqumP8FgjitVnq', '', '', '2023-12-30 15:11:02', 0, 'logged_in'),
(3, 'Ubani Jedidiah', 'jedi@gmail.com', '$2y$10$p9dQzavbYIIbErPM0ejskOsMBuQ85GYbp39GX.qRWjPTWV3n9tBd.', '', '', '2024-01-19 12:24:21', 0, 'logged_in'),
(4, 'Okoye Samuel', 'okoye@gmail.com', '$2y$10$nriAf0A6xYesUrQUMAtAh.MRH5pXNVOxgoeXWmLE58ZsKMjzCkETK', '', '', '2024-01-25 13:27:20', 0, 'logged_out'),
(5, 'Sharon Iyemheake', 'sharon@gmail.com', '$2y$10$xuWzk6B6ieqDE3La9WlbZOf/E0wO9RliBHseEdcktJ/y2YYwqdcAa', '', '', '2024-01-26 05:29:01', 0, 'logged_out'),
(6, 'Ubani Ijeoma', 'ij@gmail.com', '$2y$10$vQPxxfMN/LcBbtu776LJqeexbXEkGEh2OyFGuX6WTytHlZhO6zlpi', '', '', '2024-02-07 13:55:01', 0, 'logged_out');

-- --------------------------------------------------------

--
-- Table structure for table `flavours`
--

CREATE TABLE `flavours` (
  `flavour_id` int(11) NOT NULL,
  `flavour_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flavours`
--

INSERT INTO `flavours` (`flavour_id`, `flavour_name`) VALUES
(1, 'Vanilla'),
(2, 'Strawberry'),
(3, 'Chocolate'),
(4, 'Coconut'),
(5, 'Redvelvet');

-- --------------------------------------------------------

--
-- Table structure for table `lga`
--

CREATE TABLE `lga` (
  `lga_id` int(11) NOT NULL,
  `lga_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lga`
--

INSERT INTO `lga` (`lga_id`, `lga_name`) VALUES
(1, 'Ajeromi-Ifelodun'),
(2, 'Alimosho'),
(3, 'Kosofe'),
(4, 'Mushin'),
(5, 'Oshodi-Isolo'),
(6, 'Ojo'),
(7, 'Ikorodu'),
(8, 'Surulere'),
(9, 'Agege'),
(10, 'Ifako-Ijaiye'),
(11, 'Somolu'),
(12, 'Amuwo-Odofin'),
(13, 'Lagos Mainland'),
(14, 'Ikeja'),
(15, 'Eti-Osa'),
(16, 'Badagry'),
(17, 'Apapa'),
(18, 'Lagos Island'),
(19, 'Epe'),
(20, 'Ibeju-Lekki');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL,
  `orders_amt` float NOT NULL,
  `orders_shipping_address` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `orders_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `orders_status` enum('pending','successful','failed','') NOT NULL,
  `orders_reference` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orders_id`, `orders_amt`, `orders_shipping_address`, `customer_id`, `orders_date`, `orders_status`, `orders_reference`) VALUES
(1, 5, '2', 4200, '2024-01-29 04:49:40', 'pending', '202465b72e64001ff'),
(2, 5, '2', 4200, '2024-01-29 04:50:27', 'pending', '202465b72e9317e71'),
(3, 4200, '5 wale fajemisin street', 2, '2024-01-29 05:07:09', 'pending', '202465b7327de21fa'),
(4, 4200, '5 wale fajemisin street', 2, '2024-01-29 05:07:11', 'pending', '202465b7327fc4eac'),
(5, 2600, '5 wale fajemisin street', 2, '2024-01-29 05:34:32', 'pending', '202465b738e88528f'),
(6, 2600, '5 wale fajemisin street', 2, '2024-01-29 05:35:18', 'pending', '202465b739166b359'),
(7, 1200, '5 wale fajemisin street', 2, '2024-01-29 07:58:05', 'pending', '202465b75a8d487b3'),
(8, 1200, '5 wale fajemisin street', 2, '2024-01-29 07:58:27', 'pending', '202465b75aa353a50'),
(9, 1100, '5 wale fajemisin street', 2, '2024-01-29 08:07:36', 'pending', '202465b75cc8d0986'),
(10, 1100, '5 wale fajemisin street', 2, '2024-01-29 08:08:29', 'pending', '202465b75cfdd09a2'),
(11, 500, '5 wale fajemisin street', 2, '2024-01-29 08:08:41', 'pending', '202465b75d0978c96'),
(12, 500, '5 wale fajemisin street', 2, '2024-01-29 08:09:38', 'pending', '202465b75d42ddf77'),
(13, 500, '5 wale fajemisin street', 2, '2024-01-29 09:12:05', 'pending', '202465b76be5549ae'),
(14, 500, '5 wale fajemisin street', 2, '2024-01-29 09:13:35', 'pending', '202465b76c3fc4c26'),
(15, 500, '5 wale fajemisin street', 2, '2024-01-29 09:15:42', 'pending', '202465b76cbe75813'),
(16, 500, '5 wale fajemisin street', 2, '2024-01-29 10:22:41', 'pending', '202465b77c718c506'),
(17, 500, '5 wale fajemisin street', 2, '2024-01-29 10:23:17', 'pending', '202465b77c95cb949'),
(18, 2600, '5 wale fajemisin street', 2, '2024-01-31 12:24:58', 'pending', '202465ba3c1ab3275'),
(19, 2600, '5 wale fajemisin street', 2, '2024-01-31 12:28:44', 'pending', '202465ba3cfc905b4'),
(20, 2600, '5 wale fajemisin street', 2, '2024-01-31 12:29:07', 'pending', '202465ba3d13cb7ce'),
(21, 4200, '', 6, '2024-02-07 13:55:23', 'pending', '202465c38bcb87a88'),
(22, 4200, '', 6, '2024-02-07 13:58:24', 'pending', '202465c38c80c26a8'),
(23, 4200, '5 wale fajemisin street', 6, '2024-02-07 14:02:55', 'pending', '202465c38d8f6753f'),
(24, 1500, '5 wale fajemisin street', 2, '2024-02-09 18:16:34', 'successful', '202465c66c0285e3f');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_details_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_details_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payement`
--

CREATE TABLE `payement` (
  `payement_id` int(11) NOT NULL,
  `payement_amt` float NOT NULL,
  `customer_order_id` int(11) NOT NULL,
  `payement_reference` varchar(200) NOT NULL,
  `payement_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `customer_id` int(11) NOT NULL,
  `payement_status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_img_id` int(11) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `flavour_id` int(11) NOT NULL,
  `products_description` varchar(200) NOT NULL,
  `product_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_img_id`, `product_name`, `flavour_id`, `products_description`, `product_price`) VALUES
(3, 3, 'Cake', 2, 'Very yummy and strawberish', 1200),
(6, 6, 'Cake', 3, 'Very moist and succulent', 1500),
(7, 7, 'Cake', 3, 'Occasion worthy cake , perfect for every gathering', 10000),
(8, 8, 'Cake', 4, 'tropical in a cake? Just the right thing for you!', 1500),
(9, 9, 'Cake', 2, 'Yummy and moist', 1500),
(10, 10, 'Cake', 5, 'Craving a cake but want something small, this cake is just  right for you !', 1500),
(11, 11, 'Cinnamon Rolls', 1, 'yummy and tasty', 1500),
(12, 12, 'Cake', 2, 'yummy', 12000),
(14, 14, 'Cake', 2, 'yummy and moist', 1500),
(15, 15, 'Cake', 1, 'yumm yumm', 1400),
(16, 16, 'Cake', 2, 'yum', 1200);

-- --------------------------------------------------------

--
-- Table structure for table `product_img`
--

CREATE TABLE `product_img` (
  `product_img_id` int(11) NOT NULL,
  `product_img_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_img`
--

INSERT INTO `product_img` (`product_img_id`, `product_img_name`) VALUES
(1, 'pastriesbysteph__bakedwithlove.jpg__1704031298__6591744267118'),
(2, 'pastriesbysteph__1705821738__65acc62a78169pastries.by__1_-removebg-preview.png'),
(3, 'pastriesbysteph__cakes_images (1).jpeg__1704032258__65917802a8196'),
(4, 'pastriesbysteph__doughnut.png__1704119459__6592cca37d38c'),
(5, 'pastriesbysteph__pastries.by (4).jpeg__1704141986__659324a21762e'),
(6, 'pastriesbysteph__cakes_images (3).jpeg__1704262631__6594fbe7b3d05'),
(7, 'pastriesbysteph__chocolate_cake.jpg__1704262726__6594fc46c9d68'),
(8, 'pastriesbysteph__cakes_images (2).jpeg__1704262775__6594fc7771719'),
(9, 'pastriesbysteph__pastries.by (5).jpeg__1704262825__6594fca9634bc'),
(10, 'pastriesbysteph__cake1.jpg__1704262916__6594fd04eb225'),
(11, 'pastriesbysteph__redvelvet.jpg__1704392889__6596f8b97de80'),
(12, 'pastriesbysteph__pastries.by (7).jpeg__1705641781__65aa073523ba3'),
(13, 'pastriesbysteph__cakes_images (2).jpeg__1705666834__65aa6912f2245'),
(14, 'pastriesbysteph__blueberry_cake.png__1706266584__65b38fd8c8a77'),
(15, 'pastriesbysteph__blueberry_cake.png__1706505403__65b734bbd8a6d'),
(16, 'pastriesbysteph__pastries.by__1_-removebg-preview.png__1706704358__65ba3de670347');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `staff_fullname` varchar(255) NOT NULL,
  `staff_email` varchar(200) NOT NULL,
  `staff_password` varchar(200) NOT NULL,
  `staff_date_reg` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `staff_fullname`, `staff_email`, `staff_password`, `staff_date_reg`) VALUES
(1, 'Ubani Stephanie', 'ubanistephanieugonna@gmail.com', '$2y$10$oH/hP1e.HLXQTUCyr.97ou8fi/e3axST.e0PlQpFzzaMNUAGdYMg2', '2024-01-03 14:57:29'),
(2, 'Ubani Sithri', 'sithri@gmail.com', '$2y$10$zwHUbnkFft6xGEmsiAomJOyjYyr./58iTeBSy2TMv2Gpa03OGq8PK', '2024-01-03 15:42:49'),
(5, 'Ubani Emmanuella', 'ubaniellaa@gmail.com', '$2y$10$ls/aiYJInnXljLqqYP3wDenGRCjnfHy6Urw9WbtYn4SNL.GQ48z1W', '2024-01-03 15:55:11'),
(7, 'Ubani Samuel', 'samuel@gmail.com', '$2y$10$kjeu3SNc5i6Q7NECpnPf1.EidWsdImuPb4eCB8VCJ0cQTNQ1BzAuK', '2024-01-03 15:56:34'),
(8, 'Ubani Ezinwanyi', 'eziwaco4th@gmail.com', '$2y$10$K/EKyymq3LYcOdr4b9N9Vufi0Dq4gKOyGXsYO2eB8QxKkrbspQ5ea', '2024-01-03 15:57:08'),
(9, 'Anele Emeka', 'aneleemeka@gmail.com', '$2y$10$vnR3zO/fU.3c41JxKN8pz.u3ADEEKwmfnOaz3DH/31stU44GeLhZa', '2024-01-03 16:41:54'),
(11, 'Ubani Emmanuella', 'ellaa@gmail.com', '$2y$10$jhpQR90IUOKUZ4meslTLOu7PFJRjoVQqmb8GOjFRpzh4qX1vK7gIe', '2024-01-03 17:31:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`carts_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`customer_email`);

--
-- Indexes for table `flavours`
--
ALTER TABLE `flavours`
  ADD PRIMARY KEY (`flavour_id`);

--
-- Indexes for table `lga`
--
ALTER TABLE `lga`
  ADD PRIMARY KEY (`lga_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orders_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_details_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `flavour_id` (`flavour_id`),
  ADD KEY `product_img_id` (`product_img_id`);

--
-- Indexes for table `product_img`
--
ALTER TABLE `product_img`
  ADD PRIMARY KEY (`product_img_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `email` (`staff_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `carts_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `flavours`
--
ALTER TABLE `flavours`
  MODIFY `flavour_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lga`
--
ALTER TABLE `lga`
  MODIFY `lga_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orders_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `order_details_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `product_img`
--
ALTER TABLE `product_img`
  MODIFY `product_img_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`flavour_id`) REFERENCES `flavours` (`flavour_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`product_img_id`) REFERENCES `product_img` (`product_img_id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"todo\",\"table\":\"users\"},{\"db\":\"todo\",\"table\":\"todo\"},{\"db\":\"demoapp\",\"table\":\"customer_orders\"},{\"db\":\"todo\",\"table\":\"user\"},{\"db\":\"pastriesbysteph\",\"table\":\"carts\"},{\"db\":\"pastriesbysteph\",\"table\":\"orders\"},{\"db\":\"pastriesbysteph\",\"table\":\"customers\"},{\"db\":\"demoapp\",\"table\":\"customers\"},{\"db\":\"pastriesbysteph\",\"table\":\"payement\"},{\"db\":\"pastriesbysteph\",\"table\":\"order_details\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Dumping data for table `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('pastriesbysteph', 'product', 'product_name'),
('todo', 'todo', 'name');

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'demoapp', 'customers', '{\"sorted_col\":\"`customers`.`cust_id` DESC\"}', '2023-12-11 12:35:18'),
('root', 'pastriesbysteph', 'orders', '[]', '2024-01-29 05:31:03'),
('root', 'pastriesbysteph', 'product', '{\"CREATE_TIME\":\"2023-12-30 20:55:02\",\"col_order\":[0,1,2,3,4,5],\"col_visib\":[1,1,1,1,1,1]}', '2024-01-16 17:32:17'),
('root', 'todo', 'todo', '[]', '2024-02-01 08:29:08'),
('root', 'todo', 'users', '[]', '2024-02-29 16:00:50');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-03-01 09:28:17', '{\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":228}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `todo`
--
CREATE DATABASE IF NOT EXISTS `todo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `todo`;

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
--
-- Database: `world`
--
CREATE DATABASE IF NOT EXISTS `world` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `world`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
