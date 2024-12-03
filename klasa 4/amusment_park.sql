-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 02, 2024 at 08:54 PM
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
-- Database: `amusement_park`
--
DROP DATABASE IF EXISTS `amusement_park`;
CREATE DATABASE IF NOT EXISTS `amusement_park` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `amusement_park`;

-- --------------------------------------------------------

--
-- Table structure for table `attractions`
--

CREATE TABLE IF NOT EXISTS `attractions` (
  `attraction_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`attraction_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `attractions`:
--   `employee_id`
--       `employees` -> `employee_id`
--

--
-- Dumping data for table `attractions`
--

INSERT INTO `attractions` (`attraction_id`, `name`, `description`, `employee_id`) VALUES
(1, 'Rollercoaster', 'Największy rollercoaster w parku', 1),
(2, 'Karuzela', 'Tradycyjna karuzela dla dzieci', 2),
(3, 'Dom strachów', 'Atrakcja dla miłośników horrorów', 3),
(4, 'Basen z kulkami', 'Bezpieczna zabawa dla najmłodszych', 4),
(5, 'Wieża spadków', 'Przygoda dla fanów adrenaliny', 5),
(6, 'Labirynt luster', 'Ciekawe doświadczenie optyczne', 6),
(7, 'Wodny zjazd', 'Atrakcja z efektami wodnymi', 7),
(8, 'Strzelnica', 'Sprawdź swoje umiejętności strzeleckie', 8),
(9, 'Trampoliny', 'Zabawa z wysokościami', 9),
(10, 'Kolejka widokowa', 'Widok na cały park', 10);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `email_address` varchar(100) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `customers`:
--

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `first_name`, `last_name`, `phone_number`, `email_address`) VALUES
(1, 'Anna', 'Kowalska', '123456789', 'anna.kowalska@example.com'),
(2, 'Jan', 'Nowak', '234567890', 'jan.nowak@example.com'),
(3, 'Ewa', 'Wiśniewska', '345678901', 'ewa.wisniewska@example.com'),
(4, 'Piotr', 'Wójcik', '456789012', 'piotr.wojcik@example.com'),
(5, 'Katarzyna', 'Zielińska', '567890123', 'katarzyna.zielinska@example.com'),
(6, 'Tomasz', 'Kamiński', '678901234', 'tomasz.kaminski@example.com'),
(7, 'Monika', 'Lewandowska', '789012345', 'monika.lewandowska@example.com'),
(8, 'Marek', 'Krawczyk', '890123456', 'marek.krawczyk@example.com'),
(9, 'Agnieszka', 'Piotrowska', '901234567', 'agnieszka.piotrowska@example.com'),
(10, 'Łukasz', 'Kaczmarek', '012345678', 'lukasz.kaczmarek@example.com'),
(11, 'Paweł', 'Adamski', '222333444', 'pawel.adamski@example.com'),
(12, 'Magdalena', 'Sikora', '333444555', 'magdalena.sikora@example.com'),
(13, 'Robert', 'Jankowski', '444555666', 'robert.jankowski@example.com'),
(14, 'Sylwia', 'Król', '555666777', 'sylwia.krol@example.com'),
(15, 'Damian', 'Baran', '666777888', 'damian.baran@example.com'),
(16, 'Justyna', 'Wróbel', '777888999', 'justyna.wrobel@example.com'),
(17, 'Michał', 'Lis', '888999000', 'michal.lis@example.com'),
(18, 'Beata', 'Kołodziej', '999000111', 'beata.kolodziej@example.com'),
(19, 'Adrian', 'Czajka', '111222333', 'adrian.czajka@example.com'),
(20, 'Natalia', 'Wilk', '222333444', 'natalia.wilk@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE IF NOT EXISTS `discounts` (
  `discount_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_type` varchar(20) NOT NULL,
  `discount_value` decimal(5,2) NOT NULL,
  PRIMARY KEY (`discount_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `discounts`:
--

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`discount_type_id`, `discount_type`, `discount_value`) VALUES
(1, 'Brak zniżki', 0.00),
(2, 'Student', 15.00),
(3, 'Dziecko', 20.00),
(4, 'Senior', 10.00),
(5, 'Grupowa', 25.00),
(6, 'Rodzinna', 30.00),
(7, 'Weekendowa', 5.00),
(8, 'Promocja', 20.00),
(9, 'Specjalna okazja', 40.00),
(10, 'VIP', 50.00);

-- --------------------------------------------------------

--
-- Table structure for table `discount_history`
--

CREATE TABLE IF NOT EXISTS `discount_history` (
  `discount_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `old_discount_id` int(11) DEFAULT NULL,
  `new_discount_id` int(11) NOT NULL,
  `change_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`discount_history_id`),
  KEY `order_id` (`order_id`),
  KEY `old_discount_id` (`old_discount_id`),
  KEY `new_discount_id` (`new_discount_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `discount_history`:
--   `order_id`
--       `orders` -> `order_id`
--   `old_discount_id`
--       `discounts` -> `discount_type_id`
--   `new_discount_id`
--       `discounts` -> `discount_type_id`
--

--
-- Dumping data for table `discount_history`
--

INSERT INTO `discount_history` (`discount_history_id`, `order_id`, `old_discount_id`, `new_discount_id`, `change_date`) VALUES
(1, 1, NULL, 2, '2024-11-01 10:15:00'),
(2, 2, NULL, 3, '2024-11-02 11:45:00'),
(3, 3, NULL, 4, '2024-11-03 12:30:00'),
(4, 4, NULL, 5, '2024-11-04 13:45:00'),
(5, 5, NULL, 6, '2024-11-05 14:50:00'),
(6, 6, NULL, 7, '2024-11-06 15:40:00'),
(7, 7, NULL, 8, '2024-11-07 16:45:00'),
(8, 8, NULL, 9, '2024-11-08 17:50:00'),
(9, 9, NULL, 10, '2024-11-09 18:55:00'),
(10, 10, NULL, 1, '2024-11-10 19:50:00');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE IF NOT EXISTS `employees` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `position_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `contract_number` varchar(20) DEFAULT NULL,
  `employment_end_date` date DEFAULT NULL,
  `salary` decimal(10,2) NOT NULL,
  `bonus` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `position_id` (`position_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `employees`:
--   `position_id`
--       `positions` -> `position_id`
--   `customer_id`
--       `customers` -> `customer_id`
--

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `position_id`, `customer_id`, `contract_number`, `employment_end_date`, `salary`, `bonus`) VALUES
(1, 1, 11, 'CON123', NULL, 5000.00, 500.00),
(2, 2, 12, 'CON124', NULL, 4000.00, 300.00),
(3, 3, 13, 'CON125', NULL, 3500.00, 200.00),
(4, 4, 14, 'CON126', NULL, 6000.00, 700.00),
(5, 5, 15, 'CON127', NULL, 3000.00, 100.00),
(6, 6, 16, 'CON128', NULL, 4500.00, 400.00),
(7, 7, 17, 'CON129', NULL, 4000.00, 300.00),
(8, 8, 18, 'CON130', NULL, 3800.00, 250.00),
(9, 9, 19, 'CON131', NULL, 4200.00, 350.00),
(10, 10, 20, 'CON132', NULL, 7000.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `approving_employee_id` int(11) DEFAULT NULL,
  `payment_type_id` int(11) NOT NULL,
  `purchase_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `discount_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `customer_id` (`customer_id`),
  KEY `approving_employee_id` (`approving_employee_id`),
  KEY `payment_type_id` (`payment_type_id`),
  KEY `discount_id` (`discount_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `orders`:
--   `ticket_id`
--       `tickets` -> `ticket_id`
--   `customer_id`
--       `customers` -> `customer_id`
--   `approving_employee_id`
--       `employees` -> `employee_id`
--   `payment_type_id`
--       `payment_types` -> `payment_type_id`
--   `discount_id`
--       `discounts` -> `discount_type_id`
--

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `ticket_id`, `approving_employee_id`, `payment_type_id`, `purchase_date`, `discount_id`) VALUES
(1, 1, 1, 1, 1, '2024-11-01 09:00:00', NULL),
(2, 2, 2, 2, 2, '2024-11-02 10:30:00', 2),
(3, 3, 3, 3, 3, '2024-11-03 11:00:00', 3),
(4, 4, 4, 4, 4, '2024-11-04 12:15:00', 4),
(5, 5, 5, 5, 5, '2024-11-05 13:20:00', 5),
(6, 6, 6, 6, 6, '2024-11-06 14:25:00', 6),
(7, 7, 7, 7, 7, '2024-11-07 15:30:00', 7),
(8, 8, 8, 8, 8, '2024-11-08 16:35:00', 8),
(9, 9, 9, 9, 9, '2024-11-09 17:40:00', 9),
(10, 10, 10, 10, 10, '2024-11-10 18:45:00', 10);

-- --------------------------------------------------------

--
-- Table structure for table `order_tickets`
--

CREATE TABLE IF NOT EXISTS `order_tickets` (
  `order_ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`order_ticket_id`),
  KEY `order_id` (`order_id`),
  KEY `ticket_id` (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `order_tickets`:
--   `order_id`
--       `orders` -> `order_id`
--   `ticket_id`
--       `tickets` -> `ticket_id`
--

--
-- Dumping data for table `order_tickets`
--

INSERT INTO `order_tickets` (`order_ticket_id`, `order_id`, `ticket_id`, `quantity`) VALUES
(1, 1, 1, 2),
(2, 2, 2, 3),
(3, 3, 3, 1),
(4, 4, 4, 5),
(5, 5, 5, 2),
(6, 6, 6, 4),
(7, 7, 7, 1),
(8, 8, 8, 3),
(9, 9, 9, 6),
(10, 10, 10, 2);

-- --------------------------------------------------------

--
-- Table structure for table `payment_types`
--

CREATE TABLE IF NOT EXISTS `payment_types` (
  `payment_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(20) NOT NULL,
  PRIMARY KEY (`payment_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `payment_types`:
--

--
-- Dumping data for table `payment_types`
--

INSERT INTO `payment_types` (`payment_type_id`, `payment_type`) VALUES
(1, 'Gotówka'),
(2, 'Karta kredytowa'),
(3, 'Karta debetowa'),
(4, 'BLIK'),
(5, 'Przelew'),
(6, 'PayPal'),
(7, 'Apple Pay'),
(8, 'Google Pay'),
(9, 'Voucher'),
(10, 'Bitcoin');

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE IF NOT EXISTS `positions` (
  `position_id` int(11) NOT NULL AUTO_INCREMENT,
  `position_name` varchar(50) NOT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `positions`:
--

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`position_id`, `position_name`) VALUES
(1, 'Kierownik atrakcji'),
(2, 'Operator atrakcji'),
(3, 'Kasjer'),
(4, 'Menadżer sprzedaży'),
(5, 'Pracownik ochrony'),
(6, 'Specjalista IT'),
(7, 'Członek obsługi technicznej'),
(8, 'Animator zabaw'),
(9, 'Ratownik medyczny'),
(10, 'Dyrektor');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE IF NOT EXISTS `tickets` (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_type_id` int(11) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `ticket_type_id` (`ticket_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `tickets`:
--   `ticket_type_id`
--       `ticket_types` -> `ticket_type_id`
--

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`ticket_id`, `ticket_type_id`, `price`) VALUES
(1, 1, 50.00),
(2, 2, 30.00),
(3, 3, 100.00),
(4, 4, 40.00),
(5, 5, 200.00),
(6, 6, 500.00),
(7, 7, 350.00),
(8, 8, 80.00),
(9, 9, 120.00),
(10, 10, 400.00);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_prices`
--

CREATE TABLE IF NOT EXISTS `ticket_prices` (
  `ticket_price_id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `valid_from` datetime NOT NULL,
  `valid_to` datetime DEFAULT NULL,
  PRIMARY KEY (`ticket_price_id`),
  KEY `ticket_id` (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `ticket_prices`:
--   `ticket_id`
--       `tickets` -> `ticket_id`
--

--
-- Dumping data for table `ticket_prices`
--

INSERT INTO `ticket_prices` (`ticket_price_id`, `ticket_id`, `price`, `valid_from`, `valid_to`) VALUES
(1, 1, 55.00, '2024-11-01 00:00:00', '2024-11-07 23:59:59'),
(2, 2, 32.00, '2024-11-02 00:00:00', '2024-11-07 23:59:59'),
(3, 3, 105.00, '2024-11-03 00:00:00', '2024-11-07 23:59:59'),
(4, 4, 42.00, '2024-11-04 00:00:00', '2024-11-07 23:59:59'),
(5, 5, 210.00, '2024-11-05 00:00:00', '2024-11-07 23:59:59'),
(6, 6, 520.00, '2024-11-06 00:00:00', '2024-11-07 23:59:59'),
(7, 7, 360.00, '2024-11-07 00:00:00', '2024-11-07 23:59:59'),
(8, 8, 85.00, '2024-11-08 00:00:00', '2024-11-14 23:59:59'),
(9, 9, 125.00, '2024-11-09 00:00:00', '2024-11-14 23:59:59'),
(10, 10, 410.00, '2024-11-10 00:00:00', '2024-11-14 23:59:59');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_types`
--

CREATE TABLE IF NOT EXISTS `ticket_types` (
  `ticket_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_type` varchar(20) NOT NULL,
  PRIMARY KEY (`ticket_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `ticket_types`:
--

--
-- Dumping data for table `ticket_types`
--

INSERT INTO `ticket_types` (`ticket_type_id`, `ticket_type`) VALUES
(1, 'Normalny'),
(2, 'Ulgowy'),
(3, 'Rodzinny'),
(4, 'Senior'),
(5, 'Sezonowy'),
(6, 'VIP'),
(7, 'Grupowy'),
(8, 'Weekendowy'),
(9, 'Specjalny'),
(10, 'Dla firm');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attractions`
--
ALTER TABLE `attractions`
  ADD CONSTRAINT `attractions_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Constraints for table `discount_history`
--
ALTER TABLE `discount_history`
  ADD CONSTRAINT `discount_history_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `discount_history_ibfk_2` FOREIGN KEY (`old_discount_id`) REFERENCES `discounts` (`discount_type_id`),
  ADD CONSTRAINT `discount_history_ibfk_3` FOREIGN KEY (`new_discount_id`) REFERENCES `discounts` (`discount_type_id`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`position_id`) REFERENCES `positions` (`position_id`),
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`approving_employee_id`) REFERENCES `employees` (`employee_id`),
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_types` (`payment_type_id`),
  ADD CONSTRAINT `orders_ibfk_5` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`discount_type_id`);

--
-- Constraints for table `order_tickets`
--
ALTER TABLE `order_tickets`
  ADD CONSTRAINT `order_tickets_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_tickets_ibfk_2` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`);

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`ticket_type_id`) REFERENCES `ticket_types` (`ticket_type_id`);

--
-- Constraints for table `ticket_prices`
--
ALTER TABLE `ticket_prices`
  ADD CONSTRAINT `ticket_prices_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
