<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf_8">
<title>Une boucle for next pour dire Bonjour au monde</title>
</head>

<body>
<?php for ($i = 3; $i <= 7; $i++)
{
	echo '<font size="' . $i . "\">Hello World !</font><br />\n";   // syntaxe classique
	echo "<font size=\"$i\">Hello World !</font><br />\n";		   // synataxe PHP avec concaténation implicite
	//echo "<font size=$i>Hello World !</font><br />\n';		   // ne fonctionne pas car PHP n'interprète pas la chaîne entre simples cotes
	
}
print ("<hr />\n");    // ou echo  "<hr />\n";
?> 

<?php
// variante avec insertion des parties variables dans les balises HTML
// moins lisible mais même résultat
for ($i = 5 ; $i >= 1; $i--)
{ 
?>
	<h<?php echo  $i; ?>>Hello World !</h<?php echo $i; ?> > 
<?php
} 
?> 
... et la suite de la page Web...
</body>
</html>


