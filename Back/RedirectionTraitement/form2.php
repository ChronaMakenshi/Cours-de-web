<!DOCTYPE html>
<html>
<head>
	<title>Présence du cookie</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="css/bootstrap.css" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Fredericka+the+Great" rel="stylesheet">
	<link rel="stylesheet" href="css/style.css"/>
</head>
<body>
	<?php 
		if(empty($_COOKIE["id"]))
		{
			echo "<h2>Vous devez vous identifier</h2>";

		}else{
			
			echo "<h2>Bienvenue : ".$_COOKIE["id"]."</h2>";
		}

	 ?>
</body>
</html>