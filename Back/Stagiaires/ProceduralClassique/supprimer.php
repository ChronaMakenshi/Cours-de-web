<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Suppression d'un Membre</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <h1>Référence à l'enregistrement pour Suppression</h1>
    <?php
    echo "<div id=monid>";
    echo $_GET["id"];
    echo "</div>";


   // Connexion à la BDD
try {
    $option = array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8');
    $connexion = new PDO('mysql:host=localhost:3308;dbname=formation;charset=utf8;', 'root', '', $option);
} catch (exception $e) {
    die('Erreur ' . $e->getMessage());
}

    // Modification des données en BDD avec requête préparée.
    $reponse = $connexion->prepare(" DELETE FROM membres WHERE id_membre = :id ");
    $reponse->bindParam(":id", intval($_GET["id"]), PDO::PARAM_INT);
    $reponse->execute();

    header("Location:index.php");
    ?>
</body>
</html>