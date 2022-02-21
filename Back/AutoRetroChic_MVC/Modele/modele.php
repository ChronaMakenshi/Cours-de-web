<?php

// renvoie les 3 dernières voitures sur page accueil
function getLastVoitures(){
    $pdo = getBdd();
    $voitures = $pdo->query('SELECT id_voiture AS id, modele_voiture AS modele, img_voiture AS image FROM T_voiture ORDER BY id_voiture DESC LIMIT 3');
    return $voitures;
    $voitures->closeCursor();
    
}

// renvoie 1 constructeur automobile de manière aléatoire sur page accueil
function getOneConstructeur() {
    $pdo = getBdd();
    $constructeur = $pdo->query('SELECT id_construct AS id, nom_construct AS nom, logo_construct AS logo FROM T_Construct ORDER BY RAND() LIMIT 1');
    return $constructeur;
    $constructeur->closeCursor();
}

// Renvoie les informations sur une voiture
function getVoiture($idvoiture) {
  $pdo = getBdd();
  $voiture = $pdo->prepare('SELECT * FROM T_Voiture WHERE id_voiture=?');
  $voiture->execute(array($idvoiture));
  if ($voiture->rowCount() == 1)
    return $voiture->fetch();  // Accès à la première ligne de résultat
  else
   throw new Exception("Aucun modèle de voiture ne correspond à l'identifiant '$idvoiture'");
  $voiture->closeCursor();
}

// Renvoie les informations sur un constructeur
function getConstructeur($idconstructeur) {
  $pdo = getBdd();
  $constructeur = $pdo->prepare('SELECT * FROM T_Construct WHERE id_construct=?');
  $constructeur->execute(array($idconstructeur));
  if ($constructeur->rowCount() == 1)
    return $constructeur->fetch();  // Accès à la première ligne de résultat
  else
   throw new Exception("Aucun constructeur ne correspond à l'identifiant '$idconstructeur'");
  $constructeur->closeCursor();
}

// Renvoie tous les modèles de voiture
function getAllVoitures(){
    $pdo = getBdd();
    $voitures = $pdo->prepare('SELECT id_voiture AS id, modele_voiture AS modele, img_voiture AS img FROM T_Voiture');
    $voitures->execute();
    return $voitures;
    $voitures->closeCursor();
}

// Renvoie tous les constructeurs
function getAllConstructeurs(){
    $pdo = getBdd();
    $constructeurs = $pdo->prepare('SELECT id_construct AS id, nom_construct AS nom, logo_construct AS logo FROM T_Construct');
    $constructeurs->execute();
    return $constructeurs;
    $constructeurs->closeCursor();
}


// Effectue la connexion à la BDD
// Instancie et renvoie l'objet PDO associé
function getBdd() {
  $bdd = new PDO('mysql:host=localhost;port=3308;dbname=AutoRetroChic;charset=utf8', 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
  return $bdd;
}
