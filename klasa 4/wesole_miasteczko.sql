-- usunięcie bazy danych, jeśli istnieje
drop database if exists amusement_park;

-- utworzenie nowej bazy danych
create database amusement_park;
use amusement_park;

-- tabela przechowująca dane klientów
create table customers (
    customer_id int primary key auto_increment, -- unikalny identyfikator klienta
    first_name varchar(25) not null,            -- imię klienta
    last_name varchar(50) not null,             -- nazwisko klienta
    phone_number varchar(15),                   -- numer telefonu
    email_address varchar(100) not null         -- adres e-mail
);

-- tabela przechowująca rodzaje stanowisk pracy
create table positions (
    position_id int primary key auto_increment, -- unikalny identyfikator stanowiska
    position_name varchar(50) not null          -- nazwa stanowiska
);

-- tabela przechowująca dane pracowników
create table employees (
    employee_id int primary key auto_increment, -- unikalny identyfikator pracownika
    position_id int not null,                   -- identyfikator stanowiska
    customer_id int,                            -- identyfikator klienta (jeśli pracownik jest też klientem)
    contract_number varchar(20),                -- numer umowy
    employment_end_date date,                   -- data zakończenia zatrudnienia
    salary decimal(10,2) not null,              -- wynagrodzenie
    bonus decimal(7,2),                         -- premia
    foreign key (position_id) references positions (position_id),
    foreign key (customer_id) references customers (customer_id)
);

-- tabela przechowująca informacje o atrakcjach
create table attractions (
    attraction_id int primary key auto_increment, -- unikalny identyfikator atrakcji
    name varchar(50) not null,                    -- nazwa atrakcji
    description varchar(255),                     -- opis atrakcji
    employee_id int,                              -- identyfikator pracownika
    foreign key (employee_id) references employees (employee_id)
);

-- tabela przechowująca rodzaje biletów
create table ticket_types (
    ticket_type_id int primary key auto_increment, -- unikalny identyfikator rodzaju biletu
    ticket_type varchar(20) not null              -- nazwa rodzaju biletu
);

-- tabela przechowująca rodzaje zniżek
create table discounts (
    discount_type_id int primary key auto_increment, -- unikalny identyfikator rodzaju zniżki
    discount_type varchar(20) not null,             -- nazwa rodzaju zniżki
    discount_value decimal(5,2) not null            -- wartość zniżki
);

-- tabela przechowująca dane o biletach
create table tickets (
    ticket_id int primary key auto_increment,        -- unikalny identyfikator biletu
    ticket_type_id int not null,                     -- identyfikator rodzaju biletu
    price decimal(5,2) not null,                     -- cena biletu
    foreign key (ticket_type_id) references ticket_types (ticket_type_id)
);

-- tabela przechowująca rodzaje płatności
create table payment_types (
    payment_type_id int primary key auto_increment, -- unikalny identyfikator rodzaju płatności
    payment_type varchar(20) not null              -- nazwa rodzaju płatności
);

-- tabela przechowująca zamówienia
create table orders (
    order_id int primary key auto_increment,        -- unikalny identyfikator zamówienia
    customer_id int not null,                       -- identyfikator klienta
    ticket_id int not null,                         -- identyfikator biletu
    approving_employee_id int,                      -- identyfikator pracownika
    payment_type_id int not null,                   -- identyfikator rodzaju płatności
    purchase_date timestamp default current_timestamp, -- data zakupu (automatycznie ustawiana)
    discount_id int,                                 -- identyfikator zniżki
    foreign key (ticket_id) references tickets (ticket_id),
    foreign key (customer_id) references customers (customer_id),
    foreign key (approving_employee_id) references employees (employee_id),
    foreign key (payment_type_id) references payment_types (payment_type_id),
    foreign key (discount_id) references discounts (discount_type_id)
);

