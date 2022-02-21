<?php
session_start();
require_once 'controller.php';

try {
    if(!isset($_GET["action"])) {
        
        form_connection();

    }else if(isset($_GET["action"])){
        
        if($_GET["action"]==="connect"){
            
            if(!empty($_POST["user"])&&!empty($_POST["email"])&&(!empty($_POST["pwd"]))){

                $pwd = $_POST["pwd"];
                $user = $_POST["user"];
                $email = $_POST["email"];
                $resultat = verifie_utilisateur($user, $email);
            
                if (password_verify( $pwd, $resultat["pwd_user"])) {
                    $_SESSION["id"] = $resultat["id_user"];
                    $_SESSION["login"] = $resultat["login_user"];
                    $_SESSION["fonction"] = $resultat["fonction"];
                    $_SESSION["email"] = $resultat["email_user"];
                    accueil(); 
                }else{
                    throw new Exception("Mauvais identifiants");
                   
                }
                
            }else{
                throw new Exception("Vous devez renseigner tous les champs du formulaire");
               
            }


        }

        if($_GET["action"]==="create"){

            $erreurs = array();
            $pattern_user_fonction = '/^[a-zA-ZáàâäãåçéèêëíìîïñóòôöõúùûüýÿæœÁÀÂÄÃÅÇÉÈÊËÍÌÎÏÑÓÒÔÖÕÚÙÛÜÝŸÆŒ._\s-]{3,30}$/';
            $pattern_pwd = "#^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).{6,}$#";

            function test_input($data) {
                $data = trim($data);
                $data = stripslashes($data);
                $data = htmlspecialchars($data);
                return $data;
            }
        
            if( isset($_POST["user"])&&isset($_POST["email"])&&isset($_POST["pwd"])&&isset($_POST["fonction"])){

                $user = test_input($_POST["user"]);
                $pwd = test_input($_POST["pwd"]);
                $email = test_input($_POST["email"]);
                $fonction = test_input($_POST["fonction"]);

                // Contrôle des données ici avant insertion dans la BDD
                if( !empty($user) && !empty($pwd) && !empty($email) && !empty($fonction)){
        
                    if(!preg_match($pattern_user_fonction, $user)||!preg_match($pattern_pwd, $pwd)||!filter_var($email, FILTER_VALIDATE_EMAIL)||!preg_match($pattern_user_fonction, $fonction)){
                    
                        if (!preg_match($pattern_user_fonction, $user))
                        {
                            $erreurs["user"] = "Veuillez entrer un nom d'utilisateur valide."; 
                        }
            
                        if (!preg_match($pattern_pwd, $pwd))
                        {
                            $erreurs["pwd"] = "Veuillez entrer un mot de passe valide."; 
                        }
            
                        if (!filter_var($email, FILTER_VALIDATE_EMAIL))
                        {
                            $erreurs["email"] = "Veuillez entrer une adresse email valide.";
                        }
            
                        if (!preg_match($pattern_user_fonction, $fonction))
                        {
                            $erreurs["fonction"] = "Veuillez entrer une fonction valide."; 
                        }
            
                        require "templates/ajouter_utilisateur.php";
            
                    }else{
            
                        // Encryptage du mot de passe avant insertion dans la Base de Données.
                        $pwd = password_hash($pwd, PASSWORD_BCRYPT);
                        // Ecrire une fonction qui contrôle l'absence de doublon avant l'insertion ...
                        if(!controle_doublon($email,$user)){

                            if (empty($erreurs)) {
                                ajoute_utilisateur($email,$user,$pwd,$fonction);
                            }
                            form_connection();

                        }else{
                            
                            throw new Exception("Identifiant et Mot de Passe déja utilisés !!!");
                        }
                        
                    }
                    
                }
      
            }else{
                $message = "Vous devez renseigner tous les champs du formulaire";
                require "templates/ajouter_utilisateur.php";
            }

        }


    } else {

        throw new Exception("<h1>Page non trouvée !!!</h1>");
    }
}catch(Exception $e){

    $msgErreur = $e->getMessage();
    echo erreur($msgErreur);
}

?>
