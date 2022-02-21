<?php
class MyTable extends PDO
{
  private $db = 'annuaire'; //nom de la base de données
  private $host = 'localhost'; // nom de la machine hôte
  private $user = 'root'; // nom de l'utilisateur
  private $pwd = '';// mot de passe 
  private $port ='3308';
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

}