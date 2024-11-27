-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 27, 2024 at 01:28 PM
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
-- Database: `firma_wers`
--
DROP DATABASE IF EXISTS `firma_wers`;
CREATE DATABASE `firma_wers` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `firma_wers`;

-- --------------------------------------------------------

--
-- Table structure for table `KategorieProduktow`
--

DROP TABLE IF EXISTS `KategorieProduktow`;
CREATE TABLE IF NOT EXISTS `KategorieProduktow` (
  `ID_Kategorii` int(11) NOT NULL AUTO_INCREMENT,
  `Nazwa_Kategorii` varchar(100) NOT NULL,
  `Opis` text DEFAULT NULL,
  PRIMARY KEY (`ID_Kategorii`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `KategorieProduktow`
--

INSERT INTO `KategorieProduktow` (`ID_Kategorii`, `Nazwa_Kategorii`, `Opis`) VALUES
(1, 'Elektronika', 'Urządzenia elektroniczne, takie jak laptopy i smartfony'),
(2, 'RTV', 'Sprzęt RTV, w tym telewizory i głośniki'),
(3, 'AGD', 'Sprzęt gospodarstwa domowego, taki jak lodówki i pralki');

-- --------------------------------------------------------

--
-- Table structure for table `Klienci`
--

DROP TABLE IF EXISTS `Klienci`;
CREATE TABLE IF NOT EXISTS `Klienci` (
  `ID_Klienta` int(11) NOT NULL AUTO_INCREMENT,
  `Imie` varchar(50) NOT NULL,
  `Nazwisko` varchar(50) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Telefon` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID_Klienta`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Klienci`
--

INSERT INTO `Klienci` (`ID_Klienta`, `Imie`, `Nazwisko`, `Email`, `Telefon`) VALUES
(1, 'Krzysztof', 'Malinowski', 'krzysztof.malinowski@example.com', '123456789'),
(2, 'Ewa', 'Wiśniewska', 'ewa.wisniewska@example.com', '987654321'),
(3, 'Piotr', 'Nowicki', 'piotr.nowicki@example.com', '456789123');

-- --------------------------------------------------------

--
-- Table structure for table `Pracownicy`
--

DROP TABLE IF EXISTS `Pracownicy`;
CREATE TABLE IF NOT EXISTS `Pracownicy` (
  `ID_Pracownika` int(11) NOT NULL AUTO_INCREMENT,
  `Imie` varchar(50) NOT NULL,
  `Nazwisko` varchar(50) NOT NULL,
  `Stanowisko` varchar(50) DEFAULT NULL,
  `Data_Zatrudnienia` date NOT NULL,
  `Wynagrodzenie` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_Pracownika`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Pracownicy`
--

INSERT INTO `Pracownicy` (`ID_Pracownika`, `Imie`, `Nazwisko`, `Stanowisko`, `Data_Zatrudnienia`, `Wynagrodzenie`) VALUES
(1, 'Jan', 'Kowalski', 'Kierownik', '2020-01-15', 5500.00),
(2, 'Anna', 'Nowak', 'Sprzedawca', '2021-03-10', 3500.00),
(3, 'Marek', 'Zieliński', 'Magazynier', '2022-06-20', 3200.00);

-- --------------------------------------------------------

--
-- Table structure for table `Produkty`
--

DROP TABLE IF EXISTS `Produkty`;
CREATE TABLE IF NOT EXISTS `Produkty` (
  `ID_Produktu` int(11) NOT NULL AUTO_INCREMENT,
  `Nazwa_Produktu` varchar(100) NOT NULL,
  `Cena` decimal(10,2) NOT NULL,
  `Ilosc_Magazynowa` int(11) NOT NULL,
  PRIMARY KEY (`ID_Produktu`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Produkty`
--

INSERT INTO `Produkty` (`ID_Produktu`, `Nazwa_Produktu`, `Cena`, `Ilosc_Magazynowa`) VALUES
(1, 'Laptop Dell', 3000.00, 15),
(2, 'Smartfon Samsung', 1200.00, 30),
(3, 'Monitor LG', 800.00, 25);

-- --------------------------------------------------------

--
-- Table structure for table `Sprzedaz`
--

DROP TABLE IF EXISTS `Sprzedaz`;
CREATE TABLE IF NOT EXISTS `Sprzedaz` (
  `ID_Sprzedazy` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Produktu` int(11) DEFAULT NULL,
  `ID_Pracownika` int(11) DEFAULT NULL,
  `Data_Sprzedazy` date NOT NULL,
  `Ilosc` int(11) NOT NULL,
  PRIMARY KEY (`ID_Sprzedazy`),
  KEY `ID_Produktu` (`ID_Produktu`),
  KEY `ID_Pracownika` (`ID_Pracownika`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Sprzedaz`
--

INSERT INTO `Sprzedaz` (`ID_Sprzedazy`, `ID_Produktu`, `ID_Pracownika`, `Data_Sprzedazy`, `Ilosc`) VALUES
(1, 1, 2, '2023-11-20', 2),
(2, 2, 1, '2023-11-25', 5),
(3, 3, 3, '2023-11-26', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Zamowienia`
--

DROP TABLE IF EXISTS `Zamowienia`;
CREATE TABLE IF NOT EXISTS `Zamowienia` (
  `ID_Zamowienia` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Klienta` int(11) DEFAULT NULL,
  `Data_Zamowienia` date NOT NULL,
  `Status` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_Zamowienia`),
  KEY `ID_Klienta` (`ID_Klienta`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Zamowienia`
--

INSERT INTO `Zamowienia` (`ID_Zamowienia`, `ID_Klienta`, `Data_Zamowienia`, `Status`) VALUES
(1, 1, '2023-11-15', 'Zrealizowane'),
(2, 2, '2023-11-20', 'W trakcie realizacji'),
(3, 3, '2023-11-25', 'Anulowane');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Sprzedaz`
--
ALTER TABLE `Sprzedaz`
  ADD CONSTRAINT `Sprzedaz_ibfk_1` FOREIGN KEY (`ID_Produktu`) REFERENCES `Produkty` (`ID_Produktu`),
  ADD CONSTRAINT `Sprzedaz_ibfk_2` FOREIGN KEY (`ID_Pracownika`) REFERENCES `Pracownicy` (`ID_Pracownika`);

--
-- Constraints for table `Zamowienia`
--
ALTER TABLE `Zamowienia`
  ADD CONSTRAINT `Zamowienia_ibfk_1` FOREIGN KEY (`ID_Klienta`) REFERENCES `Klienci` (`ID_Klienta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
