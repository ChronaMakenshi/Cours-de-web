<?php
$title = "Modifier un Stagiaire";
ob_start();
?>
<h1>Modifier un Stagiaire</h1>
<br>
<form action="index.php?action=modif&id=<?=$stagiaire['id_membre']; ?>" method="POST" id="formadd">
    <table class="table table-dark">
        <tr>
            <td><label for="prenom">Prénom</label></td>
            <td><input type="text" name="prenom" value="<?php if(!empty($_POST["prenom"])){echo $_POST["prenom"];}else{echo $stagiaire["login_membre"];}?>" autocomplete="off"></td>
            <td class="tderreur"><?php if(!empty($erreurs["prenom"])){echo $erreurs["prenom"];}?></td>
            <input type="hidden" name="cache" value="<?=$stagiaire["id_membre"]; ?>">
        </tr>
        <tr>
            <td><label for="nom">Nom</label></td>
            <td><input type="text" name="nom" value="<?php if(!empty($_POST["nom"])){echo $_POST["nom"];}else{echo $stagiaire["nom_membre"];}?>" autocomplete="off"></td>
            <td class="tderreur"><?php if(!empty($erreurs["nom"])){echo $erreurs["nom"];}?></td>
        </tr>
        <tr>
            <td><input type="submit" id="submit" value="Envoyer"></td>
            <td><input type="reset" value="Annuler"></td>
            <td class="tderreur"></td>
        </tr>
    </table>
</form>
<?php
$content = ob_get_clean();
include "baselayout.php";
?>