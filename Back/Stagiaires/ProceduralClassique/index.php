<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Liste des Stagiaires</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- <link href="https://fonts.googleapis.com/css?family=Monoton&display=swap" rel="stylesheet"> -->
    <link rel="stylesheet" href="css/style.css">
    <script>
    </script>
</head>
<body>
    <?php
    // Connexion à la BDD
    try {
        $option = array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8');
        $connexion = new PDO('mysql:host=localhost:3308;dbname=formation;charset=utf8;', 'root', '', $option);
    } catch (exception $e) {
        die('Erreur ' . $e->getMessage());
    }

    //Utilisation d'une requête SQL non préparée.
    $sql = "SELECT * FROM membres";
    $resultat = $connexion->query($sql);

    ?>
    <h1>Liste des Membres</h1>
    <table class="montableau">
        <tr>
            <th> ID Membre </th>
            <th> Prénom Membre </th>
            <th> Nom Membre </th>
            <th> Suppression </th>
        </tr>
        <?php
            while ($data = $resultat->fetch()) {
                echo "<tr>";
                echo "<td class='colid'> $data[id_membre] </td>";
                echo "<td><a href=modifier.php?id=$data[id_membre]> $data[login_membre] </a></td>";
                echo "<td> $data[nom_membre] </td>";
                echo "<td class='colsuppr'><a href=supprimer.php?id=$data[id_membre]>Supprimer</a></td>";
                echo "</tr>";
            }
            $resultat->closeCursor();
        ?>
        <tr><td id= "montdajout" colspan=4><a href="ajouter.php">Ajouter un Stagiaire</a></td></tr>
    </table>
</body>
</html>