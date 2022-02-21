<?xml version="1.0" encoding="UTF-8"?>
<Algo>
    <description texte="Calculer la moyenne entre 3 Nombres rentrés par l'utilisateur" courant="AFFICHER moyenne"/>
    <extension extnom="inactif"/>
    <fonction fctcode="" fctetat="inactif"/>
    <F2 F2defaut="" F2etat="inactif" F2para="" F2lignes=""/>
    <repere repetat="inactif" repcode="-10#10#-10#10#2#2"/>
    <param maxBoucle="500000" totalBoucles="5000000" epaisseurPoint="2" arrondiAuto="vrai" totalAffichages="1000" epaisseurLigne="2" nbDecimales="8"/>
    <item code="200#declarationfonctions" algoitem="FONCTIONS_UTILISEES"/>
    <item code="100#declarationsvariables" algoitem="VARIABLES">
        <item code="1#NOMBRE#a" algoitem="a EST_DU_TYPE NOMBRE"/>
        <item code="1#NOMBRE#b" algoitem="b EST_DU_TYPE NOMBRE"/>
        <item code="1#NOMBRE#c" algoitem="c EST_DU_TYPE NOMBRE"/>
        <item code="1#NOMBRE#moyenne" algoitem="moyenne EST_DU_TYPE NOMBRE"/>
    </item>
    <item code="101#debutalgo" algoitem="DEBUT_ALGORITHME">
        <item code="2#a#pasliste" algoitem="LIRE a"/>
        <item code="2#b#pasliste" algoitem="LIRE b"/>
        <item code="2#c#pasliste" algoitem="LIRE c"/>
        <item code="19#Commentaires" algoitem="//Commentaires"/>
        <item code="5#moyenne#(a+b+c)/3#pasliste" algoitem="moyenne PREND_LA_VALEUR (a+b+c)/3"/>
        <item code="4#La Moyenne des 3 Nombres est :#0" algoitem="AFFICHER &quot;La Moyenne des 3 Nombres est :&quot;"/>
        <item code="3#moyenne#0#pasliste" algoitem="AFFICHER moyenne"/>
    </item>
    <item code="102#finalgo" algoitem="FIN_ALGORITHME"/>
</Algo>
