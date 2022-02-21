<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="css/style.css">
    <title>Liste Magasin</title>
</head>

<?php

require("connect.php");

// Connexion à la BDD
function connect_db()
{
    $dsn = "mysql:dbname=" . BASE . ";host=" . SERVER;
    try {
        $option = array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8');
        $connexion = new PDO($dsn, USER, PASSWD,$option);
    } catch (PDOException $e) {
        printf("Echec connexion : %s\n", $e->getMessage());
        exit();
    }
    return $connexion;
}

function reqPrepare($requete, $tableau, $multiple){
    
    $connexion = connect_db();
    
    $statement = $connexion->prepare($requete);
      
  	foreach($tableau as $key => $value)
  	{
  		if(is_int($value))
  			$dataType = PDO::PARAM_INT;
  		else if(is_bool($value))
  			$dataType = PDO::PARAM_BOOL;
  		else if(is_null($value))
  			$dataType = PDO::PARAM_NULL;
  		else
  			$dataType = PDO::PARAM_STR;

  		$statement->bindValue(':'.$key, $value, $dataType);
  	}

  	$statement->execute();

  	if($multiple)
  		$result = $statement->fetchAll(PDO::FETCH_OBJ);
  	else
  		$result = $statement->fetch(PDO::FETCH_OBJ);

  	$statement->closeCursor();
    return $result;
    $result->closeCursor();
      
}

// Méthode qui permet d'exécuter une requête SQL de sélection sans paramètres
function reqSelection($requete)
{
    $connexion = connect_db();
    $result =  $connexion->query($requete);
    return $result;
    $result->closeCursor();	
    
}


// Création de la liste des Stagiaires
function get_all_articles(){

    $resultat = reqSelection("select * from article");
    $articles = array();
    
    foreach ($resultat as $row) {
        $articles[] = $row;
    }
    return $articles;
}


?>
<body>
    <h1>Liste des Articles</h1>

    <?php

    $articles = get_all_articles();

    foreach($articles as $row){

        echo $row["designation"]."<br>";
    }
    ?>
</body>
</html>