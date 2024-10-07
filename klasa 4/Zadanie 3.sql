CREATE DATABASE IF NOT EXISTS komis;
USE komis;

CREATE TABLE Pojazdy (
    ID_pojazdu INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Unikalny identyfikator pojazdu',
    Marka VARCHAR(30) COMMENT 'Marka pojazdu (np. Toyota)',
    Model VARCHAR(50) COMMENT 'Model pojazdu (np. Corolla)',
    Rok_produkcji YEAR COMMENT 'Rok produkcji pojazdu',
    Cena DECIMAL(10, 2) COMMENT 'Cena pojazdu',
    Status VARCHAR(20) COMMENT 'Status pojazdu (np. "Dostępny", "Sprzedany")'
);

CREATE TABLE Klienci (
    ID_klienta INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Unikalny identyfikator klienta',
    Imie VARCHAR(12) COMMENT 'Imię klienta',
    Nazwisko VARCHAR(25) COMMENT 'Nazwisko klienta',
    Email VARCHAR(100) COMMENT 'Adres email klienta',
    Telefon VARCHAR(15) COMMENT 'Numer telefonu klienta',
    Adres VARCHAR(255) COMMENT 'Adres zamieszkania klienta'
);

CREATE TABLE Pracownicy (
    ID_pracownika INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Unikalny identyfikator pracownika',
    Imie VARCHAR(12) COMMENT 'Imię pracownika',
    Nazwisko VARCHAR(25) COMMENT 'Nazwisko pracownika',
    Stanowisko VARCHAR(50) COMMENT 'Stanowisko (np. "Sprzedawca")',
    Telefon_służbowy VARCHAR(15) COMMENT 'Numer telefonu służbowego'
);

CREATE TABLE Transakcje (
    ID_transakcji INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Unikalny identyfikator transakcji',
    ID_pojazdu INT COMMENT 'Identyfikator pojazdu sprzedanego (FK do Pojazdy)',
    ID_klienta INT COMMENT 'Identyfikator klienta (FK do Klienci)',
    ID_pracownika INT COMMENT 'Identyfikator pracownika obsługującego transakcję (FK do Pracownicy)',
    Data_sprzedazy DATE COMMENT 'Data transakcji',
    Cena_sprzedazy DECIMAL(10, 2) COMMENT 'Ostateczna cena sprzedaży',
);

