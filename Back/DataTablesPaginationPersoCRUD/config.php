<?php
$server = "localhost";
$username = "root";
$password = "";
$dbname = "annuaire";
$port = '3308';

// Create connection
try{

  $conn = new PDO("mysql:host=$server;port=$port;dbname=$dbname","$username","$password");
  $conn->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
}catch(PDOException $e){
  die('Impossible de se connecter à la BDD');
}
