
<!DOCTYPE html>
<html>
<head>
	<title>Ajouter un Salarié</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="css/bootstrap.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Fredericka+the+Great" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css"/> 
</head>
<?php

include "config.php";

function affiche_formulaire($nomErr, $prenomErr, $emailErr, $nom, $prenom, $telephone, $email){ ?>
    <body>
        <div class='MonTableau'>
            <h2>Ajouter un Salarié</h2>
            <form action="<?php echo htmlspecialchars($_SERVER["SCRIPT_NAME"]) ?>" method="POST">
                <table class='table table-bordered table-dark table-hover'>
                    <tr>
                        <td>Nom</td>
                        <td><input type='text' name='nom' value='<?php if(!empty($nom)) echo $nom;?>' autocomplete="off"><span class="error"><?php if(!empty($nomErr)) echo " * ".$nomErr;?></span></td>
                    </tr>
                    <tr>
                        <td>Prénom</td>
                        <td><input type='text' name='prenom' value='<?php if(!empty($prenom)) echo $prenom;?>' autocomplete="off"><span class="error"><?php if(!empty($prenomErr)) echo " * ".$prenomErr;?></span></td>
                    </tr>
                    <tr>
                        <td>Téléphone</td>
                        <td><input type='text' name='telephone' value='<?php if(!empty($telephone)) echo $telephone;?>' autocomplete="off"></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type='text' name='email' value='<?php if(!empty($email)) echo $email;?>' autocomplete="off"><span class="error"><?php if(!empty($emailErr)) echo " * ".$emailErr;?></span></td>
                    </tr>
                    <tr>
                        <td><input type='submit' name='valider' value='Validez'></td>
                        <td><input type='reset' name='annuler' value='Annuler'></td>
                    </tr>
                </table>
            </form>
        <a href="index.php">Retour à la liste</a>
        </div>	
    </body>
<?php }

if(!empty($_POST["valider"])){

    $nomErr = $prenomErr = $emailErr = 0;
    
    // Récupération des données issues du formulaire avec contrôle des données.
    function test_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }
    if (empty($_POST["nom"])) 
    {
        $nomErr = "Le Nom est requis !!!";
        $nom = "";
    }else{
        $nom = test_input($_POST["nom"]);
    }

    if (empty($_POST["prenom"])) 
    {
        $prenomErr = "Le Prénom est requis !!!";
        $prenom = "";
    }else{
        $prenom = test_input($_POST["prenom"]);
    }

    $telephone = test_input($_POST["telephone"]);

    $email = test_input($_POST["email"]);
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $emailErr = "Format d'adresse mail invalide !!!";
    }

    if((strlen($nomErr)!=0)||(strlen($prenomErr)!=0)||(strlen($emailErr)!=0)){

        echo affiche_formulaire($nomErr, $prenomErr, $emailErr, $nom, $prenom, $telephone, $email);

    }else{

        echo affiche_formulaire("","","","","","","");
    }

    // Insertion des données dans la BDD ...
    if(!empty($nom) && !empty($prenom) && !empty($email)){
        //Requête préparée d'insertion des données.
        $requete = "INSERT INTO personne(nom, prenom, telephone, email) VALUES (:nom, :prenom, :telephone, :email)";
        $stmt = $conn->prepare($requete);
        $stmt->bindParam(':nom', $nom);
        $stmt->bindParam(':prenom', $prenom);
        $stmt->bindParam(':telephone', $telephone);
        $stmt->bindParam(':email', $email);
        $stmt->execute();

        header("Location:index.php");
    }

}else{

    echo affiche_formulaire("","","","","","","");
}
?>
</html>