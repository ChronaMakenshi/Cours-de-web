<?php
$title = "Modifier un Stagiaire";
ob_start();
?>
<h1>Modifier un Stagiaire</h1>
<form action="index.php?action=modif&id=<?=$stagiaire['id_membre']?>" method="POST" id="monform">
    <label for="prenom">Prénom</label><input type="text" name="prenom" autocomplete="off" value="<?=$stagiaire["login_membre"] ?>"><br>
    <label for="nom">Nom</label><input type="text" name="nom" autocomplete="off" value="<?=$stagiaire["nom_membre"] ?>"><br><br><br>
    <input type="hidden" name="cache" value="<?=$stagiaire["id_membre"] ?>">
    <input type="submit" id="submit" value="Envoyer">
    <input type="reset" value="Annuler">
</form>
<?php
$content = ob_get_clean();
include "baselayout.php";
?>