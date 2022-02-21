<?php
$login = $_SESSION["login"];
$fonction = $_SESSION["fonction"];
$email = $_SESSION["email"];
$title = "Bienvenue ".$login;
ob_start();

$html="";
$html.="<h1>Bienvenue $login</h1>";
$html.="<h3>Vous êtes : <span>$fonction</span></h3>";
$html.="<h4>Votre Adresse Email est : <span>$email<span></h4>";

$html.="<a href='index.php'>Retour à l'accueil</a>";

echo $html;

$content = ob_get_clean();
include "baselayout.php";
?>