<?php
require_once 'modele.php';

$objStagiaire = new Stagiaire();

function liste_stagiaires(){
    global $objStagiaire;
    $stagiaires = $objStagiaire->get_all_stagiaires();
    require "templates/listestagiaires.php";
}

function supprimer_stagiaire($id){
    global $objStagiaire;
    $objStagiaire->delete_stagiaire_by_id($id);
    $stagiaires = $objStagiaire->get_all_stagiaires();
    require "templates/listestagiaires.php";

}

function ajout_stagiaire($nom, $prenom){
    global $objStagiaire;
    $objStagiaire->ajouter_stagiaire($nom, $prenom);
    $stagiaires =  $objStagiaire->get_all_stagiaires();
    require "templates/listestagiaires.php";
}

function modifie_stagiaire($nom, $prenom, $id){
    global $objStagiaire;
    $objStagiaire->modifier_stagiaire($nom, $prenom, $id);
    $stagiaires = $objStagiaire->get_all_stagiaires();
    require "templates/listestagiaires.php";
}

function obtenir_stagiaire($id){
    global $objStagiaire;
    return $objStagiaire->get_stagiaire_by_id($id);

}

// Affiche une erreur dans une vue qui centralise toutes les levées d'Exceptions 
function erreur($msgErreur) {
    require 'templates/erreur.php';
}
  
?>