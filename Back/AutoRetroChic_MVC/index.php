<?php

require('Controleur/controleur.php');

try {
  if (isset($_GET['action'])) {
      
    switch ($_GET['action']) {          
        case 'voiture':
            if (isset($_GET['id'])) {
                $idVoiture = intval($_GET['id']);
                    if ($idVoiture != 0)
                        singleVoiture($idVoiture);
                    else
                    throw new Exception("Identifiant de voiture non valide");
            }
            else
                throw new Exception("Identifiant de voiture non défini");
            break;
        case 'constructeur':
            if (isset($_GET['id'])) {
                $idConstructeur = intval($_GET['id']);
                    if ($idConstructeur != 0)
                        singleConstructeur($idConstructeur);
                    else
                    throw new Exception("Identifiant de constructeur non valide");
            }
            else
                throw new Exception("Identifiant de constructeur non défini");
            break;
        case 'voitures':
            allVoitures();
            break;
        case 'constructeurs':
            allConstructeurs();
            break;
        default:
            throw new Exception("Action non valide");
    } //fin de switch
      
  } // fin de isset($_GET['action']
  else {
    accueil();  // action par défaut
  }
}catch (Exception $e) {
    erreur($e->getMessage());
}