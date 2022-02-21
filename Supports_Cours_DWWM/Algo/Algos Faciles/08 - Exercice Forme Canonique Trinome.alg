<?xml version="1.0" encoding="UTF-8"?>
<Algo>
    <description courant="AFFICHER beta" texte="Algorithme permettant d'écrire la forme canonique d'un trinôme du second degré ax²+bx+c (a non nul)."/>
    <extension extnom="inactif"/>
    <fonction fctetat="inactif" fctcode=""/>
    <F2 F2lignes="" F2etat="inactif" F2para="" F2defaut=""/>
    <repere repcode="-10#10#-10#10#2#2" repetat="inactif"/>
    <param epaisseurLigne="2" totalAffichages="1000" totalBoucles="5000000" arrondiAuto="vrai" nbDecimales="8" maxBoucle="500000" epaisseurPoint="2"/>
    <item algoitem="FONCTIONS_UTILISEES" code="200#declarationfonctions"/>
    <item algoitem="VARIABLES" code="100#declarationsvariables">
        <item algoitem="a EST_DU_TYPE NOMBRE" code="1#NOMBRE#a"/>
        <item algoitem="b EST_DU_TYPE NOMBRE" code="1#NOMBRE#b"/>
        <item algoitem="c EST_DU_TYPE NOMBRE" code="1#NOMBRE#c"/>
        <item algoitem="alpha EST_DU_TYPE NOMBRE" code="1#NOMBRE#alpha"/>
        <item algoitem="beta EST_DU_TYPE NOMBRE" code="1#NOMBRE#beta"/>
    </item>
    <item algoitem="DEBUT_ALGORITHME" code="101#debutalgo">
        <item algoitem="AFFICHER &quot;Soit un trinôme du second degré ax²+bx+c.&quot;" code="4#Soit un trinôme du second degré ax²+bx+c.#1"/>
        <item algoitem="AFFICHER &quot;Donner la valeur de a (a non nul) : &quot;" code="4#Donner la valeur de a (a non nul) : #0"/>
        <item algoitem="LIRE a" code="2#a#pasliste"/>
        <item algoitem="AFFICHER a" code="3#a#1#pasliste"/>
        <item algoitem="AFFICHER &quot;Donner la valeur de b : &quot;" code="4#Donner la valeur de b : #0"/>
        <item algoitem="LIRE b" code="2#b#pasliste"/>
        <item algoitem="AFFICHER b" code="3#b#1#pasliste"/>
        <item algoitem="AFFICHER &quot;Donner la valeur de c : &quot;" code="4#Donner la valeur de c : #0"/>
        <item algoitem="LIRE c" code="2#c#pasliste"/>
        <item algoitem="AFFICHER c" code="3#c#1#pasliste"/>
        <item algoitem="alpha PREND_LA_VALEUR -b/(2*a)" code="5#alpha#-b/(2*a)#pasliste"/>
        <item algoitem="beta PREND_LA_VALEUR (-pow(b,2)+4*a*c)/(4*a)" code="5#beta#(-pow(b,2)+4*a*c)/(4*a)#pasliste"/>
        <item algoitem="AFFICHER &quot;La forme canonique est a(x-alpha)²+beta avec :&quot;" code="4#La forme canonique est a(x-alpha)²+beta avec :#1"/>
        <item algoitem="AFFICHER &quot;alpha = &quot;" code="4#alpha = #0"/>
        <item algoitem="AFFICHER alpha" code="3#alpha#1#pasliste"/>
        <item algoitem="AFFICHER &quot;beta = &quot;" code="4#beta = #0"/>
        <item algoitem="AFFICHER beta" code="3#beta#0#pasliste"/>
    </item>
    <item algoitem="FIN_ALGORITHME" code="102#finalgo"/>
</Algo>
