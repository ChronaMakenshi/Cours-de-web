<?php
include_once "database.class.php";

class Contact {

    private $nom;
    private $prenom;
    private $email;
    private $message;
    

    // Méthode statique qui supprime les espaces en début et fin de chaîne, les antislashes, convertit les
    // caractères spéciaux en entités HTML 
    public static function test_input($data) {
      $data = trim($data);
      $data = stripslashes($data);
      $data = htmlspecialchars($data);
      return $data;
    }

    public function insertContact($nom,$prenom,$email,$message)
    {
      
      $this->nom          = self::test_input($nom);
      $this->prenom       = self::test_input($prenom);
      $this->email        = self::test_input($email);
      $this->message      = self::test_input($message);
      
      $pdo = Database::connect();
      $sql = "INSERT INTO contact(nom, prenom, email, message) VALUES (:nom, :prenom, :email, :message_contact)";
      $reponse = $pdo->prepare($sql);

      $reponse->bindParam(':nom', $this->nom);
      $reponse->bindParam(':prenom', $this->prenom);
      $reponse->bindParam(':email', $this->email);
      $reponse->bindParam(':message_contact', $this->message);
      
      $reponse->execute();
      Database::disconnect();

    } 
    
}