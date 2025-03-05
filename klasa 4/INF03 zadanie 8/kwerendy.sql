-- zapytanie 1
SELECT id, nazwa, wystepowanie
FROM ryby
WHERE styl_zycia = 1;

-- zapytanie 2
SELECT akwen, wojewodztwo
FROM lowisko
WHERE rodzaj IN (2, 3);

-- zapytanie 3
SELECT r.nazwa
FROM ryby AS r
LEFT JOIN okres_ochronny AS o ON r.id = o.Ryby_id
WHERE o.wymiar_ochronny = 0;

-- zapytanie 4
CREATE TABLE wedkarze (
    id INT UNSIGNED NOT NULL,
    imie VARCHAR(255),
    nazwisko VARCHAR(255),
    punkty INT
);
