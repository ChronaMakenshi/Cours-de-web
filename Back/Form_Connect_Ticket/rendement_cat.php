<?php 
session_start(); 
require("database.class.php");

$resultat = Database::ps_rendement_categorie($_POST["id"]);
Database::disconnect();

echo $resultat["@rendement"]." €";
?>
