<?php
// Afin d'éviter l'utilisation de balises HTML on peut construire notre vue HTML directement dans une variable $html qu'on fera afficher à la fin des traitements. Ici je n'utilise l'instruction echo qu'une seule fois à la fin du programme.

$html= "<!DOCTYPE html>";
$html.= "<html>";
$html.= "<head>";
$html.= "<title>Table de Multiplication</title>";

$html.="<meta http-equiv='Content-Type' content='text/html; charset=utf-8'/>";
$html.="<link href='css/bootstrap.css' rel='stylesheet'/>";
$html.="<link href='https://fonts.googleapis.com/css?family=Fredericka+the+Great' rel='stylesheet'>";
$html.=	"<link rel='stylesheet' href='css/style.css'/>";

$html.= "</head>";
$html.= "<body>";
$html.= "<h2>Une table de multiplication</h2>";
$html.= "<table border='1' width='90%' class='table table-bordered table-dark'>";

for ($i=1; $i<=10; $i++) {

	$html .= "<tr ";

	if ($i==1) {

		$html .=" bgcolor='#F50EB6' align='center' ";
	}
	$html .= ">";
	for($j=1; $j<=10; $j++) {

		$html .= "<td align='center'";

		if($j==1) {

			$html .= " bgcolor='#F50EB6' ";
		}

		$html .=  ">";
		$html .=  $i*$j;
		$html .=  "</td>";
	}
	$html .=  "</tr>";	
}
$html .=  "</table>";
$html .=  "</body>";
$html .=  "</html>";

echo $html;
?>