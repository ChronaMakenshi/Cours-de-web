<?php
$title = "Ajouter un Utilisateur";
ob_start();
?>
<h1>Ajouter un Utilisateur</h1>
<form action="index.php?action=create" method="POST" id="monform">
    <p id="perreur"></p>
    <table>
        <tr>
            <td>Utilisateur : </td>
            <td><input type="text" id="user" name="user" value="<?php if(!empty($_POST["user"])){echo $_POST["user"];}?>" autocomplete="off"></td>
            <td class="erreurajout"><?php if(!empty($erreurs["user"])){echo $erreurs["user"];}?></td>
        </tr>
        <tr>
            <td>Mot de passe : </td>
            <td><input type="password" id="pwd" name="pwd" value="<?php if(!empty($_POST["pwd"])){echo $_POST["pwd"];}?>" autocomplete="off"></td>
            <td class="erreurajout"><?php if(!empty($erreurs["pwd"])){echo $erreurs["pwd"];}?></td>
        </tr>
        <tr>
            <td>Email : </td>
            <td><input type="text" id="email" name="email" value="<?php if(!empty($_POST["email"])){echo $_POST["email"];}?>" autocomplete="off"></td>
            <td class="erreurajout"><?php if(!empty($erreurs["email"])){echo $erreurs["email"];}?></td>
        </tr>
        <tr>
            <td>Fonction : </td>
            <td><input type="text" id="fonction" name="fonction" value="<?php if(!empty($_POST["fonction"])){echo $_POST["fonction"];}?>" autocomplete="off"></td>
            <td class="erreurajout"><?php if(!empty($erreurs["fonction"])){echo $erreurs["fonction"];}?></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" id="submit" name="submit" value="Enregistrer"><input type="reset" id="reset" value="Annuler"></td>
            <td></td> 
        </tr>
        <tr>
            <td><a href="index.php">Retour à l'accueil</a></td>
            <td></td>
            <td></td>
        </tr>
    </table>
</form>

<?php
$content = ob_get_clean();
include "baselayout.php";
?>