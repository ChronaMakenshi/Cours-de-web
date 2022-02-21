<?php
session_start();
// On génère quelque chose d'aléatoire
$ticket = session_id().microtime().rand(0,9999999999);
// On hash pour avoir un ID  qui aura toujours la même forme
$ticket = hash('sha512', $ticket);

echo "Variable de ticket : ".$ticket."<br>";
echo "Variable de Cookie : ".$_COOKIE['ticket']."<br><br>";

// On vérifie que le Navigateur du Client accepte les cookies
if(!isset($_COOKIE['ticket'])) {
    echo "<p>Le navigateur n'accepte pas les cookies</p>";
}

// On enregistre des deux cotés
setcookie('ticket', $ticket, time() + (60 * 20)); // Expire au bout de 20 min
$_SESSION['ticket'] = $ticket;

echo "<h1>Page Accueil</h1>";
echo "Variable de Cookie : ".$_COOKIE['ticket']."<br>";
// On affiche la variable de Session générée
echo "Variable de Session : ".$_SESSION['ticket']."<br>";


// On affiche un lien pour passer à la page suivante
echo "<br><a href='page1.php' >Page1</a>";
?>
