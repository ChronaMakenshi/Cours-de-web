<?php
session_start();

echo "Variable de Session : ".$_SESSION['ticket']."<br>";
echo "Variable de Cookie : ".$_COOKIE['ticket']."<br>";

if ($_COOKIE['ticket'] == $_SESSION['ticket'])
{
	$ticket = session_id().microtime().rand(0,9999999999);
	$ticket = hash('sha512', $ticket);
	$_COOKIE['ticket'] = $ticket;
    $_SESSION['ticket'] = $ticket;
    
    echo "<h1>Page 1</h1>";
    echo "Variable de Session : ".$_SESSION['ticket']."<br>";
    echo "Variable de Cookie : ".$_COOKIE['ticket'];

}else{
	// On détruit la session
	$_SESSION = array();
	session_destroy();
	header('location:index.php');
}
?>