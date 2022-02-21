<?php

require_once 'vendor/autoload.php';

$loader = new \Twig\Loader\FilesystemLoader('templates');
$twig = new \Twig\Environment($loader, [
    'cache' => false,
]);


$paragraphe = "<strong>Le World Wide Web</strong> (litt. la « toile (d’araignée) mondiale », abrégé www ou le Web), le réseau mondial ou la Toile, est un système hypertexte public fonctionnant sur Internet. Le Web permet de consulter, avec un navigateur, des pages accessibles sur des sites. L’image de la toile d’araignée vient des hyperliens qui lient les pages web entre elles.

Le Web n’est qu’une des applications d’Internet, distincte d’autres applications comme le courrier électronique, la messagerie instantanée et le partage de fichiers en pair à pair. Le Web est inventé le 12 mars 1989 au CERN, à Meyrin, près de Genève par Tim Berners-Lee et le Belge Robert Cailliau plusieurs années après Internet. C'est également le Web qui a rendu les médias grand public attentifs à Internet. Depuis, le Web est fréquemment confondu avec Internet; en particulier, le mot Toile est souvent utilisé dans les textes non techniques sans qu'il soit clair si l'auteur désigne le Web ou Internet.";

$langages = ["html","css", "javascript", "jquery"];
$page = "accueil";

echo $twig->render('home.html.twig', [
    'paragraphe'        => $paragraphe,
    'langages'          => $langages,
    'url'               => $_SERVER['PHP_SELF'],
    'page'              => $page
]);

?>