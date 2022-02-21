<?php
require_once 'controller/controller.php';


if (!isset($_GET["action"])) {

    connexion();
} else if (isset($_GET["action"])) {
    if ($_GET["action"] == "liste") { // Ajout d'une société
        liste_clients();
    } else if ($_GET["action"] == "soumettre") { // Ajout d'une société
        soumettre_form();
    } else if ($_GET["action"] == "recherche") { // Recherche d'une société
        if (isset($_GET["rch"])) {
            recherche_client($_GET["rch"]);
        } else {
            echo "Aucun identifiant de client envoyé";
        }
    } else if ($_GET["action"] == "ajout") { // Ajout d'une société
        ajout_client();
    } else if ($_GET["action"] == "modifier") { // Modification d'une société
        if (isset($_GET["id"])) {
            modifier_client($_GET["id"]);
        } else {
            echo "Aucun identifiant de client envoyé";
        }
    } else  if ($_GET["action"] == "suppr") { // Suppression d'une société
        if (isset($_GET["id"])) {
            supprimer_client($_GET["id"]);
        } else {
            echo "Aucun identifiant de client envoyé";
        }
    } else  if ($_GET["action"] == "validation") { // Validation formulaire
        if (erreur_formulaire() == 1) {
            validation_formulaire($_GET["origine"]);
        } else {
            if ($_GET["origine"] == "ajout") {
                add_client();
            } else if ($_GET["origine"] == "modifier") {
                update_client($_GET["id"]);
            }

            liste_clients();
        }
    }
} else {
    header('Status: 404 Not Found');
    echo '<html><body><h1>Page Non trouvée !!!</h1></body></html>';
}