-- tabela łącząca zamówienia z biletami
create table order_tickets (
    order_ticket_id int primary key auto_increment, -- unikalny identyfikator
    order_id int not null,                          -- identyfikator zamówienia
    ticket_id int not null,                         -- identyfikator biletu
    quantity int not null,                          -- ilość biletów
    foreign key (order_id) references orders (order_id),
    foreign key (ticket_id) references tickets (ticket_id)
);

-- tabela przechowująca ceny biletów zależne od daty (np. weekendowe)
create table ticket_prices (
    ticket_price_id int primary key auto_increment,
    ticket_id int not null,
    price decimal(5,2) not null,
    valid_from datetime not null,   -- data początkowa
    valid_to datetime,              -- data końcowa
    foreign key (ticket_id) references tickets (ticket_id)
);

-- tabela historii zmian zniżek
create table discount_history (
    discount_history_id int primary key auto_increment,
    order_id int not null,
    old_discount_id int,
    new_discount_id int not null,
    change_date datetime not null default current_timestamp,
    foreign key (order_id) references orders (order_id),
    foreign key (old_discount_id) references discounts (discount_type_id),
    foreign key (new_discount_id) references discounts (discount_type_id)
);

insert into customers (first_name, last_name, phone_number, email_address)
values
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

insert into positions (position_name)
values
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

insert into employees (position_id, customer_id, contract_number, employment_end_date, salary, bonus)
values
(1, 11, 'CON123', null, 5000.00, 500.00),
(2, 12, 'CON124', null, 4000.00, 300.00),
(3, 13, 'CON125', null, 3500.00, 200.00),
(4, 14, 'CON126', null, 6000.00, 700.00),
(5, 15, 'CON127', null, 3000.00, 100.00),
(6, 16, 'CON128', null, 4500.00, 400.00),
(7, 17, 'CON129', null, 4000.00, 300.00),
(8, 18, 'CON130', null, 3800.00, 250.00),
(9, 19, 'CON131', null, 4200.00, 350.00),
(10, 20, 'CON132', null, 7000.00, null);

insert into attractions (name, description, employee_id)
values
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

insert into ticket_types (ticket_type)
values
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

insert into discounts (discount_type, discount_value)
values
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

insert into tickets (ticket_type_id, price)
values
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

insert into payment_types (payment_type)
values
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

insert into orders (customer_id, ticket_id, approving_employee_id, payment_type_id, purchase_date, discount_id)
values
(1, 1, 1, 1, '2024-11-01 10:00:00', null),
(2, 2, 2, 2, '2024-11-02 11:30:00', 2),
(3, 3, 3, 3, '2024-11-03 12:00:00', 3),
(4, 4, 4, 4, '2024-11-04 13:15:00', 4),
(5, 5, 5, 5, '2024-11-05 14:20:00', 5),
(6, 6, 6, 6, '2024-11-06 15:25:00', 6),
(7, 7, 7, 7, '2024-11-07 16:30:00', 7),
(8, 8, 8, 8, '2024-11-08 17:35:00', 8),
(9, 9, 9, 9, '2024-11-09 18:40:00', 9),
(10, 10, 10, 10, '2024-11-10 19:45:00', 10);

insert into order_tickets (order_id, ticket_id, quantity)
values
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

insert into ticket_prices (ticket_id, price, valid_from, valid_to)
values
(1, 55.00, '2024-11-01 00:00:00', '2024-11-07 23:59:59'),
(2, 32.00, '2024-11-02 00:00:00', '2024-11-07 23:59:59'),
(3, 105.00, '2024-11-03 00:00:00', '2024-11-07 23:59:59'),
(4, 42.00, '2024-11-04 00:00:00', '2024-11-07 23:59:59'),
(5, 210.00, '2024-11-05 00:00:00', '2024-11-07 23:59:59'),
(6, 520.00, '2024-11-06 00:00:00', '2024-11-07 23:59:59'),
(7, 360.00, '2024-11-07 00:00:00', '2024-11-07 23:59:59'),
(8, 85.00, '2024-11-08 00:00:00', '2024-11-14 23:59:59'),
(9, 125.00, '2024-11-09 00:00:00', '2024-11-14 23:59:59'),
(10, 410.00, '2024-11-10 00:00:00', '2024-11-14 23:59:59');

