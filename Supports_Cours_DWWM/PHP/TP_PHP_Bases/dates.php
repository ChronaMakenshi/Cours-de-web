<?php
echo "variable systeme \$_SERVER : \n";
var_dump($_SERVER);

$cejour = getdate();
echo "variable de type date retournée par getdate() : \n";
var_dump($cejour);

//echo $cejour['weekday'];

$cejourobjet = new DateTime();
echo "variable de type objet date  : \n";
var_dump($cejourobjet);
//echo $cejourobjet->timezone;
//echo $cejourobjet->getTimestamp();
//echo $cejourobjet['weekday'];
?>