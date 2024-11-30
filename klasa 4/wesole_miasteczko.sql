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
    discount_id int,                                 -- Identyfikator zniżki
    price decimal(5,2) NOT NULL,                     -- Cena biletu
    foreign key (ticket_type_id) references ticket_types (ticket_type_id),
    foreign key (discount_id) references discounts (discount_type_id)
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
    foreign key (ticket_id) references tickets (ticket_id),
    foreign key (customer_id) references customers (customer_id),
    foreign key (approving_employee_id) references employees (employee_id),
    foreign key (payment_type_id) references payment_types (payment_type_id)
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
