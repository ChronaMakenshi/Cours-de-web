<?php
$title = "Bienvenue sur BAI.com";
ob_start();
?>
<h1><img src="public/img/logo.png"> </img>Bienvenue sur ABI.com</h1>

<form action="index.php?action=soumettre" method="post" id="affichage_connexion">
    <h3>
        Connexion
    </h3>
    <div id="msg_erreur">
        <?= $message_erreur ?>
    </div>

    <div>
        <label> Pseudo: </label>
        <input type="text" name="pseudo" value="" required />
    </div>

    <div>
        <label> Mot de passe: </label>
        <input type="password" name="mdp" value="" required />
    </div>
    <div>
        <button type='submit' class='btn btn-dark' name='validation'>Valider</button>
        <button type='reset' class='btn btn-dark'>Annuler</button>
    </div>
</form>

<?php
$content = ob_get_clean();
ob_start();

$pied_page = '';
include "baselayout.php";
?>