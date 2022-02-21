<?xml version="1.0" encoding="UTF-8"?>
<Algo>
    <description texte="" courant="FIN_POUR"/>
    <extension extnom="inactif"/>
    <fonction fctetat="inactif" fctcode=""/>
    <F2 F2para="" F2lignes="" F2etat="inactif" F2defaut=""/>
    <repere repetat="inactif" repcode="-10#10#-10#10#2#2"/>
    <param totalAffichages="1000" nbDecimales="8" arrondiAuto="vrai" epaisseurPoint="2" maxBoucle="500000" totalBoucles="5000000" epaisseurLigne="2"/>
    <item code="200#declarationfonctions" algoitem="FONCTIONS_UTILISEES"/>
    <item code="100#declarationsvariables" algoitem="VARIABLES">
        <item code="1#LISTE#Tab" algoitem="Tab EST_DU_TYPE LISTE"/>
        <item code="1#NOMBRE#min" algoitem="min EST_DU_TYPE NOMBRE"/>
        <item code="1#NOMBRE#max" algoitem="max EST_DU_TYPE NOMBRE"/>
        <item code="1#NOMBRE#Temp" algoitem="Temp EST_DU_TYPE NOMBRE"/>
        <item code="1#NOMBRE#i" algoitem="i EST_DU_TYPE NOMBRE"/>
        <item code="1#NOMBRE#j" algoitem="j EST_DU_TYPE NOMBRE"/>
    </item>
    <item code="101#debutalgo" algoitem="DEBUT_ALGORITHME">
        <item code="5#min#1#pasliste" algoitem="min PREND_LA_VALEUR 1"/>
        <item code="2#max#pasliste" algoitem="LIRE max"/>
        <item code="12#i#min#max" algoitem="POUR i ALLANT_DE min A max">
            <item code="13#debutpour" algoitem="DEBUT_POUR"/>
            <item code="2#Tab#i" algoitem="LIRE Tab[i]"/>
            <item code="14#finpour" algoitem="FIN_POUR"/>
        </item>
        <item code="12#j#min#max" algoitem="POUR j ALLANT_DE min A max">
            <item code="13#debutpour" algoitem="DEBUT_POUR"/>
            <item code="12#i#j+1#max" algoitem="POUR i ALLANT_DE j+1 A max">
                <item code="13#debutpour" algoitem="DEBUT_POUR"/>
                <item code="19#i PREND_LA_VALEUR j+1" algoitem="//i PREND_LA_VALEUR j+1"/>
                <item code="19#TANT_QUE (i&lt;=max) FAIRE" algoitem="//TANT_QUE (i&lt;=max) FAIRE"/>
                <item code="19#  DEBUT_TANT_QUE" algoitem="//  DEBUT_TANT_QUE"/>
                <item code="6#Tab[i]&lt;Tab[j]" algoitem="SI (Tab[i]&lt;Tab[j]) ALORS">
                    <item code="7#debutsi" algoitem="DEBUT_SI"/>
                    <item code="5#Temp#Tab[i]#pasliste" algoitem="Temp PREND_LA_VALEUR Tab[i]"/>
                    <item code="5#Tab#Tab[j]#i" algoitem="Tab[i] PREND_LA_VALEUR Tab[j]"/>
                    <item code="5#Tab#Temp#j" algoitem="Tab[j] PREND_LA_VALEUR Temp"/>
                    <item code="8#finsi" algoitem="FIN_SI"/>
                </item>
                <item code="14#finpour" algoitem="FIN_POUR"/>
            </item>
            <item code="19#  i PREND_LA_VALEUR i+1" algoitem="//  i PREND_LA_VALEUR i+1"/>
            <item code="19#  FIN_TANT_QUE" algoitem="//  FIN_TANT_QUE"/>
            <item code="14#finpour" algoitem="FIN_POUR"/>
        </item>
        <item code="12#i#min#max" algoitem="POUR i ALLANT_DE min A max">
            <item code="13#debutpour" algoitem="DEBUT_POUR"/>
            <item code="3#Tab#0#i" algoitem="AFFICHER Tab[i]"/>
            <item code="4# #0" algoitem="AFFICHER &quot; &quot;"/>
            <item code="14#finpour" algoitem="FIN_POUR"/>
        </item>
    </item>
    <item code="102#finalgo" algoitem="FIN_ALGORITHME"/>
</Algo>
