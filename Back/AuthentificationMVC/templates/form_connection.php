<?php
$title = "Connexion MVC";
ob_start();
?>
<h1>Connexion MVC</h1>
<?php if(isset($message)){ echo $message;} ?>
<form action="index.php?action=connect" id="formconnect" method="post">
    <table>
        <tr>
            <td id="tdcompte" colspan="2"><a href="index.php?action=create">Créer un compte</a></td>
        </tr>
        <tr>
            <td>Utilisateur : </td>
            <td><input type="text" id="user" name="user" autocomplete="off"></td>
        </tr>
        <tr>
            <td>Email : </td>
            <td><input type="text" id="email" name="email" autocomplete="off"></td>
        </tr>
        <tr>
            <td>Mot de passe : </td>
            <td><input type="password" name="pwd" autocomplete="off"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" id="submit" value="Valider"><input type="reset" id="reset" value="Annuler"></td>
        </tr>
       
    </table>
</form>

<?php
$content = ob_get_clean();
include "baselayout.php";
?>