<?php
	include("liststring.php");

	$l = new listString();
	$l->addString("Mozart");
	$l->addString("Chopin");
	$l->addString("Bach");
	$l->addString("Debussy");
	$l->addString("Blerioz");

?>

<!DOCTYPE html>
<html>
<head>
	<title>Les Itérateurs</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="css/bootstrap.css" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Fredericka+the+Great" rel="stylesheet">
	<link rel="stylesheet" href="css/style.css"/>
</head>
<body>
	<div class="MonTableau">
		<h2>Les Itérateurs</h2><br>
		<?php
		foreach ($l as $s) {
			echo "<li>$s</li>";
		}
		?>
	</div>
</body>
</html>