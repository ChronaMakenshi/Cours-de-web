<?xml version="1.0" encoding="UTF-8"?>
<Algo>
    <description texte="Algorithme permettant de calculer la somme des entiers de 1 à N." courant="AFFICHER &quot;La somme des entiers de 1 à &quot;"/>
    <fonction fctcode="" fctetat="inactif"/>
    <F2 F2defaut="" F2lignes="" F2etat="inactif" F2para=""/>
    <repere repetat="inactif" repcode="-10#10#-10#10#2#2"/>
    <item algoitem="VARIABLES" code="100#declarationsvariables">
        <item algoitem="somme EST_DU_TYPE NOMBRE" code="1#NOMBRE#somme"/>
        <item algoitem="i EST_DU_TYPE NOMBRE" code="1#NOMBRE#i"/>
        <item algoitem="N EST_DU_TYPE NOMBRE" code="1#NOMBRE#N"/>
    </item>
    <item algoitem="DEBUT_ALGORITHME" code="101#debutalgo">
        <item algoitem="AFFICHER &quot;Saisir un entier naturel non nul : &quot;" code="4#Saisir un entier naturel non nul : #0"/>
        <item algoitem="somme PREND_LA_VALEUR 0" code="5#somme#0#pasliste"/>
        <item algoitem="LIRE N" code="2#N#pasliste"/>
        <item algoitem="AFFICHER N" code="3#N#1#pasliste"/>
        <item algoitem="POUR i ALLANT_DE 1 A N" code="12#i#1#N">
            <item algoitem="DEBUT_POUR" code="13#debutpour"/>
            <item algoitem="somme PREND_LA_VALEUR somme+i" code="5#somme#somme+i#pasliste"/>
            <item algoitem="FIN_POUR" code="14#finpour"/>
        </item>
        <item algoitem="AFFICHER &quot;La somme des entiers de 1 à &quot;" code="4#La somme des entiers de 1 à #0"/>
        <item algoitem="AFFICHER N" code="3#N#0#pasliste"/>
        <item algoitem="AFFICHER &quot; est égale à : &quot;" code="4# est égale à : #0"/>
        <item algoitem="AFFICHER somme" code="3#somme#0#pasliste"/>
    </item>
    <item algoitem="FIN_ALGORITHME" code="102#finalgo"/>
</Algo>
