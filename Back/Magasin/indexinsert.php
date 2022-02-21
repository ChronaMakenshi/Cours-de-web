<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/style.css">
    <title>Insertion d'un Article dans la Table Article</title>
</head>
<?php
// Ouverture d'une connexion sur la Base magasin du SGBD MySQL
$dsn = "mysql:dbname=magasin;host=localhost:3308";
try {
    $option = array(
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'
    );

    $connexion = new PDO($dsn, "root", "", $option);
} catch (PDOException $e) {
    printf("Echec connexion : %s\n", $e->getMessage());
}
// Récupération des articles dans la Table article appartenant à la catégorie 'video' 
// et dont la désignation comporte le mot 'Camescope'
$sql = "select * from article where categorie = :cat and designation like :design ";
$reponse = $connexion->prepare($sql);
$reponse->execute(array(":cat" => "video", ":design" => "%Camescope%"));
?>

<body>
    <h1>Insertion d'un Article </h1>
    <br><br>

    <form action="traitementinsert.php" method="post">

        <p>
            <label for="code">Code Article :</label>
            <input type="text" name="code" id="code" autocomplete="off">
        </p>
        <br>
        <p>
            <label for="designation">Désignation :</label>
            <input type="text" name="designation" id="designation" autocomplete="off">
        </p>
        <br>
        <p>
            <label for="prix">Prix :</label>
            <input type="text" name="prix" id="prix" autocomplete="off">
        </p>
        <br>
        <p>
            <label for="categorie">Catégorie :</label>
            <input type="text" name="categorie" id="categorie" autocomplete="off">
        </p>
        <br><br>
        <p>
            <button type="reset">Annuler</button>&nbsp;&nbsp;&nbsp;
            <button type="submit">Envoyer</button>
        </p>
    </form>
</body>

</html>