<?php 
include "bdd.php";

if(isset($_POST['search'])){
    $search = $_POST['search'];

    $table 		= new TableAnnuaire();
	//$requete 	= "SELECT * FROM personne WHERE nom LIKE '%".$search."%'";
	$requete 	= "SELECT * FROM personne WHERE nom LIKE '".$search."%'";
	$resultat 	= $table->reqSelection($requete);

    while($row = $resultat->fetch(PDO::FETCH_ASSOC)){
        $response[] = array("value"=>$row['id'],"label"=>$row['nom']." ".$row['prenom'],"telephone"=>$row['telephone'], "email"=>$row['email'], "prenom"=>$row['prenom']);
    }
    echo json_encode($response);
}
exit;


