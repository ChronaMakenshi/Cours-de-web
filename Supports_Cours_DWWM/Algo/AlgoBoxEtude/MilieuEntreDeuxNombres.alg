<?xml version="1.0" encoding="UTF-8"?>
<Algo>
    <description courant="AFFICHER m" texte="Algorithme qui calcule le milieu entre deux nombres donnés par l'utilisateur."/>
    <extension extnom="inactif"/>
    <fonction fctcode="" fctetat="inactif"/>
    <F2 F2etat="inactif" F2lignes="" F2para="" F2defaut=""/>
    <repere repetat="inactif" repcode="-10#10#-10#10#2#2"/>
    <param maxBoucle="500000" nbDecimales="8" totalAffichages="1000" epaisseurLigne="2" epaisseurPoint="2" totalBoucles="5000000" arrondiAuto="vrai"/>
    <item code="200#declarationfonctions" algoitem="FONCTIONS_UTILISEES"/>
    <item code="100#declarationsvariables" algoitem="VARIABLES">
        <item code="1#NOMBRE#a" algoitem="a EST_DU_TYPE NOMBRE"/>
        <item code="1#NOMBRE#b" algoitem="b EST_DU_TYPE NOMBRE"/>
        <item code="1#NOMBRE#m" algoitem="m EST_DU_TYPE NOMBRE"/>
    </item>
    <item code="101#debutalgo" algoitem="DEBUT_ALGORITHME">
        <item code="2#a#pasliste" algoitem="LIRE a"/>
        <item code="2#b#pasliste" algoitem="LIRE b"/>
        <item code="5#m#(a+b)/2#pasliste" algoitem="m PREND_LA_VALEUR (a+b)/2"/>
        <item code="4#Le Milieu entre a et b est :#0" algoitem="AFFICHER &quot;Le Milieu entre a et b est :&quot;"/>
        <item code="3#m#0#pasliste" algoitem="AFFICHER m"/>
    </item>
    <item code="102#finalgo" algoitem="FIN_ALGORITHME"/>
</Algo>
