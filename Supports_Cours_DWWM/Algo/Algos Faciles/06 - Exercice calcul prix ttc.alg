<?xml version="1.0" encoding="UTF-8"?>
<Algo>
    <description texte="Calcul prix TTC sur plusieurs articles" courant="AFFICHER &quot; €&quot;"/>
    <extension extnom="inactif"/>
    <fonction fctcode="" fctetat="inactif"/>
    <F2 F2etat="inactif" F2lignes="" F2defaut="" F2para=""/>
    <repere repetat="inactif" repcode="-10#10#-10#10#2#2"/>
    <param nbDecimales="8" totalBoucles="5000000" arrondiAuto="vrai" maxBoucle="500000" totalAffichages="1000" epaisseurPoint="2" epaisseurLigne="2"/>
    <item algoitem="FONCTIONS_UTILISEES" code="200#declarationfonctions"/>
    <item algoitem="VARIABLES" code="100#declarationsvariables">
        <item algoitem="nb EST_DU_TYPE NOMBRE" code="1#NOMBRE#nb"/>
        <item algoitem="ttva EST_DU_TYPE NOMBRE" code="1#NOMBRE#ttva"/>
        <item algoitem="pttc EST_DU_TYPE NOMBRE" code="1#NOMBRE#pttc"/>
        <item algoitem="prixHT EST_DU_TYPE NOMBRE" code="1#NOMBRE#prixHT"/>
    </item>
    <item algoitem="DEBUT_ALGORITHME" code="101#debutalgo">
        <item algoitem="AFFICHER &quot;Entrez le prix hors taxes :&quot;" code="4#Entrez le prix hors taxes :#0"/>
        <item algoitem="LIRE prixHT" code="2#prixHT#pasliste"/>
        <item algoitem="AFFICHER &quot;Entrez le nombre d'articles&quot;" code="4#Entrez le nombre d'articles#0"/>
        <item algoitem="LIRE nb" code="2#nb#pasliste"/>
        <item algoitem="AFFICHER &quot;Entrez le taux de TVA :&quot;" code="4#Entrez le taux de TVA :#0"/>
        <item algoitem="LIRE ttva" code="2#ttva#pasliste"/>
        <item algoitem="//Calcul du prix ttc" code="19#Calcul du prix ttc"/>
        <item algoitem="//pttc PREND_LA_VALEUR nb * prixHT * ttva" code="19#pttc PREND_LA_VALEUR nb * prixHT * ttva"/>
        <item algoitem="pttc PREND_LA_VALEUR nb * prixHT * (1 + ttva)" code="5#pttc#nb * prixHT * (1 + ttva)#pasliste"/>
        <item algoitem="//Affichage du résultat" code="19#Affichage du résultat"/>
        <item algoitem="AFFICHER &quot;Le prix toutes taxes comprises est : &quot;" code="4#Le prix toutes taxes comprises est : #0"/>
        <item algoitem="AFFICHER pttc" code="3#pttc#0#pasliste"/>
        <item algoitem="AFFICHER &quot; €&quot;" code="4# €#0"/>
    </item>
    <item algoitem="FIN_ALGORITHME" code="102#finalgo"/>
</Algo>
