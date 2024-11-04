create database if not exists WesołeMiasteczko;
use WesołeMiasteczko;

create table Pracownicy (
    id_pracownik int primary key auto_increment,
    imie varchar(50),
    nazwisko varchar(50),
    stanowisko varchar(50),
    data_zatrudnienia date
);

create table Atrakcje (
    id_atrakcja int primary key auto_increment,
    nazwa varchar(100),
    opis text,
    cena decimal(10, 2)
);

create table Uzytkownicy (
    id_uzytkownik int primary key auto_increment,
    imie varchar(50),
    nazwisko varchar(50),
    email varchar(100),
    telefon varchar(15)
);

create table Bilety (
    bilet_id int primary key auto_increment,
    id_uzytkownik int,
    id_atrakcja int,
    data_zakupu timestamp default current_timestamp,
    foreign key (id_uzytkownik) references Uzytkownicy(id_uzytkownik),
    foreign key (id_atrakcja) references Atrakcje(id_atrakcja)
);

create table Pracownik_Atrakcja (
    id_pracownik_atrakcja int primary key auto_increment,
    id_pracownik int,
    id_atrakcja int,
    data_przypisania date default current_date,
    foreign key (id_pracownik) references Pracownicy(id_pracownik),
    foreign key (id_atrakcja) references Atrakcje(id_atrakcja)
);

insert into Pracownicy (imie, nazwisko, stanowisko, data_zatrudnienia) values
('Jan', 'Kowalski', 'Operator karuzeli', '2023-05-15'),
('Anna', 'Nowak', 'Kasjerka', '2022-11-20'),
('Piotr', 'Wiśniewski', 'Technik', '2023-07-01'),
('Katarzyna', 'Zielińska', 'Przewodnik', '2021-09-10'),
('Michał', 'Jankowski', 'Menedżer', '2020-03-02');

insert into Atrakcje (nazwa, opis, cena) values
('Karuzela Wenecka', 'Tradycyjna karuzela dla dzieci i dorosłych', 15.00),
('Kolejka Górska', 'Szybka przejażdżka kolejką z wieloma zakrętami', 25.00),
('Dom Strachu', 'Atrakcja dla fanów horrorów, pełna strasznych efektów', 20.00),
('Diabelski Młyn', 'Wielkie koło widokowe z panoramą miasta', 30.00),
('Zjeżdżalnia Wodna', 'Zjeżdżalnia z wysoką prędkością, idealna na gorące dni', 18.00);

insert into Uzytkownicy (imie, nazwisko, email, telefon) values
('Marta', 'Kwiatkowska', 'marta.kwiatkowska@example.com', '123456789'),
('Paweł', 'Lewandowski', 'pawel.lewandowski@example.com', '987654321'),
('Agnieszka', 'Szymańska', 'agnieszka.szymanska@example.com', '654321987'),
('Kamil', 'Kozłowski', 'kamil.kozlowski@example.com', '321654987'),
('Monika', 'Dąbrowska', 'monika.dabrowska@example.com', '456789123');

insert into Bilety (id_uzytkownik, id_atrakcja, data_zakupu) values
(1, 2, '2024-10-10 10:30:00'),
(2, 3, '2024-10-12 12:45:00'),
(3, 1, '2024-10-15 15:00:00'),
(4, 5, '2024-10-20 14:20:00'),
(5, 4, '2024-10-22 11:05:00');

insert into Pracownik_Atrakcja (id_pracownik, id_atrakcja, data_przypisania) values
(1, 2, '2023-05-15'),
(2, 5, '2022-11-21'),
(3, 3, '2023-07-05'),
(4, 4, '2021-09-11'),
(5, 1, '2020-03-03');
