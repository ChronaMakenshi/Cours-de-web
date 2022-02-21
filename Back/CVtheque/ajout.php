<!DOCTYPE html>
<html>
<head>
	<title>Ajout CV</title>
	<link href="css/bootstrap.css" rel="stylesheet" />
	<link rel="stylesheet" href="css/style.css"/>
	<link href="https://fonts.googleapis.com/css?family=Fredericka+the+Great" rel="stylesheet">
</head>
<body class="MonTableau">
<?php
	include("menu.php");
?>
	<h2>Ajouter un CV</h2>
<form method="post" action="recevoir.php" enctype="multipart/form-data">
	<table border="0" class='table table-bordered table-dark table-hover'>
		<tr>
			<td>Nom</td>
			<td><input type="text" name="nom" ></td>
		</tr>
		<tr>
			<td>Email</td>
			<td><input type="email" name="email" ></td>
		</tr>
		<tr>
			<td>Emploi recherché</td>
			<td><input type="radio" name="emploi" value="CDI" checked>CDI<br>
				<input type="radio" name="emploi" value="CDD">CDD<br>
				<input type="radio" name="emploi" value="Stage">Stage<br>
			</td>
		</tr>
		<tr>
			<td>CV (Format PDF uniquement)</td>
			<td><input type="file" name="cv[]" accept="application/pdf"></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td><input class="btn btn-sample" type="submit" id="submit" name="submit" value="Envoyer">&nbsp;&nbsp;&nbsp;
			<input class="btn btn-sample" type="reset" id="reset" name="reset" value="Annuler"></td>
		</tr>
	</table>
</form>
</body>
</html>