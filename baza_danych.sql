create table przesylki(
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
