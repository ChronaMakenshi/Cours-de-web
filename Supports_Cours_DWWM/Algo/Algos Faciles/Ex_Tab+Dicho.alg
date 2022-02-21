<?xml version="1.0" encoding="UTF-8"?>
<Algo>
    <description courant="AFFICHER medium" texte=""/>
    <extension extnom="inactif"/>
    <fonction fctetat="inactif" fctcode=""/>
    <F2 F2defaut="" F2lignes="" F2etat="inactif" F2para=""/>
    <repere repcode="-10#10#-10#10#2#2" repetat="inactif"/>
    <param totalAffichages="1000" nbDecimales="8" epaisseurPoint="2" arrondiAuto="vrai" maxBoucle="500000" totalBoucles="5000000" epaisseurLigne="2"/>
    <item algoitem="FONCTIONS_UTILISEES" code="200#declarationfonctions"/>
    <item algoitem="VARIABLES" code="100#declarationsvariables">
        <item algoitem="list EST_DU_TYPE LISTE" code="1#LISTE#list"/>
        <item algoitem="longueur EST_DU_TYPE NOMBRE" code="1#NOMBRE#longueur"/>
        <item algoitem="min EST_DU_TYPE NOMBRE" code="1#NOMBRE#min"/>
        <item algoitem="max EST_DU_TYPE NOMBRE" code="1#NOMBRE#max"/>
        <item algoitem="temp EST_DU_TYPE NOMBRE" code="1#NOMBRE#temp"/>
        <item algoitem="X EST_DU_TYPE NOMBRE" code="1#NOMBRE#X"/>
        <item algoitem="medium EST_DU_TYPE NOMBRE" code="1#NOMBRE#medium"/>
        <item algoitem="result EST_DU_TYPE NOMBRE" code="1#NOMBRE#result"/>
    </item>
    <item algoitem="DEBUT_ALGORITHME" code="101#debutalgo">
        <item algoitem="AFFICHER &quot;Ecrire le nombre de valeur&quot;" code="4#Ecrire le nombre de valeur#1"/>
        <item algoitem="LIRE longueur" code="2#longueur#pasliste"/>
        <item algoitem="POUR min ALLANT_DE 1 A longueur" code="12#min#1#longueur">
            <item algoitem="DEBUT_POUR" code="13#debutpour"/>
            <item algoitem="LIRE list[min]" code="2#list#min"/>
            <item algoitem="FIN_POUR" code="14#finpour"/>
        </item>
        <item algoitem="POUR min ALLANT_DE 1 A longueur-1" code="12#min#1#longueur-1">
            <item algoitem="DEBUT_POUR" code="13#debutpour"/>
            <item algoitem="max PREND_LA_VALEUR longueur" code="5#max#longueur#pasliste"/>
            <item algoitem="TANT_QUE (min&lt;max) FAIRE" code="15#min&lt;max">
                <item algoitem="DEBUT_TANT_QUE" code="16#debuttantque"/>
                <item algoitem="SI (list[max]&lt;list[min]) ALORS" code="6#list[max]&lt;list[min]">
                    <item algoitem="DEBUT_SI" code="7#debutsi"/>
                    <item algoitem="temp PREND_LA_VALEUR list[min]" code="5#temp#list[min]#pasliste"/>
                    <item algoitem="list[min] PREND_LA_VALEUR list[max]" code="5#list#list[max]#min"/>
                    <item algoitem="list[max] PREND_LA_VALEUR temp" code="5#list#temp#max"/>
                    <item algoitem="FIN_SI" code="8#finsi"/>
                </item>
                <item algoitem="max PREND_LA_VALEUR max-1" code="5#max#max-1#pasliste"/>
                <item algoitem="FIN_TANT_QUE" code="17#fintantque"/>
            </item>
            <item algoitem="FIN_POUR" code="14#finpour"/>
        </item>
        <item algoitem="POUR min ALLANT_DE 1 A longueur" code="12#min#1#longueur">
            <item algoitem="DEBUT_POUR" code="13#debutpour"/>
            <item algoitem="AFFICHER list[min]" code="3#list#0#min"/>
            <item algoitem="AFFICHER &quot;:&quot;" code="4#:#0"/>
            <item algoitem="FIN_POUR" code="14#finpour"/>
        </item>
        <item algoitem="" code="103#commentaire"/>
        <item algoitem="AFFICHER &quot;Entrer votre valeur X&quot;" code="4#Entrer votre valeur X#1"/>
        <item algoitem="LIRE X" code="2#X#pasliste"/>
        <item algoitem="min PREND_LA_VALEUR 1" code="5#min#1#pasliste"/>
        <item algoitem="max PREND_LA_VALEUR longueur" code="5#max#longueur#pasliste"/>
        <item algoitem="" code="103#commentaire"/>
        <item algoitem="TANT_QUE (X!=list[medium]) FAIRE" code="15#X!=list[medium]">
            <item algoitem="DEBUT_TANT_QUE" code="16#debuttantque"/>
            <item algoitem="medium PREND_LA_VALEUR (min+max)/2" code="5#medium#(min+max)/2#pasliste"/>
            <item algoitem="medium PREND_LA_VALEUR ALGOBOX_ARRONDIR(medium,0)" code="5#medium#ALGOBOX_ARRONDIR(medium,0)#pasliste"/>
            <item algoitem="SI (X&lt;list[medium]) ALORS" code="6#X&lt;list[medium]">
                <item algoitem="DEBUT_SI" code="7#debutsi"/>
                <item algoitem="max PREND_LA_VALEUR medium" code="5#max#medium#pasliste"/>
                <item algoitem="FIN_SI" code="8#finsi"/>
                <item algoitem="SINON" code="9#sinon">
                    <item algoitem="DEBUT_SINON" code="10#debutsinon"/>
                    <item algoitem="min PREND_LA_VALEUR medium" code="5#min#medium#pasliste"/>
                    <item algoitem="FIN_SINON" code="11#finsinon"/>
                </item>
            </item>
            <item algoitem="FIN_TANT_QUE" code="17#fintantque"/>
        </item>
        <item algoitem="AFFICHER &quot;La position de la valeur X est : &quot;" code="4#La position de la valeur X est : #0"/>
        <item algoitem="AFFICHER medium" code="3#medium#0#pasliste"/>
    </item>
    <item algoitem="FIN_ALGORITHME" code="102#finalgo"/>
</Algo>
