<?xml version="1.0" encoding="UTF-8"?>
<Algo>
    <description texte="Calcul d'une somme à partir d'une liste de nombres" courant="LIRE masomme"/>
    <extension extnom="inactif"/>
    <fonction fctcode="" fctetat="inactif"/>
    <F2 F2para="" F2defaut="" F2etat="inactif" F2lignes=""/>
    <repere repcode="-10#10#-10#10#2#2" repetat="inactif"/>
    <param epaisseurPoint="2" totalAffichages="1000" arrondiAuto="vrai" totalBoucles="5000000" epaisseurLigne="2" maxBoucle="500000" nbDecimales="8"/>
    <item code="200#declarationfonctions" algoitem="FONCTIONS_UTILISEES">
        <item code="201#Calcul_somme#param" algoitem="FONCTION Calcul_somme(param)">
            <item code="202#declarationsvariablesfonction" algoitem="VARIABLES_FONCTION"/>
            <item code="203#debutfonction" algoitem="DEBUT_FONCTION"/>
            <item code="5#somme#0#pasliste" algoitem="somme PREND_LA_VALEUR 0"/>
            <item code="12#j#1#param" algoitem="POUR j ALLANT_DE 1 A param">
                <item code="13#debutpour" algoitem="DEBUT_POUR"/>
                <item code="4#Entrez un nombre :#0" algoitem="AFFICHER &quot;Entrez un nombre :&quot;"/>
                <item code="2#tab#j" algoitem="LIRE tab[j]"/>
                <item code="5#somme#somme + tab[j]#pasliste" algoitem="somme PREND_LA_VALEUR somme + tab[j]"/>
                <item code="14#finpour" algoitem="FIN_POUR"/>
            </item>
            <item code="205#somme" algoitem="RENVOYER somme"/>
            <item code="204#finfonction" algoitem="FIN_FONCTION"/>
        </item>
    </item>
    <item code="100#declarationsvariables" algoitem="VARIABLES">
        <item code="1#LISTE#tab" algoitem="tab EST_DU_TYPE LISTE"/>
        <item code="1#NOMBRE#i" algoitem="i EST_DU_TYPE NOMBRE"/>
        <item code="1#NOMBRE#n" algoitem="n EST_DU_TYPE NOMBRE"/>
        <item code="1#NOMBRE#somme" algoitem="somme EST_DU_TYPE NOMBRE"/>
        <item code="1#NOMBRE#masomme" algoitem="masomme EST_DU_TYPE NOMBRE"/>
        <item code="1#NOMBRE#j" algoitem="j EST_DU_TYPE NOMBRE"/>
    </item>
    <item code="101#debutalgo" algoitem="DEBUT_ALGORITHME">
        <item code="4#Saisissez un nombre :#0" algoitem="AFFICHER &quot;Saisissez un nombre :&quot;"/>
        <item code="2#n#pasliste" algoitem="LIRE n"/>
        <item code="5#masomme#Calcul_somme(n)#pasliste" algoitem="masomme PREND_LA_VALEUR Calcul_somme(n)"/>
        <item code="4#La somme des nombres de la liste est :#0" algoitem="AFFICHER &quot;La somme des nombres de la liste est :&quot;"/>
        <item code="2#masomme#pasliste" algoitem="LIRE masomme"/>
    </item>
    <item code="102#finalgo" algoitem="FIN_ALGORITHME"/>
</Algo>
