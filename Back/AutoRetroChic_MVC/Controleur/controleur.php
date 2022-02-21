<?php

require 'Modele/modele.php';

// Affiche les 3 derniers modèles et 1 constructeur aléatoire
function accueil() {
  $voitures = getLastVoitures();
  $constructeur = getOneConstructeur();
  require 'Vue/vueAccueil.php';
}

// Affiche les détails sur un constructeur
function singleConstructeur($idConstructeur) {
  $constructeur = getConstructeur($idConstructeur);
  require 'Vue/vueConstructeur.php';
}

// Affiche les détails sur un modèle de voiture
function singleVoiture($idVoiture) {
  $voiture = getVoiture($idVoiture);
  require 'Vue/vueVoiture.php';
}

// Affiche tous les modèles de voiture
function allVoitures() {
  $voitures = getAllVoitures();
  require 'Vue/vueVoitures.php';
}

// Affiche tous les constructeurs
function allConstructeurs() {
  $constructeurs = getAllConstructeurs();
  require 'Vue/vueConstructeurs.php';
}

// Affiche une erreur
function erreur($msgErreur) {
  require 'Vue/vueErreur.php';
}

