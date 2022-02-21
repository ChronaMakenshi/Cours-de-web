<?php

class Database {

    private static $dbName = 'magasin1' ;
    private static $dbHost = 'localhost:3308' ;
    private static $dbUsername = 'root';
    private static $dbUserPassword = '';
    private static $connexion = null;
     
    public function __construct() { 
         die("Fonction d'initialisation pas permise !!!");        
    }
     
    
    public static function connect() { 
        if ( null == self::$connexion ) { 
            try { 
                self::$connexion = new PDO( "mysql:host=".self::$dbHost.";"."dbname=".self::$dbName, self::$dbUsername, self::$dbUserPassword, array(PDO::ATTR_ERRMODE=> PDO::ERRMODE_EXCEPTION
                ));  
            } 
            catch(PDOException $e) { 
                 die($e->getMessage()); 
            }
       } 
       return self::$connexion;
    }
     
    public static function disconnect()
    {
        self::$connexion = null;
    }

    public static function verifier_utilisateur($login,$pwd){
        $dbo = self::connect();
        $requete = "SELECT * FROM utilisateur WHERE login = :login AND pwd= :pwd";
        $stmt = $dbo->prepare($requete);
        $stmt->bindParam(':login', $login, PDO::PARAM_STR);
        $stmt->bindParam(':pwd', $pwd, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetch();
    }


    // Exécution de la requête SQL qui récupére les Articles directement dans le code PHP
    public static function liste_articles(){
        $dbo = self::connect();
        $requete = "SELECT * FROM article";
        $stmt = $dbo->prepare($requete);
        $stmt->execute();
        return $stmt->fetchAll();

    }

    // Exécution d'un Procédure Stockée depuis le code PHP
    public static function ps_liste_articles(){
        $dbo = self::connect();
        $stmt = $dbo->prepare("CALL ps_liste_articles()");
        $stmt->execute();
        return $stmt->fetchAll();
    }

    // Exécution d'un Procédure Stockée depuis le code PHP, avec un paramétre en IN et un autre en OUT
    public static function ps_rendement_categorie($categorie){

        $dbo = self::connect();
        $stmt = $dbo->prepare("CALL ps_rendement_categorie(:categorie, @rendement); SELECT @rendement;");
        $stmt->bindParam(':categorie', $categorie, PDO::PARAM_STR);
        $stmt->execute();
       
        return $stmt->fetch();
    }

    public static function recuperer_role($login,$pwd){

        $dbo = self::connect();
        $requete = "SELECT R.libelle_role FROM utilisateur AS U INNER JOIN role AS R ON R.role_id = U.role_id WHERE login = :login AND pwd= :pwd";
        $stmt = $dbo->prepare($requete);
        $stmt->bindParam(':login', $login, PDO::PARAM_STR);
        $stmt->bindParam(':pwd', $pwd, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetch();

    }
}
