<!doctype html>
<html lang="fr">

<head>
    <meta charset="UTF−8" />
    <title>Mon premier formulaire HTML</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <h1>Saisie d’un Employé</h1>
    <br><br>
    <form method="post" action="traitement.php">
        <p>
            <label for="nomEmploye">Nom</label>
            <input type="text" name="nom" id="nomEmploye" size="20" autocomplete="off"/>
        </p>
        <p>
            <label for="prenomEmploye">Prénom</label>
            <input type="text" name="prenom" id="prenomEmploye" size="20" autocomplete="off"/><br />
        </p>
        <p>

            <label for="telephone">Téléphone</label>
            <input type="text" name="telephone" id="telephone" size="15" autocomplete="off" /><br />
        </p>
        <p>
            <label for="email">e−mail</label>
            <input type="text" name="email" id="email" size="20" autocomplete="off"/><br />
        </p>
        <p>
            <label for="categorie">Catégorie </label>
            <select name="categorie">
                <option value="secretaire" selected="selected">Secrétaire</option>
                <option value="commercial">Commercial</option>
                <option value="technique">Technique</option>
                <option value="boss">The Big Boss</option>
            </select>
        </p>
        <p>
            <input type="submit" value="Envoyer"></input>
            <input type="reset" value="Annuler"></input>
        </p>
    </form>
</body>

</html>