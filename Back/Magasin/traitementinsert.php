
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
    $sql = "insert into article values (:code, :designation, :prix, :categorie)";
    $reponse = $connexion->prepare($sql);

    // Récupération des valeurs issues de la soumission du formulaire
    $code           = $_POST["code"];
    $designation    = $_POST["designation"];
    $prix           = $_POST["prix"];
    $categorie      = $_POST["categorie"];

    // Exécution de la requête préparée d'insertion sans contrôle de validation
    // $reponse->execute( array(   ":code"=>$code, 
    //                             ":designation"=>$designation, 
    //                             ":prix"=>$prix,
    //                             ":categorie"=>$categorie));

    // Version de l'insertion avec bindValue (on peut passer des valeurs aux différents marqueurs)
    // De plus on peut sécuriser les données à insérer en utilisant les constantes de classe PDO
    // PDO::PARAM_STR, PDO::PARAM_INT, PDO::PARAM_BOOL

    $reponse->bindValue(":code", $code, PDO::PARAM_STR);
    $reponse->bindValue(":designation", $designation, PDO::PARAM_STR);
    $reponse->bindValue(":prix", $prix, PDO::PARAM_STR);
    $reponse->bindValue(":categorie", $categorie, PDO::PARAM_STR);
    $reponse->execute();  
    
    echo 'Valeur de la dernière clef primaire insérée : '.$connexion->lastInsertId();
?>

