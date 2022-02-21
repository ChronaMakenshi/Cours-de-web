<?php

// -----------
class Personne
// -----------
{
    private $nom, $prenom;
    private $refvoiture;

    public function __construct($monnom, $monprenom, $marefvoiture){
        $this->nom = $monnom; 
        $this->prenom = $monprenom;
        $this->refvoiture = $marefvoiture;
    }

    public function __set($item, $valeur) { $this->$item = $valeur; }
    public function __get($item) { return $this->$item; }
    
    public function getNom(){
		return $this->nom;
    }
    
    public function getRefVoiture(){
		return $this->refvoiture;
	}

    public function getPrenom(){
		return $this->prenom;
	}


    public function __toString(){
        $chaine = "";
        foreach($this as $valeur) $chaine .= $valeur . "-";
        return $chaine;
    }
}

?>