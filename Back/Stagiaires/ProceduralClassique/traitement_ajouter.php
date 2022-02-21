<?php

// Connexion à la BDD
try {
    $option = array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8');
    $connexion = new PDO('mysql:host=localhost:3308;dbname=formation;charset=utf8;', 'root', '', $option);
} catch (exception $e) {
    die('Erreur ' . $e->getMessage());
}

if(!empty($_POST)){

    $nom = $_POST["nom"];
    $prenom = $_POST["prenom"];

    $requete = "INSERT INTO membres(nom_membre, login_membre) VALUES (:nom, :prenom)";
    $reponse = $connexion->prepare($requete);
    $reponse->bindParam(':nom', $nom);
    $reponse->bindParam(':prenom', $prenom);
    $reponse->execute();

    header('Location: index.php');

}