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
    $id  = $_POST["id"];

    $sql = "UPDATE membres SET nom_membre = :nom , login_membre = :prenom WHERE id_membre = :id";
    $reponse = $connexion->prepare($sql);
    $reponse->bindParam(':nom', $nom);
    $reponse->bindParam(':prenom', $prenom);
    $reponse->bindParam(':id', $id, PDO::PARAM_INT);
    $reponse->execute();

    header('Location: index.php');

}

?>