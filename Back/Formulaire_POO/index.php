<?php

require('contact.class.php');


// Si le Formulaire a été soumis
if(!empty($_POST))
{
  //  extract($_POST) : Cette fonction PHP assigne automatiquement les valeurs du formulaire comme par exemple 
  //  $_POST["nom"] à la variable du même nom $nom ... c'est une écriture raccourcie de ce qui suit.
  
  //extract($_POST);

  $nom = $_POST["nom"];
  $prenom = $_POST["prenom"];
  $email = $_POST["email"];
  $message = $_POST["message"];

  // Opérateur Ternaire qui permet d'obtenir une écriture simplifiée pour le Test des conditions.
  $valid = (empty($nom) || empty($prenom) || empty($email) || !filter_var($email,FILTER_VALIDATE_EMAIL) || empty($message)) ? false : true;
  $erreurnom = (empty($nom)) ? 'Indiquez votre Nom' : null;
  $erreurprenom = (empty($prenom)) ? 'Indiquez votre Prénom' : null;
  $erreuremail = (empty($email) || !filter_var($email,FILTER_VALIDATE_EMAIL)) ? 'Indiquez une adresse Email valide' : null;
  $erreurmessage = (empty($message)) ? 'Indiquez votre Message' : null;
  
  if($valid)
  {
    $contact = new Contact();
    $contact->insertContact($nom,$prenom,$email,$message);
    $contact->sendEmail($email,$message);
    
    // La fonction unset() permet de détruire les variables et les objets
    unset($nom);
    unset($prenom);
    unset($email);
    unset($message);
    unset($contact);
    
    $success = 'Message envoyé';
  }

}

?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulaire de Contact - PHP-POO</title>
     <!-- Bootstrap CSS -->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<h1>Formulaire de Contact - PHP-POO</h1>
    <br><br>
    <div class="container">
        <?php if(isset($success)):?>
            <div class="success"><?php echo $success;?></div>
        <?php endif;?>
        <form method="POST" action="index.php">
            <div class="form-row">
                <div class="col-md-12 mb-3">
                    <label for="nom">Nom</label>
                    <span class="error"><?php if(isset($erreurnom)) echo $erreurnom;?></span>
                    <input type="text" class="form-control" id="nom" name="nom"  value="<?php if(isset($nom)) echo $nom;?>">
                   
                </div>
                <div class="col-md-12 mb-3">
                    <label for="prenom">Prénom</label>
                    <span class="error"><?php if(isset($erreurprenom)) echo $erreurprenom;?></span>
                    <input type="text" class="form-control" id="prenom" name="prenom"  value="<?php if(isset($prenom)) echo $prenom;?>">
                   
                </div>
                <div class="col-md-12 mb-3">
                    <label for="email">Email</label>
                    <span class="error"><?php if(isset($erreuremail)) echo $erreuremail;?></span>
                    <input type="text" class="form-control" id="email" name="email" value="<?php if(isset($email)) echo $email;?>">
                </div>
                <div class="col-md-12 mb-3">
                    <label for="message">Message</label>
                    <span class="error"><?php if(isset($erreurmessage)) echo $erreurmessage;?></span>
                    <textarea class="form-control" id="message" name="message"><?php if(isset($message)) echo $message;?></textarea>
                </div>
            </div>
            <button class="btn btn-light" type="reset" id="annuler">Annuler</button>
            <button class="btn btn-success" type="submit" id="submit">Envoyer</button>
        </form>
    </div> 
    
</body>
</html>