-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2024 at 04:17 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trip_planner`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin1', 'adminPass123'),
(2, 'admin2', 'adminPass456'),
(3, 'admin3', 'adminPass789'),
(4, 'admin4', 'adminPass1011'),
(5, 'admin5', 'adminPass1213'),
(6, 'admin6', 'adminPass1415'),
(7, 'admin7', 'adminPass1617'),
(8, 'admin8', 'adminPass1819'),
(9, 'admin9', 'adminPass2021'),
(10, 'admin10', 'adminPass2223');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `trip_id` int(11) DEFAULT NULL,
  `booking_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `seats_booked` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `user_id`, `trip_id`, `booking_date`, `seats_booked`) VALUES
(1, 1, 1, '2024-09-19 11:26:36', 2),
(2, 2, 2, '2024-09-19 11:26:36', 1),
(3, 3, 3, '2024-09-19 11:26:36', 4),
(4, 4, 4, '2024-09-19 11:26:36', 2),
(5, 5, 5, '2024-09-19 11:26:36', 3),
(6, 6, 6, '2024-09-19 11:26:36', 2),
(7, 7, 7, '2024-09-19 11:26:36', 1),
(8, 8, 8, '2024-09-19 11:26:36', 2),
(9, 9, 9, '2024-09-19 11:26:36', 4),
(10, 10, 10, '2024-09-19 11:26:36', 2),
(11, 11, 17, '2024-09-19 19:00:00', 5);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `user_id`) VALUES
(1, 'Luxury', 1),
(2, 'Business', 2),
(3, 'Family', 3),
(4, 'Adventure', 4),
(5, 'Cultural', 5),
(6, 'Nature', 6),
(7, 'City', 7),
(8, 'Beach', 8),
(9, 'Wildlife', 9),
(10, 'Winter', 10);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `expense` decimal(10,2) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `trip_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `category`, `amount`, `expense`, `notes`, `user_id`, `trip_id`) VALUES
(1, 'Accommodation', 1500.00, 1500.00, 'Hotel booking', 1, 1),
(2, 'Flight', 1000.00, 1000.00, 'Round trip', 2, 2),
(3, 'Food', 300.00, 300.00, 'Meals', 3, 3),
(4, 'Transport', 500.00, 500.00, 'Rental car', 4, 4),
(5, 'Miscellaneous', 200.00, 200.00, 'Souvenirs', 5, 5),
(6, 'Activities', 1200.00, 1200.00, 'Excursions', 6, 6),
(7, 'Insurance', 400.00, 400.00, 'Travel insurance', 7, 7),
(8, 'Visa Fees', 300.00, 300.00, 'Visa application', 8, 8),
(9, 'Equipment', 700.00, 700.00, 'Safari gear', 9, 9),
(10, 'Winter Gear', 800.00, 800.00, 'Clothing', 10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `trip`
--

CREATE TABLE `trip` (
  `id` int(11) NOT NULL,
  `trip_name` varchar(255) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `budget` decimal(10,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trip`
--

INSERT INTO `trip` (`id`, `trip_name`, `destination`, `budget`, `start_date`, `end_date`, `user_id`) VALUES
(1, 'Summer Vacation', 'Hawaii', 5000.00, '2024-07-10', '2024-07-20', 1),
(2, 'Business Conference', 'New York', 3000.00, '2024-09-01', '2024-09-05', 2),
(3, 'Family Reunion', 'Florida', 2500.00, '2024-12-20', '2024-12-30', 3),
(4, 'Adventure Trek', 'Nepal', 4000.00, '2025-03-15', '2025-03-25', 4),
(5, 'Cultural Tour', 'Japan', 7000.00, '2025-05-10', '2025-05-20', 5),
(6, 'Mountain Escape', 'Switzerland', 8000.00, '2025-06-01', '2025-06-10', 6),
(7, 'City Break', 'Paris', 4500.00, '2025-07-05', '2025-07-15', 7),
(8, 'Beach Holiday', 'Maldives', 6500.00, '2025-08-20', '2025-08-30', 8),
(9, 'Safari Adventure', 'Kenya', 6000.00, '2025-09-10', '2025-09-20', 9),
(10, 'Winter Wonderland', 'Iceland', 7000.00, '2025-12-01', '2025-12-10', 10),
(11, 'indonseia', 'bali', 77777.00, '2024-09-21', '2024-10-08', 4),
(12, 'indonseia', 'bali', 77777.00, '2024-09-21', '2024-10-08', 4),
(13, 'indonseia', 'bali', 77777.00, '2024-09-21', '2024-10-08', 4),
(14, 'England', 'London', 999.00, '2024-09-03', '2024-10-08', NULL),
(15, 'England', 'London', 999.00, '2024-09-03', '2024-10-08', NULL),
(16, 'England', 'London', 999.00, '2024-09-03', '2024-10-08', NULL),
(17, '', 'new-york', 0.00, '2024-09-02', '2024-10-11', 11);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `password`, `email`) VALUES
(1, 'John', 'Doe', 'password123', 'john.doe@example.com'),
(2, 'Jane', 'Smith', 'password456', 'jane.smith@example.com'),
(3, 'Michael', 'Johnson', 'password789', 'michael.johnson@example.com'),
(4, 'Emily', 'Davis', 'passwordABC', 'emily.davis@example.com'),
(5, 'William', 'Brown', 'passwordXYZ', 'william.brown@example.com'),
(6, 'Sophia', 'Wilson', 'password1234', 'sophia.wilson@example.com'),
(7, 'James', 'Taylor', 'password5678', 'james.taylor@example.com'),
(8, 'Olivia', 'Anderson', 'password91011', 'olivia.anderson@example.com'),
(9, 'Liam', 'Thomas', 'password1213', 'liam.thomas@example.com'),
(10, 'Isabella', 'Moore', 'password1415', 'isabella.moore@example.com'),
(11, 'syed', 'ahmed', '', 'ahmi@gmail.com'),
(12, 'bilal', 'ahmred', '$2y$10$vmGhWvkd9MyMu/bhQA8SmeOUgzQMAN0GmzXYk5iJYAu8X.JH6CZTK', 'bilal@gmail.com'),
(16, 'maaz ', 'ghori', '$2y$10$3rZ.W.y/oNIH7DC4rE8LAu0o3PTxCHHoJRsrtENK/Vq4SlrMmbPua', 'maaz@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `trip_id` (`trip_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `trip_id` (`trip_id`);

--
-- Indexes for table `trip`
--
ALTER TABLE `trip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `trip`
--
ALTER TABLE `trip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`);

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `expenses_ibfk_2` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`);

--
-- Constraints for table `trip`
--
ALTER TABLE `trip`
  ADD CONSTRAINT `trip_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
