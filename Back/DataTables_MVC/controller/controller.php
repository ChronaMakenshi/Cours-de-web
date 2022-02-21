<?php
require_once 'model/model.php';

function soumettre_form()
{
    $retour = verif_connect();

    if ($retour > 0) {
        header('location:index.php?action=liste');
    } else {
        $message_erreur = "Mauvaise association login/mdp";
        require "view/connexion.php";
    }
}

function connexion()
{
    $message_erreur = "";
    require "view/connexion.php";
}
function liste_clients()
{
    $clients = get_all_clients();
    require "view/liste_annuaire.php";
}

function supprimer_client($id)
{

    delete_client_by_id($id);
    $stagiaires = get_all_clients();
    require "view/liste_clients.php";
}

function modifier_client($id)
{
    $titre_component = "Modification d'un salarié";
    $client = get_client_by_id($id);
    $liste_erreur = tb_erreur_vierge();
    require "view/detail_client.php";
}

function ajout_client()
{
    $titre_component = "Ajout d'un salarié";
    $client = client_vierge();
    $liste_erreur = tb_erreur_vierge();
    require "view/detail_client.php";
}

function client_vierge()
{
    $client = [
        "id" => 0,
        "nom" => "",
        "prenom" => "",
        "telephone" => "",
        "email" => ""
    ];

    return $client;
}

function tb_erreur_vierge()
{
    $liste_erreur = [
        "nom" => "",
        "prenom" => "",
        "telephone" => "",
        "email" => "",
        "nb_erreur" => 0,
    ];

    return   $liste_erreur;
}

function validation_formulaire($origine)
{
    if ($origine == 'ajout') {
        $titre_component = "Ajout d'un client";
    } else {
        $titre_component = "Modification d'un client";
    }
    $liste_erreur = tb_erreur_vierge();
    $liste_erreur = Validation($liste_erreur);
    $client = [
        "id" => $_GET["id"],
        "nom" => $_POST["nom"],
        "prenom" => $_POST["prenom"],
        "telephone" => $_POST["telephone"],
        "email" => $_POST["email"]
    ];
    require "view/detail_client.php";
}
