
drop database if exists wesole_miasteczko;
create database wesole_miasteczko;
use wesole_miasteczko;

create table klienci (
    id_klienta int auto_increment primary key,
    imie varchar(50) not null,
    nazwisko varchar(50) not null,
    email varchar(100) unique,
    telefon varchar(15)
);

create table bilety (
    id_biletu int auto_increment primary key,
    id_klienta int,
    rodzaj enum('normalny', 'ulgowy', 'rodzinny') not null,
    cena decimal(10, 2) not null,
    data_zakupu timestamp default current_timestamp,
    foreign key (id_klienta) references klienci(id_klienta) on delete set null
);

create table atrakcje (
    id_atrakcji int auto_increment primary key,
    nazwa varchar(100) not null,
    opis text,
    limit_wieku int default 0,
    cena decimal(10, 2) not null
);

create table pracownicy (
    id_pracownika int auto_increment primary key,
    imie varchar(50) not null,
    nazwisko varchar(50) not null,
    stanowisko varchar(100),
    data_zatrudnienia date default current_date
);

create table harmonogram (
    id_harmonogramu int auto_increment primary key,
    id_pracownika int,
    id_atrakcji int,
    data date not null,
    godzina_start time not null,
    godzina_koniec time not null,
    foreign key (id_pracownika) references pracownicy(id_pracownika) on delete cascade,
    foreign key (id_atrakcji) references atrakcje(id_atrakcji) on delete cascade
);

insert into klienci (imie, nazwisko, email, telefon)
values
('jan', 'kowalski', 'jan.kowalski@example.com', '123456789'),
('anna', 'nowak', 'anna.nowak@example.com', '987654321'),
('piotr', 'wiśniewski', null, '564738291');

insert into atrakcje (nazwa, opis, limit_wieku, cena)
values
('kolejka górska', 'szybka i emocjonująca przejażdżka.', 12, 15.00),
('diabelski młyn', 'wspaniałe widoki z góry.', 0, 10.00),
('karuzela', 'klasyczna atrakcja dla dzieci.', 0, 5.00);

insert into pracownicy (imie, nazwisko, stanowisko)
values
('tomasz', 'zieliński', 'operator kolejki górskiej'),
('ewa', 'kwiatkowska', 'obsługa diabelskiego młyna'),
('karolina', 'mazur', 'obsługa karuzeli');

insert into bilety (id_klienta, rodzaj, cena)
values
(1, 'normalny', 50.00),
(2, 'ulgowy', 30.00),
(3, 'rodzinny', 120.00);

insert into harmonogram (id_pracownika, id_atrakcji, data, godzina_start, godzina_koniec)
values
(1, 1, '2024-12-01', '10:00:00', '18:00:00'),
(2, 2, '2024-12-01', '10:00:00', '18:00:00'),
(3, 3, '2024-12-01', '10:00:00', '16:00:00');
