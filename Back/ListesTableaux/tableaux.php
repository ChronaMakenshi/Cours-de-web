<?php

// 1 - Echange de deux variables sans variable auxiliaire.

$a = 10;
$b = "abc";

//$a = $b;

// $temp = $a;
// $a = $b;
// $b = $temp;

// echo '<br> Valeur dans $a = '.$a .'<br>';
// echo '<br> Valeur dans $b = '.$b .'<br>';


list ($a, $b) = array($b,$a);

echo '<br> Nouvelle Valeur dans $a = '.$a .'<br>';
echo '<br> Nouvelle Valeur dans $b = '.$b .'<br>';


// list ($a, $b) = array($b,$a);

// echo "a=$a, b=$b<br>";





 // 2 - Déclarer un tableau

$pays = array('France','Allemagne', 'Angleterre');

//$pays = ["France","Allemagne", "Angleterre"];

for($i=0; $i<count($pays); $i++){

	echo $pays[$i]."<br>";

}

echo "Boucle foreach : "."<br>";
foreach ($pays as $valeur){
	echo $valeur.'<br>';
}


// 3 - Affichage

echo var_dump($pays)."<br>";

echo 'On a count($pays) = '.count($pays).'<br>';

// 4 - Parcourir le tableau avec un for
echo "Boucle for : "."<br>";
for ($i=0; $i < count($pays); $i++) { 
	echo $pays[$i] ." "."<br>";
	
}
echo "<hr>";
// 5 - Parcourir le tableau avec une boucle foreach

echo "Boucle foreach : "."<br>";
foreach ($pays as $valeur){
	echo $valeur.'<br>';
}

// 6 - Si le tableau est vide, la boucle do sera parcourue au moins une fois. Il n'est pas aisé de tester la validité de la clef :

$pays = array();

do {
	$c = key($pays);
	$p = current($pays);
	echo $p. " - ";
}while (next($pays));

reset($pays);
echo "<br>";

// 7 - Les Capitales associées aux pays

// $pays['Paris'] = "France";
// $pays['Berlin'] = "Allemagne";
// $pays['Londres'] = "Angleterre";


$pays = array(
	"Paris" => "France",
	"Berlin" => "Allemagne",
	"Londre" => "Angleterre"
);

echo '<strong>'.$pays["Berlin"].'</strong><br>';



// 8 - Combien vaut cette fois count($pays)

echo 'On a count($pays) = '.count($pays).'<br>';

echo "<pre>";
print_r($pays);
echo "</pre>";

foreach($pays as $item => $valeur){

	echo "La clef ".$item. " => ".$valeur."<br>";
}




// 9 - Nous obtenons 3, autant dire que le parcours avec la boucle for ne convient plus. Aucune valeur n'est définie pour les index 4, 5 et 6

//echo count($pays);

// for ($i=0; $i < count($pays)-3; $i++) { 
// 	echo $pays[$i] ." "."<br>";
	
// }

foreach ($pays as $item => $valeur){
	
	echo'<pre>';
	echo $valeur.' '.$item;
	echo'</pre>';

}

// 10 - Un parcours complet avec vérification du type de la clé nous tire d'affaire. Affichage avec un while de chaque capitale.

// while (list($c,$p) = each($pays))
// 	if (is_string($c))
// 		echo $p. " " .$c ."<br>";

// reset($pays);

// 11 - Avec untilisation d'une fonction

function enumerer ($t)	{

	foreach ($t as $item => $valeur){
		echo $valeur.'=>'.$item.'<br>';
	}
return;
}

echo enumerer($pays);

echo "Parcourir le tableau associatif avec boucle foreach : <br>";

foreach ($pays as $key => $value) {
    echo "{$key} => {$value} <br>";
    
}
print_r($pays);

echo "<br>";
echo "<hr>";
// 12 - La fonction ajouter() peut s'écrire :



function ajouter ($t)	{

	$t["capitale"] = "pays";
	foreach ($t as $item => $valeur){
		echo $valeur.'=>'.$item.'<br>';
	}

return;
}

echo "<br>";

echo ajouter($pays);

echo "<br>";

// 12 - la fonction ajouter($t) reçoit une copie du tableau $pays. 
// Ainsi c'est cette copie du Tableau $pays qui est modifiée. 
// Le Tableau initial n'est pas modifié !!!

var_dump($pays);

?>