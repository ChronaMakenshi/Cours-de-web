<?php // analyse du formulaire recu :
// init des var
$interet = "" ;// libelle des int�rets utilisateur
$marequ = "insert into Matable values(" ;// partie constante de la requete sql	 

// r�cup nom et age
$marequ = $marequ . "'" . $_GET["nom"] . "'," . $_GET["age"] . "," ;  

// recup situation maritale (bt radio dans le form)
$marequ = $marequ . "'" . $_GET["marit"] . "'," ;  

// r�cup du/des centres int�ret utilisateur (checkbox dans le form)
// avec concat�nation du libell� int�rets utilisateur
if(isset($_GET["interet"])) // au moins une case est coch�e
{

	foreach ($_GET["interet"] as $item)
	{
		if ($item == "internet")
		{
			// case Internet a �t� coch�e
			
			
		}
		else if ($item == "micro")
		{
			// case Micro-informatique a �t� coch�e
			
		}
		else if (...)
}
else
{
	$marequ = $marequ . "0," ;
} 
	
if(isset($_GET["micro"]))
{
	$marequ = $marequ . "1," ;
	$interet = $interet .  " la micro-informatique," ;
} 
else
{
	$marequ = $marequ . "0," ;
}

if(isset($_GET["jeux"]))
{
	$marequ = $marequ .  "1)"; 
	$interet = $interet . " les jeux vid�o" ;
}	
else
{
	$marequ = $marequ . "0)" ;
}

if ($interet == "" ) { $interet = "rien (dommage...)." ; }
// fin pr�paration requete sql et libell� int�rets utilisateur
?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf_8">
<title>Une petite r�ponse</title>
</head>
<body>
<h2>Merci � vous, <?php echo $_GET["nom"] ; ?>.</h2>
Vous avez donc le bel �ge de <b><?php echo $_GET["age"] ; ?></b> ans, 
vous �tes <b><?php echo $_GET["marit"] ; ?></b><br />
et vous vous int�ressez � 

<b><?php echo $interet ; ?></b>.<br /><br />

Je m'empresse d'envoyer la requ�te :<br />
<b><?php echo $marequ ; ?><br /></b> � notre base de donn�es.
</body>
</html>
