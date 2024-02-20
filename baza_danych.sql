create table Pracownicy(
    	idPracownik int,
 	imie varchar(45),
	nazwisko varchar(45),
    	pesel int,
    	ulica varchar(45),
    	miasto varchar(45),
    	kod varchar(45),
    	telefon int,
    	haslo varchar(45),
    	szef boolean,
    	primary key (idPracownik)
);
    
create table Odbiorca(
    	idOdbiorca int,
    	imie varchar(45),
	nazwisko varchar(45),
    	ulica varchar(45),
    	miasto varchar(45),
    	kod varchar(45),
    	telefon int,
    	primary key (idOdbiorca)
);
    
create table Reklamacje(
    	idReklamacja int,
	Nazwa varchar(45),
	Opis varchar(45),
    	Rozpatrzenie boolean,
	Odpowiedz varchar(45),
    	primary key (idReklamacja)	
);
    
create table Przesylki(
    	idPrzesylka int,
    	nazwa varchar(45),
	cena double,
    	platnosci boolean,
    	idReklamacja int,
    	idKategoria int,
    	idStan int,
    	idPracownik int,
    	idOdbiorca int,
    	idNadawca int,
    	primary key (idPrzesylka,idReklamacja,idKategoria, idStan,idPracownik,idOdbiorca,idNadawca)
);
    
create table Kategorie(
    	idKategoria int,
    	nazwa varchar(45),
    	primary key (idKategoria)
);
    
create table Stan(
	idStan int,
    	nazwa varchar(45),
    	primary key (idStan)
);

create table Nadawca(
    	idNadawca int,
    	imie varchar(45),
	nazwisko varchar(45),
    	ulica varchar(45),
    	miasto varchar(45),
    	kod varchar(45),
    	telefon int,
    	primary key (idNadawca)
);
