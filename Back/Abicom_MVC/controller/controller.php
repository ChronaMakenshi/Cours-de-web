<?php
require_once 'model/model.php';

function soumettre_form()
{
    $retour = verif_connect();

    if ($retour['nombre'] > 0) {
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
    require "view/liste_clients.php";
}

function supprimer_client($id)
{

    delete_client_by_id($id);
    $stagiaires = get_all_clients();
    require "view/liste_clients.php";
}

function modifier_client($id)
{
    $titre_component = "Modification d'un client";
    $client = get_client_by_id($id);
    $liste_erreur = tb_erreur_vierge();
    require "view/detail_client.php";
}

function recherche_client($rch)
{
    $clients = get_rch_clients($rch);
    require "view/liste_clients.php";
}

function ajout_client()
{
    $titre_component = "Ajout d'un client";
    $client = client_vierge();
    $liste_erreur = tb_erreur_vierge();
    require "view/detail_client.php";
}

function client_vierge()
{
    $client = [
        "idClient" => 0,
        "raisonSociale" => "",
        "typeClient" => "",
        "telephoneClient" => "",
        "adresseClient" => "",
        "villeClient" => "",
        "codePostalClient" => "",
        "idSect" => 0,
        "natureClient" => "",
        "CA" => "",
        "effectif" => "",
        "commentaireClient" => ""
    ];

    return $client;
}

function tb_erreur_vierge()
{
    $liste_erreur = [
        "raisonSociale" => "",
        "telephoneClient" => "",
        "adresseClient" => "",
        "villeClient" => "",
        "codePostalClient" => "",
        "CA" => "",
        "effectif" => "",
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
        "idClient" => $_GET["id"],
        "raisonSociale" => $_POST["raisonSociale"],
        "typeClient" =>  $_POST["typeClient"],
        "telephoneClient" => $_POST["telephoneClient"],
        "adresseClient" =>  $_POST["adresseClient"],
        "villeClient" =>  $_POST["villeClient"],
        "codePostalClient" =>  $_POST["codePostalClient"],
        "idSect" =>  $_POST["idSect"],
        "natureClient" =>  $_POST["natureClient"],
        "CA" =>  $_POST["CA"],
        "effectif" =>  $_POST["effectif"],
        "commentaireClient" =>  $_POST["commentaireClient"]
    ];
    require "view/detail_client.php";
}

function erreur_formulaire()
{
    $erreur = 0;
    if ($_POST['raisonSociale'] == "" || !(isset($_POST['raisonSociale']))) {
        $erreur = 1;
    }

    if ($_POST['telephoneClient'] == "" || !(isset($_POST['telephoneClient'])) || !(preg_match('~^[0-9]{10}$~', $_POST['telephoneClient']))) {
        $erreur = 1;
    }

    if ($_POST['adresseClient'] == "" || !(isset($_POST['adresseClient'])) || !(preg_match('~^[0-9]{2} [a-zA-Z -]{1,50}$~', $_POST['adresseClient']))) {
        $erreur = 1;
    }

    if ($_POST['villeClient'] == "" || !(isset($_POST['villeClient'])) || !(preg_match('~^[a-zA-Z -]{1,50}$~', $_POST['villeClient']))) {
        $erreur = 1;
    }
    if ($_POST['codePostalClient'] == "" || !(isset($_POST['codePostalClient'])) || !(preg_match("~^[0-9]{5}$~", $_POST['codePostalClient']))) {
        $erreur = 1;
    }
    if ($_POST['CA'] == "" || !(isset($_POST['CA'])) || !(preg_match("~^[0-9]{1,50}$~", $_POST['CA']))) {
        $erreur = 1;
    }
    if ($_POST['effectif'] == "" || !(isset($_POST['effectif'])) || !(preg_match("~^[0-9]{1,50}$~", $_POST['effectif']))) {
        $erreur = 1;
    }
    return $erreur;
}
