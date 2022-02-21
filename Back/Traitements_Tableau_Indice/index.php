<?php
//Tableau des adresses mail

$tab=array("php7@free.fr","sacha8@gmail.com","ariel3@wanadoo.fr",
"webmestre@wanadoo.fr","marcelduchamp9@gmail.com","picasso69@gmail.com",
"vangogh6@gmail.com","matis63@free.fr","degas45@wanadoo.fr");

//Récupération des noms de domaine
foreach($tab as $ind=>$val)
{
    $dom=explode("@",$val);
    $domaine[]=$dom[1];
}

// Compte du nombre d'occurences de chaque domaine, retourne un tableau associatif qui donne 
// le nombre d'occurences de chaque domaine.
$stat=array_count_values ($domaine);

echo '<pre>';
print_r( $stat);
echo '</pre>';


//Nombre total d'adresses
$total=count($tab);
//Ou encore
//$total=array_sum($stat);
//Calcul des pourcentages
foreach($stat as $fourn=>$nb) 
{
    $pourcent[$fourn]=($nb*100)/$total;
    //var_dump(round($pourcent[$fourn],2));
    echo "Fournisseur d'accès : $fourn =" .round($pourcent[$fourn],2)." % <br>";
    
}
?>