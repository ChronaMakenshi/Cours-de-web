<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <title>Liste Articles</title>
</head>

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

// Récupération des articles dans la Table article appartenant à la catégorie 'video' 
// et dont la désignation comporte le mot 'Camescope'
$sql = "select * from article where categorie = :cat and designation like :design ";
$reponse = $connexion->prepare($sql);

// Version avec bindValue (on peut passer des valeurs aux différents marqueurs)

$reponse->bindValue(":cat", "video", PDO::PARAM_STR);
$reponse->bindValue(":design", "%Camescope%", PDO::PARAM_STR);
$reponse->execute();


// Version avec bindParam (on peut passer des variables aux différents marqueurs), on lie
// les différents marqueurs à des variables attitrées qui peuvent donc changer de valeurs.
// La valeur est donc transmise par référence au marqueur, c'est pourquoi elle peut être
// modifiée au cours du programme.

// $cat="video";
// $des="%Camescope%";

// $reponse->bindParam(":cat", $cat, PDO::PARAM_STR);
// $reponse->bindParam(":design", $des, PDO::PARAM_STR);
// $reponse->execute();


//$reponse->execute( array(":cat"=>"video", ":design"=>"%Camescope%"));
?>
<body>
    <h1>Liste des Articles </h1>
    <?php
    // Affichage de la liste des articles de la catégorie 'photo'
    while($data = $reponse->fetch(PDO::FETCH_BOTH)){

        echo $data["designation"]."<br>";
    }
    // Fermer le curseur d'analyse des résultats. A faire à chaque fois que vous avez
    // terminé de traiter le retour d'une requête.
    $reponse->closeCursor();
    ?>
</body>
</html>