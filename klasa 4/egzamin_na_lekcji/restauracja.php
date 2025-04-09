<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Restauracja Wszystkie Smaki</title>
    <link rel="stylesheet" href="styl1.css">
</head>
<body>
    <div class="baner">
        <h1>Witamy w restauracji „Wszystkie Smaki”</h1>
    </div>
    <div class="panel-lewy">
        <img src="menu.jpg" alt="Nasze danie">
    </div>
    <div class="panel-prawy">
        <h4>U nas dobrze zjesz!</h4>
        <ul>
            <li>Obiady od 40 zł</li>
            <li>Przekąski od 10 zł</li>
            <li>Kolacje od 20 zł</li>
        </ul>
    </div>
    <div class="panel-dolny">
        <h2>Zarezerwuj stolik on-line</h2>
        <form action="rezerwacja.php" method="post">
            <label>Data (format rrrr-mm-dd):<br>
                <input type="text" name="data"><br>
            </label>
            <label>Ile osób?<br>
                <input type="number" name="osoby"><br>
            </label>
            <label>Twój numer telefonu:<br>
                <input type="text" name="telefon"><br>
            </label>
            <label>
                <input type="checkbox" name="zgoda"> Zgadzam się na przetwarzanie moich danych osobowych
            </label><br>
            <input type="reset" value="WYCZYŚĆ">
            <input type="submit" value="REZERWUJ">
        </form>
    </div>
    <div class="stopka">
        Stronę internetową opracował: <i>Dawid Mostowski</i>
    </div>
</body>
</html>