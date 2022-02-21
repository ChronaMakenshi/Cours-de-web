<?php

class CSession
{
	public $message;

	public function init()
	{
		session_start();
		global $session;

		if ($session == null)
		{
			$session = new CSession();
			$_SESSION["session"]=$session;
		}
	}

}

$composant = new CSession();
$composant->init();

?>