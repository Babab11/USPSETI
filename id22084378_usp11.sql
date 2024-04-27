-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 25, 2024 at 11:55 AM
-- Server version: 10.5.20-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id22084378_usp11`
--

-- --------------------------------------------------------

--
-- Table structure for table `Locations`
--

CREATE TABLE `Locations` (
  `locationID` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` char(2) NOT NULL,
  `zipCode` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Locations`
--

INSERT INTO `Locations` (`locationID`, `NAME`, `address`, `city`, `state`, `zipCode`) VALUES
(1, 'Main Post Office', '123 Main St', 'Anytown', 'CA', '90210'),
(2, 'Downtown Post Office', '456 Elm St', 'Anytown', 'CA', '90211'),
(3, 'Suburban Post Office', '789 Birch St', 'Anytown', 'CA', '90212'),
(4, 'City Center Post Office', '234 Cedar Rd', 'Anytown', 'CA', '90213');

-- --------------------------------------------------------

--
-- Table structure for table `Packages`
--

CREATE TABLE `Packages` (
  `packageID` int(11) NOT NULL,
  `trackingNumber` varchar(50) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `STATUS` varchar(100) DEFAULT NULL,
  `estimatedDelivery` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Packages`
--

INSERT INTO `Packages` (`packageID`, `trackingNumber`, `userID`, `STATUS`, `estimatedDelivery`) VALUES
(1, 'Z123456789', 1, 'In Transit', '2024-05-25'),
(2, 'X987654321', 2, 'Delivered', '2024-04-15'),
(3, 'Y111222333', 3, 'In Transit', '2024-06-01'),
(4, 'W444555666', 4, 'At Local Post Office', '2024-06-02'),
(5, 'V777888999', 1, 'Out for Delivery', '2024-06-03'),
(6, 'U000111222', 2, 'Returned to Sender', '2024-05-30');

-- --------------------------------------------------------

--
-- Table structure for table `Services`
--

CREATE TABLE `Services` (
  `serviceID` int(11) NOT NULL,
  `locationID` int(11) DEFAULT NULL,
  `serviceType` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Services`
--

INSERT INTO `Services` (`serviceID`, `locationID`, `serviceType`, `description`, `price`) VALUES
(1, 1, 'Standard Mail', 'Deliver within 3-5 business days.', 0.55),
(2, 1, 'Priority Mail', 'Deliver within 1-3 business days.', 7.50),
(3, 2, 'International Mail', 'Deliver to over 190 countries.', 1.20),
(4, 3, 'Express Mail', 'Guaranteed overnight delivery.', 25.00),
(5, 3, 'Certified Mail', 'Provides proof of mailing.', 3.75),
(6, 4, 'Registered Mail', 'Secures valuables with postal insurance.', 12.50),
(7, 4, 'Media Mail', 'Economical way to send media materials.', 2.80),
(8, 1, 'Express International', 'International delivery in 3-5 days.', 45.50),
(9, 2, 'Global Express Guaranteed', 'Delivery to over 190 countries in 1-3 days.', 60.00),
(10, 3, 'Post Office Box Rental', 'Monthly rental of a post office box.', 15.00),
(11, 4, 'Money Order', 'Secure payment method for up to $1,000.', 1.25);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `userID` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`userID`, `username`, `PASSWORD`, `email`) VALUES
(1, 'user1', 'hashed_password1', 'user1@example.com'),
(2, 'user2', 'hashed_password2', 'user2@example.com'),
(3, 'user3', 'hashed_password3', 'user3@example.com'),
(4, 'user4', 'hashed_password4', 'user4@example.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Locations`
--
ALTER TABLE `Locations`
  ADD PRIMARY KEY (`locationID`);

--
-- Indexes for table `Packages`
--
ALTER TABLE `Packages`
  ADD PRIMARY KEY (`packageID`),
  ADD UNIQUE KEY `trackingNumber` (`trackingNumber`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `Services`
--
ALTER TABLE `Services`
  ADD PRIMARY KEY (`serviceID`),
  ADD KEY `locationID` (`locationID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Locations`
--
ALTER TABLE `Locations`
  MODIFY `locationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Packages`
--
ALTER TABLE `Packages`
  MODIFY `packageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Services`
--
ALTER TABLE `Services`
  MODIFY `serviceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Packages`
--
ALTER TABLE `Packages`
  ADD CONSTRAINT `Packages_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `Users` (`userID`);

--
-- Constraints for table `Services`
--
ALTER TABLE `Services`
  ADD CONSTRAINT `Services_ibfk_1` FOREIGN KEY (`locationID`) REFERENCES `Locations` (`locationID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
