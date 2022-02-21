<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Données Saisies</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <?php
    echo "<h1>Données reçues</h1>\n";
    echo "<p>\n";
    echo "nom: " . $nom . "<br/>\n";
    echo "prenom: " . $prenom . "<br/>\n";
    echo "Téléphone: " . $telephone . "<br/>\n";
    echo "E−mail: " . $email . "<br/>\n";
    echo "Catégorie: " . $categorie . "<br/>\n";
    echo "</p>\n";
    echo"<p><a href='index.php'>Retour</a></p>";
    ?>
</body>
</html>