<?php
$nom = isset($_POST["nom"]) ? $_POST["nom"] : "";
$prenom = isset($_POST["prenom"]) ? $_POST["prenom"] : "";
$telephone = isset($_POST["telephone"]) ? $_POST["telephone"] : "";
$email = isset($_POST["email"]) ? $_POST["email"] : "";
$categorie = isset($_POST["categorie"]) ? $_POST["categorie"] : "";

require ("validation.php");
if (empty( $dataErrors ) ) {
    require ("vueSaisie.php");
} else {
    require ("vueErreur.php");
}
?>