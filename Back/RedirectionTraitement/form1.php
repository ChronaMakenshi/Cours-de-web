<?php 
if(!isset($_POST["cmd_valid"]))
{
 	// Publication initiale
	$msg = "Saisie obligatoire";
	$erreur = true;

}else{

 	// Post Back
	$msg = "";
	if (empty($_POST["email"]))
	{
		$msg .= "Le Champ email doit être renseigné.<br>";
		$erreur = true;
	}

	if (empty($_POST["password"]))
	{
		$msg .= "Le Champ password doit être renseigné.<br>";
		$erreur = true;
	}

	$logins = array('jean_valjean@academie.net' => "hugo", 'steve_ostin@lesseries.org' => "3md", 'david_banner@marvel.com' => "hulk");

	
	if (!empty($_POST["email"])&&!empty($_POST["password"]))
	{
		if(array_key_exists($_POST["email"], $logins))
		{
			if ($logins[$_POST["email"]] != $_POST["password"])
			{
				$msg .= "Echec de l'identification.";
				$erreur = true;
			}
		}else{
				$msg .= "Cette adresse mail est inconnue.";
				$erreur = true;
		}
	}
	$msg.= "</font>";
}

if (!$erreur)
{
 	// Création d'un Cookie et Redirection
	setcookie("id", $_POST["email"]);
	header('Location:form2.php');
}
?>
<!DOCTYPE html>
<html>
<head>
	<title>Redirection après Traitement</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="css/bootstrap.css" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Fredericka+the+Great" rel="stylesheet">
	<link rel="stylesheet" href="css/style.css"/>
</head>
<body>
	<h2>Identifiez-vous</h2>
	<br>
	<div class='MonTableau' >
		<!-- <form method="post" action="<?php echo $_SERVER["SCRIPT_NAME"] ?>"> -->
		<form method="post" action="form1.php">
			<table class='table table-bordered table-dark table-hover'>
				<tr>
					<td class="MonLabel">Email</td>
					<td><input type="text" name="email" autocomplete="false"></td>
				</tr>
				<tr>
					<td class="MonLabel">Mot de passe</td>
					<td><input type="password" name="password" value="" autocomplete="false"></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="2"><input class="btn btn-sample" type="submit" name="cmd_valid" value="Valider">
					<input class="btn btn-sample" type="reset" id="reset" name="reset" value="Annuler"></td>
					<td><i id="message"><?php echo $msg; ?></i></td>
				</tr>
			</table>	
		</form>
	</div>
</body>
</html>

