<?php
/* programme principal utilisant la classe Voiture */
// fusion classe Voiture
require('Voiture.php');

// début de page HTML
?>
<html>
<meta charset="utf-8" />
<head><title>Ma Porsche</title></head>
<body>

<?php
// j'achete une Porsche (on peut rever...)
$maPorsche  = new Voiture('AA 123 AA', 'Rouge', 850, 25, 70 , 4);
// je regarde le tableau de bord
echo $maPorsche->getMessage() . '<br />' ;

// exploration objet
var_dump($maPorsche);

// j'assure !
$maPorsche->setAssure(true);
// je regarde le tableau de bord
echo $maPorsche->getMessage() . '<br />' ;

// je passe à la pompe
$niveau = $maPorsche->Mettre_essence(50);
// je regarde le tableau de bord
echo $maPorsche->getMessage() . '<br />' ;


// j'ajoute de l'essence
$niveau = $maPorsche->Mettre_essence(20);
// je regarde le tableau de bord
echo $maPorsche->getMessage() . '<br />' ;


// je roule 100km à 90km/h
$maPorsche->Se_Deplacer(100,90);
// je regarde le tableau de bord
echo $maPorsche->getMessage(). '<br />'  ;

// je roule 1000km à 200km/h
$maPorsche->Se_Deplacer(1000,200);
// je regarde le tableau de bord
echo $maPorsche->getMessage(). '<br />'  ;

// je repeins ma Porsche
// NB : sans utilisation du retour de la fonction
// $maPorsche->Repeindre(); // pour test
$maPorsche->Repeindre('bleu profond'); 
// je regarde le tableau de bord
echo $maPorsche->getMessage() . '<br />' ;

$msg = "Niveau d'essence : ";
$msg .= $maPorsche->getNiveau_essence();
$msg .= 'l.<br />';
echo $msg;

// methode magique __toString()
//echo $maPorsche->__toString();
echo $maPorsche;

// exploration objet
var_dump($maPorsche);

// fin de page HTML
?>
</body>
</html>