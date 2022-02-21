<?php
include_once "database.class.php";

class Stagiaire {

    // Création de la liste des Stagiaires
    public function get_all_stagiaires(){
        
        $pdo = Database::connect();
        $stagiaires = array();
        $sql = "SELECT * from membres";

        foreach ($pdo->query($sql) as $row) {
            $stagiaires[] = $row;
        }
        Database::disconnect();
        return $stagiaires;
    }

    // Suppression d'un Stagiaire par id
    public function delete_stagiaire_by_id($id){
        
        $pdo = Database::connect();
        $sql = "DELETE FROM membres WHERE id_membre = :id";
        $reponse = $pdo->prepare($sql);
        $reponse->bindValue(":id", intval($_GET["id"]), PDO::PARAM_INT);
        $reponse->execute();
        Database::disconnect();

    }

    public function ajouter_stagiaire($nom, $prenom){
        
        $pdo = Database::connect();
        $sql = "INSERT INTO membres(nom_membre, login_membre) VALUES (:nom, :prenom)";
        $reponse = $pdo->prepare($sql);
        $reponse->bindParam(':nom', $nom);
        $reponse->bindParam(':prenom', $prenom);
        $reponse->execute();
        Database::disconnect();

    }

    public function modifier_stagiaire($nom, $prenom, $id){
        
        $pdo = Database::connect();
        $sql = "UPDATE membres SET nom_membre = :nom , login_membre = :prenom WHERE id_membre = :id";
        $reponse = $pdo->prepare($sql);
        $reponse->bindParam(':nom', $nom);
        $reponse->bindParam(':prenom', $prenom);
        $reponse->bindParam(':id', $id, PDO::PARAM_INT);
        $reponse->execute();
        Database::disconnect();

    }

    public function get_stagiaire_by_id($id){
        
        $pdo = Database::connect();
        $sql = "SELECT * from membres WHERE id_membre = :id";
        $reponse = $pdo->prepare($sql);
        $reponse->bindParam(':id', $id, PDO::PARAM_INT);
        $reponse->execute();
        Database::disconnect();
        return $reponse->fetch();
    }

}