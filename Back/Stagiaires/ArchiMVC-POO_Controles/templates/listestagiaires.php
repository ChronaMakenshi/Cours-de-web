<?php
$title = "Liste des Stagiaires";
ob_start();
?>
<h1>Liste des Stagiaires</h1>
    <table class="montableau">
        <tr>
            <th> ID Membre </th>
            <th> Prénom Membre </th>
            <th> Nom Membre </th>
            <th> Suppression </th>
        </tr>
        <?php
            foreach($stagiaires as $stagiaire){
                echo "<tr>";
                echo "<td class='colid'>$stagiaire[id_membre]</td>";
                echo "<td> <a href=index.php?action=modif&id=$stagiaire[id_membre]>$stagiaire[login_membre]</a></td>";
                echo "<td> $stagiaire[nom_membre] </td>";
                echo "<td class='colsuppr'><a href=index.php?action=suppr&id=$stagiaire[id_membre]>Supprimer</a></td>";
            }  
        ?>
        </tr>
        <tr><td id='montd' colspan='4'><a href="index.php?action=add">Ajouter un Stagiaire</a></td></tr>
    </table>
    
<?php
$content = ob_get_clean();
include "baselayout.php";
?>