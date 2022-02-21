<?php
require_once 'modele.php';

function liste_stagiaires(){

    $stagiaires = get_all_stagiaires();
    require "templates/listestagiaires.php";
}

function supprimer_stagiaire($id){

    delete_stagiaire_by_id($id);
    $stagiaires = get_all_stagiaires();
    require "templates/listestagiaires.php";

}

function ajout_stagiaire($nom, $prenom){

    ajouter_stagiaire($nom, $prenom);
    $stagiaires = get_all_stagiaires();
    require "templates/listestagiaires.php";
}

function modifie_stagiaire($nom, $prenom, $id){

    modifier_stagiaire($nom, $prenom, $id);
    $stagiaires = get_all_stagiaires();
    require "templates/listestagiaires.php";
}

function obtenir_stagiaire($id){

    return get_stagiaire_by_id($id);

}

// Affiche une erreur dans une vue qui centralise toutes les levées d'Exceptions 
function erreur($msgErreur) {
    require 'templates/erreur.php';
}
?>