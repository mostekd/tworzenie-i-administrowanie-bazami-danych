-- Usunięcie bazy danych, jeśli istnieje, aby uniknąć konfliktów
drop database if exists amusement_park;

-- Utworzenie nowej bazy danych
create database amusement_park;
use amusement_park;

-- Tabela przechowująca dane klientów
create table customers (
    customer_id int primary key auto_increment, -- Unikalny identyfikator klienta
    first_name varchar(25),                     -- Imię klienta
    last_name varchar(50),                      -- Nazwisko klienta
    phone_number varchar(15),                   -- Numer telefonu
    email_address varchar(50)                   -- Adres e-mail
);

-- Tabela przechowująca rodzaje stanowisk pracy
create table positions (
    position_id int primary key auto_increment, -- Unikalny identyfikator stanowiska
    position_name varchar(20)                   -- Nazwa stanowiska
);

-- Tabela przechowująca dane pracowników
create table employees (
    employee_id int primary key auto_increment, -- Unikalny identyfikator pracownika
    position_id int,                            -- Identyfikator stanowiska (powiązanie z tabelą `positions`)
    customer_id int,                            -- Identyfikator klienta (jeśli pracownik jest też klientem)
    contract_number varchar(20),                -- Numer umowy
    employment_end_date date,                   -- Data zakończenia zatrudnienia
    salary varchar(10),                         -- Wynagrodzenie (zalecane: zmiana na `decimal`)
    bonus varchar(5),                           -- Premia (zalecane: zmiana na `decimal`)
    foreign key (position_id) references positions (position_id), -- Klucz obcy do tabeli `positions`
    foreign key (customer_id) references customers (customer_id)  -- Klucz obcy do tabeli `customers`
);

-- Tabela przechowująca informacje o atrakcjach
create table attractions (
    attraction_id int primary key auto_increment, -- Unikalny identyfikator atrakcji
    name varchar(20),                             -- Nazwa atrakcji
    description varchar(255),                     -- Opis atrakcji
    employee_id int,                              -- Identyfikator pracownika odpowiedzialnego za atrakcję
    foreign key (employee_id) references employees (employee_id) -- Klucz obcy do tabeli `employees`
);

-- Tabela przechowująca rodzaje biletów
create table ticket_types (
    ticket_type_id int primary key auto_increment, -- Unikalny identyfikator rodzaju biletu
    ticket_type varchar(10)                        -- Nazwa rodzaju biletu
);

-- Tabela przechowująca rodzaje zniżek
create table discounts (
    discount_type_id int primary key auto_increment, -- Unikalny identyfikator rodzaju zniżki
    discount_type varchar(10),                       -- Nazwa rodzaju zniżki
    discount_value varchar(5)                        -- Wartość zniżki (zalecane: zmiana na `decimal`)
);

-- Tabela przechowująca dane o biletach
create table tickets (
    ticket_id int primary key auto_increment,        -- Unikalny identyfikator biletu
    ticket_type_id int,                              -- Identyfikator rodzaju biletu (powiązanie z tabelą `ticket_types`)
    discount_id int,                                 -- Identyfikator zniżki (powiązanie z tabelą `discounts`)
    price varchar(5),                                -- Cena biletu (zalecane: zmiana na `decimal`)
    foreign key (ticket_type_id) references ticket_types (ticket_type_id), -- Klucz obcy do tabeli `ticket_types`
    foreign key (discount_id) references discounts (discount_type_id)     -- Klucz obcy do tabeli `discounts`
);

-- Tabela przechowująca rodzaje płatności
create table payment_types (
    payment_type_id int primary key auto_increment, -- Unikalny identyfikator rodzaju płatności
    payment_type varchar(10)                        -- Nazwa rodzaju płatności
);

-- Tabela przechowująca zamówienia
create table orders (
    order_id int primary key auto_increment,        -- Unikalny identyfikator zamówienia
    customer_id int,                                -- Identyfikator klienta (powiązanie z tabelą `customers`)
    ticket_id int,                                  -- Identyfikator biletu (powiązanie z tabelą `tickets`)
    approving_employee_id int,                      -- Identyfikator pracownika zatwierdzającego (powiązanie z tabelą `employees`)
    purchase_date datetime,                         -- Data zakupu
    foreign key (ticket_id) references tickets (ticket_id), -- Klucz obcy do tabeli `tickets`
    foreign key (customer_id) references customers (customer_id), -- Klucz obcy do tabeli `customers`
    foreign key (approving_employee_id) references employees (employee_id) -- Klucz obcy do tabeli `employees`
);

-- Tabela łącząca zamówienia z biletami (jeśli zamówienie zawiera wiele biletów)
create table order_tickets (
    order_ticket_id int primary key auto_increment, -- Unikalny identyfikator wiersza
    order_id int,                                   -- Identyfikator zamówienia (powiązanie z tabelą `orders`)
    ticket_id int,                                  -- Identyfikator biletu (powiązanie z tabelą `tickets`)
    quantity int,                                   -- Ilość danego rodzaju biletu w zamówieniu
    foreign key (order_id) references orders (order_id), -- Klucz obcy do tabeli `orders`
    foreign key (ticket_id) references tickets (ticket_id) -- Klucz obcy do tabeli `tickets`
);