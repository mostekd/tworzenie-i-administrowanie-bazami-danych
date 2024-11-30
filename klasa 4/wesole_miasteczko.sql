-- Usunięcie bazy danych, jeśli istnieje
drop database if exists amusement_park;

-- Utworzenie nowej bazy danych
create database amusement_park;
use amusement_park;

-- Tabela przechowująca dane klientów
create table customers (
    customer_id int primary key auto_increment, -- Unikalny identyfikator klienta
    first_name varchar(25) NOT NULL,            -- Imię klienta
    last_name varchar(50) NOT NULL,             -- Nazwisko klienta
    phone_number varchar(15),                   -- Numer telefonu
    email_address varchar(100) NOT NULL         -- Adres e-mail
);

-- Tabela przechowująca rodzaje stanowisk pracy
create table positions (
    position_id int primary key auto_increment, -- Unikalny identyfikator stanowiska
    position_name varchar(50) NOT NULL          -- Nazwa stanowiska
);

-- Tabela przechowująca dane pracowników
create table employees (
    employee_id int primary key auto_increment, -- Unikalny identyfikator pracownika
    position_id int NOT NULL,                   -- Identyfikator stanowiska
    customer_id int,                            -- Identyfikator klienta (jeśli pracownik jest też klientem)
    contract_number varchar(20),                -- Numer umowy
    employment_end_date date,                   -- Data zakończenia zatrudnienia
    salary decimal(10,2) NOT NULL,              -- Wynagrodzenie
    bonus decimal(5,2),                         -- Premia
    foreign key (position_id) references positions (position_id),
    foreign key (customer_id) references customers (customer_id)
);

-- Tabela przechowująca informacje o atrakcjach
create table attractions (
    attraction_id int primary key auto_increment, -- Unikalny identyfikator atrakcji
    name varchar(50) NOT NULL,                    -- Nazwa atrakcji
    description varchar(255),                     -- Opis atrakcji
    employee_id int,                              -- Identyfikator pracownika
    foreign key (employee_id) references employees (employee_id)
);

-- Tabela przechowująca rodzaje biletów
create table ticket_types (
    ticket_type_id int primary key auto_increment, -- Unikalny identyfikator rodzaju biletu
    ticket_type varchar(20) NOT NULL              -- Nazwa rodzaju biletu
);

-- Tabela przechowująca rodzaje zniżek
create table discounts (
    discount_type_id int primary key auto_increment, -- Unikalny identyfikator rodzaju zniżki
    discount_type varchar(20) NOT NULL,             -- Nazwa rodzaju zniżki
    discount_value decimal(5,2) NOT NULL            -- Wartość zniżki
);

-- Tabela przechowująca dane o biletach
create table tickets (
    ticket_id int primary key auto_increment,        -- Unikalny identyfikator biletu
    ticket_type_id int NOT NULL,                     -- Identyfikator rodzaju biletu
    price decimal(5,2) NOT NULL,                     -- Cena biletu
    foreign key (ticket_type_id) references ticket_types (ticket_type_id),
);

-- Tabela przechowująca rodzaje płatności
create table payment_types (
    payment_type_id int primary key auto_increment, -- Unikalny identyfikator rodzaju płatności
    payment_type varchar(20) NOT NULL              -- Nazwa rodzaju płatności
);

-- Tabela przechowująca zamówienia
create table orders (
    order_id int primary key auto_increment,        -- Unikalny identyfikator zamówienia
    customer_id int NOT NULL,                       -- Identyfikator klienta
    ticket_id int NOT NULL,                         -- Identyfikator biletu
    approving_employee_id int,                      -- Identyfikator pracownika
    payment_type_id int NOT NULL,                   -- Identyfikator rodzaju płatności
    purchase_date datetime NOT NULL,                -- Data zakupu
    discount_id int,                                 -- Identyfikator zniżki
    foreign key (ticket_id) references tickets (ticket_id),
    foreign key (customer_id) references customers (customer_id),
    foreign key (approving_employee_id) references employees (employee_id),
    foreign key (payment_type_id) references payment_types (payment_type_id),
    foreign key (discount_id) references discounts (discount_type_id)
);

-- Tabela łącząca zamówienia z biletami
create table order_tickets (
    order_ticket_id int primary key auto_increment, -- Unikalny identyfikator
    order_id int NOT NULL,                          -- Identyfikator zamówienia
    ticket_id int NOT NULL,                         -- Identyfikator biletu
    quantity int NOT NULL,                          -- Ilość biletów
    foreign key (order_id) references orders (order_id),
    foreign key (ticket_id) references tickets (ticket_id)
);

