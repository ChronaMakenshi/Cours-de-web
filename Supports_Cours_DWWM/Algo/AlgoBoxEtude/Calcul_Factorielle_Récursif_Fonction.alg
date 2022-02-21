<?xml version="1.0" encoding="UTF-8"?>
<Algo>
    <description courant="AFFICHER resultat" texte="Calcul de la Factorielle d'un Nombre de façon récursive."/>
    <extension extnom="inactif"/>
    <fonction fctetat="actif" fctcode=""/>
    <F2 F2lignes="" F2defaut="" F2para="" F2etat="inactif"/>
    <repere repcode="-10#10#-10#10#2#2" repetat="inactif"/>
    <param maxBoucle="500000" epaisseurLigne="2" arrondiAuto="vrai" epaisseurPoint="2" totalBoucles="5000000" totalAffichages="1000" nbDecimales="8"/>
    <item code="200#declarationfonctions" algoitem="FONCTIONS_UTILISEES">
        <item code="201#factorielle#param" algoitem="FONCTION factorielle(param)">
            <item code="202#declarationsvariablesfonction" algoitem="VARIABLES_FONCTION"/>
            <item code="203#debutfonction" algoitem="DEBUT_FONCTION"/>
            <item code="6#param == 0" algoitem="SI (param == 0) ALORS">
                <item code="7#debutsi" algoitem="DEBUT_SI"/>
                <item code="205#1" algoitem="RENVOYER 1"/>
                <item code="8#finsi" algoitem="FIN_SI"/>
            </item>
            <item code="205#param*factorielle(param-1)" algoitem="RENVOYER param*factorielle(param-1)"/>
            <item code="204#finfonction" algoitem="FIN_FONCTION"/>
        </item>
    </item>
    <item code="100#declarationsvariables" algoitem="VARIABLES">
        <item code="1#NOMBRE#n" algoitem="n EST_DU_TYPE NOMBRE"/>
        <item code="1#NOMBRE#resultat" algoitem="resultat EST_DU_TYPE NOMBRE"/>
        <item code="1#CHAINE#monmessage" algoitem="monmessage EST_DU_TYPE CHAINE"/>
    </item>
    <item code="101#debutalgo" algoitem="DEBUT_ALGORITHME">
        <item code="2#n#pasliste" algoitem="LIRE n"/>
        <item code="5#resultat#factorielle(n)#pasliste" algoitem="resultat PREND_LA_VALEUR factorielle(n)"/>
        <item code="4#La Factorielle est :#0" algoitem="AFFICHER &quot;La Factorielle est :&quot;"/>
        <item code="3#resultat#0#pasliste" algoitem="AFFICHER resultat"/>
    </item>
    <item code="102#finalgo" algoitem="FIN_ALGORITHME"/>
</Algo>
