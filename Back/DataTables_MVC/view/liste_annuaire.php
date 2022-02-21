<?php
$title = "DataTable et Pagination";
ob_start();
?>
<h1>DataTable et Pagination</h1>



<table class="table table-dark  table-bordered table-striped " id='table_id'>
    <thead>
        <tr>
            <th hidden></th>
            <th> Nom salarié </th>
            <th> Email </th>
            <th> Téléphone </th>
            <th> Email</th>
            <th> </th>
            <th hidden></th>
        </tr>
    </thead>
    <tbody>
        <?php
        foreach ($clients as $client) {
            echo "<tr class='ligne'>";
            echo "<td hidden id = 'id'> $client[id] </td>";
            echo "<td id = 'nom'><a href=index.php?action=modifier&id=$client[id]> $client[nom]</a> </td>";
            echo "<td id = 'prenom'> $client[prenom] </td>";
            echo "<td> $client[telephone] </td>";
            echo "<td> $client[email] </td>";
            echo "<td class='colsuppr'><button type='button' class='btn btn-warning' id='suppr'>Supprimer</button></td>";
            echo "<td class='colid' id='id_client' hidden> $client[id] </td></tr>";
        }
        ?>

    </tbody>
</table>

<a href="index.php?action=ajout" id="ajout_cl">Ajouter un Salarié</a>
<?php
$content = ob_get_clean();

include "view/baselayout.php";
?>