insert into discount_history (order_id, old_discount_id, new_discount_id, change_date)
values
(1, null, 2, '2024-11-01 10:15:00'),
(2, null, 3, '2024-11-02 11:45:00'),
(3, null, 4, '2024-11-03 12:30:00'),
(4, null, 5, '2024-11-04 13:45:00'),
(5, null, 6, '2024-11-05 14:50:00'),
(6, null, 7, '2024-11-06 15:40:00'),
(7, null, 8, '2024-11-07 16:45:00'),
(8, null, 9, '2024-11-08 17:50:00'),
(9, null, 10, '2024-11-09 18:55:00'),
(10, null, 1, '2024-11-10 19:50:00');


drop user if exists 'admin_amusement_park'@'localhost';
drop user if exists 'worker_amusement_park'@'localhost';
drop user if exists 'system_amusement_park'@'localhost';
drop user if exists 'client_amusement_park'@'localhost';

create user 'admin_amusement_park'@'localhost' identified by 'haslo_admina';
grant all privileges on amusement_park.* to 'admin_amusement_park'@'localhost';

create user 'worker_amusement_park'@'localhost' identified by 'haslo_pracownika';
grant select, update on amusement_park.attractions to 'worker_amusement_park'@'localhost';
grant select on amusement_park.customers to 'worker_amusement_park'@'localhost';
grant select on amusement_park.discounts to 'worker_amusement_park'@'localhost';
grant select on amusement_park.employees to 'worker_amusement_park'@'localhost';
grant select, update, delete on amusement_park.orders to 'worker_amusement_park'@'localhost';
grant select, update, delete on amusement_park.order_tickets to 'worker_amusement_park'@'localhost';
grant select on amusement_park.payment_types to 'worker_amusement_park'@'localhost';
grant select on amusement_park.positions to 'worker_amusement_park'@'localhost';
grant select on amusement_park.tickets to 'worker_amusement_park'@'localhost';
grant select on amusement_park.ticket_prices to 'worker_amusement_park'@'localhost';
grant select on amusement_park.ticket_types to 'worker_amusement_park'@'localhost';

create user 'system_amusement_park'@'localhost' identified by 'haslo_systemu';
grant select on amusement_park.discounts to 'system_amusement_park'@'localhost';
grant select, insert, update on amusement_park.discount_history to 'system_amusement_park'@'localhost';
grant select, update on amusement_park.orders to 'system_amusement_park'@'localhost';
grant select on amusement_park.order_tickets to 'system_amusement_park'@'localhost';
grant select on amusement_park.tickets to 'system_amusement_park'@'localhost';
grant select on amusement_park.ticket_prices to 'system_amusement_park'@'localhost';
grant select on amusement_park.ticket_types to 'system_amusement_park'@'localhost';

create user 'client_amusement_park'@'localhost' identified by 'haslo_klienta';
grant select on amusement_park.attractions to 'client_amusement_park'@'localhost';
grant select, insert, update, delete on amusement_park.customers to 'client_amusement_park'@'localhost';
grant select, insert, update, delete on amusement_park.orders to 'client_amusement_park'@'localhost';
grant select, insert, update, delete on amusement_park.order_tickets to 'client_amusement_park'@'localhost';
grant select on amusement_park.payment_types to 'client_amusement_park'@'localhost';
grant select on amusement_park.tickets to 'client_amusement_park'@'localhost';
grant select on amusement_park.ticket_prices to 'client_amusement_park'@'localhost';
grant select on amusement_park.ticket_types to 'client_amusement_park'@'localhost';

-- Zastosowanie uprawnień
flush privileges;