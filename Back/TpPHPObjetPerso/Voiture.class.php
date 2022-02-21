<?php
/* 
classe Voiture 
écrit par Sacha RESTOUEIX - 08/2021
*/
class Voiture {
	
	private $immatriculation;
	private $couleur;
	private $poids;
	private $puissance;
	private $capacite_reservoir;
	private $niveau_essence;
	private $nombre_place;
	private $assure;
	private $message_tableau_bord;

	public function __construct($monimmat, $macouleur, $monpoids, $mapuissance, $macapacite_reservoir, $monnombre_place){

		$this->immatriculation = $monimmat;
		$this->couleur = $macouleur;
		$this->poids = $monpoids;
		$this->puissance = $mapuissance;
		$this->capacite_reservoir = $macapacite_reservoir;
		$this->nombre_place = $monnombre_place;

		$this->niveau_essence = 5.0;
		$this->message_tableau_bord = "Bienvenue à bord";
		$this->assure = false;

	}

	public function __set($item, $valeur) { $this->$item = $valeur; }
	public function __get($item) { return $this->$item; }

	public function getImmatriculation(){
		return $this->immatriculation;
	}

	public function getCouleur(){
		return $this->couleur;
	}

	public function getPoids(){
		return $this->poids;
	}

	public function getPuissance(){
		return $this->puissance;
	}

	public function getCapacite_reservoir(){
		return $this->capacite_reservoir;
	}

	public function getNombre_place(){
		return $this->nombre_place;
	}

	public function getMessage_tableau_bord(){
		return $this->message_tableau_bord;
	}

	public function getNiveau_essence(){
		return $this->niveau_essence;
	}


	public function setAssure($etre_assure){
		$this->assure = $etre_assure;
	}

	public function setMessage_tableau_bord($message){
		$this->message_tableau_bord = $message;
	}

	public function repeindre($macouleur){

		if(isset($macouleur)){
		
			if($this->couleur === $macouleur){
				$this->message_tableau_bord = "Merci pour ce rafraichissement !!!";
				return true;
			}else{
				$this->couleur = $macouleur;
				$this->message_tableau_bord = "Merci pour cette nouvelle couleur !!!";
				return false;
			}

		}

	}

	public function mettre_essence($quantite){

		if(($this->capacite_reservoir - $this->niveau_essence) > $quantite){

			$this->niveau_essence += $quantite;
			$this->message_tableau_bord = "Merci pour l'essence";

		}else{

			$this->message_tableau_bord = "Ca va déborder !!!";
		}

		return $this->niveau_essence;
	}

	// return : string
	public function __toString()
	{
		//return "Véhicule $this->immatriculation ; puissance $this->puissance cv ; couleur $this->couleur;";
		// chaîne formatée
		$msg = 'Véhicule %s ; puissance %d cv ; couleur %s.';
		return sprintf($msg , $this->immatriculation , $this->puissance , $this->couleur);
	}

}
?>