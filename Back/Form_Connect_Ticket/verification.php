<?php
session_start();  

require("database.class.php");

if(isset($_POST["login"]) && isset($_POST["pwd"])){

    $login = htmlspecialchars(trim($_POST["login"]));
    $pwd = htmlspecialchars(trim($_POST["pwd"]));

    $role = Database::recuperer_role($login, $pwd);
    Database::disconnect();

    if($role == null){
        header('location:login.php'); 
    }else{

        // Suivant le rôle (Admin, Editeur, Lecteur) on créer une variable de Session qui 
        // renseignera tout au long de la session sur le droit ou non en écriture de l'utilisateur.
        switch ($role['libelle_role']) {
            case "Admin":
                $_SESSION["permission_edit"] = 1;
                break;
            case "Editeur":
                $_SESSION["permission_edit"] = 1;
                break;
            case "Lecteur":
                $_SESSION["permission_edit"] = 0;
                break;
        }
  
    }

    $resultat = Database::verifier_utilisateur($login, $pwd);
    Database::disconnect();

    if($resultat == null){
        header('location:login.php'); 
    }else{
        // On génère un ticket aléatoire 
        $ticket = session_id().microtime().rand(0,9999999999); 
        // On hash pour avoir un ID qui aura toujours la même forme 
        $ticket = hash('sha512', $ticket); 
        // On initialise des deux cotés : un COOKIE de ticket côté client et une SESSION de ticket côté serveur. 
        setcookie('ticket', $ticket, time() + (60 * 20)); // Expire au bout de 20 min 
        $_SESSION['ticket'] = $ticket;
        // On enregistre le login utilisateur en variable de session
        $_SESSION["login"] = $resultat['login'];
        header('location:liste_articles.php'); 
        
    }

}
