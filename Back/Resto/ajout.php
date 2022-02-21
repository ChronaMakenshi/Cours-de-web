<!DOCTYPE html>
<html>
<head>
	<title>Ajout Resto</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="css/bootstrap.css" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Fredericka+the+Great" rel="stylesheet">
	<link rel="stylesheet" href="css/style.css"/>
</head>
<body>
	<h1>WebAppli Les Restos</h1><br><br>

<?php
	include "bases.php";
	
	$table = new MyTable();
	echo "<div class='MonTableau' >".$table->ajout_html()."</div>";
	
	if(!empty($_POST)){
		echo $table->ajout_enreg();
	}
?>
</body>
</html>