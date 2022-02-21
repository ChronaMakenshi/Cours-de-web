<?php
include "bdd.php";

$a_json = array();
$a_json_row = array();

$table 		= new TableAnnuaire();
$requete 	= "SELECT * FROM personne";
$resultat 	= $table->reqSelection($requete);

while($ligne = $resultat->fetch(PDO::FETCH_ASSOC))
{
	$a_json_row["id"] = $ligne["id"];
	$a_json_row["nom"] = $ligne["nom"];
	$a_json_row["telephone"] = $ligne['telephone'];
	$a_json_row["email"] = $ligne['email'];
	array_push($a_json, $a_json_row);
}
$json = json_encode($a_json);
echo $json;
file_put_contents("Annuaire.json",$json);
?>