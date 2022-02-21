<?php

require_once 'modele.php';

function form_connection(){
    require "templates/form_connection.php";
}

function accueil(){
    require "templates/accueil.php";
}

function controle_doublon($user, $email){
    return controler_doublon($user,$email);
}

function verifie_utilisateur($user,$email){
    return verifier_utilisateur($user,$email);
}

function ajoute_utilisateur($email,$user,$pwd,$fonction){
    ajouter_utilisateur($email,$user,$pwd,$fonction);
}

// Affiche une erreur dans une vue qui centralise toutes les levées d'Exceptions 
function erreur($msgErreur) {
    require 'templates/erreur.php';
}

?>
