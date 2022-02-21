<?xml version="1.0" encoding="UTF-8"?>
<Algo>
    <description courant="AFFICHER max" texte=""/>
    <extension extnom="inactif"/>
    <fonction fctcode="" fctetat="inactif"/>
    <F2 F2para="" F2lignes="" F2etat="inactif" F2defaut=""/>
    <repere repetat="inactif" repcode="-10#10#-10#10#2#2"/>
    <param epaisseurLigne="2" totalAffichages="1000" totalBoucles="5000000" epaisseurPoint="2" arrondiAuto="vrai" maxBoucle="500000" nbDecimales="8"/>
    <item code="200#declarationfonctions" algoitem="FONCTIONS_UTILISEES"/>
    <item code="100#declarationsvariables" algoitem="VARIABLES">
        <item code="1#NOMBRE#n" algoitem="n EST_DU_TYPE NOMBRE"/>
        <item code="1#NOMBRE#i" algoitem="i EST_DU_TYPE NOMBRE"/>
        <item code="1#LISTE#Tab" algoitem="Tab EST_DU_TYPE LISTE"/>
        <item code="1#NOMBRE#max" algoitem="max EST_DU_TYPE NOMBRE"/>
    </item>
    <item code="101#debutalgo" algoitem="DEBUT_ALGORITHME">
        <item code="4#Entrer la dimension de votre tabeau : #0" algoitem="AFFICHER &quot;Entrer la dimension de votre tabeau : &quot;"/>
        <item code="2#n#pasliste" algoitem="LIRE n"/>
        <item code="12#i#1#n" algoitem="POUR i ALLANT_DE 1 A n">
            <item code="13#debutpour" algoitem="DEBUT_POUR"/>
            <item code="2#Tab#i" algoitem="LIRE Tab[i]"/>
            <item code="14#finpour" algoitem="FIN_POUR"/>
        </item>
        <item code="5#max#Tab[1]#pasliste" algoitem="max PREND_LA_VALEUR Tab[1]"/>
        <item code="12#i#2#n" algoitem="POUR i ALLANT_DE 2 A n">
            <item code="13#debutpour" algoitem="DEBUT_POUR"/>
            <item code="6#Tab[i] > max" algoitem="SI (Tab[i] > max) ALORS">
                <item code="7#debutsi" algoitem="DEBUT_SI"/>
                <item code="5#max#Tab[i]#pasliste" algoitem="max PREND_LA_VALEUR Tab[i]"/>
                <item code="8#finsi" algoitem="FIN_SI"/>
            </item>
            <item code="14#finpour" algoitem="FIN_POUR"/>
        </item>
        <item code="4#La valeur Max de ce tableau est :#0" algoitem="AFFICHER &quot;La valeur Max de ce tableau est :&quot;"/>
        <item code="3#max#0#pasliste" algoitem="AFFICHER max"/>
    </item>
    <item code="102#finalgo" algoitem="FIN_ALGORITHME"/>
</Algo>
