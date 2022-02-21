<?xml version="1.0" encoding="UTF-8"?>
<Algo>
    <description courant="AFFICHER &quot;La Factorielle de &quot;" texte="Calcul de la Factorielle d'un Nombre entier positif."/>
    <extension extnom="inactif"/>
    <fonction fctcode="" fctetat="inactif"/>
    <F2 F2etat="inactif" F2defaut="" F2lignes="" F2para=""/>
    <repere repcode="-10#10#-10#10#2#2" repetat="inactif"/>
    <param maxBoucle="500000" epaisseurPoint="2" totalAffichages="1000" totalBoucles="5000000" arrondiAuto="vrai" nbDecimales="8" epaisseurLigne="2"/>
    <item algoitem="FONCTIONS_UTILISEES" code="200#declarationfonctions"/>
    <item algoitem="VARIABLES" code="100#declarationsvariables">
        <item algoitem="n EST_DU_TYPE NOMBRE" code="1#NOMBRE#n"/>
        <item algoitem="resultat EST_DU_TYPE NOMBRE" code="1#NOMBRE#resultat"/>
        <item algoitem="courant EST_DU_TYPE NOMBRE" code="1#NOMBRE#courant"/>
    </item>
    <item algoitem="DEBUT_ALGORITHME" code="101#debutalgo">
        <item algoitem="LIRE n" code="2#n#pasliste"/>
        <item algoitem="courant PREND_LA_VALEUR n" code="5#courant#n#pasliste"/>
        <item algoitem="resultat PREND_LA_VALEUR 1" code="5#resultat#1#pasliste"/>
        <item algoitem="TANT_QUE (courant>0) FAIRE" code="15#courant>0">
            <item algoitem="DEBUT_TANT_QUE" code="16#debuttantque"/>
            <item algoitem="resultat PREND_LA_VALEUR resultat*courant" code="5#resultat#resultat*courant#pasliste"/>
            <item algoitem="courant PREND_LA_VALEUR courant-1" code="5#courant#courant-1#pasliste"/>
            <item algoitem="FIN_TANT_QUE" code="17#fintantque"/>
        </item>
        <item algoitem="AFFICHER &quot;La Factorielle de &quot;" code="4#La Factorielle de #0"/>
        <item algoitem="AFFICHER n" code="3#n#0#pasliste"/>
        <item algoitem="AFFICHER &quot; est :&quot;" code="4# est :#0"/>
        <item algoitem="AFFICHER resultat" code="3#resultat#0#pasliste"/>
    </item>
    <item algoitem="FIN_ALGORITHME" code="102#finalgo"/>
</Algo>
