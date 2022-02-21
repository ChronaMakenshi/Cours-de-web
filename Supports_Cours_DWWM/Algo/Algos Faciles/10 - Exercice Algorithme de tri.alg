<?xml version="1.0" encoding="UTF-8"?>
<Algo>
    <description courant="FIN_POUR" texte="Tri par valeurs croissantes d'un tableau de valeurs !!!"/>
    <extension extnom="inactif"/>
    <fonction fctetat="inactif" fctcode=""/>
    <F2 F2para="" F2defaut="" F2lignes="" F2etat="inactif"/>
    <repere repcode="-10#10#-10#10#2#2" repetat="inactif"/>
    <param totalAffichages="1000" arrondiAuto="vrai" nbDecimales="8" epaisseurPoint="2" epaisseurLigne="2" maxBoucle="500000" totalBoucles="5000000"/>
    <item algoitem="FONCTIONS_UTILISEES" code="200#declarationfonctions"/>
    <item algoitem="VARIABLES" code="100#declarationsvariables">
        <item algoitem="i EST_DU_TYPE NOMBRE" code="1#NOMBRE#i"/>
        <item algoitem="j EST_DU_TYPE NOMBRE" code="1#NOMBRE#j"/>
        <item algoitem="n EST_DU_TYPE NOMBRE" code="1#NOMBRE#n"/>
        <item algoitem="x EST_DU_TYPE LISTE" code="1#LISTE#x"/>
        <item algoitem="A EST_DU_TYPE NOMBRE" code="1#NOMBRE#A"/>
    </item>
    <item algoitem="DEBUT_ALGORITHME" code="101#debutalgo">
        <item algoitem="//Lecture du nombre de valeurs à trier" code="19#Lecture du nombre de valeurs à trier"/>
        <item algoitem="LIRE n" code="2#n#pasliste"/>
        <item algoitem="//Lecture des valeurs à trier" code="19#Lecture des valeurs à trier"/>
        <item algoitem="POUR i ALLANT_DE 1 A n" code="12#i#1#n">
            <item algoitem="DEBUT_POUR" code="13#debutpour"/>
            <item algoitem="LIRE x[ i ]" code="2#x# i "/>
            <item algoitem="FIN_POUR" code="14#finpour"/>
        </item>
        <item algoitem="//Traitement de tri" code="19#Traitement de tri"/>
        <item algoitem="POUR i ALLANT_DE 1 A n-1" code="12#i#1#n-1">
            <item algoitem="DEBUT_POUR" code="13#debutpour"/>
            <item algoitem="j PREND_LA_VALEUR n" code="5#j#n#pasliste"/>
            <item algoitem="TANT_QUE ( i &lt; j ) FAIRE" code="15# i &lt; j ">
                <item algoitem="DEBUT_TANT_QUE" code="16#debuttantque"/>
                <item algoitem="SI ( x[j] &lt; x[j-1]) ALORS" code="6# x[j] &lt; x[j-1]">
                    <item algoitem="DEBUT_SI" code="7#debutsi"/>
                    <item algoitem="A PREND_LA_VALEUR x[j]" code="5#A#x[j]#pasliste"/>
                    <item algoitem="x[j] PREND_LA_VALEUR x[j-1]" code="5#x#x[j-1]#j"/>
                    <item algoitem="x[j-1] PREND_LA_VALEUR A" code="5#x#A#j-1"/>
                    <item algoitem="FIN_SI" code="8#finsi"/>
                </item>
                <item algoitem="j PREND_LA_VALEUR j-1" code="5#j#j-1#pasliste"/>
                <item algoitem="FIN_TANT_QUE" code="17#fintantque"/>
            </item>
            <item algoitem="FIN_POUR" code="14#finpour"/>
        </item>
        <item algoitem="//Sortie des valeurs triées par ordre croissant" code="19#Sortie des valeurs triées par ordre croissant"/>
        <item algoitem="POUR i ALLANT_DE 1 A n" code="12#i#1#n">
            <item algoitem="DEBUT_POUR" code="13#debutpour"/>
            <item algoitem="AFFICHER x[ i ]" code="3#x#0# i "/>
            <item algoitem="AFFICHER &quot; &quot;" code="4# #0"/>
            <item algoitem="FIN_POUR" code="14#finpour"/>
        </item>
    </item>
    <item algoitem="FIN_ALGORITHME" code="102#finalgo"/>
</Algo>
