<?php
$title = "Liste des Clients";
ob_start();
?>
<h1><img src="public/img/logo.png"> </img>Liste des Clients</h1>

<form action="" method="POST">
    <label for="site-search">Raison Sociale:</label>
    <input type="search" id="site-search" name="rch" aria-label="Search through site content">
    <button type="submit" name='rch_ent' class="btn btn-dark">Rechercher</button>
</form>
<?php
if (isset($_POST['rch_ent'])) {
    if (isset($_POST['rch']) and !empty($_POST['rch'])) {
        header("location: index.php?action=recherche&rch=" . $_POST['rch']);
    } else {
        header("location: index.php?action=liste");
    }
}
?>

<a href="index.php?action=ajout" id="ajout_cl">Ajouter un nouveau client</a>
<table class="table table-dark table-striped table-bordered">
    <tr>
        <th> ID Client </th>
        <th> Raison sociale </th>
        <th> Code postal client </th>
        <th> Ville client </th>
        <th> CA (€)</th>
        <th> Téléphone client </th>
        <th> Type client </th>
        <th> Nature client </th>
        <th> Supprimer client </th>
    </tr>
    <?php
    foreach ($clients as $client) {
        echo "<tr>";
        echo "<td class='colid'> $client[idClient] </td>";
        // echo "<td><a href=model/controle_modifier.php?id=$client[idClient]> $client[raisonSociale]</a> </td>";
        echo "<td><a href=index.php?action=modifier&id=$client[idClient]> $client[raisonSociale]</a> </td>";
        echo "<td> $client[adresseClient] </td>";
        echo "<td> $client[villeClient] </td>";
        echo "<td> $client[CA] </td>";
        echo "<td> $client[telephoneClient] </td>";
        echo "<td> $client[typeClient] </td>";
        echo "<td> $client[natureClient] </td>";
        // echo "<td class='colsuppr'><a href=model/controle_supprimer.php?id=$client[idClient]>Supprimer</a></td>";
        echo "<td class='colsuppr'><a href=index.php?action=suppr&id=$client[idClient]>Supprimer</a></td>";
    }
    ?>
    </tr>
</table>
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