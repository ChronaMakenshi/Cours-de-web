<?xml version="1.0" encoding="UTF-8"?>
<Algo>
    <description courant="resultat EST_DU_TYPE LISTE" texte="Algo Dichotomie &amp; Tri Tableau avec utilisation de fonction"/>
    <extension extnom="inactif"/>
    <fonction fctetat="actif" fctcode="ALGOBOX_POS_MAXIMUM(Tab,min,max)"/>
    <F2 F2defaut="" F2para="" F2etat="inactif" F2lignes=""/>
    <repere repetat="inactif" repcode="-10#10#-10#10#2#2"/>
    <param totalBoucles="5000000" totalAffichages="1000" arrondiAuto="vrai" epaisseurPoint="2" maxBoucle="500000" epaisseurLigne="2" nbDecimales="8"/>
    <item algoitem="FONCTIONS_UTILISEES" code="200#declarationfonctions">
        <item algoitem="FONCTION Trier_Tableau(pTab, pmin, pmax)" code="201#Trier_Tableau#pTab, pmin, pmax">
            <item algoitem="VARIABLES_FONCTION" code="202#declarationsvariablesfonction">
                <item algoitem="i EST_DU_TYPE NOMBRE" code="1#NOMBRE#i"/>
                <item algoitem="j EST_DU_TYPE NOMBRE" code="1#NOMBRE#j"/>
                <item algoitem="Temp EST_DU_TYPE NOMBRE" code="1#NOMBRE#Temp"/>
            </item>
            <item algoitem="DEBUT_FONCTION" code="203#debutfonction"/>
            <item algoitem="POUR i ALLANT_DE pmin A pmax" code="12#i#pmin#pmax">
                <item algoitem="DEBUT_POUR" code="13#debutpour"/>
                <item algoitem="SI (PTab[i]&lt;pTab[j]) ALORS" code="6#PTab[i]&lt;pTab[j]">
                    <item algoitem="DEBUT_SI" code="7#debutsi"/>
                    <item algoitem="Temp PREND_LA_VALEUR pTab[i]" code="5#Temp#pTab[i]#pasliste"/>
                    <item algoitem="pTab[i] PREND_LA_VALEUR pTab[j]" code="5#pTab#pTab[j]#i"/>
                    <item algoitem="pTab[j] PREND_LA_VALEUR Temp" code="5#pTab#Temp#j"/>
                    <item algoitem="FIN_SI" code="8#finsi"/>
                </item>
                <item algoitem="FIN_POUR" code="14#finpour"/>
            </item>
            <item algoitem="RENVOYER pTab" code="205#pTab"/>
            <item algoitem="FIN_FONCTION" code="204#finfonction"/>
        </item>
    </item>
    <item algoitem="VARIABLES" code="100#declarationsvariables">
        <item algoitem="min EST_DU_TYPE NOMBRE" code="1#NOMBRE#min"/>
        <item algoitem="max EST_DU_TYPE NOMBRE" code="1#NOMBRE#max"/>
        <item algoitem="k EST_DU_TYPE NOMBRE" code="1#NOMBRE#k"/>
        <item algoitem="Tab EST_DU_TYPE LISTE" code="1#LISTE#Tab"/>
        <item algoitem="resultat EST_DU_TYPE LISTE" code="1#LISTE#resultat"/>
    </item>
    <item algoitem="DEBUT_ALGORITHME" code="101#debutalgo">
        <item algoitem="min PREND_LA_VALEUR 1" code="5#min#1#pasliste"/>
        <item algoitem="LIRE max" code="2#max#pasliste"/>
        <item algoitem="POUR k ALLANT_DE min A max" code="12#k#min#max">
            <item algoitem="DEBUT_POUR" code="13#debutpour"/>
            <item algoitem="LIRE Tab[k]" code="2#Tab#k"/>
            <item algoitem="FIN_POUR" code="14#finpour"/>
        </item>
        <item algoitem="POUR k ALLANT_DE min A max" code="12#k#min#max">
            <item algoitem="DEBUT_POUR" code="13#debutpour"/>
            <item algoitem="AFFICHER Tab[k]" code="3#Tab#0#k"/>
            <item algoitem="AFFICHER &quot; &quot;" code="4# #0"/>
            <item algoitem="FIN_POUR" code="14#finpour"/>
        </item>
        <item algoitem="resultat PREND_LA_VALEUR Trier_Tableau(Tab, min, max)" code="5#resultat#Trier_Tableau(Tab, min, max)#pasliste"/>
        <item algoitem="POUR k ALLANT_DE min A max" code="12#k#min#max">
            <item algoitem="DEBUT_POUR" code="13#debutpour"/>
            <item algoitem="AFFICHER resultat[k]" code="3#resultat#0#k"/>
            <item algoitem="AFFICHER &quot; &quot;" code="4# #0"/>
            <item algoitem="FIN_POUR" code="14#finpour"/>
        </item>
    </item>
    <item algoitem="FIN_ALGORITHME" code="102#finalgo"/>
</Algo>
