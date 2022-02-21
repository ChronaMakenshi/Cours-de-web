<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulaire en Ajax</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <h1>Traitement d'un Formulaire de Contact en AJAX - PHP</h1>
    <br><br>
    <div class="container">
        <div class="success"></div>
        <form id="monformulaire">
            <div class="form-row">
                <div class="col-md-12 mb-3">
                    <label for="nom">Nom</label>
                    <span class="errornom"></span>
                    <input type="text" class="form-control" id="nom" name="nom" value="<?php if (isset($nom)) echo $nom; ?>">

                </div>
                <div class="col-md-12 mb-3">
                    <label for="prenom">Prénom</label>
                    <input type="text" class="form-control" id="prenom" name="prenom" value="<?php if (isset($prenom)) echo $prenom; ?>">

                </div>
                <div class="col-md-12 mb-3">
                    <label for="email">Email</label>
                    <span class="erroremail"></span>
                    <input type="text" class="form-control" id="email" name="email" value="<?php if (isset($email)) echo $email; ?>">
                </div>
                <div class="col-md-12 mb-3">
                    <label for="message">Message</label>
                    <span class="errormessage"></span>
                    <textarea class="form-control" id="message" name="message"><?php if (isset($message)) echo $message; ?></textarea>
                </div>
            </div>
            <button class="btn btn-light" type="reset" id="annuler">Annuler</button>
            <button class="btn btn-success" type="submit" id="submit">Envoyer</button>
        </form>
    </div>

    <script src="js/jquery.min.js"></script>
    <script>
        $(document).ready(function() {

            $("#annuler").on("click", function() {

                $(".success").html("");
                $(".errornom").html("");
                $(".erroremail").html("");
                $(".errormessage").html("");

            });


            $("#submit").on("click", function(e) {

                if (($("#nom").val().length === 0) || ($("#email").val().length === 0) || ($("#message").val().length === 0)) {

                    e.preventDefault();

                    if ($("#nom").val().length === 0) {

                        $(".errornom").html("Veuillez saisir votre Nom");

                    } else {
                        $(".errornom").html("");
                    }

                    if ($("#email").val().length === 0) {

                        $(".erroremail").html("Veuillez saisir votre adresse Email");

                    } else {
                        $(".erroremail").html("");
                    }

                    if ($("#message").val().length === 0) {

                        $(".errormessage").html("Veuillez saisir votre Message");

                    } else {
                        $(".errormessage").html("");
                    }

                } else {

                    $(".success").html("");
                    $(".errornom").html("");
                    $(".erroremail").html("");
                    $(".errormessage").html("");

                    $.ajax({

                        url: "traitement.php",
                        type: "POST",
                        data: $("#monformulaire").serialize(),
                        dataType: "JSON",

                        success: function(json) {

                            console.log(json);

                            if (json.reponse == "Ok") {
                                $(".success").html("Données insérées avec succés !!!");
                            }

                        }
                    });


                }

                e.preventDefault();
            });
        });
    </script>
</body>

</html>