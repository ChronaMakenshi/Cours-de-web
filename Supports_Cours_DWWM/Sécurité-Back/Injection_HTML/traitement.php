<!doctype html>
<html lang="fr">
<head>
<meta charset="UTF−8"/>
<title>Injection de HTML</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<h1>Réception avec échappement par <i>htmlentities</i></h1>
<strong>La description du Client est :</strong>

<?php
if(isset($_POST["description"])){
    echo html_entity_decode(htmlentities( $_POST["description"], ENT_COMPAT, "UTF-8"), ENT_COMPAT, "UTF-8");
}
echo"<p><a href='index.php'>Retour</a></p>";
?>

