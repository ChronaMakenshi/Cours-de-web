<?xml version="1.0" encoding="UTF-8"?>
<Algo>
    <description texte="Calcul du carré d'un Nombre" courant="AFFICHER resultat"/>
    <extension extnom="inactif"/>
    <fonction fctetat="inactif" fctcode=""/>
    <F2 F2lignes="" F2etat="inactif" F2defaut="" F2para=""/>
    <repere repcode="-10#10#-10#10#2#2" repetat="inactif"/>
    <param maxBoucle="500000" arrondiAuto="vrai" epaisseurPoint="2" totalAffichages="1000" epaisseurLigne="2" nbDecimales="8" totalBoucles="5000000"/>
    <item algoitem="FONCTIONS_UTILISEES" code="200#declarationfonctions"/>
    <item algoitem="VARIABLES" code="100#declarationsvariables">
        <item algoitem="nombreSaisi EST_DU_TYPE NOMBRE" code="1#NOMBRE#nombreSaisi"/>
        <item algoitem="resultat EST_DU_TYPE NOMBRE" code="1#NOMBRE#resultat"/>
    </item>
    <item algoitem="DEBUT_ALGORITHME" code="101#debutalgo">
        <item algoitem="//Saisie du nombre" code="19#Saisie du nombre"/>
        <item algoitem="AFFICHER &quot;Entrez un nombre :&quot;" code="4#Entrez un nombre :#0"/>
        <item algoitem="LIRE nombreSaisi" code="2#nombreSaisi#pasliste"/>
        <item algoitem="//Calcul" code="19#Calcul"/>
        <item algoitem="resultat PREND_LA_VALEUR nombreSaisi * nombreSaisi" code="5#resultat#nombreSaisi * nombreSaisi#pasliste"/>
        <item algoitem="//Affichage résultat" code="19#Affichage résultat"/>
        <item algoitem="AFFICHER &quot;Le carré de &quot;" code="4#Le carré de #0"/>
        <item algoitem="AFFICHER nombreSaisi" code="3#nombreSaisi#0#pasliste"/>
        <item algoitem="AFFICHER &quot; est &quot;" code="4# est #0"/>
        <item algoitem="AFFICHER resultat" code="3#resultat#1#pasliste"/>
    </item>
    <item algoitem="FIN_ALGORITHME" code="102#finalgo"/>
</Algo>
