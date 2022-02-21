<?php
/* programme principal utilisant la classe Voiture */
// fusion classe Voiture
require('Voiture.class.php');
require('Personne.class.php');

// début de page HTML
?>
<html>
<meta charset="utf-8" />
<head><title>Ma BMW</title></head>
<body>

<?php

$mabmw = new Voiture("123-CW-19","Noir",1200,11,80,4);
$mabmw->setAssure(true);

var_dump($mabmw);

$reponse = $mabmw->repeindre("Bleu");
if($reponse === true){
    $mabmw->setMessage_tableau_bord('Merci pour ce rafraichissement de ma peinture !!!');
    echo '<p>'.$mabmw->getMessage_tableau_bord().'</p><br>';
}else{
    $mabmw->setMessage_tableau_bord('Merci pour cette nouvelle couleur !!!');
    echo '<p>'.$mabmw->getMessage_tableau_bord().'<br></p><br>';
}

$mabmw->mettre_essence(90);
//echo $mabmw->getNiveau_essence();
echo $mabmw->getMessage_tableau_bord().'<br><br>';

// Grace au formatage obtenu grâce à la méthode magique __toString() 
echo $mabmw.'<br><br>';

//var_dump($mabmw);


$sacha = new Personne("RESTOUEIX", "Sacha", $mabmw);

echo "La voiture de <strong>". $sacha->getPrenom() . "</strong> a pour immatriculation : <strong>". $sacha->getRefVoiture()->getImmatriculation().'</strong>';

?>
</body>
</html>