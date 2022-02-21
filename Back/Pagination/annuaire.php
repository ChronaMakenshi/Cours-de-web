<!DOCTYPE html>
<html>
<head>
	<title>Annuaire</title>
	<link href="css/bootstrap.css" rel="stylesheet" />
	<link rel="stylesheet" href="css/style.css"/>
	<link href="https://fonts.googleapis.com/css?family=Fredericka+the+Great" rel="stylesheet">
</head>
<body>
	<h2 class="MonTableau">Annuaire</h2>
	<?php 
	include "bdd.php";

	// Connexion à la BDD et première requête pour déterminer le nombre d'enregistrements dans la table personne puis les indices min et max.
	$table 		= new MyTable();
	$requete 	= "SELECT MIN(id) as min, MAX(id) as max, COUNT(*) as compteur from personne";
	$resultat 	= $table->reqSelection($requete);

	// Collecte du nombre d'enregistrements ($compteur), de l'id minimum ($min), de l'id maximum ($max) ...
	foreach ($resultat as $row)
	{
		$compteur = $row["compteur"];
		$min = $row["min"];
		$max = $row["max"];
	}

	// Initialisation et affectation de valeurs des variables $debut et $fin
	if (empty($_GET['debut']))
	{	
		$debut=$min;
	}else{
		
		$debut=$min+$_GET['debut'];
	}

	if ($debut < $min)
	{	
		$debut=$min;
	}
	$fin=$debut+10;

	echo("<div class='MonTableau'>");

	// Affichage du liens Précédent
	if($debut-10 >= $min)
	{
		echo "<a href='annuaire.php?debut=".($debut-$min-10)."'>Précédent</a>";
		echo "&nbsp;";
	}

	// Affichage de la pagination par bloc de 10 enregistrements
	for( $i=1;$i*10<$compteur;$i++)
	{
		$v = ($i*10 != 0 ? $i*10 : 1);
		echo "<a href='annuaire.php?debut=".($v)."'> ".$v." </a>&nbsp;";
	}

	// Affichage du lien Suivant
	if($debut+10 < $max)
	{
		echo "<a href='annuaire.php?debut=".($debut-$min+10)."'>Suivant</a>";
		echo "&nbsp;";
	}


	echo("</div>");
	echo "<hr>";

	// Enfin requête finale qui ne ramène que le nombre d'enregistrements souhaité pour une plage de pagination donnée.

	$req 	= "SELECT * FROM personne where id>=$debut AND id<$fin";

	$result = $table->reqSelection($req);

	echo "<div class='table-responsive MonTableau'><table class='table table-bordered table-dark table-hover'>";
	foreach ($result as $myrow)
	{
		$nom = $myrow['nom'];
		$prenom = $myrow['prenom'];
		$tel = $myrow['telephone'];
		$email = $myrow['email'];

		echo "<tr><td>$nom</td><td>$prenom</td><td>$tel</td><td>$email</td></tr>";
	}
	echo "</table></div>";

	?>
</body>
</html>