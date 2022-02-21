<?php

require_once 'vendor/autoload.php';

$loader = new \Twig\Loader\FilesystemLoader('templates');
$twig = new \Twig\Environment($loader, [
    'cache' => false,
]);



$paragraphe = "<mark>jQuery</mark> est une bibliothèque JavaScript libre et multiplateforme créée pour faciliter l'écriture de scripts côté client dans le code HTML des pages web. La première version est lancée en janvier 2006 par John Resig.

Le but de la bibliothèque étant le parcours et la modification du DOM (y compris le support des sélecteurs CSS 1 à 3 et un support basique de XPath), elle contient de nombreuses fonctionnalités ; notamment des animations, la manipulation des feuilles de style en cascade (accessibilité des classes et attributs), la gestion des évènements, etc. L'utilisation d'Ajax est facilitée et de nombreux plugins sont présents.

Depuis sa création en 2006 et notamment à cause de la complexification croissante des interfaces Web, jQuery a connu un large succès auprès des développeurs Web et son apprentissage est aujourd'hui un des fondamentaux de la formation aux technologies du Web. Elle est à l'heure actuelle la bibliothèque front-end la plus utilisée au monde (plus de la moitié des sites Internet en ligne intègrent jQuery).";

$langages = ["html","css", "javascript", "jquery"];
$page = "jquery";

echo $twig->render('jquery.html.twig', [
    'paragraphe'    => $paragraphe,
    'langages'      => $langages,
    'url'           => $_SERVER['PHP_SELF'],
    'page'          => $page
]);

?>