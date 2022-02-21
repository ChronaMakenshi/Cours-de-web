<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier un Stagiaire</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<?php

// Connexion à la BDD
try {
    $option = array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8');
    $connexion = new PDO('mysql:host=localhost:3308;dbname=formation;charset=utf8;', 'root', '', $option);
} catch (exception $e) {
    die('Erreur ' . $e->getMessage());
}

if(isset($_GET["id"])){
    $id = $_GET["id"];
}

$sql = "SELECT * from membres WHERE id_membre = :id";
$reponse = $connexion->prepare($sql);
$reponse->bindParam(':id', $id, PDO::PARAM_INT);
$reponse->execute();
$donnees = $reponse->fetch();

?>
<h1>Modifier un Stagiaire</h1>
<form action="traitement_modifier.php" method="POST" id="monform">
    <table class="table">
        <tr>
            <td><label for="prenom">Prénom</label></td>
            <td><input type="text" name="prenom" id="prenom" value="<?=$donnees["login_membre"] ?>"></td>
            <input type="hidden" name="id" value="<?=$donnees["id_membre"] ?>">
        </tr>
        <tr>
            <td><label for="nom">Nom</label></td>
            <td><input type="text" name="nom" id="nom" value="<?=$donnees["nom_membre"] ?>"></td>
        </tr>
        <tr>
            <td><input type="submit" id="submit" value="Envoyer"></td>
            <td><input type="reset" value="Annuler"></td>
        </tr>
    </table>
</form>
</body>
</html>