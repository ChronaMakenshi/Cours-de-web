<?php
include_once("modele.php");
?>

<!DOCTYPE html>
<html>
<head>
	<title>Erreurs et exceptions</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="css/bootstrap.css" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Fredericka+the+Great" rel="stylesheet">
	<link rel="stylesheet" href="css/style.css"/>
</head>
<body>
	<div class='MonTableau' >
		<h3>Erreurs et Exceptions</h3>
		<?php echo getMessage("titre"); ?>
		<form>
			<?php echo getMessage("invites"); ?>
			<input type="text" name="q">
			<input class="btn btn-sample" type="submit" name="cmd" value="OK">
		</form>
	</div>
</body>
</html>