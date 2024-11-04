create database if not exists WesołeMiasteczko;
use WesołeMiasteczko;

create table Pracownicy (
    pracownik_id int primary key auto_increment,
    imie varchar(50),
    nazwisko varchar(50),
    stanowisko varchar(50),
    data_zatrudnienia date
);

create table Atrakcje (
    atrakcja_id int primary key auto_increment,
    nazwa varchar(100),
    opis text,
    cena decimal(10, 2)
);

create table Uzytkownicy (
    uzytkownik_id int primary key auto_increment,
    imie varchar(50),
    nazwisko varchar(50),
    email varchar(100),
    telefon varchar(15)
);

create table Bilety (
    bilet_id int primary key auto_increment,
    uzytkownik_id int,
    atrakcja_id int,
    data_zakupu timestamp default current_timestamp,
    foreign key (uzytkownik_id) references Uzytkownicy(uzytkownik_id),
    foreign key (atrakcja_id) references Atrakcje(atrakcja_id)
);

create table Pracownik_Atrakcja (
    pracownik_atrakcja_id int primary key auto_increment,
    pracownik_id int,
    atrakcja_id int,
    data_przypisania date default CURRENT_date,
    foreign key (pracownik_id) references Pracownicy(pracownik_id),
    foreign key (atrakcja_id) references Atrakcje(atrakcja_id)
);
