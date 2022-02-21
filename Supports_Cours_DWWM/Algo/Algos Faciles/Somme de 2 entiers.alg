<?xml version="1.0" encoding="UTF-8"?>
<Algo>
    <description courant="AFFICHER somme" texte="Calcul de la somme de 2 entiers."/>
    <extension extnom="inactif"/>
    <fonction fctetat="inactif" fctcode=""/>
    <F2 F2para="" F2etat="inactif" F2defaut="" F2lignes=""/>
    <repere repcode="-10#10#-10#10#2#2" repetat="inactif"/>
    <param arrondiAuto="vrai" totalBoucles="5000000" nbDecimales="8" totalAffichages="1000" epaisseurLigne="2" epaisseurPoint="2" maxBoucle="500000"/>
    <item algoitem="FONCTIONS_UTILISEES" code="200#declarationfonctions"/>
    <item algoitem="VARIABLES" code="100#declarationsvariables">
        <item algoitem="a EST_DU_TYPE NOMBRE" code="1#NOMBRE#a"/>
        <item algoitem="b EST_DU_TYPE NOMBRE" code="1#NOMBRE#b"/>
        <item algoitem="somme EST_DU_TYPE NOMBRE" code="1#NOMBRE#somme"/>
    </item>
    <item algoitem="DEBUT_ALGORITHME" code="101#debutalgo">
        <item algoitem="AFFICHER &quot;Entrez un nombre :&quot;" code="4#Entrez un nombre :#0"/>
        <item algoitem="LIRE a" code="2#a#pasliste"/>
        <item algoitem="AFFICHER &quot;Entrez un nombre :&quot;" code="4#Entrez un nombre :#0"/>
        <item algoitem="LIRE b" code="2#b#pasliste"/>
        <item algoitem="somme PREND_LA_VALEUR a+b" code="5#somme#a+b#pasliste"/>
        <item algoitem="AFFICHER somme" code="3#somme#0#pasliste"/>
    </item>
    <item algoitem="FIN_ALGORITHME" code="102#finalgo"/>
</Algo>
