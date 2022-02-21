<?php

require_once 'vendor/autoload.php';

$loader = new \Twig\Loader\FilesystemLoader('templates');
$twig = new \Twig\Environment($loader, [
    'cache' => false,
]);



$paragraphe = "<mark>CSS</mark>Les feuilles de style en cascade, généralement appelées CSS de l'anglais Cascading Style Sheets, forment un langage informatique qui décrit la présentation des documents HTML et XML. Les standards définissant CSS sont publiés par le World Wide Web Consortium (W3C). Introduit au milieu des années 1990, CSS devient couramment utilisé dans la conception de sites web et bien pris en charge par les navigateurs web dans les années 2000.Le concept de feuille de style est présent dès l'origine du World Wide Web : le premier navigateur web World Wide Web permet de mettre en forme les documents à l'aide de ce qui serait aujourd'hui considéré comme une « feuille de style utilisateur ». De même, les navigateurs Viola en 1992 et Harmony en 1993 recourent à un mécanisme similaire permettant de déterminer le rendu des polices de caractères, des couleurs ou de l'alignement du texte.

Il ne s'agit cependant pas de styles déterminés par l'auteur du document. HTML ne comportant pas non plus d'éléments de présentation dans ses premières années, une pression croissante s'exerce alors pour que les navigateurs permettent aux auteurs de déterminer eux-mêmes la présentation des pages web, dans une démarche issue de la publication imprimée électronique. C'est dans ce contexte, en 1994-1995, que le tout nouveau Netscape Navigator introduit les premiers éléments HTML de présentation à l'initiative de Marc Andreessen, tandis qu'apparaissent concurremment les premières propositions de styles externes: le « stylesheet proposal » de Pei Wei (créateur de Viola), les « Stylesheets for HTML » de Robert Raisch (O'Reilly), et enfin les «  Cascading HTML Style Sheets » (CHSS) d'Håkon Wium Lie. L'apparition de CSS répond à une volonté de « proposer une alternative à l'évolution du HTML d'un langage de structuration vers un langage de présentation ».";

$langages = ["html", "css", "javascript", "jquery"];
$page = "css";

echo $twig->render('css.html.twig', [
    'paragraphe'    => $paragraphe,
    'langages'      => $langages,
    'url'               => $_SERVER['PHP_SELF'],
    'page'              => $page

]);

?>



