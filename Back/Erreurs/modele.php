<?php

$messages=null;

function loadMessages(){

	global $messages;

	$messages = array();

	$path = $_SERVER["DOCUMENT_ROOT"].dirname($_SERVER["PHP_SELF"])."/messages.txt";
	//var_dump($path);

	// Test avec fichier message.txt sans s !!!
	// $path = $_SERVER["DOCUMENT_ROOT"].dirname($_SERVER["PHP_SELF"])."/message.txt";

	// 6 -Traitement de l'erreur si le fichier n'existe pas ...
	if (!file_exists($path)) {
		throw new Exception ("<span style='color:red'>Le fichier $path n'existe pas !!!</span>");
	}

	$txt = file_get_contents($path);
	$tab = explode("\n", $txt);
	foreach ($tab as $line) {
		$s = explode("=", $line);
		$messages[$s[0]]=$s[1];
	}
}

function getMessage($key){

	global $messages;
	try 
	{
		if ($messages == null)
			loadMessages();

		$msg=$messages[$key];
		//$msg="";
	
		if ($msg=="")
			throw new Exception("<span style='color:red'>Message inconnu: $key</span>");

		return "<span style='color:white'>".$msg."</span>";
	}
	catch (Exception $err)
	{
		echo $err->getMessage();
	}
	return "";
}

//loadMessages()

?>