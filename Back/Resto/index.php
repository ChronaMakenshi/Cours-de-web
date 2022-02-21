<!DOCTYPE html>
<html>
<head>
	<title>Les Restos</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="css/bootstrap.css" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Fredericka+the+Great" rel="stylesheet">
	<link rel="stylesheet" href="css/style.css" />
	<script>
	function supprimer(id)
	{
		document.forms[0].sup_id.value=id;
		if (confirm("Voulez-vous vraiment supprimer ce Resto ?"))
		{
			document.forms[0].submit();
		}
		else{
			
		}
	}
	</script>
</head>
<body>
	<h1>WebAppli Les Restos</h1><br><br>
	<?php
	include "bases.php";

	$table = new MyTable();
	echo $table->rendre_html();
	?>

</body>
</html>