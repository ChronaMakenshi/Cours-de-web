<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/style.css">
    <title>Modification d'un Article dans la Table Article</title>
</head>
<?php

// Ouverture d'une connexion sur la Base magasin du SGBD MySQL
$dsn = "mysql:dbname=magasin;host=localhost:3308;charset=utf8";
try {
    $option = array(
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION);

    $connexion = new PDO($dsn, "root", "", $option);
} catch (PDOException $e) {
    printf("Echec connexion : %s\n", $e->getMessage());
}


// Récupération des articles dans la Table article
$sql = "select * from article";
$reponse = $connexion->prepare($sql);
$reponse->execute(array());

$reponse->rowCount()

?>
<body>
    <h1>Suppression d'un Article </h1>
    <br><br>
    <?php echo 'Il y a <strong>' .$reponse->rowCount().'</strong> articles dans la Table Article'; ?>
    <table class="table">
        <tr><th>Code</th><th>Désignation</th><th>Prix</th><th>Catégorie</th><th>Suppression</th></tr>
    <?php
    while($donnees = $reponse->fetch()){
        echo '<tr><td>' .$donnees["id_article"].'</td><td>'.$donnees["designation"].'</td><td>'
        .$donnees["prix"].'</td><td>'.$donnees["categorie"].
        '</td><td><a href=traitementdelete.php?code='.$donnees["id_article"].'>Supprimer</a></td></tr>';
    }
    ?>    
    </table>
</body>
</html>