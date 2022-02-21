<?php
require_once 'model/model.php';
$title = $titre_component;
ob_start();
if (isset($_GET['origine'])) {
    $action = "index.php?action=validation&origine=" . $_GET['origine'] . "&id=" . $client['idClient'];
} else {
    $action = "index.php?action=validation&origine=" . $_GET['action'] . "&id=" . $client['idClient'];
}
?>
<h1> <a class="btn btn-primary" data-toggle="collapse" href="index.php?action=liste" role="button" aria-expanded="false" aria-controls="collapseExample">
        Retour
    </a><img src="public/img/logo.png"></img><?= $titre_component ?></h1>
<form action="<?= $action ?>" method="POST">
    <table class="table table-dark table-striped table-bordered">

        <?php
        echo "<tr><td> ID Client </td>";
        echo "<td class='colid'> <input type='text' name='idClient' id='idClient' value='$client[idClient]' disabled> </td><td></td></tr>";
        echo "<tr><td> Raison sociale </th>";
        echo '<td class="colid"> <input type="text" name="raisonSociale" id="raisonSociale" value="'
            . $client["raisonSociale"] . '" > </td><td>' . $liste_erreur["raisonSociale"] . '</td></tr>';
        echo "<tr><td> Type client </th>";
        // echo "<td class='colid'> <input type='text' name='typeClient' id='typeClient' value='$client[typeClient]'> </td><td></td></tr>";
        echo "<td class='colid'><select name='typeClient' >";

        $connexion = connect_db();

        $sql = $connexion->prepare("SELECT distinct typeClient from clients order by natureClient");
        $sql->execute();
        while ($act = $sql->fetch(PDO::FETCH_BOTH)) {
            if ($act['typeClient'] === $client['typeClient']) {
                echo "<option value='$act[typeClient]' selected>$act[typeClient]</option>";
            } else {
                echo "<option value='$act[typeClient]'>$act[typeClient]</option>";
            }
        }
        echo "</select> </td><td></td></tr>";
        echo "<tr><td> Téléphone client </th>";
        echo "<td class='colid'> <input type='text' name='telephoneClient' id='telephoneClient' value='$client[telephoneClient]' > </td><td>$liste_erreur[telephoneClient]</td></tr>";
        echo "<tr><td> Adresse client </th>";
        echo "<td class='colid'> <input type='text' name='adresseClient' id='adresseClient' value='$client[adresseClient]' ></td><td>$liste_erreur[adresseClient]</td></tr>";
        echo "<tr><td> Ville client </td>";
        echo "<td class='colid'> <input type='text' name='villeClient' id='villeClient' value='$client[villeClient]'></td><td>$liste_erreur[villeClient]</td></tr>";
        echo "<tr><td> Code postal client </td>";
        echo "<td class='colid'> <input type='text' name='codePostalClient' id='codePostalClient' value='$client[codePostalClient]'></td><td>$liste_erreur[codePostalClient]</td></tr>";
        echo "<tr><td> Activité client  </td>";
        echo "<td class='colid'><select name='idSect' >";

        $connexion = connect_db();

        $sql = $connexion->prepare("SELECT distinct idSect, activite FROM secteuractivite order by activite");
        $sql->execute();
        while ($act = $sql->fetch(PDO::FETCH_BOTH)) {
            if ($act['idSect'] === $client['idSect']) {
                echo "<option value='$act[idSect]' selected>$act[activite]</option>";
            } else {
                echo "<option value='$act[idSect]'>$act[activite]</option>";
            }
        }
        echo "</select> </td><td></td></tr>";
        echo "<tr><td> Nature client  </td>";
        //echo "<td class='colid'> <input type='text' name='natureClient' id='natureClient' value='$client[natureClient]' > </td></tr>";
        echo "<td class='colid'><select name='natureClient' >";

        $connexion = connect_db();

        $sql = $connexion->prepare("SELECT distinct natureClient from clients order by natureClient");
        $sql->execute();
        while ($nature = $sql->fetch(PDO::FETCH_BOTH)) {
            if ($nature['natureClient'] === $client['natureClient']) {
                echo "<option value='$nature[natureClient]' selected>$nature[natureClient]</option>";
            } else {
                echo "<option value='$nature[natureClient]'>$nature[natureClient]</option>";
            }
        }
        echo "</select> </td><td></td></tr>";
        echo "<tr><td> CA</td>";
        echo "<td class='colid'> <input type='text' name='CA' id='CA' value='$client[CA]' > </td><td>$liste_erreur[CA]</td></tr>";
        echo "<tr><td> Effectif (€)</td>";
        echo "<td class='colid'> <input type='text' name='effectif' id='effectif' value='$client[effectif]' > </td><td>$liste_erreur[effectif]</td></tr>";
        echo "<tr><td> Commentaires commerciaux </td>";
        echo "<td class='colid'><textarea class='form-control' name='commentaireClient' rows='5' id='commentaireClient' value='$client[commentaireClient]' >$client[commentaireClient]</textarea>        
        </td><td></td></tr>";
        echo "<tr><td><button type='submit' class='btn btn-primary' name = 'validation'>Valider</button></td><td> <button type='reset' class='btn btn-primary'>Annuler</button></td><td></td></tr>";
        ?>
        </tr>
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
include "baselayout.php";
?>