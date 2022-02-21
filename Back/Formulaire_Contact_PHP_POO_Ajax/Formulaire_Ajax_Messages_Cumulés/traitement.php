<?php

require('contact.class.php');

$nom = $_POST["nom"];
$prenom = $_POST["prenom"];
$email = $_POST["email"];
$message = $_POST["message"];

$msg = "";

if(empty($nom)){

    $msg .= "<li>Vous devez saisir un Nom</li>";
}

if(empty($email)){

    $msg .= "<li>Vous devez saisir un Email</li>";
} else if (!filter_var($email, FILTER_VALIDATE_EMAIL)){

    $msg .= "<li>Vous devez saisir un Email au format valide</li>";
}

if(empty($message)){

    $msg .= "<li>Vous devez saisir un Message</li>";
}

if(empty($msg)){

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
    echo json_encode(['code' => '200','reponse' => $reponse]);

}else{

    echo json_encode(['code' => '404','reponse' => $msg]);

}

?>