-- Zapytanie 1:
SELECT imie, nazwisko FROM autorzy;

-- Zapytanie 2:
INSERT INTO czytelnicy (imie, nazwisko, kod) VALUES ('Anna', 'Michalak', 'ANMI05');

-- Zapytanie 3:
SELECT tytul FROM ksiazki WHERE id_kategoria = (SELECT id FROM kategorie WHERE nazwa = 'epika');

-- Zapytanie 4:
SELECT tytul FROM ksiazki WHERE id IN (SELECT id_ksiazka FROM wypozyczenia WHERE id_czytelnik = 3);