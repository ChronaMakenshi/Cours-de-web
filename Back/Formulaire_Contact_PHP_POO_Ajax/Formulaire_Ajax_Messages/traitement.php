<?php

require('contact.class.php');

$nom = $_POST["nom"];
$prenom = $_POST["prenom"];
$email = $_POST["email"];
$message = $_POST["message"];

$msg = array();

if(empty($nom)){

    $msg["errornom"]= "Vous devez saisir un Nom";
}

if(empty($email)){

    $msg["errormail"]= "Vous devez saisir un Email";

} else if (!filter_var($email, FILTER_VALIDATE_EMAIL)){

    $msg["errormail"]= "Vous devez saisir un Email au format valide";
}

if(empty($message)){

    $msg["errormessage"]= "Vous devez saisir un Message";
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