<?php

$host = 'localhost';
$username = 'root';
$password = '';
$database = 'mydb';

$con = mysqli_connect($host, $username, $password, $database) or die("Conexão falhou! " . mysqli_connect_error());


