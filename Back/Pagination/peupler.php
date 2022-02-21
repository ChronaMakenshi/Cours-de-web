<!DOCTYPE html>
<html>
<head>
	<title>Peupler Annuaire</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
<?php
include "bdd.php";
// Liste de prénoms et de noms
$prenoms = "Marie, Nathalie, Francis, Mila, Nicolas, Pierre, Raoul, Maxime, Marguerite, Isabelle, Karine, Paul, Cherry, Fred, Simone, Bernard, Florian";

$noms = "Durand, Dupont, Duchamp, Martin, Restoueix, Bost, Charlemagne, Vanbeck, Hoche, Delacre, Nicaud, Valadas, Magnoux, Morillon, Chemin, Lescure, Comin, Adam";

$domaines = "gmail.com, hotmail.com, orange.fr, wanadoo.fr, yahoo.com";

// Découpage.
$t_prenoms = explode(", ", $prenoms);
$t_noms = explode(", ", $noms);
$t_domaines = explode(", ", $domaines);

// Futurs enregisrements.
$t_cn = array();
$t_cp = array();
$t_num = array();
$t_dom = array();

// Générer des enregistrements, sans tenir compte des éventuels doublons.
$tp = count($t_prenoms);
$tn = count($t_noms);
$td = count($t_domaines);

for ($i=0; $i<100; $i++)
{
	
	$n = rand(0, $tn-1);
	$t_cn[$i] = $t_noms[$n];
	
	$p = rand(0, $tp-1);
	$t_cp[$i] = $t_prenoms[$p];

	$d = rand(0, $td-1);
	$t_dom[$i] = lcfirst(substr($t_prenoms[$p],0,1)).".".lcfirst($t_noms[$n])."@".$t_domaines[$d]; 

}

// Suppression des doublons
//$t_cn = array_unique($t_cn);
//$t_cp = array_unique($t_cp);
//$t_dom = array_unique($t_dom);

// Connexion à la BDD
$table = new MyTable();

for ($j=0; $j<count($t_cn); $j++)
{
	
	// On affiche uniquement les éléments du tableau qui ont une clé.
	if (array_key_exists($j, $t_cn) && array_key_exists($j, $t_dom) && array_key_exists($j, $t_cp))
	{
		if(($t_cn[$j] != "") && ($t_dom[$j] != ""))
		{

			$t_num[$j]="0".rand(5,9).rand(0,9).rand(0,9).rand(0,9).rand(0,9).rand(0,9).rand(0,9).rand(0,9).rand(0,9);

			$annuaire = array($t_cn[$j], $t_cp[$j], $t_num[$j], $t_dom[$j]);
			$sql= "INSERT INTO personne (nom, prenom, telephone, email) VALUES ('$t_cn[$j]','$t_cp[$j]','$t_num[$j]', '$t_dom[$j]')";

			// Insertion des données dans la table personne de la BDD annuaire (a n'exécuter qu'une seule fois) :
			//$resultat = $table->reqPrepare($sql, $annuaire, false);
			
		}
	}
}
?>
</body>
</html>