<?php
require_once("validUtils.php");
$dataErrors=array();

//validation du nom
$nom=filter_var($nom,getSanitizeFilter("string"));

//validation du prénom
$prenom=filter_var($prenom,getSanitizeFilter("string"));

//validation du téléphone
$telephone=filter_var($telephone,getSanitizeFilter("string"));

//validation de l’adresse email
if( filter_var($email, getValidateFilter("email") )===false){
    $dataErrors["email"]="Erreur: l'adresse mail est invalide.";
}

//validation de la catégorie
$categorie=filter_var($categorie,getSanitizeFilter("string"));
?>