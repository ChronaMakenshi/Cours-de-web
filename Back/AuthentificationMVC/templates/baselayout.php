<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <title><?= $title ?></title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery-3.4.1.js"></script>
    <script>
        $(document).ready(function() {
            var patternMail = /^[a-z0-9\-_.]+@[a-z0-9\-_.]+\.[a-z]{2,3}$/i;
           
            // Contrôle à la saisie de la validité de l'adresse email.
            $("#email").on("keyup", function() {
                if (!$(this).val().match(patternMail)) {
                    $(this).css({
                        backgroundColor: "#DE125C"
                    })
                } else {
                    $(this).css({
                        backgroundColor: "#22C718"
                    })
                }
            });

            // Obtenir à la saisie un nom utilisateur commençant par une majuscule et 
            // lettres minusules ensuite.
            $("#user").on("keyup", function(){
                $(this).val($(this).val().charAt(0).toUpperCase() + $(this).val().substr(1).toLowerCase());
            });


            // Disparition du BackgroudColor éventuel.
            $("#reset").on("click", function() {
                $("#email").css({
                    backgroundColor: ""
                });
            });

            // Sur la soumission du formulaire on vérifie que les champs du formulaire d'inscription
            // soient tous bien renseignés. Pour cela, dés qu'il manque au moins une valeur on bloque
            // la soumission du formulaire et on affiche le message d'erreur.
            $("#submit").on("click", function(e) {
               if($("#user").val().length ==0 || $("#pwd").val().length ==0 || $("#email").val().length==0||$("#fonction").val().length==0){
                e.preventDefault();
                var html="";
                html += "<span>Vous devez renseigner tous les champs !!!</span>";
                $("#perreur").empty();
                $("#perreur").append(html);  
               }else{
                   return true;
               }
            });

        });
    </script>
</head>

<body>
    <?= $content ?>
</body>

</html>