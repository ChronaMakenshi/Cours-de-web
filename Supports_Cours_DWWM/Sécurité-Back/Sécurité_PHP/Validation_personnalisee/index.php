<!doctype html>
<html lang="fr">
<head>
<meta charset="UTF−8"/>
<title>Post un Numero de Téléphone</title>
</head>
<body>
<h1>Tests de <code> filter_var</code> avec filtre <code>FILTER_CALLBACK</code></h1>

<?php
    function numeroTelephone($tel){

        if(preg_match("/^(0{1}[0-9]{1}([0-9]{2}){4})$/",$tel))
        {
            return $tel;
        }else{
            return false;
        }
    }
    
    $telephone="0678541957";
    echo "Numéro de Téléphone : ".$telephone."<br>";

    if(filter_var($telephone, FILTER_CALLBACK, array("options"=>"numeroTelephone"))!==false){
        echo"Numéro de téléphone valide.<br/>";
    }else{
        echo"Numéro de téléphone invalide.<br/>";
    }
?>
</body>
</html>