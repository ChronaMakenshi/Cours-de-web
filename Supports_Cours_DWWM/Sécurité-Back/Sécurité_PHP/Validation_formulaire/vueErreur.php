<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Données Erreur</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<?php
    echo"<h1>Données reçues incorrectes</h1>\n";
    echo"<ul>";
        foreach($dataErrors as $field => $message ){
            echo "<li>Problème avec l'attribut <code>".$field."</code><span style='color:red;'>".$message."</span></li>";
        }
    echo"</ul>";
    echo"<p>Merci de bien vouloir<a href='index.php'>  Essayer à nouveau</a></p>";
?>
    
</body>
</html>

