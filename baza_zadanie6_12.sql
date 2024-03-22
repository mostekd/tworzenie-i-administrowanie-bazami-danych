-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2024 at 02:46 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zarzadzanieprojektami_12`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zadania_12`
--

CREATE TABLE `zadania_12` (
  `id_zadania` int(11) NOT NULL,
  `id_projektu` int(11) DEFAULT NULL,
  `nazwa_zadania` varchar(100) NOT NULL,
  `opis` text DEFAULT NULL,
  `status` enum('Do zrobienia','W trakcie','Zakończone') DEFAULT 'Do zrobienia',
  `data_deadline` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `zadania_12`
--

INSERT INTO `zadania_12` (`id_zadania`, `id_projektu`, `nazwa_zadania`, `opis`, `status`, `data_deadline`) VALUES
(10, 3, 'Zadanie 1', 'Opis zadania 1', 'Do zrobienia', '2023-03-10'),
(11, 4, 'Zadanie 2', 'Opis zadania 2', 'W trakcie', '2023-03-20'),
(12, 5, 'Zadanie 3', 'Opis zadania 3', 'Zakończone', '2023-04-25'),
(13, 6, 'Zadanie A', 'Opis zadania A', 'Do zrobienia', '2023-04-10'),
(14, 7, 'Zadanie B', 'Opis zadania B', 'W trakcie', '2023-05-20'),
(15, 8, 'Zadanie C', 'Opis zadania C', 'Zakończone', '2023-06-25'),
(16, 9, 'Zadanie D', 'Opis zadania D', 'Do zrobienia', '2023-07-30');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `zadania_12`
--
ALTER TABLE `zadania_12`
  ADD PRIMARY KEY (`id_zadania`),
  ADD KEY `id_projektu` (`id_projektu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `zadania_12`
--
ALTER TABLE `zadania_12`
  MODIFY `id_zadania` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `zadania_12`
--
ALTER TABLE `zadania_12`
  ADD CONSTRAINT `zadania_12_ibfk_1` FOREIGN KEY (`id_projektu`) REFERENCES `projekty_12` (`id_projektu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
