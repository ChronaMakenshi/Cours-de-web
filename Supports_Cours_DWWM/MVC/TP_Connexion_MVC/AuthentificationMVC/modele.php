<?php
require("connect.php");

// Connexion à la BDD
function connect_db()
{
    $dsn = "mysql:dbname=" . BASE . ";host=" . SERVER.";port=3308";
    try {
        $option = array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8');
        $connexion = new PDO($dsn, USER, PASSWD, $option);
    } catch (PDOException $e) {
        printf("Echec connexion : %s\n", $e->getMessage());
        exit();
    }
    return $connexion;
}

function controler_doublon($email,$user){
    $connexion = connect_db();
    $requete = "SELECT * FROM utilisateurs WHERE email_user = :email_user AND login_user= :user";
    $stmt = $connexion->prepare($requete);
    $stmt->bindParam(':email_user', $email, PDO::PARAM_STR);
    $stmt->bindParam(':user', $user, PDO::PARAM_STR);
    $stmt->execute();
    $result = $stmt->rowCount();
    if ($result==0) return false;
    else return true;

}

function ajouter_utilisateur($email,$user,$pwd,$fonction){
    $connexion = connect_db();
    $requete = "INSERT INTO utilisateurs(email_user, login_user, pwd_user, fonction) VALUES (:email_user, :login_user, :pwd_user, :fonction)";
    $stmt = $connexion->prepare($requete);
    $stmt->bindParam(':email_user', $email);
    $stmt->bindParam(':login_user', $user);
    $stmt->bindParam(':pwd_user', $pwd);
    $stmt->bindParam(':fonction', $fonction);
    $stmt->execute();

}

function verifier_utilisateur($user,$email){
    $connexion = connect_db();
    $requete = "SELECT * FROM utilisateurs WHERE email_user = :email_user AND login_user= :user";
    $stmt = $connexion->prepare($requete);
    $stmt->bindParam(':email_user', $email, PDO::PARAM_STR);
    $stmt->bindParam(':user', $user, PDO::PARAM_STR);
    $stmt->execute();
    return $stmt->fetch();
}

?>

