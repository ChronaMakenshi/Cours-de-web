<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Création de formulaires par Classe</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<h1>Création de formulaires par Classe</h1>
<?php
include('formclass.php');

Form::afficherCommentaire();

//***************************
$myform = new Form("traitement.php","Accès au site","post");
$myform->setText("nom","Votre nom : &nbsp;");
$myform->setText("code","Votre code : ");
$myform->setSubmit();
$myform->setReset();
$myform->getForm();


Form2::afficherCommentaire();

$myform = new Form2("traitement.php","Coordonnées et sports préférés","post");
$myform->setText("nom","Votre nom : &nbsp;");
$myform->setText("code","Votre code : ");
$myform->setRadio("sexe"," Homme ","homme","checked");
$myform->setRadio("sexe"," Femme ","femme", "");
$myform->setCase("loisir"," Tennis ","tennis");
$myform->setCase("loisir"," Equitation ","équitaion");
$myform->setCase("loisir"," Football ","football");
$myform->setSubmit();
$myform->setReset();
$myform->getForm();

// $myform = new Form2("traitement.php","Donnez vos informations","post");
// $myform->setText("nom","Votre nom : &nbsp;");
// $myform->setText("code","Votre code : ");
// $myform->setSubmit();
// $myform->setReset();
// $myform->getForm();

// $myclone = clone $myform;
// $myclone->setText("truc","Votre truc : ");
// $myclone->getForm();

?>   
</body>
</html>