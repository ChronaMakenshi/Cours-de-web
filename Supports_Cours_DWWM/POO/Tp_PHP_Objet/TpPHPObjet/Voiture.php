<?php
/* 
classe Voiture 
écrit par B. Hézard - 03/16
*/
class Voiture {
	/* attributs privés */
	private $immatriculation; // string
	private $couleur ; // string
	private $poids ; // int
	private $puissance ; // int
	private $capacite_reservoir ; // float
	private $niveau_essence; // float
	private $nombre_places ; // int
	private $assure ; // bool
	private $message ; // string

	/* contructeur */
	public function __construct($uneImmat, $uneCouleur, $unPoids, 
	$unePuissance, $uneCapacite, $unNbre_places)
	{
		// initialisation paramètres reçus
		$this->immatriculation = $uneImmat;
		$this->couleur = $uneCouleur;
		$this->poids = $unPoids;
		$this->puissance = $unePuissance;
		$this->capacite_reservoir = (float)$uneCapacite;
		$this->nombre_places = $unNbre_places;
		// initialisation autres attributs
		$this->niveau_essence = 5.0; // la voiture est livrée avec 5l en réservoir
		$this->assure = false;
		$this->message = 'Bonjour !';
	}
	/* getters */
	public function getImmatriculation()
	{
		return $this->immatriculation;
	}
	public function getCouleur()
	{
		return $this->couleur;
	}
	public function getPoids()
	{
		return $this->poids;      
	}
	public function getPuissance()
	{
		return $this->puissance;
	}
	public function getCapacite_reservoir()
	{
		return $this->capacite_reservoir;
	}
	public function getNiveau_essence()
	{
		return $this->niveau_essence;
	}
	public function getNombre_places()
	{
		return $this->nombre_places;
	}
	public function getMessage()
	{
		return $this->message;
	}
	
	/* setters */
	public function setAssure($unBoolAssure)
	{
		$this->assure = $unBoolAssure;
		if($unBoolAssure)
		{
			$this->message = 'Merci de m\'avoir assurée';
		}
		else
		{
			$this->message = 'Attention : je ne suis plus assurée !';
		}
	}

	
	/* services */
	// param : float
	// return : niveau_essence mis à jour (float)
	public function Mettre_essence($quantite){
		// test si quantité peut tenir dans réservoir
		if($quantite > ($this->capacite_reservoir - $this->niveau_essence))
			// erreur : ça va déborder !
			{
				$this->message = $quantite . 'l ! Tu vas mouiller tes chaussures ! J\'ai déjà ' ;
				$this->message .= $this->niveau_essence . ' l.';
			}
		else
			// augmenter le niveau d'essence
			{
				$this->niveau_essence += $quantite;
				$this->message = 'Merci pour le carburant ! J\'ai maintenant ' . $this->niveau_essence . ' l.';
			};
		// dans tous les cas fournir le niveau courant
		return $this->niveau_essence;
	}
	
	// param : string
	// return : true = OK ; false = erreur
	public function Repeindre($uneCouleur = null)
	{
		// contrôle paramètre recu
		if (!(isset($uneCouleur)))
		{
			$this->message = 'Erreur : j\'ai besoin de connaître la nouvelle couleur !';
		return false;
		};
		// message feed-back
		if($uneCouleur != $this->couleur)
		{ 
			$this->message = ucfirst($uneCouleur);
			$this->message .='!. Tu m\'as changé de couleur ! Je ne me reconnais plus...';}
		else
		{ $this->message = 'Merci de m\'avoir rafraîchi le teint !';}
		// modif couleur
		$this->couleur = $uneCouleur;
		return true;
	}
	
	// param : float et float
	// return : float
	private function consommer($uneDistance, $uneVitesse)
	{
		$conso = 0; // initialisation
		
		// calcul carburant consomme
		if ($uneVitesse < 50)
			{$conso = $uneDistance * 0.1;}
		elseif ($uneVitesse < 90)
			{$conso = $uneDistance * 0.05;}
		elseif ($uneVitesse < 130)
			{$conso = $uneDistance * 0.08;}
		else
			{$conso = $uneDistance * 0.12;};
		return $conso;
	}
	
	// param : float et float
	// return : rien
	public function Se_deplacer($uneDistance, $uneVitesse)
	{
		$conso = $this->consommer($uneDistance, $uneVitesse);
		//echo $conso ; // pour test
		// test carburant insuffisant
		if($conso > $this->niveau_essence)
		{
			$this->message = $uneDistance . 'km : Erreur : pas assez de carburant pour ce trajet !';
		}
		else // carburant suffisant
		{
			// MAJ niveau carburant
			$this->niveau_essence -= $conso;
			$this->message = $uneDistance . 'km : Tu as consommé ' . $conso . 'l.';
		}
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