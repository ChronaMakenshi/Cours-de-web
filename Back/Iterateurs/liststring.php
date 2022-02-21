<?php

// 1 - Ce code est très souvent utilisé pour implémenter une collection :
class ListString implements IteratorAggregate 
{

	public $items;

	// Définition du constructeur de cette classe :
	function __construct()
	{
		$this->items=array();
	}

	function addString($s)
	{
		$this->items[]=$s;
	}

	// 4 - Evidemment, la méthode getIterator() renvoie une nouvelle instance de ListSrtringIterator :
	function getIterator()
	{
		return new ListSrtringIterator($this);
	}


}

// 2 - Nous obtenons :
class ListSrtringIterator implements Iterator
{

	private $listString;
	
	// Définition du constructeur de cette classe :
	function __construct($listString)
	{
		$this->listString = $listString;
	}

	// 3 - Les méthodes à implémenter sont imposées par l'interface Iterator. 
	// Nous ajoutons aussi un champ $pos qui sert d'indicateur de position à l'instruction foreach :
	private $pos;

	// methode qui permet de placer l'iterateur sur le premier élément
	function rewind()
	{
		$this->pos=0;
	}
	// methode qui retourne la clé de l'élément courant
	function key()
	{
		return $this->pos;
	}
	// methode qui retourne l'élément courant
	function current()
	{
		return $this->listString->items[$this->pos];
	}
	// methode qui permet de passer à l'élément suivant
	function next()
	{
		$this->pos++;
	}
	// methode qui vérifie si la position courante est valide 
	function valid()
	{
		return $this->pos < count($this->listString->items);
		
	}

}
?>