<!DOCTYPE html>
<html>
<head>
	<title>principal</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<!-- <link href="css/bootstrap.css" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Fredericka+the+Great" rel="stylesheet">
	<link rel="stylesheet" href="css/style.css"/> -->
</head>
<body>
<?php 	include "heure.php";
		include "personnes.php";

		// 4 - L'exécution du script déclenche les affichages pour les instructions qui ne figurent pas 
		// dans des classes.

		// 5 -  la portée globale d'une fonction ou d'une instruction pose un problème de visibilité : 
		// ne devraient donc figurer dans ces modules que des fonctions ou des classes. 
		// L'approche objet (à base de classes) possède un atout supplémentaire : la réentrance, car chaque 
		// fonction est exécutée dans le contexte d'un objet, avec son propre jeu de variables, 
		// que l'on appelle dès lors des champs. Enfin, l'extension généralement consacrée, 
		// .inc relève de la rupture de fantaisie. Il vaut mieux donner une extension explicite (.php ou .html) 
		// pour pouvoir développer avec le maximum de confort. 
		// Nombreux sont les environnements de développement qui adaptent leur présentation en fonction 
		// de l'extension du fichier.

?>
</body>
</html>