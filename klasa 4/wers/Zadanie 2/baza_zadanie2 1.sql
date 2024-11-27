CREATE DATABASE IF NOT EXISTS PrzykladowaBaza;
USE PrzykladowaBaza;

-- Tabela Klienci
CREATE TABLE Klienci (
    klient_id INT AUTO_INCREMENT PRIMARY KEY,
    imie VARCHAR(100) NOT NULL,
    nazwisko VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    telefon VARCHAR(20) DEFAULT NULL
);

-- Tabela Produkty
CREATE TABLE Produkty (
    produkt_id INT AUTO_INCREMENT PRIMARY KEY,
    nazwa VARCHAR(100) NOT NULL,
    cena DECIMAL(10,2) NOT NULL,
    ilosc_w_magazynie INT NOT NULL CHECK (ilosc_w_magazynie >= 0)
);

-- Tabela Zamowienia
CREATE TABLE Zamowienia (
    zamowienie_id INT AUTO_INCREMENT PRIMARY KEY,
    klient_id INT NOT NULL,
    data_zamowienia DATETIME NOT NULL,
    FOREIGN KEY (klient_id) REFERENCES Klienci(klient_id)
);

-- Tabela SzczegolyZamowienia
CREATE TABLE SzczegolyZamowienia (
    zamowienie_id INT NOT NULL AUTO_INCREMENT,
    produkt_id INT NOT NULL,
    ilosc INT NOT NULL CHECK (ilosc > 0),
    cena DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (zamowienie_id, produkt_id),
    FOREIGN KEY (zamowienie_id) REFERENCES Zamowienia(zamowienie_id),
    FOREIGN KEY (produkt_id) REFERENCES Produkty(produkt_id)
);

-- Dodanie  klientów
INSERT INTO Klienci (imie, nazwisko, email, telefon) VALUES
('Jan', 'Kowalski', 'jan.kowalski@przyklad.com', '123-456-789'),
('Anna', 'Nowak', '', '987-654-321'),  
('Tomasz', 'Wiśniewski', 'tomasz.wisniewski@przyklad', '456-123-789'),  
('Katarzyna', 'Malinowska', 'katarzyna.malinowska@przyklad.com', NULL);

-- Dodanie  produktów
INSERT INTO Produkty (nazwa, cena, ilosc_w_magazynie) VALUES
('Laptop', 3000.00, 10),
('Telefon', 1500.00, 5), 
('Tablet', 800.00, 5),  
('Monitor', 700.00, 0);  

-- Dodanie  zamówień
INSERT INTO Zamowienia (klient_id, data_zamowienia) VALUES
(1, '2023-08-15 10:00:00'),
(2, '2023-08-16 12:30:00'),
(3, '2023-08-17 14:00:00'); 

-- Dodanie  szczegółów zamówień
INSERT INTO SzczegolyZamowienia (zamowienie_id, produkt_id, ilosc, cena) VALUES
(1, 1, 2, 3000.00),
(1, 2, 1, 1500.00),
(2, 2, 1, 1500.00), 
(3, 3, 1, 800.00), 
(1, 3, 1, 800.00);  