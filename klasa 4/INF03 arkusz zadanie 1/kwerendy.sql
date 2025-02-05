-- Zapytanie 1: Wybór id, nazwa, opis, cena dla podzespołów tańszych niż 1000 zł
SELECT id, nazwa, opis, cena 
FROM podzespoly 
WHERE cena < 1000;

-- Zapytanie 2: Wybór nazwa i opis dla podzespołów dostępnych w sklepie i produkowanych przez Intel
SELECT nazwa, opis 
FROM podzespoly 
WHERE dostepnosc = 'tak' AND producenci_id = (SELECT id FROM producenci WHERE nazwa = 'Intel');

-- Zapytanie 3: Wybór nazwy podzespołów i odpowiadającej nazwy producenta
SELECT p.nazwa AS nazwa_podzespolu, pr.nazwa AS nazwa_producenta
FROM podzespoly p
JOIN producenci pr ON p.producenci_id = pr.id;

-- Zapytanie 4: Aktualizacja nazwy producenta „Patriot” do wielkich liter
UPDATE producenci 
SET nazwa = 'PATRIOT' 
WHERE nazwa = 'Patriot';
