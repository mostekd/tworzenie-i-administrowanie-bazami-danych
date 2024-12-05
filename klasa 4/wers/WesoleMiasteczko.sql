
-- Tworzenie bazy danych
CREATE DATABASE IF NOT EXISTS WesoleMiasteczko;
USE WesoleMiasteczko;

-- Tabela: Uzytkownicy
CREATE TABLE IF NOT EXISTS Uzytkownicy (
    id_uzytkownika INT AUTO_INCREMENT PRIMARY KEY,
    imie VARCHAR(50) NOT NULL,
    nazwisko VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    haslo VARCHAR(255) NOT NULL,
    rola ENUM('uzytkownik', 'administrator') DEFAULT 'uzytkownik'
);

-- Tabela: Bilety
CREATE TABLE IF NOT EXISTS Bilety (
    id_biletu INT AUTO_INCREMENT PRIMARY KEY,
    id_uzytkownika INT NOT NULL,
    rodzaj_biletu ENUM('normalny', 'ulgowy', 'grupowy') NOT NULL,
    cena DECIMAL(6,2) NOT NULL,
    data_zakupu DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_uzycia DATE NOT NULL,
    FOREIGN KEY (id_uzytkownika) REFERENCES Uzytkownicy(id_uzytkownika)
);

-- Tabela: Atrakcje
CREATE TABLE IF NOT EXISTS Atrakcje (
    id_atrakcji INT AUTO_INCREMENT PRIMARY KEY,
    nazwa VARCHAR(100) NOT NULL,
    opis TEXT NOT NULL,
    wiek_minimalny INT NOT NULL,
    rodzaj VARCHAR(50) NOT NULL
);

-- Tabela: Oceny
CREATE TABLE IF NOT EXISTS Oceny (
    id_oceny INT AUTO_INCREMENT PRIMARY KEY,
    id_atrakcji INT NOT NULL,
    id_uzytkownika INT NOT NULL,
    ocena INT CHECK (ocena BETWEEN 1 AND 5),
    komentarz TEXT,
    data_dodania DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_atrakcji) REFERENCES Atrakcje(id_atrakcji),
    FOREIGN KEY (id_uzytkownika) REFERENCES Uzytkownicy(id_uzytkownika)
);

-- Tabela: FAQ
CREATE TABLE IF NOT EXISTS FAQ (
    id_pytania INT AUTO_INCREMENT PRIMARY KEY,
    pytanie TEXT NOT NULL,
    odpowiedz TEXT NOT NULL
);

-- Przykładowe dane: Uzytkownicy
INSERT INTO Uzytkownicy (imie, nazwisko, email, haslo, rola) VALUES
('Jan', 'Kowalski', 'jan.kowalski@example.com', 'haslo123', 'uzytkownik'),
('Anna', 'Nowak', 'anna.nowak@example.com', 'haslo456', 'administrator');

-- Przykładowe dane: Atrakcje
INSERT INTO Atrakcje (nazwa, opis, wiek_minimalny, rodzaj) VALUES
('Kolejka Górska', 'Szybka i ekscytująca przejażdżka.', 12, 'adrenalina'),
('Diabelski Młyn', 'Wspaniały widok na całe wesołe miasteczko.', 6, 'widokowa'),
('Karuzela', 'Idealna zabawa dla dzieci.', 3, 'dziecięca');

-- Przykładowe dane: Bilety
INSERT INTO Bilety (id_uzytkownika, rodzaj_biletu, cena, data_uzycia) VALUES
(1, 'normalny', 50.00, '2024-12-10'),
(2, 'ulgowy', 30.00, '2024-12-12');

-- Przykładowe dane: Oceny
INSERT INTO Oceny (id_atrakcji, id_uzytkownika, ocena, komentarz) VALUES
(1, 1, 5, 'Niesamowite wrażenia!'),
(2, 2, 4, 'Fajne, ale mogłoby być dłużej.');

-- Przykładowe dane: FAQ
INSERT INTO FAQ (pytanie, odpowiedz) VALUES
('Czy bilety są dostępne online?', 'Tak, bilety można kupić na naszej stronie.'),
('Czy są zniżki dla dzieci?', 'Tak, dzieci do 12 lat płacą połowę ceny.');
