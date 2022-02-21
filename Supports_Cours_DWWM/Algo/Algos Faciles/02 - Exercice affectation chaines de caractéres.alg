<?xml version="1.0" encoding="UTF-8"?>
<Algo>
    <description texte="Exercices sur les chaînes de caractéres et sur l'affectation des variables" courant="AFFICHER B"/>
    <extension extnom="inactif"/>
    <fonction fctcode="" fctetat="inactif"/>
    <F2 F2etat="inactif" F2para="" F2lignes="" F2defaut=""/>
    <repere repetat="inactif" repcode="-10#10#-10#10#2#2"/>
    <param totalAffichages="1000" totalBoucles="5000000" maxBoucle="500000" epaisseurPoint="2" arrondiAuto="vrai" nbDecimales="8" epaisseurLigne="2"/>
    <item algoitem="FONCTIONS_UTILISEES" code="200#declarationfonctions"/>
    <item algoitem="VARIABLES" code="100#declarationsvariables">
        <item algoitem="A EST_DU_TYPE CHAINE" code="1#CHAINE#A"/>
        <item algoitem="B EST_DU_TYPE CHAINE" code="1#CHAINE#B"/>
        <item algoitem="TEMP EST_DU_TYPE CHAINE" code="1#CHAINE#TEMP"/>
    </item>
    <item algoitem="DEBUT_ALGORITHME" code="101#debutalgo">
        <item algoitem="//Affectation des variables" code="19#Affectation des variables"/>
        <item algoitem="A PREND_LA_VALEUR &quot;Coucou&quot;" code="5#A#&quot;Coucou&quot;#pasliste"/>
        <item algoitem="B PREND_LA_VALEUR &quot;Salut&quot;" code="5#B#&quot;Salut&quot;#pasliste"/>
        <item algoitem="//Traitement" code="19#Traitement"/>
        <item algoitem="TEMP PREND_LA_VALEUR B" code="5#TEMP#B#pasliste"/>
        <item algoitem="B PREND_LA_VALEUR A" code="5#B#A#pasliste"/>
        <item algoitem="A PREND_LA_VALEUR TEMP" code="5#A#TEMP#pasliste"/>
        <item algoitem="//Affichage du résultat" code="19#Affichage du résultat"/>
        <item algoitem="AFFICHER &quot;A vaut :&quot;" code="4#A vaut :#0"/>
        <item algoitem="AFFICHER A" code="3#A#1#pasliste"/>
        <item algoitem="AFFICHER &quot;B vaut :&quot;" code="4#B vaut :#0"/>
        <item algoitem="AFFICHER B" code="3#B#1#pasliste"/>
    </item>
    <item algoitem="FIN_ALGORITHME" code="102#finalgo"/>
</Algo>
