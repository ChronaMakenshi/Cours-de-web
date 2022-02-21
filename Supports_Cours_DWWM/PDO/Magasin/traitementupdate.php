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

    // Préparation de la requête avec des marqueurs nommés
    $sql = "update article set designation=:designation, prix=:prix, categorie=:categorie where id_article=:code";
   
    $reponse = $connexion->prepare($sql);

    // Récupération des valeurs issues de la soumission du formulaire
    $designation    = $_POST["designation"];
    $prix           = $_POST["prix"];
    $categorie      = $_POST["categorie"];
    $code           = $_POST["code"];

    // Exécution de la requête préparée de modification sans contrôle de validation
    // $reponse->execute( array(   ":designation"=>$designation, 
    //                             ":prix"=>$prix,
    //                             ":categorie"=>$categorie,
    //                             ":code"=>$code));

    $reponse->bindValue(":designation", $designation, PDO::PARAM_STR);
    $reponse->bindValue(":prix", $prix, PDO::PARAM_STR);
    $reponse->bindValue(":categorie", $categorie, PDO::PARAM_STR);
    $reponse->bindValue(":code", $code, PDO::PARAM_STR);
    $reponse->execute();        

    header("location:indexupdate.php");
?>