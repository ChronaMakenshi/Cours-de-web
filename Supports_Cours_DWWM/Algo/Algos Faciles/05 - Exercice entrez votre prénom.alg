<?xml version="1.0" encoding="UTF-8"?>
<Algo>
    <description courant="AFFICHER &quot; !&quot;" texte="Entrez votre prénom !!!"/>
    <extension extnom="inactif"/>
    <fonction fctetat="inactif" fctcode=""/>
    <F2 F2etat="inactif" F2lignes="" F2para="" F2defaut=""/>
    <repere repcode="-10#10#-10#10#2#2" repetat="inactif"/>
    <param maxBoucle="500000" totalBoucles="5000000" arrondiAuto="vrai" totalAffichages="1000" epaisseurPoint="2" nbDecimales="8" epaisseurLigne="2"/>
    <item algoitem="FONCTIONS_UTILISEES" code="200#declarationfonctions"/>
    <item algoitem="VARIABLES" code="100#declarationsvariables">
        <item algoitem="nomSaisi EST_DU_TYPE CHAINE" code="1#CHAINE#nomSaisi"/>
    </item>
    <item algoitem="DEBUT_ALGORITHME" code="101#debutalgo">
        <item algoitem="AFFICHER &quot;Quel est votre prénom ?&quot;" code="4#Quel est votre prénom ?#0"/>
        <item algoitem="LIRE nomSaisi" code="2#nomSaisi#pasliste"/>
        <item algoitem="AFFICHER &quot;Bonjour &quot;" code="4#Bonjour #0"/>
        <item algoitem="AFFICHER nomSaisi" code="3#nomSaisi#0#pasliste"/>
        <item algoitem="AFFICHER &quot; !&quot;" code="4# !#0"/>
    </item>
    <item algoitem="FIN_ALGORITHME" code="102#finalgo"/>
</Algo>
