<?php
// Connexion à la base de données
try {
    $bdd = new PDO('mysql:host=localhost:3308;dbname=annonce;charset=utf8', 'root', '');
} catch (Exception $e) {
    die('Erreur : ' . $e->getMessage());
}

// Fonction qui vérifie qu'un enregistrement n'est pas déjà en Base. Si le retour est 1 on redirige vers index.php
// sinon on insert en BDD.
function verifier_doublon($titre, $message, $fichier, $connexion){

    $req = "SELECT * FROM annonces WHERE titre= :titre AND message= :message AND nom_image = :nom_image";

    $reponse = $connexion->prepare($req);
    $reponse->bindValue(":titre", $titre, PDO::PARAM_STR);
    $reponse->bindValue(":message", $message, PDO::PARAM_STR);
    $reponse->bindValue(":nom_image", $fichier, PDO::PARAM_STR);
    $reponse->execute();

    return $reponse->rowCount();

}


if (isset($_FILES['image'])) {

    $erreurs = array();

    $dossier = getcwd() . "\img\\";
    $fichier = basename($_FILES['image']['name']);

    $extensions = array('.png', '.gif', '.jpg', '.jpeg', '.JPG', '.JPEG', '.PNG', '.GIF');
    $extension = strrchr($_FILES['image']['name'], '.');

    if (!in_array($extension, $extensions))
    //Si l'extension n'est pas dans le tableau
    {
        $erreurs["image"] = 'Vous devez uploader un fichier de type png, gif, jpg ou jpeg...';
    } else {

        echo "Taille du fichier image : ".$_FILES['image']['size']." Octets<br>";

        if ($_FILES['image']['size'] > 3000000) {
            $erreurs["image"] = 'Votre fichier image est trop volumineux !';
        } else {

            if (move_uploaded_file($_FILES['image']['tmp_name'], $dossier . $fichier)) {
                echo 'Upload effectué avec succès !';

                // Si la fonction verifier_doublon() renvoie 1 on redirige sur la même page, les POST ont
                // donc disparu sinon on insert les données en BDD
                if(verifier_doublon($_POST['titre'], $_POST['message'], $fichier, $bdd) == 1){

                    header("location:index.php");

                }else{
                     // Insertion du message à l'aide d'une requête préparée
                    $req = $bdd->prepare('INSERT INTO annonces (titre, message, nom_image) VALUES(?, ?, ?)');
                    $req->execute(array($_POST['titre'], $_POST['message'], $fichier));

                }
 
            } else {
                echo 'Echec de l\'upload !';
            }
        }
    }
}

?>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Image</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <div class="container">
        <h1>Upload d'une image vers le Serveur</h1>
        <br><br>
        <form action="index.php" method="post" enctype="multipart/form-data">
            <div class="form-row">
                <div class="col-md-12 mb-3">
                    <label for="titre">Titre de l'annonce</label>
                    <input type="text" class="form-control" id="titre" name="titre" value="<?php if (!empty($_POST["titre"])) {
                                                                                                echo $_POST["titre"];
                                                                                            } ?>">
                </div>

                <div class="col-md-12 mb-3">
                    <label for="message">Message de l'annonce</label>
                    <textarea class="form-control" name="message" id="message" rows="8"><?php if (!empty($_POST["message"])) {
                                                                                            echo $_POST["message"];
                                                                                        } ?></textarea>
                </div>
                <!-- value=1000000 exprimée en Octets, 1 000 000 Octets = 1 Mo -->
                <input type="hidden" name="MAX_FILE_SIZE" value="40000000" />

                <div class="col-md-12 mb-3">
                    <label for="image">Choisir une image</label>
                    <span class="erreur"><?php if (!empty($erreurs["image"])) {
                                                echo $erreurs["image"];
                                            } ?></span>
                    <input type="file" class="form-control" id="image" name="image">
                </div>

                <input class="btn btn-warning" type="submit" value="Ajouter" />
                <?php if (isset($_FILES['image'])) {
                    if (empty($erreurs["image"])) {
                        // récupération de l'id de l'annonce insérée
                        $id = $bdd->lastInsertId();

                ?>
                        <a href="vue_front.php?id=<?= $id ?>">Rendu sur le Front</a>
                <?php
                    }
                } ?>
            </div>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous">
    </script>
</body>

</html>