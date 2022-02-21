<!DOCTYPE html>
<html>
<head>
	<title>Recevoir CV</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
<?php

include "bdd.php";

$nom = $_POST['nom'];
$email = $_POST['email'];
$emploi = $_POST['emploi'];


function reArrayFiles(&$file_post) {

    $file_ary = array();
    $file_count = count($file_post['name']);
    $file_keys = array_keys($file_post);

    for ($i=0; $i<$file_count; $i++) {
        foreach ($file_keys as $key) {
            $file_ary[$i][$key] = $file_post[$key][$i];
        }
    }

    return $file_ary;
}

if ($_FILES  && (!empty($_POST))) {
    
    $file_ary = reArrayFiles($_FILES['cv']);

    foreach ($file_ary as $file) {

    	// 3 - Affichage des paramétres du fichier reçu
    	$cv_name = $file['name'];
    	$cv_size = $file['size'];
    	$cv_type = $file['type'];
    	$cv_tmp = $file['tmp_name'];

    }
}

if (is_uploaded_file($cv_tmp)) {
	//echo "File ". $cv_name ." téléchargé avec succès.\n";
	//echo "Affichage du contenu\n";
	
    // Vérifier que l'utilisateur upload bien un fichier PDF.
    if( !strstr($cv_type, 'pdf'))
    {
        exit("<br><br><br><div style='color:red'>Le fichier n'est pas une fichier PDF !!!</div>");
    }

	$fichier =file_get_contents($cv_tmp);
    
} else {
	echo "Attaque possible par téléchargement de fichier : ";
	echo "Nom du fichier : '". $cv_tmp . "'.";
}

// 5 - Insertion des données et gestion de la Date du jour pour la rendre compatible avec les attentes de MySQL

if (!empty($_POST['nom']) && !empty($_POST['email']) && $_FILES) {

    $table 		= new MyTable();
    $personne = array("nom"=>$nom, "email" =>$email, "emploi" =>$emploi, "nom_fichier_cv" =>$cv_name, "cv" => $fichier, "cv_type" =>$cv_type, "jour" => date('y/m/d', time()));

    $requete 	= "INSERT INTO Personne(nom, email, emploi, nom_fichier_cv, cv, cv_type, jour) VALUES (:nom, :email, :emploi, :nom_fichier_cv, :cv, :cv_type, :jour)";

    $resultat = $table->reqPrepare($requete, $personne, false);

    header("Location:lister.php");
}

?>
</body>
</html>