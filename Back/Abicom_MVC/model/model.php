<?php
require("connect.php");

// Connexion à la BDD
function connect_db()
{
    $dsn = "mysql:dbname=" . BASE . ";host=" . SERVER;
    try {
        $option = array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8');
        $connexion = new PDO($dsn, USER, PASSWD, $option);
    } catch (PDOException $e) {
        printf("Echec connexion : %s\n", $e->getMessage());
        exit();
    }
    return $connexion;
}


// Vérification login//mdp
function verif_connect()
{
    $connexion = connect_db();
    $sql = $connexion->prepare("SELECT count(*) as nombre from users where loginUser = :id and passUser = :mdp");
    $sql->bindValue(":id", strval($_POST['pseudo']), PDO::PARAM_STR);
    $sql->bindValue(":mdp", strval($_POST['mdp']), PDO::PARAM_STR);
    $sql->execute();

    return  $sql->fetch(PDO::FETCH_BOTH);
}

// Création de la liste des clients
function get_all_clients()
{
    $connexion = connect_db();
    $clients = array();

    $sql = $connexion->prepare("SELECT * from clients");
    $sql->execute();
    while ($row = $sql->fetch(PDO::FETCH_BOTH)) {
        $clients[] = $row;
    }

    return $clients;
}

// Recherche d'un client
function get_client_by_id($id)
{
    $connexion = connect_db();
    $sql = $connexion->prepare("SELECT * from clients where idClient = :id");
    $sql->bindValue(":id", intval($id), PDO::PARAM_INT);
    $sql->execute();

    return  $sql->fetch(PDO::FETCH_BOTH);
}

// recherche de la liste des clients par raison sociale
function get_rch_clients($rch)
{
    $connexion = connect_db();
    $clients = array();
    $rch .= '%';
    $sql = $connexion->prepare("SELECT * from clients where raisonSociale like :rch");
    $sql->bindValue(":rch", strval($rch), PDO::PARAM_STR);
    $sql->execute();
    while ($row = $sql->fetch(PDO::FETCH_BOTH)) {
        $clients[] = $row;
    }
    return $clients;
}

// Suppression d'un stagiaire par id
function delete_client_by_id($id)
{

    $connexion = connect_db();
    $stmt = $connexion->prepare(" DELETE FROM clients WHERE idClient = :id ");
    $stmt->bindValue(":id", intval($_GET["id"]), PDO::PARAM_INT);
    $stmt->execute();

    header("Location:index.php?action=liste");
}



// Validation d'un formulaire
function Validation($liste_erreur)
{
    if ($_POST['raisonSociale'] == "" || !(isset($_POST['raisonSociale']))) {
        $liste_erreur["raisonSociale"] = "La raison sociale doit être saisie";
    }

    if ($_POST['telephoneClient'] == "" || !(isset($_POST['telephoneClient'])) || !(preg_match('~^[0-9]{10}$~', $_POST['telephoneClient']))) {
        $liste_erreur["telephoneClient"] = "Veuillez saisir un téléphone sur 10 chiffres";
    }

    if ($_POST['adresseClient'] == "" || !(isset($_POST['adresseClient'])) || !(preg_match('~^[0-9]{2} [a-zA-Z -]{1,50}$~', $_POST['adresseClient']))) {
        $liste_erreur["adresseClient"] = "Veuillez saisir une adresse valide";
    }

    if ($_POST['villeClient'] == "" || !(isset($_POST['villeClient'])) || !(preg_match('~^[a-zA-Z -]{1,50}$~', $_POST['villeClient']))) {
        $liste_erreur["villeClient"] = "La ville doit être composée de caractères alphabétiques non accentués";;
    }
    if ($_POST['codePostalClient'] == "" || !(isset($_POST['codePostalClient'])) || !(preg_match("~^[0-9]{5}$~", $_POST['codePostalClient']))) {
        $liste_erreur["codePostalClient"] = "Le CP est sur 5 chiffres";;
    }
    if ($_POST['CA'] == "" || !(isset($_POST['CA'])) || !(preg_match("~^[0-9]{1,50}$~", $_POST['CA']))) {
        $liste_erreur["CA"] = "Le CA doit être numérique";;
    }
    if ($_POST['effectif'] == "" || !(isset($_POST['effectif'])) || !(preg_match("~^[0-9]{1,50}$~", $_POST['effectif']))) {
        $liste_erreur["effectif"] = "L'effectif doit être numérique";;
    }

    return  $liste_erreur;
}

