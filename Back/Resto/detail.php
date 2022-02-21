<!DOCTYPE html>
<html>
<head>
	<title>Détail Resto</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="css/bootstrap.css" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Fredericka+the+Great" rel="stylesheet">
	<link rel="stylesheet" href="css/style.css"/>
</head>
<body>
	<h1>WebAppli Les Restos</h1><br><br>

<?php
	include "bases.php";
	
	$id=$_GET["id"];
	$table = new MyTable();
	echo "<div class='MonTableau' >".$table->detail_html($id)."</div>";

	if(!empty($_POST)){
		echo $table->modification_enreg($id);
	}

?>
</body>
</html>