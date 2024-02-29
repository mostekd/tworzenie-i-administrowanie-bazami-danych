-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2024 at 12:41 PM
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
-- Database: `baza_12`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kategorie`
--

CREATE TABLE `kategorie` (
  `idKategoria` int(11) NOT NULL,
  `nazwa` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nadawca`
--

CREATE TABLE `nadawca` (
  `idNadawca` int(11) NOT NULL,
  `imie` varchar(45) NOT NULL,
  `nazwisko` varchar(45) NOT NULL,
  `ulica` varchar(45) NOT NULL,
  `miasto` varchar(45) NOT NULL,
  `kod` varchar(45) NOT NULL,
  `telefon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `odbiorca`
--

CREATE TABLE `odbiorca` (
  `idOdbiorca` int(11) NOT NULL,
  `imie` varchar(45) NOT NULL,
  `nazwisko` varchar(45) NOT NULL,
  `ulica` varchar(45) NOT NULL,
  `miasto` varchar(45) NOT NULL,
  `kod` varchar(45) NOT NULL,
  `telefon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `idPracownik` int(11) NOT NULL,
  `imie` varchar(45) NOT NULL,
  `nazwisko` varchar(45) NOT NULL,
  `pesel` int(11) NOT NULL,
  `ulica` varchar(45) NOT NULL,
  `miasto` varchar(45) NOT NULL,
  `kod` varchar(45) NOT NULL,
  `telefon` int(11) NOT NULL,
  `haslo` varchar(45) NOT NULL,
  `szef` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przesylki`
--

CREATE TABLE `przesylki` (
  `idPrzesylka` int(11) NOT NULL,
  `nazwa` varchar(45) DEFAULT NULL,
  `cena` double DEFAULT NULL,
  `platnosci` tinyint(1) DEFAULT NULL,
  `idReklamacja` int(11) NOT NULL,
  `idKategoria` int(11) NOT NULL,
  `idStan` int(11) NOT NULL,
  `idPracownik` int(11) NOT NULL,
  `idOdbiorca` int(11) NOT NULL,
  `idNadawca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `reklamacje`
--

CREATE TABLE `reklamacje` (
  `idReklamacja` int(11) NOT NULL,
  `Nazwa` varchar(45) NOT NULL,
  `Opis` varchar(45) NOT NULL,
  `Rozpatrzenie` tinyint(1) NOT NULL,
  `Odpowiedz` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stan`
--

CREATE TABLE `stan` (
  `idStan` int(11) NOT NULL,
  `nazwa` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`idKategoria`);

--
-- Indeksy dla tabeli `nadawca`
--
ALTER TABLE `nadawca`
  ADD PRIMARY KEY (`idNadawca`);

--
-- Indeksy dla tabeli `odbiorca`
--
ALTER TABLE `odbiorca`
  ADD PRIMARY KEY (`idOdbiorca`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`idPracownik`);

--
-- Indeksy dla tabeli `przesylki`
--
ALTER TABLE `przesylki`
  ADD PRIMARY KEY (`idPrzesylka`,`idReklamacja`,`idKategoria`,`idStan`,`idPracownik`,`idOdbiorca`,`idNadawca`);

--
-- Indeksy dla tabeli `reklamacje`
--
ALTER TABLE `reklamacje`
  ADD PRIMARY KEY (`idReklamacja`);

--
-- Indeksy dla tabeli `stan`
--
ALTER TABLE `stan`
  ADD PRIMARY KEY (`idStan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `idKategoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nadawca`
--
ALTER TABLE `nadawca`
  MODIFY `idNadawca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `odbiorca`
--
ALTER TABLE `odbiorca`
  MODIFY `idOdbiorca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `idPracownik` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reklamacje`
--
ALTER TABLE `reklamacje`
  MODIFY `idReklamacja` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stan`
--
ALTER TABLE `stan`
  MODIFY `idStan` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
