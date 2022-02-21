<!doctype html>
<html lang="fr">

<head>
    <meta charset="UTF−8" />
    <title>Mot de Passe</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    
    <h1>Mot de Passe</h1>
    <form action="#" method="post">

        <label for="pwd">Mot de Passe</label>
        <input type="text" name="pwd" id="pwd" autocomplete="off">
        <br>
        <input type="submit" value="Envoyer">
    </form>
    <?php
        $pwd = isset($_POST["pwd"]) ? $_POST["pwd"] : "";
        if(!empty($pwd)){
            echo password_hash($pwd, PASSWORD_BCRYPT)."<br>";

            if(password_verify($pwd, password_hash($pwd, PASSWORD_BCRYPT))) {
                echo 'Vérification OK';
            } else {
                echo 'ERREUR';
            }
        }
    ?>

</body>

</html>