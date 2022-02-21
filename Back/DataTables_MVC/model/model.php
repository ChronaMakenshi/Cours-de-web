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
    $sql = $connexion->prepare("SELECT * from utilisateur where login = :id and mdp = :mdp");
    $sql->bindValue(":id", strval($_POST['pseudo']), PDO::PARAM_STR);
    $sql->bindValue(":mdp", strval($_POST['mdp']), PDO::PARAM_STR);
    $sql->execute();
    $count = $sql->rowCount();

    return  $count;
}

// Création de la liste des clients
function get_all_clients()
{
    $connexion = connect_db();
    $clients = array();

    $sql = $connexion->prepare("SELECT * from personne");
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
    $sql = $connexion->prepare("SELECT * from personne where id = :id");
    $sql->bindValue(":id", intval($id), PDO::PARAM_INT);
    $sql->execute();

    return  $sql->fetch(PDO::FETCH_BOTH);
}

// Suppression d'un client par id
function delete_client_by_id($id)
{

    $connexion = connect_db();
    $stmt = $connexion->prepare(" DELETE FROM personne WHERE id = :id ");
    $stmt->bindValue(":id", intval($_GET["id"]), PDO::PARAM_INT);
    $stmt->execute();

    header("Location:index.php?action=liste");
}



// Validation d'un formulaire
function Validation($liste_erreur)
{
    if ($_POST['nom'] == "" || !(isset($_POST['nom']))) {
        $liste_erreur["nom"] = "Le nom doit être saisi";
        $liste_erreur["nb_erreur"] += 1;
    }
    if ($_POST['prenom'] == "" || !(isset($_POST['prenom']))) {
        $liste_erreur["prenom"] = "Le prénom doit être saisi";
        $liste_erreur["nb_erreur"] += 1;
    }

    if ($_POST['telephone'] == "" || !(isset($_POST['telephone'])) || !(preg_match('~^[0-9]{10}$~', $_POST['telephone']))) {
        $liste_erreur["telephone"] = "Veuillez saisir un téléphone sur 10 chiffres";
        $liste_erreur["nb_erreur"] += 1;
    }

    if ($_POST['email'] == "" || !(isset($_POST['email'])) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
        $liste_erreur["email"] = "Veuillez saisir une adresse email valide";
        $liste_erreur["nb_erreur"] += 1;
    }



    return  $liste_erreur;
}

// Insertion d'une societe
function add_client()
{
    $connexion = connect_db();
    $stmt = $connexion->prepare(" INSERT INTO 
    personne (nom, prenom, telephone, email) 
    values (:nom, :prenom, :telephone, :email ) ");
    $stmt->bindValue(":nom", strval($_POST["nom"]), PDO::PARAM_STR);
    $stmt->bindValue(":prenom", strval($_POST["prenom"]), PDO::PARAM_STR);
    $stmt->bindValue(":telephone", strval($_POST["telephone"]), PDO::PARAM_STR);
    $stmt->bindValue(":email", strval($_POST["email"]), PDO::PARAM_STR);


    $stmt->execute();
}

// MAJ d'une societe
function update_client($id)
{
    $connexion = connect_db();
    $stmt = $connexion->prepare(" UPDATE personne set nom = :nom, prenom = :prenom, telephone = :telephone, email = :email where id = :id");
    $stmt->bindValue(":id", intval($id), PDO::PARAM_INT);
    $stmt->bindValue(":nom", strval($_POST["nom"]), PDO::PARAM_STR);
    $stmt->bindValue(":prenom", strval($_POST["prenom"]), PDO::PARAM_STR);
    $stmt->bindValue(":telephone", strval($_POST["telephone"]), PDO::PARAM_STR);
    $stmt->bindValue(":email", strval($_POST["email"]), PDO::PARAM_STR);

    $stmt->execute();
}
