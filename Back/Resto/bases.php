<?php
class MyTable extends PDO
{
  private $db = 'guide'; //nom de la base de données
  private $host = 'localhost'; // nom de la machine hôte
  private $user = 'root'; // nom de l'utilisateur
  private $pwd = '';// mot de passe 
  private $port = '3308';
  private $dsn;
  private $con;
  private $requete; // requête
  
  
  // Méthode qui permet de se connecter à la BDD Guide.
  public function __construct()
  {
  	try 
  	{
  		$this->dsn = "mysql:dbname=$this->db;host=$this->host;port=$this->port";
  		$this->con = new PDO($this->dsn, $this->user, $this->pwd, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));
  	}
  	catch (PDOException $e)
  	{
  		print 'Erreur ! : '.$e->getMessage().'<br/>';
  		echo 'N° : '.$e->getCode();
  		die();
  	}
  	return $this->con;
  }
  
  // Méthode qui permet d'exécuter une requête préparée par passage de la requête et passage d'un tableau associatif de type (nom champ du formulaire => valeur du champ )
  public function reqPrepare($requete, $tableau, $multiple)
  {
  	$statement = $this->con->prepare($requete);

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
  }

  // Méthode qui permet d'exécuter une requête SQL de sélection.
  public function reqSelection($requete)
  {
  	$result = $this->con->query($requete);
  	return $result;	
  }

  // Méthode qui permet d'afficher la liste comlpléte des Restaurants.
  public function rendre_html()
  {
  	$resultat = $this->reqSelection("select * from restaurant");

   // Le Formulaire a été soumis, on récupére la valeur du champ caché sup_id que l'on passe en paramétre de la fonction de suppression : suppression_enreg(sup_id)
  	if(!empty($_POST['sup_id']))
  		$this->suppression_enreg($_POST['sup_id']);

  	$m="<div class='container'>";
  	$m.="<div class='row'>";
  	$m.="<div class='table-responsive'>";
  	$m.="<form method='post' action='".$_SERVER['SCRIPT_NAME']."'>";
  	$m.="<input type='hidden' name='sup_id'>";
  	$m.="<table class='table table-bordered table-dark table-hover'>";
  	$m.="<caption>Liste des restaurants</caption>";
  	$m.="<tr><th>ID</th><th>Nom</th><th>Adresse</th><th>Prix €</th><th>Commentaires</th><th>Note</th><th>Visite</th><th>Suppression</th><th>Modification</th></tr>";

  	foreach ($resultat as $row)
  	{
    	// Préparation de la date pour l'affichage au format français:
  		//$date = new DateTime($row['visite']);
    	// Affichage de la date au format francophone:
  		//$visite = $date->format('d/m/Y');

  		$visite = $row['visite'];
  		$id = $row['id'];
  		$n = "sup_".$row['id'];
  		$nom = $row['nom'];

  		$m.="<tr>";
  		$m.="<td>".$row['id']."</td><td><a href=detail.php?id=".$row['id'].">".$row['nom']."</a></td><td>".$row['adresse']."</td><td>".$row['prix']."</td>";
  		$m.="<td>".$row['commentaires']."</td><td>".$row['note']."</td><td>".$visite."</td>";
  		$m.="<td><input type='button' name='$n' class='btn btn-sample' value='Supprimer' onclick='supprimer($id)'></td>";
  		$m.="<td><a href=detail.php?id=".$row['id']."&modif=1>Modifier</a></td>";
  		$m.="</tr>";

  	}
  	$m.="<span class='ajoutR'><a href='ajout.php'>Ajout d'un Resto</a></span><br><br>";
  	$m.="</table>";
  	$m.="</form>";
  	$m.="</div>";
  	$m.="</div>";
  	$m.="</div>";

  	return $m;

  }

  // Méthode qui permet d'afficher le détail des données sur un Restaurant, qui permet aussi l'affichage en mode Modification.
  public function detail_html($id)
  {

  	$resultat = $this->reqSelection("select * from restaurant where id=".$id);

  	if(isset($_GET['modif'])){
  		$modif =1;
  	}else{
  		$modif =0;
  	}
  	
  	$m="<div class='container'>";
  	$m.="<div class='row'>";
  	$m.="<form method='post' action='".$_SERVER['SCRIPT_NAME']."?id=".$id."&modif=1"."'>";
  	$m.="<div class='table-responsive'>";
  	$m.="<table class='table table-bordered table-dark table-hover'>";
  	$m.="<caption><a href='index.php'>Retour à la liste</a></caption>";

  	foreach ($resultat as $row)
  	{
    	// Préparation de la date pour l'affichage au format français:
  		//$date = new DateTime($row['visite']);
    	// Affichage de la date au format francophone:
  		//$visite = $date->format('d/m/Y');

  		$visite = $row['visite'];

  		if ($modif==1)
  		{
  			$m.="<div class='form-group'>";
  			$m.="<tr><td>";
  			$m.="<label for='nom'>Nom : </label>";
  			$m.="</td>";
  			$m.="<td>";
  			$m.="<input type='text' class='form-control' id='nom' name='nom' value='".$row['nom']."'>";
  			$m.="</td>";
  			$m.="</div>";
  		}else{

  			$m.="<div class='page-header'>";
  			$m.="<h2>".$row['nom']."</h2>";
  			$m.="</div>";
  		}

  		$m.="<tr>";
  		$m.="<div class='form-group'>";
  		$m.="<td>";
  		$m.="<label for='adresse'>Adresse : </label>";
  		$m.="</td>";

  		if ($modif==1)
  		{
  			$m.="<td>";
  			$m.="<input type='text' size='50' class='form-control' id='adresse' name='adresse' value='".$row['adresse']."'>";
  			$m.="</td>";

  		}else{
  			$m.="<td>".$row['adresse']."</td>";
  		}
  		$m.="</div>";
  		$m.="</tr>";
  		$m.="<tr>";
  		$m.="<div class='form-group'>";
  		$m.="<td>";
  		$m.="<label for='prix'>Prix : </label>";
  		$m.="</td>";

  		if ($modif==1)
  		{
  			$m.="<td>";
  			$m.="<input type='number' class='form-control' id='prix' name='prix' value='".$row['prix']."'>";
  			$m.="</td>";

  		}else{
  			$m.="<td>".$row['prix']."</td>";
  		}
  		$m.="</div>";
  		$m.="</tr>";
  		$m.="<tr>";
  		$m.="<div class='form-group'>";
  		$m.="<td>";
  		$m.="<label for='commentaires'>Commentaires : </label>";
  		$m.="</td>";

  		if ($modif==1)
  		{
  			$m.="<td>";
  			$m.="<textarea class='form-control' id='commentaires' rows='5' cols='33' name='commentaires' >".$row['commentaires']."</textarea>";
  			$m.="</td>";

  		}else{
  			$m.="<td>".$row['commentaires']."</td>";

  		}
  		$m.="</div>";
  		$m.="</tr>";

  		$m.="<tr>";
  		$m.="<div class='form-group'>";
  		$m.="<td>";
  		$m.="<label for='note'>Note : </label>";
  		$m.="</td>";

  		if ($modif==1)
  		{
  			$m.="<td>";
  			$m.="<input type='number' class='form-control' id='note' name='note' value='".$row['note']."'>";
  			$m.="</td>";

  		}else{
  			$m.="<td>".$row['note']."</td>";

  		}
  		$m.="</div>";
  		$m.="</tr>";

  		$m.="<tr>";
  		$m.="<div class='form-group'>";
  		$m.="<td>";
  		$m.="<label for='visite'>Date de la visite : </label>";
  		$m.="</td>";

  		if ($modif==1)
  		{
  			$m.="<td>";
  			$m.="<input type='text' class='form-control' id='visite' name='visite' value='".$visite."'>";
  			$m.="</td>";

  		}else{
  			$m.="<td>".$visite."</td>";

  		}
  		$m.="</div>";
  		$m.="</tr>";


  		$m.="<tr>";
  		$m.="<div class='form-group'>";

  		if ($modif==1)
  		{

  			$m.="<td><input type='submit' class='btn btn-sample center-block' id='submit' name='submit' value='Valider'></td>";
  			$m.="<td><input type='reset' class='btn btn-sample center-block' id='reset' name='reset' value='Annuler'></td>";	
  		}else{
  			
  		}

  		$m.="</div>";
  		$m.="</tr>";
  		
  	}
  	$m.="</table>";
  	$m.="</form>";
  	$m.="</div>";
  	$m.="</div>";
  	$m.="</div>";
  	return $m;

  }
  // Méthode qui permet d'afficher le formulaire vierge pour l'Ajout d'un Nouveau Restaurant.
  public function ajout_html()
  {

  	$m="<div class='container'>";
  	$m.="<div class='row'>";
  	$m.="<form method='post' action='".$_SERVER['SCRIPT_NAME']."'>";
  	$m.="<div class='table-responsive'>";
  	$m.="<table class='table table-bordered table-dark table-hover'>";
  	$m.="<caption><a href='index.php'>Retour à la liste</a></caption>";
  	$m.="<div class='form-group'>";
  	$m.="<tr><td>";
  	$m.="<label for='nom'>Nom : </label>";
  	$m.="</td>";
  	$m.="<td>";
  	$m.="<input type='text' class='form-control' id='nom' name='nom'>";
  	$m.="</td>";
  	$m.="</div>";
  	$m.="<tr>";
  	$m.="<div class='form-group'>";
  	$m.="<td>";
  	$m.="<label for='adresse'>Adresse : </label>";
  	$m.="</td>";
  	$m.="<td>";
  	$m.="<input type='text' size='50' class='form-control' id='adresse' name='adresse'>";
  	$m.="</td>";
  	$m.="</div>";
  	$m.="</tr>";
  	$m.="<tr>";
  	$m.="<div class='form-group'>";
  	$m.="<td>";
  	$m.="<label for='prix'>Prix : </label>";
  	$m.="</td>";
  	$m.="<td>";
  	$m.="<input type='number' class='form-control' id='prix' name='prix'>";
  	$m.="</td>";
  	$m.="</div>";
  	$m.="</tr>";
  	$m.="<tr>";
  	$m.="<div class='form-group'>";
  	$m.="<td>";
  	$m.="<label for='commentaires'>Commentaires : </label>";
  	$m.="</td>";
  	$m.="<td>";
  	$m.="<textarea class='form-control' id='commentaires' rows='5' cols='33' name='commentaires' ></textarea>";
  	$m.="</td>";
  	$m.="</div>";
  	$m.="</tr>";
  	$m.="<tr>";
  	$m.="<div class='form-group'>";
  	$m.="<td>";
  	$m.="<label for='note'>Note : </label>";
  	$m.="</td>";
  	$m.="<td>";
  	$m.="<input type='number' class='form-control' id='note' name='note'>";
  	$m.="</td>";
  	$m.="<tr>";
  	$m.="<div class='form-group'>";
  	$m.="<td>";
  	$m.="<label for='visite'>Date de la visite : </label>";
  	$m.="</td>";
  	$m.="<td>";
  	$m.="<input type='text' class='form-control' id='visite' name='visite'>";
  	$m.="</td>";
  	$m.="</div>";
  	$m.="</tr>";
  	$m.="</div>";
  	$m.="</tr>";
  	$m.="<tr>";
  	$m.="<div class='form-group'>";
  	$m.="<td><input type='submit' class='btn btn-sample center-block' id='submit' name='submit' value='Valider'></td>";
  	$m.="<td><input type='reset' class='btn btn-sample center-block' id='reset' name='reset' value='Annuler'></td>";
  	$m.="</div>";
  	$m.="</tr>";
  	$m.="</table>";
  	$m.="</form>";
  	$m.="</div>";
  	$m.="</div>";
  	$m.="</div>";

  	return $m;
  }

	// Méthode qui permet d'Ajouter un Resto à la Table Restaurant :
  public function ajout_enreg()
  {
  	$nom = $_POST["nom"];
  	$adresse = $_POST["adresse"];
  	$prix = $_POST["prix"];
  	$commentaires = $_POST["commentaires"];
  	$note = $_POST["note"];
  	$visite = $_POST["visite"];

  		// Constitution d'un tableau associatif constitué des noms des champs du formulaire et des valeurs associées :
  	$restaurant = array("nom"=>$nom, "adresse" =>$adresse, "prix" =>$prix, "commentaires" =>$commentaires, "note" => $note, "visite" =>$visite);

  		// Création de la requête préparée d'Ajout : 
  	$req = "INSERT INTO restaurant (nom, adresse, prix, commentaires, note, visite) VALUES (:nom, :adresse, :prix, :commentaires, :note, :visite)";

  	$resultat = $this->reqPrepare($req, $restaurant, false);
  	header("Location:index.php");

  }

  // Méthode qui permet de supprimer un Restaurant.
  public function suppression_enreg($id)
  {
  	$recup = $_SERVER['SCRIPT_NAME'];
  	$resultat = $this->reqSelection("delete from restaurant where id=".$id);
  	header("Location:$recup");
  }

  // Méthode qui permet de modifier les données d'un Restaurant.
  public function modification_enreg($id)
  {

  	$recup = $_SERVER['SCRIPT_NAME']."?id=".$id."&modif=1";

  	$nom = $_POST["nom"];
  	$adresse = $_POST["adresse"];
  	$prix = $_POST["prix"];
  	$commentaires = $_POST["commentaires"];
  	$note = $_POST["note"];
  	$visite = $_POST["visite"];

  		// Constitution d'un tableau associatif constitué des noms des champs du formulaire et des valeurs associées :
  	$restaurant = array("nom"=>$nom, "adresse" =>$adresse, "prix" =>$prix, "commentaires" =>$commentaires, "note" => $note, "visite" =>$visite, "id" => $id);

  		// Création de la requête préparée de modification : 
  	$req = "UPDATE restaurant SET nom = :nom, adresse = :adresse, prix = :prix, commentaires = :commentaires, note = :note, visite = :visite WHERE id= :id";

  	$resultat = $this->reqPrepare($req, $restaurant, false);
  	header("Location:$recup");

  }

}
?>