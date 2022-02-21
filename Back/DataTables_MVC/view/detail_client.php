<?php
require_once 'model/model.php';
$title = $titre_component;
ob_start();
if (isset($_GET['origine'])) {
    $action = "index.php?action=validation&origine=" . $_GET['origine'] . "&id=" . $client['id'];
} else {
    $action = "index.php?action=validation&origine=" . $_GET['action'] . "&id=" . $client['id'];
}
?>
<h1> <a class="btn btn-primary" data-toggle="collapse" href="index.php?action=liste" role="button" aria-expanded="false" aria-controls="collapseExample">
        Retour
    </a><?= $titre_component ?></h1>
<form action="<?= $action ?>" method="POST">
    <table class="table table-dark table-striped table-bordered">

        <?php
        echo "<tr hidden><td> ID Salarié </td>";
        echo "<td class='colid'> <input type='text' name='idClient' id='id' value='$client[id]' disabled> </td><td></td></tr>";
        echo "<tr><td> Nom salarié </th>";
        echo '<td class="colid"> <input type="text" name="nom" id="nom" value="'
            . $client["nom"] . '" > </td><td>' . $liste_erreur["nom"] . '</td></tr>';
        echo "<tr><td> Prénom salarié </th>";
        echo "<td class='colid'> <input type='text' name='prenom' id='telephone' value='$client[prenom]' > </td><td>$liste_erreur[prenom]</td></tr>";
        echo "<tr><td> Téléphone salarié </th>";
        echo "<td class='colid'> <input type='text' name='telephone' id='telephone' value='$client[telephone]' > </td><td>$liste_erreur[telephone]</td></tr>";
        echo "<tr><td> E-Mail salarié </th>";
        echo "<td class='colid'> <input type='text' name='email' id='email' value='$client[email]' ></td><td>$liste_erreur[email]</td></tr>";
        echo "<tr><td><button type='submit' class='btn btn-primary' name = 'validation'>Valider</button></td><td> <button type='reset' class='btn btn-primary'>Annuler</button></td><td></td></tr>";

        ?>
    </table>
</form>
<?php

$content = ob_get_clean();
ob_start();
?>
<div id="pied">
    <div>
        <h5><img src="public/img/logo.png"> </img>ABI.COM</h5>
    </div>
    <div>
        <h5>Qui sommes nous?</h5>
        <h6>Rejoignez nous</h6>
        <h6>Actualité</h6>
        <h6>Contact</h6>
    </div>
</div>
<?php
$pied_page = ob_get_clean();
include "view/baselayout.php";
?>