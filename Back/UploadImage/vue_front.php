<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>rendu sur Front</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="container">
        <h1>Rendu sur le Front</h1>
        <br><br>
        <?php
        // Connexion à la base de données
        try {
            $bdd = new PDO('mysql:host=localhost:3308;dbname=annonce;charset=utf8', 'root', '');
        } catch (Exception $e) {
            die('Erreur : ' . $e->getMessage());
        }

        if(isset($_GET["id"])){
            $idAnnonce = $_GET["id"];
            // On recupere l'enregistrement dans la Table annonces
            $req = "SELECT * FROM annonces WHERE id_annonce= :idAnnonce";

            $reponse = $bdd->prepare($req);
            $reponse->bindValue(":idAnnonce", $idAnnonce, PDO::PARAM_INT);
            $reponse->execute();
            $donnees = $reponse->fetch();
        }
        
        ?>

        <h2><?= $donnees["titre"]?></h2>
        <br>

        <img class="left" width="150px" src="<?= ".\img\\".$donnees['nom_image']?>" alt="<?= $donnees['nom_image']?>">

        <span><?= $donnees['message']?></span>
        <div class="clear"></div>
</div> 
</body>


</html>