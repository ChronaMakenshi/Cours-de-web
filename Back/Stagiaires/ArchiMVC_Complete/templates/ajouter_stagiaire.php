<?php
$title = "Ajouter un Stagiaire";
ob_start();
?>
<h1>Ajout d'un Stagiaire</h1>
<form action= "index.php?action=add" method="POST" id="monform">
    <label for="prenom">Prénom</label><input type="text" name="prenom" autocomplete="off"><br>
    <label for="nom">Nom</label><input type="text" name="nom" autocomplete="off"><br><br><br>

    <input type="submit" id="submit" value="Envoyer">
    <input type="reset" value="Annuler">
</form>
<?php
$content = ob_get_clean();
include "baselayout.php";
?>