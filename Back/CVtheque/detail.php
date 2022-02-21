
<?php
	include "bdd.php";
	$table 		= new MyTable();
	$requete 	= "SELECT cv, cv_type FROM Personne WHERE id=".$_GET['id'];
	$resultat 	= $table->reqSelection($requete);

	foreach ($resultat as $myrow)
	{
		$fichier  = $myrow['cv'];
		$type = $myrow['cv_type'];	

		header("Content-Type: ".$type);
		echo  $fichier;
	}
?>