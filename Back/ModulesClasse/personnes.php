<?php

// 1 - PHP est un langage faiblement typé, le mot clé var sert à déclarer une variable sans avoir à lui affecter 
// une valeur, il n'est utilisable que dans une classe.
class Personne {

	public $nom;
	public $email;

	// Question 4
	function __construct()
	{
		
		$this->nom = "sans nom";
		$this->email = "sans email";
	}

	// Question 6
	function afficher() {

		echo $this->nom." ".$this->email."\n";
		
	}
}

// 2 - L'opérateur new sert à réserver de la place mémoire pour les champs du nouvel objet $p1

$p1 = new Personne();

$p1->nom="Jean";
$p1->email = "jean@ailleurs.net";

// 3 - Le var_dump ne sert qu'à la mise au point. L'instruction echo est bien plus appropriée pour afficher 
// les valeurs des champs d'un objet.

echo "Affichage en utilisant directement l'objet : <br><br>".$p1->nom . " <br>". $p1->email ."\n<hr>";

echo "Affichage en utilisant <b>var_dump : </b>";
echo var_dump ($p1) ."\n";

// 4 - Le mot clé this est essentiel. Il permet d'atteindre les champs de l'objet pour lesquels on applique 
// la méthode. Des variables locales aux méthodes seraient affectées à la place des champs si le mot 
// clé this n'existait pas. La portée n'est pas non plus globale. 
// Il s'agit justement de la portée dans une classe.

// 5 - Nous constatons que le constructeur est appelé à l'occasion de l'application 
// de l'opérateur new. La présence des parenthéses rappelle ce mécanisme.

$p2 = new Personne();
echo var_dump($p2)."\n";

// 6 - Nous commençons par la déclaration de la méthode afficher() à l'intérieur de la classe. 
// Il faut remarquer l'emploi de l'opérateur de résolution de portée $this-> comme dans 
// le constructeur Personne.

$p1->afficher();

$p2->afficher();

// 7 - Le mot clé extends signifie que Employe est-une Personne. Autrement dit, Employe spécialise Personne, 
// en étendant ses définitions. Employe est une Personne un peu particulière. En l'occurence, 
// c'est la présence du badge qui est discriminante.

class Employe extends Personne {

	var $badge;
	// Question 8
	function __construct()
	{
		parent::__construct();
		$this->badge="numéro de badge inconnu";
	}

	// Question 10
	function afficher() {
		// Si on veut malgré tout avoir aussi accés à la méthode afficher de la classe Personne, 
		// on doit faire appel à la méthode en invoquant l'appel statique de afficher() 
		// de la classe Personne à l'aide de l'opérateur de résolution de portée (::). 
		
		parent::afficher();

		echo "<br>".$this->nom." ".$this->email." ". $this->badge."\n";
		
	}

}

// 8 - L'appel en cascade des constructeurs est primordial pour la cohésion de la programmation. 
// Le constructeur de Personne faisait très bien son travail d'initialisation des champs nom et email. 
// Pourquoi réécrire cette initialisation dans Employe alors qu'il est si facile d'appeler Personne() ?

// 9 - Nous vérifions que la classe Employe hérite des membres (champs et méthodes) déclarés dans la classe 
// Personne. Bien entendu, le champ badge n'est pas affiché puisque la méthode Personne->afficher() 
// n'en a pas connaissance.
$e1 = new Employe;
$e1->afficher();

// 10 - La ligne consacrée à l'application de cette méthode à $e1 ne change pas.L'interprète invoque 
// la version la plus proche, celle de Employe qui occulte celle de Personne. Le badge apparaît enfin. 
// La réécriture d'une méthode fournie par une classe ancestrale s'appelle la surcharge.
?>