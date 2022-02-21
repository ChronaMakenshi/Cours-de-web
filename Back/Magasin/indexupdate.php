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
$sql = "select * from article where id_article = :code ";
$reponse = $connexion->prepare($sql);
$reponse->execute(array(":code" => "CA300"));
$data = $reponse->fetch();

?>

<body>
    <h1>Modification d'un Article </h1>
    <br><br>

    <form action="traitementupdate.php" method="post">

        <p>
            <label for="code">Code Article :</label>
            <input type="text" name="code" id="code" disabled autocomplete="off" value="<?=$data['id_article'] ?>">
            <input type="hidden" name="code" id="code" autocomplete="off" value="<?=$data['id_article'] ?>">
        </p>
        <br>
        <p>
            <label for="designation">Désignation :</label>
            <input type="text" name="designation" id="designation" autocomplete="off" value="<?=$data['designation']?>">
        </p>
        <br>
        <p>
            <label for="prix">Prix :</label>
            <input type="text" name="prix" id="prix" autocomplete="off" value="<?=$data['prix']?>">&nbsp;€
        </p>
        <br>
        <p>
            <label for="categorie">Catégorie :</label>
            <input type="text" name="categorie" id="categorie" autocomplete="off" value="<?=$data['categorie']?>">
        </p>
        <br><br>
        <p>
            <button type="reset">Annuler</button>&nbsp;&nbsp;&nbsp;
            <button type="submit">Envoyer</button>
        </p>
    </form>
</body>

</html>