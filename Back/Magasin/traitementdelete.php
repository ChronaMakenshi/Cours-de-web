<?php
    // Ouverture d'une connexion sur la Base magasin du SGBD MySQL
    $dsn = "mysql:dbname=magasin;host=localhost:3308";
    try {
        $option = array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, 
                        PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8');
                                       
        $connexion = new PDO($dsn, "root", "", $option);   

    } catch (PDOException $e) {
        printf("Echec connexion : %s\n", $e->getMessage());
    }

    // Préparation de la requête de suppression avec le marqueurs nommé :code
    $sql = "delete from article where id_article=:code";
    $reponse = $connexion->prepare($sql);

    // Récupération du code passé en GET à partir du lien hypertexte
    $code= $_GET["code"];

    // Exécution de la requête préparée de suppression
    $reponse->execute( array(":code"=>$code));

    // Retour à la liste des articles
    header("location:indexdelete.php");
?>