// Insertion d'une societe
function add_client()
{
    $connexion = connect_db();
    $stmt = $connexion->prepare(" INSERT INTO 
    clients (idSect, raisonSociale, adresseClient, codePostalClient, villeClient, CA, effectif, telephoneClient, typeClient, natureClient, commentaireClient) 
    values (:idSect, :raisonSociale, :adresseClient, :codePostalClient, :villeClient, :CA, :effectif, :telephoneClient, :typeClient, :natureClient, :commentaireClient ) ");
    $stmt->bindValue(":idSect", intval($_POST["idSect"]), PDO::PARAM_INT);
    $stmt->bindValue(":raisonSociale", strval($_POST["raisonSociale"]), PDO::PARAM_STR);
    $stmt->bindValue(":adresseClient", strval($_POST["adresseClient"]), PDO::PARAM_STR);
    $stmt->bindValue(":codePostalClient", strval($_POST["codePostalClient"]), PDO::PARAM_STR);
    $stmt->bindValue(":villeClient", strval($_POST["villeClient"]), PDO::PARAM_STR);
    $stmt->bindValue(":CA", intval($_POST["CA"]), PDO::PARAM_INT);
    $stmt->bindValue(":effectif", intval($_POST["effectif"]), PDO::PARAM_INT);
    $stmt->bindValue(":telephoneClient", strval($_POST["telephoneClient"]), PDO::PARAM_STR);
    $stmt->bindValue(":typeClient", strval($_POST["typeClient"]), PDO::PARAM_STR);
    $stmt->bindValue(":natureClient", strval($_POST["natureClient"]), PDO::PARAM_STR);
    $stmt->bindValue(":commentaireClient", strval($_POST["commentaireClient"]), PDO::PARAM_STR);

    $stmt->execute();
}

// MAJ d'une societe
function update_client($id)
{
    $connexion = connect_db();
    $stmt = $connexion->prepare(" UPDATE clients set idSect = :idSect, raisonSociale = :raisonSociale, adresseClient = :adresseClient, 
    codePostalClient = :codePostalClient, villeClient = :villeClient, CA = :CA, effectif = :effectif, telephoneClient = :telephoneClient,
    typeClient = :typeClient, natureClient = :natureClient, commentaireClient = :commentaireClient
    where idClient = :idClient");
    $stmt->bindValue(":idClient", intval($id), PDO::PARAM_INT);
    $stmt->bindValue(":idSect", intval($_POST["idSect"]), PDO::PARAM_INT);
    $stmt->bindValue(":raisonSociale", strval($_POST["raisonSociale"]), PDO::PARAM_STR);
    $stmt->bindValue(":adresseClient", strval($_POST["adresseClient"]), PDO::PARAM_STR);
    $stmt->bindValue(":codePostalClient", strval($_POST["codePostalClient"]), PDO::PARAM_STR);
    $stmt->bindValue(":villeClient", strval($_POST["villeClient"]), PDO::PARAM_STR);
    $stmt->bindValue(":CA", intval($_POST["CA"]), PDO::PARAM_INT);
    $stmt->bindValue(":effectif", intval($_POST["effectif"]), PDO::PARAM_INT);
    $stmt->bindValue(":telephoneClient", strval($_POST["telephoneClient"]), PDO::PARAM_STR);
    $stmt->bindValue(":typeClient", strval($_POST["typeClient"]), PDO::PARAM_STR);
    $stmt->bindValue(":natureClient", strval($_POST["natureClient"]), PDO::PARAM_STR);
    $stmt->bindValue(":commentaireClient", strval($_POST["commentaireClient"]), PDO::PARAM_STR);

    $stmt->execute();
}
