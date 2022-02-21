<?php
include_once "database.class.php";

class Contact {

    private $nom;
    private $prenom;
    private $email;
    private $sujet;
    private $message;
    private $to;
    private $headers;

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
      $this->nom      = self::test_input($nom);
      $this->prenom   = self::test_input($prenom);
      $this->email    = self::test_input($email);
      $this->message  = self::test_input($message);
      
      $pdo = Database::connect();
      $sql = "INSERT INTO contact(nom, prenom, email, message) VALUES (:nom, :prenom, :email, :message)";
      $reponse = $pdo->prepare($sql);
      $reponse->bindParam(':nom', $nom);
      $reponse->bindParam(':prenom', $prenom);
      $reponse->bindParam(':email', $email);
      $reponse->bindParam(':message', $message);
      
      $reponse->execute();
      Database::disconnect();

    }
    
    public function sendEmail($email,$message)
    {
      $this->to       = 'sacha8milo@gmail.com';
      $this->email    = self::test_input($email);
      $this->sujet    = "ENVOI EMAIL DEPUIS FORMULAIRE DE CONTACT PHP-POO";
      $this->message  = self::test_input($message);
      
      $this->headers  = 'From:'.$this->email."\r\n";
      $this->headers  .= 'MIME-version: 1.0'."\r\n";
      $this->headers  .= 'Content-type: text/html; charset=utf-8'."\r\n";
      
      mail($this->to,$this->sujet,$this->message,$this->headers);
    }
    
}