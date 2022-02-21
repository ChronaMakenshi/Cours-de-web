<?php

require('contact.class.php');

$nom = $_POST["nom"];
$prenom = $_POST["prenom"];
$email = $_POST["email"];
$message = $_POST["message"];

// Opérateur Ternaire qui permet d'obtenir une écriture simplifiée pour le Test des conditions.
$valid = (empty($nom) || empty($email) || !filter_var($email,FILTER_VALIDATE_EMAIL) || empty($message)) ? false : true;

if($valid)
{

    $contact = new Contact();
    $contact->insertContact($nom,$prenom,$email,$message);

    $reponse = "Ok";
   
    // La fonction unset() permet de détruire les variables et les objets
    unset($nom);
    unset($prenom);
    unset($email);
    unset($message);
    unset($contact);

    // Ici on convertit le tableau associatif en une représentation JSON (Création d'un flux JSON)
    echo json_encode(['reponse' => $reponse]);

}

?>