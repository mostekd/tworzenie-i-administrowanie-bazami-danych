<?php
    $conn = mysqli_connect('localhost', 'root', '', 'baza');

    $data = $_POST['data'];
    $osoby = $_POST['osoby'];
    $telefon = $_POST['telefon'];

    $query = "INSERT INTO rezerwacje (data_rez, liczba_osob, telefon) VALUES ('$data', $osoby, '$telefon')";
    mysqli_query($conn, $query);

    echo "Dodano rezerwację do bazy";

    mysqli_close($conn);
?>