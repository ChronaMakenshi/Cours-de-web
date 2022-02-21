<?php 
session_start(); 
require("database.class.php");
function permettre_edition($param){
    if($param == 1){ 
        $titre = "Admin";
    }else{
        $titre = "Lecteur";
    }
    return $titre;
}

if(!empty($_COOKIE['ticket'])&&!empty($_SESSION['ticket'])){
    
    if ($_COOKIE['ticket'] == $_SESSION['ticket']) { 
        $ticket = session_id().microtime().rand(0,9999999999); 
        $ticket = hash('sha512', $ticket); 
        $_COOKIE['ticket'] = $ticket; 
        $_SESSION['ticket'] = $ticket;
        
    }else{ 
        // On détruit la session 
        $_SESSION = array(); 
        // On détruit ainsi toutes les variables de session 
        session_destroy(); 
        header('location:login.php'); 
    }

}else{

    header('location:login.php');
}


?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Articles -- <?= $_SESSION["login"]." ". permettre_edition($_SESSION["permission_edit"]); ?></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
</head>
<body class="container">
<h1>Liste des Articles</h1><br><br>

<?php 
if($_SESSION["permission_edit"] == 1){ 
  echo "<a href='#' id='lienajout'>Ajouter un Article</a>";  
}
?>
<table class="matable table table-bordered table-striped table-dark">
    <tr>
        <th> ID Article </th>
        <th> Désignation </th>
        <th> Prix Unitaire (€)</th>
        <th> Catégorie </th>
        <th> Quantité Vendue</th>
        <?php if($_SESSION["permission_edit"] == 1){ ?>
        <th> Modifier</th>
        <th> Supprimer </th>
        <?php } ?>
    </tr>
    <?php

    // Invocation de la méthode static de la Classe Database qui déclenche l'appel à une PS.
    $resultat = Database::ps_liste_articles();
    Database::disconnect();

    foreach($resultat as $ligne){
        echo "<tr>";
        echo "<td> $ligne[id_article]</td>";
        echo "<td> $ligne[designation]</td>";
        echo "<td> $ligne[prix]</td>";
        echo "<td><a class=share-label name=$ligne[id_article] id=$ligne[categorie] data-tooltip=''>$ligne[categorie]</a></td>";
        echo "<td> $ligne[Quantite_articles_commandes]</td>";

        if($_SESSION["permission_edit"] == 1){
            echo "<td><a class=monBtnModif id=".$ligne["id_article"]." href=''>Modification</a></td>";
            echo "<td><a class=monBtnSuppr id=".$ligne["id_article"]." href=''>Suppression</a></td>";   
        }    
    }
    ?>
</table>
<?php 

?> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js" integrity="sha512-n/4gHW3atM3QqRcbCn6ewmpxcLAHGaDjpEBu4xZd47N0W2oQ+6q7oc3PXstrJYXcbNU1OHdQ1T7pAP+gi5Yu8g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
$(document).ready(function(){

    $(".share-label").on("mouseover",function(e){

        var name = $(this).attr('name');
        var id = e.target.id;
       
        $.ajax({
                url:'rendement_cat.php',
                type:'POST',
                data:{id:id},
                success: function(response){
                    console.log(response);
                    $("a[name="+name+"]").attr("data-tooltip", "Gain pour la catégorie "+id+" : "+response);
                }
        });

    });

});

</script>
</body>
</html>