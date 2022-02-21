<?php
function verifier($d)
{	
	global $msg;
	
	$c = $_POST[$d];
	$msg .= "<span style='color: #48A2F5'>Date saisie : $c </span><br>";
	// 4 - Il faut bien faire attention à encadrer l'expression régulière par les symboles ^ et $ pour 
	// indiquer que le masque vérifie la chaîne du premier caractère au dernier.

	$m = "'^\d{1,2}/\d{1,2}/\d{4}$'";

	// 5 - Nous utilisons ici la fonction preg_match() pour effectuer la vérification de la validité de 
	// l'expression face au masque 'jj/mm/aaaa' :

	$v=preg_match($m, $c);
	
	if ($v == 0)
	{
		$msg .= "<div style='color: red'>Le format de la date ne correspond pas au masque attendu !!!</div>";
	}else{
		$msg .= "<div style='color: green'>Le format de la date est valide !!!</div>";

			// 6 - Vérification effective de la date ...
			// pour tester chaque portion de la date, on génére une liste avec la fonction PHP explode().
		list($jour,$mois,$annee)=explode("/",$c);

		if(checkdate($mois,$jour,$annee))  // La fonction checkdate() de PHP vérifie si le mois, le jour 
		// et l'année correspondent.
			{$msg.= "<span style='color: green'>La date est ok ! </span>";}
		else
			{$msg .="<span style='color: red'>La date n'est pas ok !</span> ";}
	}
	return $msg;
}

$msg = "";

if ( !empty($_POST['b']))
{
	verifier("jour");
}

?>
<!DOCTYPE html>
<html>
<head>
	<title>Validation Date</title><br>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="css/bootstrap.css" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Fredericka+the+Great" rel="stylesheet">
	<link rel="stylesheet" href="css/style.css"/> 
</head>
<body>
	<div class='MonTableau'>
		<h2>Validation Date</h2>
		<form method="post" action="<?php echo $_SERVER["SCRIPT_NAME"] ?>">
			Entrez une date <input type="text" name="jour" placeholder="jj/mm/aaaa">
			<input class="btn btn-sample" type="submit" name="b" value="Tester">
			<div><?php echo $msg; ?></div>
		</form>
	</div>
</body>
</html>


