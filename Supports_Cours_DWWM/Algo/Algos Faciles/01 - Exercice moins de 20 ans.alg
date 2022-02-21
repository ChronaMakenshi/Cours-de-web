<?xml version="1.0" encoding="UTF-8"?>
<Algo>
    <description courant="AFFICHER &quot; personne(s) qui ont moins de 20 ans dans cet échantillon de 5 personnes&quot;" texte="Echantillon de 5 personnes qui donnent leur age au clavier. Si leur age est &lt; 20 ans ont les comptabilise."/>
    <extension extnom="inactif"/>
    <fonction fctetat="inactif" fctcode=""/>
    <F2 F2para="" F2lignes="" F2etat="inactif" F2defaut=""/>
    <repere repcode="-10#10#-10#10#2#2" repetat="inactif"/>
    <param totalAffichages="1000" epaisseurLigne="2" arrondiAuto="vrai" maxBoucle="500000" nbDecimales="8" epaisseurPoint="2" totalBoucles="5000000"/>
    <item algoitem="FONCTIONS_UTILISEES" code="200#declarationfonctions"/>
    <item algoitem="VARIABLES" code="100#declarationsvariables">
        <item algoitem="n EST_DU_TYPE NOMBRE" code="1#NOMBRE#n"/>
        <item algoitem="c EST_DU_TYPE NOMBRE" code="1#NOMBRE#c"/>
        <item algoitem="x EST_DU_TYPE NOMBRE" code="1#NOMBRE#x"/>
    </item>
    <item algoitem="DEBUT_ALGORITHME" code="101#debutalgo">
        <item algoitem="x PREND_LA_VALEUR 0" code="5#x#0#pasliste"/>
        <item algoitem="n PREND_LA_VALEUR 0" code="5#n#0#pasliste"/>
        <item algoitem="TANT_QUE (x&lt;5) FAIRE" code="15#x&lt;5">
            <item algoitem="DEBUT_TANT_QUE" code="16#debuttantque"/>
            <item algoitem="AFFICHER &quot;Entrez votre age :&quot;" code="4#Entrez votre age :#0"/>
            <item algoitem="LIRE n" code="2#n#pasliste"/>
            <item algoitem="x PREND_LA_VALEUR x+1" code="5#x#x+1#pasliste"/>
            <item algoitem="SI (n&lt;20) ALORS" code="6#n&lt;20">
                <item algoitem="DEBUT_SI" code="7#debutsi"/>
                <item algoitem="c PREND_LA_VALEUR c +1" code="5#c#c +1#pasliste"/>
                <item algoitem="FIN_SI" code="8#finsi"/>
            </item>
            <item algoitem="FIN_TANT_QUE" code="17#fintantque"/>
        </item>
        <item algoitem="AFFICHER &quot;Il y a &quot;" code="4#Il y a #0"/>
        <item algoitem="AFFICHER c" code="3#c#0#pasliste"/>
        <item algoitem="AFFICHER &quot; personne(s) qui ont moins de 20 ans dans cet échantillon de 5 personnes&quot;" code="4# personne(s) qui ont moins de 20 ans dans cet échantillon de 5 personnes#0"/>
    </item>
    <item algoitem="FIN_ALGORITHME" code="102#finalgo"/>
</Algo>