INSERT INTO customers (first_name, last_name, phone_number, email_address)
VALUES
('Anna', 'Kowalska', '123456789', 'anna.kowalska@example.com'),
('Jan', 'Nowak', '234567890', 'jan.nowak@example.com'),
('Ewa', 'Wiśniewska', '345678901', 'ewa.wisniewska@example.com'),
('Piotr', 'Wójcik', '456789012', 'piotr.wojcik@example.com'),
('Katarzyna', 'Zielińska', '567890123', 'katarzyna.zielinska@example.com'),
('Tomasz', 'Kamiński', '678901234', 'tomasz.kaminski@example.com'),
('Monika', 'Lewandowska', '789012345', 'monika.lewandowska@example.com'),
('Marek', 'Krawczyk', '890123456', 'marek.krawczyk@example.com'),
('Agnieszka', 'Piotrowska', '901234567', 'agnieszka.piotrowska@example.com'),
('Łukasz', 'Kaczmarek', '012345678', 'lukasz.kaczmarek@example.com'),
('Paweł', 'Adamski', '222333444', 'pawel.adamski@example.com'),
('Magdalena', 'Sikora', '333444555', 'magdalena.sikora@example.com'),
('Robert', 'Jankowski', '444555666', 'robert.jankowski@example.com'),
('Sylwia', 'Król', '555666777', 'sylwia.krol@example.com'),
('Damian', 'Baran', '666777888', 'damian.baran@example.com'),
('Justyna', 'Wróbel', '777888999', 'justyna.wrobel@example.com'),
('Michał', 'Lis', '888999000', 'michal.lis@example.com'),
('Beata', 'Kołodziej', '999000111', 'beata.kolodziej@example.com'),
('Adrian', 'Czajka', '111222333', 'adrian.czajka@example.com'),
('Natalia', 'Wilk', '222333444', 'natalia.wilk@example.com');

INSERT INTO positions (position_name)
VALUES
('Kierownik atrakcji'),
('Operator atrakcji'),
('Kasjer'),
('Menadżer sprzedaży'),
('Pracownik ochrony'),
('Specjalista IT'),
('Członek obsługi technicznej'),
('Animator zabaw'),
('Ratownik medyczny'),
('Dyrektor');

INSERT INTO employees (position_id, customer_id, contract_number, employment_end_date, salary, bonus)
VALUES
(1, 11, 'CON123', NULL, 5000.00, 500.00),
(2, 12, 'CON124', NULL, 4000.00, 300.00),
(3, 13, 'CON125', NULL, 3500.00, 200.00),
(4, 14, 'CON126', NULL, 6000.00, 700.00),
(5, 15, 'CON127', NULL, 3000.00, 100.00),
(6, 16, 'CON128', NULL, 4500.00, 400.00),
(7, 17, 'CON129', NULL, 4000.00, 300.00),
(8, 18, 'CON130', NULL, 3800.00, 250.00),
(9, 19, 'CON131', NULL, 4200.00, 350.00),
(10, 20, 'CON132', NULL, 7000.00, 1000.00);

INSERT INTO attractions (name, description, employee_id)
VALUES
('Rollercoaster', 'Największy rollercoaster w parku', 1),
('Karuzela', 'Tradycyjna karuzela dla dzieci', 2),
('Dom strachów', 'Atrakcja dla miłośników horrorów', 3),
('Basen z kulkami', 'Bezpieczna zabawa dla najmłodszych', 4),
('Wieża spadków', 'Przygoda dla fanów adrenaliny', 5),
('Labirynt luster', 'Ciekawe doświadczenie optyczne', 6),
('Wodny zjazd', 'Atrakcja z efektami wodnymi', 7),
('Strzelnica', 'Sprawdź swoje umiejętności strzeleckie', 8),
('Trampoliny', 'Zabawa z wysokościami', 9),
('Kolejka widokowa', 'Widok na cały park', 10);

INSERT INTO ticket_types (ticket_type)
VALUES
('Normalny'),
('Ulgowy'),
('Rodzinny'),
('Senior'),
('Sezonowy'),
('VIP'),
('Grupowy'),
('Weekendowy'),
('Specjalny'),
('Dla firm');

INSERT INTO discounts (discount_type, discount_value)
VALUES
('Brak zniżki', 0.00),
('Student', 15.00),
('Dziecko', 20.00),
('Senior', 10.00),
('Grupowa', 25.00),
('Rodzinna', 30.00),
('Weekendowa', 5.00),
('Promocja', 20.00),
('Specjalna okazja', 40.00),
('VIP', 50.00);

INSERT INTO tickets (ticket_type_id, price)
VALUES
(1, 50.00),
(2, 30.00),
(3, 100.00),
(4, 40.00),
(5, 200.00),
(6, 500.00),
(7, 350.00),
(8, 80.00),
(9, 120.00),
(10, 400.00);

INSERT INTO payment_types (payment_type)
VALUES
('Gotówka'),
('Karta kredytowa'),
('Karta debetowa'),
('BLIK'),
('Przelew'),
('PayPal'),
('Apple Pay'),
('Google Pay'),
('Voucher'),
('Bitcoin');

INSERT INTO orders (customer_id, ticket_id, approving_employee_id, payment_type_id, purchase_date, discount_id)
VALUES
(1, 1, 11, 1, '2024-11-01 10:00:00', NULL),
(2, 2, 12, 2, '2024-11-02 11:30:00', 2),
(3, 3, 13, 3, '2024-11-03 12:00:00', 3),
(4, 4, 14, 4, '2024-11-04 13:15:00', 4),
(5, 5, 15, 5, '2024-11-05 14:20:00', 5),
(6, 6, 16, 6, '2024-11-06 15:25:00', 6),
(7, 7, 17, 7, '2024-11-07 16:30:00', 7),
(8, 8, 18, 8, '2024-11-08 17:35:00', 8),
(9, 9, 19, 9, '2024-11-09 18:40:00', 9),
(10, 10, 20, 10, '2024-11-10 19:45:00', 10);

INSERT INTO order_tickets (order_id, ticket_id, quantity)
VALUES
(1, 1, 2),
(2, 2, 3),
(3, 3, 1),
(4, 4, 5),
(5, 5, 2),
(6, 6, 4),
(7, 7, 1),
(8, 8, 3),
(9, 9, 6),
(10, 10, 2);