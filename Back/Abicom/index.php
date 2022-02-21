<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABICOM - Liste Clients</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/style.css">
   
</head>

<body>
    <?php
    require("connect.php");

    // Connexion à la BDD
    $dsn = "mysql:dbname=" . BASE . ";host=" . SERVER . "charset=utf8";
    try {
        $option = array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8');
        $connexion = new PDO($dsn, USER, PASSWD, $option);
    } catch (PDOException $e) {
        printf("Echec connexion : %s\n", $e->getMessage());
        exit();
    }


    if (!empty($_POST)){
        $req = "SELECT * FROM clients WHERE raisonSociale like :raisonsociale";
        $nomClient = $_POST["NomClient"];	
    }else{
        $req = 	"SELECT * FROM clients";
        $nomClient = "";	
    }
    
    $reponse = $connexion->prepare($req);
    $reponse->bindValue(":raisonsociale", "%$nomClient%", PDO::PARAM_STR);
    $reponse->execute();

    ?>
    
    <h1><img id="abilogo" src="img/logo.png" alt="ABICOM" />Liste des Clients </h1>
    <div class="container">  
        <fieldset id="monfieldset">
            <form class="form-horizontal" role="form" action="index.php" method="post" name="formRech">
                <div class="form-group">
                    <label for="NomClient" control-label>Raison Sociale : </label>
                    <input type="texte" id="NomClient" name="NomClient" placeholder="Veuillez saisir le nom du client">
                    <input id="connect" class="btn btn-dark" type="submit" value="Rechercher"/>
                </div>
            </form>
            <a id="nouveauClient" href="ajout_client.php">Ajouter un Nouveau Client</a>
        </fieldset>  
        <table class="matable table table-bordered table-striped table-dark">
            <tr>
                <th> ID Client </th>
                <th> Raison Sociale </th>
                <th> Code Postal Client </th>
                <th> Ville Client </th>
                <th> CA (€)</th>
                <th> Téléphone Client </th>
                <th> Type Client </th>
                <th> Nature Client </th>
                <th> Supprimer un Client </th>
            </tr>
            <?php
                // On affiche le resultat dans un tableau, la méthode fetch() de PDO te permet de passer d'un enregistrement au suivant. (c'est une forme de curseur finalement)
                while ($donnees = $reponse->fetch()) {
                    //On affiche les données dans le tableau
                    echo "<tr>";
                    echo "<td> $donnees[idClient] </td>";
                    // Je passe en paramétre au script modification_client.php le paramétre idClient, ce sera la première chose à récupérer en GET sur le script cible modification_client.php !!!
                    echo "<td><a href=modification_client.php?idClient=" . $donnees["idClient"] . ">" . htmlspecialchars($donnees["raisonSociale"]) . "</a></td>";
                    echo "<td> $donnees[codePostalClient]</td>";
                    echo "<td> $donnees[villeClient]</td>";
                    echo "<td> $donnees[CA]</td>";
                    echo "<td> $donnees[telephoneClient]</td>";
                    echo "<td> $donnees[typeClient]</td>";
                    echo "<td> $donnees[natureClient]</td>";
                    echo "<td><a class=monBtnSuppr id=".$donnees["idClient"]."_".$donnees["raisonSociale"]." href=''>Suppression de ce Client</a></td>";
                    echo "</tr>";
                }
                $reponse->closeCursor();
            ?>
        </table>
        <footer>
		<section id="bottombar">
			<article>
				<h2><img id="logofooter" src="img/logo.png" alt="ABICOM" />ABI.COM</h2>	
			</article>
			<article>
				<h2>Qui sommes-nous ?</h2>
				<ul>
                    <li>Rejoignez-nous</li>
                    <li>Actualité</li>
                    <li>Contact</li>
				</ul>
			</article>
		</section>
        </footer>
    </div>
    <script>
        window.addEventListener("load", function(){
            let abilogo = document.getElementById("abilogo");

            abilogo.addEventListener("click", function(){
                document.location.assign('index.php');
            });

            let btnSuppr = document.getElementsByClassName("monBtnSuppr");

            for(let i=0; i< btnSuppr.length; i++){

                btnSuppr[i].addEventListener("click", function(e){

                    let paramRecup = e.target.id;
                    let paramid = paramRecup.split("_")[0];
                    let paramraisonsociale = paramRecup.split("_")[1];

                    if(confirm("Vous êtes certain de vouloir supprimer le Client : " +paramraisonsociale+ " ?"))
                    {
                        window.location.href = "suppression_client.php?idClient="+paramid;
                    }else{
                        return false;
                    }
                   
                    

                });

            }
            
        });
    </script>
</body>

</html>