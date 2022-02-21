<?php
 include "session.php";
 $session->message = $_GET["monmessage"];
?>
<!DOCTYPE html>
<html>
<head>
	<title>Test Session Page2</title>
	<link href="css/bootstrap.css" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Fredericka+the+Great" rel="stylesheet">
	<link rel="stylesheet" href="css/style.css"/>
</head>
<body>
	<h2>Test Composant de Session : Page2</h2>
	<?php echo "<span class='labelmessage'>Nouveau message de la variable de session : </span><i class='messagedesign'> ".$session->message."</i>"; ?>
</body>
</html>