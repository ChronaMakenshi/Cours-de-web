<!DOCTYPE html>
<html>
<head>
	<title>Liste des Candidatures</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="css/bootstrap.css" rel="stylesheet" />
	<link rel="stylesheet" href="css/style.css"/>
	<link href="https://fonts.googleapis.com/css?family=Fredericka+the+Great" rel="stylesheet">
	<script>
	function supprimer(id)
	{
		document.forms[0].sup_id.value=id;
		if (confirm("Voulez-vous vraiment supprimer ce Candidat ?"))
		{
			document.forms[0].submit();
		}
		else{
			
		}
	}
	</script>
</head>
<body class="MonTableau">

<?php
	include("menu.php");
?>	
	<h2>Liste des Candidats</h2>
<?php
	include "bdd.php";

	$table 		= new MyTable();
	$requete 	= "SELECT id, nom, email, emploi FROM Personne";
	$resultat 	= $table->reqSelection($requete);


	if(!empty($_POST['sup_id']))
  		$table->suppression_enreg($_POST['sup_id']);

	echo "<form method='post' action='".$_SERVER['SCRIPT_NAME']."'>";
	echo "<input type='hidden' name='sup_id'>";
	echo "<div class='table-responsive MonTableau'><table class='table table-bordered table-dark table-hover'>";
	foreach ($resultat as $myrow)
	{
		$id  = $myrow['id'];
		$nom = $myrow['nom'];
		$email = $myrow['email'];
		$emploi = $myrow['emploi'];

		$lien = "<a href='detail.php?id=$id' target='top'>CV ( <i>pdf</i> )</a>";

	
		echo "<tr><td>$nom</td><td>$email</td><td>$emploi</td><td>$lien</td><td><input type='button' class='btn btn-sample' value='Supprimer' onclick='supprimer($id)'></td></tr>";
	}
	echo "</div></table></form>";

?>
</body>
</html>