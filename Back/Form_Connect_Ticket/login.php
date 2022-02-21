<!DOCTYPE html>
<html lang="fr">
    <head>
       <meta charset="utf-8">
        <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
        <title>Authentification - Magasin</title>
    </head>
    <body>
        <div id="container">
            <form action="verification.php" method="POST">
                <h1>Connexion au Magasin</h1>
                <label><b>Login utilisateur</b></label>
                <input type="text" placeholder="Entrer le login d'utilisateur" name="login" autocomplete="off">

                <label><b>Mot de passe</b></label>
                <input type="password" placeholder="Entrer le mot de passe" name="pwd" autocomplete="off">

                <input type="submit" id='submit' value='LOGIN' >
            </form>
        </div>
    </body>
</html>