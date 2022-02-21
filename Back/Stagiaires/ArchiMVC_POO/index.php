<?php

require_once 'controller.php';

try {
    
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

                $nom = $_POST["nom"];
                $prenom = $_POST["prenom"];

                // Contrôle des données ici avant insertion dans la BDD

                ajout_stagiaire($nom, $prenom);
                
            }else{
                require "templates/ajouter_stagiaire.php";
            }

        }

        if($_GET["action"]=="modif"){
            
            if(isset($_GET["id"])){

                $stagiaire = obtenir_stagiaire($_GET["id"]);

                if(!empty($_POST["nom"])&&(!empty($_POST["prenom"]))){
    
                    $nom = $_POST["nom"];
                    $prenom = $_POST["prenom"];
                    $id = $_POST["cache"];

                    // Contrôle des données ici avant modification dans la BDD

                    modifie_stagiaire($nom, $prenom, $id);
                    
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
