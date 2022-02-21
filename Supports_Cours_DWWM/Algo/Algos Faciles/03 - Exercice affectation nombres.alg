<?xml version="1.0" encoding="UTF-8"?>
<Algo>
    <description courant="A PREND_LA_VALEUR TEMP" texte=""/>
    <extension extnom="inactif"/>
    <fonction fctcode="" fctetat="inactif"/>
    <F2 F2etat="inactif" F2para="" F2defaut="" F2lignes=""/>
    <repere repcode="-10#10#-10#10#2#2" repetat="inactif"/>
    <param arrondiAuto="vrai" totalAffichages="1000" maxBoucle="500000" epaisseurPoint="2" epaisseurLigne="2" totalBoucles="5000000" nbDecimales="8"/>
    <item algoitem="FONCTIONS_UTILISEES" code="200#declarationfonctions"/>
    <item algoitem="VARIABLES" code="100#declarationsvariables">
        <item algoitem="A EST_DU_TYPE NOMBRE" code="1#NOMBRE#A"/>
        <item algoitem="B EST_DU_TYPE NOMBRE" code="1#NOMBRE#B"/>
        <item algoitem="C EST_DU_TYPE NOMBRE" code="1#NOMBRE#C"/>
        <item algoitem="TEMP EST_DU_TYPE NOMBRE" code="1#NOMBRE#TEMP"/>
    </item>
    <item algoitem="DEBUT_ALGORITHME" code="101#debutalgo">
        <item algoitem="//Affectation des variables" code="19#Affectation des variables"/>
        <item algoitem="A PREND_LA_VALEUR 10" code="5#A#10#pasliste"/>
        <item algoitem="B PREND_LA_VALEUR 20" code="5#B#20#pasliste"/>
        <item algoitem="C PREND_LA_VALEUR 30" code="5#C#30#pasliste"/>
        <item algoitem="//Traitement" code="19#Traitement"/>
        <item algoitem="TEMP PREND_LA_VALEUR C" code="5#TEMP#C#pasliste"/>
        <item algoitem="C PREND_LA_VALEUR B" code="5#C#B#pasliste"/>
        <item algoitem="B PREND_LA_VALEUR A" code="5#B#A#pasliste"/>
        <item algoitem="A PREND_LA_VALEUR TEMP" code="5#A#TEMP#pasliste"/>
        <item algoitem="//Affichage du résultat" code="19#Affichage du résultat"/>
        <item algoitem="AFFICHER &quot;A vaut :&quot;" code="4#A vaut :#0"/>
        <item algoitem="AFFICHER A" code="3#A#1#pasliste"/>
        <item algoitem="AFFICHER &quot;B vaut :&quot;" code="4#B vaut :#0"/>
        <item algoitem="AFFICHER B" code="3#B#1#pasliste"/>
        <item algoitem="AFFICHER &quot;C vaut :&quot;" code="4#C vaut :#0"/>
        <item algoitem="AFFICHER C" code="3#C#1#pasliste"/>
    </item>
    <item algoitem="FIN_ALGORITHME" code="102#finalgo"/>
</Algo>
