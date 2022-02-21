<?php

require_once 'controller.php';

// Fonction qui supprime les espaces en début et fin de chaîne, les antislashes, convertit les
// caractères spéciaux en entités HTML 
function test_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

$erreurs = array();

try {
    //$_GET["action"] = null;
    if (!isset($_GET["action"])) {
        
        liste_stagiaires();


    }else if(isset($_GET["action"])){
        
        if($_GET["action"]=="suppr"){
        
            if(isset($_GET["id"])){
                supprimer_stagiaire($_GET["id"]);
            }else{
                
                throw new Exception("<span style='color:red'>Aucun identifiant de stagiaire envoyé</span>");
            }
        }

        if($_GET["action"]=="add"){
            if(!empty($_POST["nom"])&&(!empty($_POST["prenom"]))){

                $nom    =   test_input($_POST["nom"]);
                $prenom =   test_input($_POST["prenom"]);

                // Contrôle des données ici avant insertion dans la BDD
                // Filtre qui n'accepte qu'un ensemble de chaînes de caractères éventuellement séparées par des - ou des espaces
                // ou les deux
                $pattern_str_insert = '#^[A-Za-z- ]+$#';
                if(!preg_match($pattern_str_insert, $nom)){

                    $erreurs["nom"] = "Veuillez saisir un nom valide."; 
                }
                if(!preg_match($pattern_str_insert, $prenom)){

                    $erreurs["prenom"] = "Veuillez saisir un prénom valide."; 
                }

                // Insertion dans la BDD si pas d'erreurs
                if(empty($erreurs)){

                    ajout_stagiaire($nom, $prenom);

                }else{

                    require "templates/ajouter_stagiaire.php";
                }
     
            }else{
                require "templates/ajouter_stagiaire.php";
            }

        }

        if($_GET["action"]=="modif"){
            
            if(isset($_GET["id"])){

                $stagiaire = obtenir_stagiaire($_GET["id"]);

                if(!empty($_POST["nom"])&&(!empty($_POST["prenom"]))){
    
                    $nom    =   test_input($_POST["nom"]);
                    $prenom =   test_input($_POST["prenom"]);
                    $id     =   test_input($_POST["cache"]);
    
                    // Contrôle des données ici avant insertion dans la BDD
                    // Filtre qui n'accepte qu'un ensemble de chaînes de caractères éventuellement séparées par des - ou des espaces
                    // ou les deux
                    $pattern_str_insert = '#^[A-Za-z- ]+$#';
                    if(!preg_match($pattern_str_insert, $nom)){
    
                        $erreurs["nom"] = "Veuillez saisir un nom valide."; 
                    }
                    if(!preg_match($pattern_str_insert, $prenom)){
    
                        $erreurs["prenom"] = "Veuillez saisir un prénom valide."; 
                    }

                     // Insertion dans la BDD si pas d'erreurs
                    if(empty($erreurs)){

                        modifie_stagiaire($nom, $prenom, $id);

                    }else{

                        require "templates/modifier_stagiaire.php";
                    }
    
                }else{
                    
                    require "templates/modifier_stagiaire.php";
                }

            }
            
        }

    } else {
        
        throw new Exception("<h1>Page non trouvée !!!</h1>");

    }

}catch(Exception $e){

    $msgErreur = $e->getMessage();
    echo erreur($msgErreur);
}
