<?xml version="1.0" encoding="UTF-8"?>
<Algo>
    <description courant="FIN_SINON" texte=""/>
    <extension extnom="inactif"/>
    <fonction fctcode="" fctetat="inactif"/>
    <F2 F2lignes="" F2etat="inactif" F2para="" F2defaut=""/>
    <repere repcode="-10#10#-10#10#2#2" repetat="inactif"/>
    <param epaisseurPoint="2" totalAffichages="1000" epaisseurLigne="2" totalBoucles="5000000" maxBoucle="500000" arrondiAuto="vrai" nbDecimales="8"/>
    <item algoitem="FONCTIONS_UTILISEES" code="200#declarationfonctions"/>
    <item algoitem="VARIABLES" code="100#declarationsvariables">
        <item algoitem="Texte EST_DU_TYPE CHAINE" code="1#CHAINE#Texte"/>
        <item algoitem="TexteCompresse EST_DU_TYPE CHAINE" code="1#CHAINE#TexteCompresse"/>
        <item algoitem="i EST_DU_TYPE NOMBRE" code="1#NOMBRE#i"/>
        <item algoitem="CarIdentique EST_DU_TYPE CHAINE" code="1#CHAINE#CarIdentique"/>
        <item algoitem="CarG EST_DU_TYPE CHAINE" code="1#CHAINE#CarG"/>
        <item algoitem="carD EST_DU_TYPE CHAINE" code="1#CHAINE#carD"/>
    </item>
    <item algoitem="DEBUT_ALGORITHME" code="101#debutalgo">
        <item algoitem="TexteCompresse PREND_LA_VALEUR &quot;&quot;" code="5#TexteCompresse#&quot;&quot;#pasliste"/>
        <item algoitem="AFFICHER &quot;Merci de fournir une chaine de caractères minuscules non accentués&quot;" code="4#Merci de fournir une chaine de caractères minuscules non accentués#0"/>
        <item algoitem="LIRE Texte" code="2#Texte#pasliste"/>
        <item algoitem="POUR i ALLANT_DE 0 A Texte.length-1" code="12#i#0#Texte.length-1">
            <item algoitem="DEBUT_POUR" code="13#debutpour"/>
            <item algoitem="SI (Texte.substr(i,1) != &quot; &quot;) ALORS" code="6#Texte.substr(i,1) != &quot; &quot;">
                <item algoitem="DEBUT_SI" code="7#debutsi"/>
                <item algoitem="TexteCompresse PREND_LA_VALEUR TexteCompresse + Texte.substr(i,1)" code="5#TexteCompresse#TexteCompresse + Texte.substr(i,1)#pasliste"/>
                <item algoitem="FIN_SI" code="8#finsi"/>
            </item>
            <item algoitem="FIN_POUR" code="14#finpour"/>
        </item>
        <item algoitem="i PREND_LA_VALEUR 0" code="5#i#0#pasliste"/>
        <item algoitem="CarIdentique PREND_LA_VALEUR &quot;1&quot;" code="5#CarIdentique#&quot;1&quot;#pasliste"/>
        <item algoitem="TANT_QUE ((i &lt; TexteCompresse.length - 1 - i) ET (CarIdentique==&quot;1&quot;)) FAIRE" code="15#(i &lt; TexteCompresse.length - 1 - i) ET (CarIdentique==&quot;1&quot;)">
            <item algoitem="DEBUT_TANT_QUE" code="16#debuttantque"/>
            <item algoitem="CarG PREND_LA_VALEUR TexteCompresse.substr(i,1)" code="5#CarG#TexteCompresse.substr(i,1)#pasliste"/>
            <item algoitem="carD PREND_LA_VALEUR TexteCompresse.substr(TexteCompresse.length-1-i,1)" code="5#carD#TexteCompresse.substr(TexteCompresse.length-1-i,1)#pasliste"/>
            <item algoitem="SI (TexteCompresse.substr(i,1)!=TexteCompresse.substr(TexteCompresse.length-1-i,1)) ALORS" code="6#TexteCompresse.substr(i,1)!=TexteCompresse.substr(TexteCompresse.length-1-i,1)">
                <item algoitem="DEBUT_SI" code="7#debutsi"/>
                <item algoitem="CarIdentique PREND_LA_VALEUR &quot;0&quot;" code="5#CarIdentique#&quot;0&quot;#pasliste"/>
                <item algoitem="FIN_SI" code="8#finsi"/>
                <item algoitem="SINON" code="9#sinon">
                    <item algoitem="DEBUT_SINON" code="10#debutsinon"/>
                    <item algoitem="i PREND_LA_VALEUR i+1" code="5#i#i+1#pasliste"/>
                    <item algoitem="FIN_SINON" code="11#finsinon"/>
                </item>
            </item>
            <item algoitem="FIN_TANT_QUE" code="17#fintantque"/>
        </item>
        <item algoitem="SI (CarIdentique==&quot;1&quot;) ALORS" code="6#CarIdentique==&quot;1&quot;">
            <item algoitem="DEBUT_SI" code="7#debutsi"/>
            <item algoitem="AFFICHER &quot;La chaine &quot;" code="4#La chaine #0"/>
            <item algoitem="AFFICHER Texte" code="3#Texte#0#pasliste"/>
            <item algoitem="AFFICHER &quot; est un palindrome&quot;" code="4# est un palindrome#1"/>
            <item algoitem="FIN_SI" code="8#finsi"/>
            <item algoitem="SINON" code="9#sinon">
                <item algoitem="DEBUT_SINON" code="10#debutsinon"/>
                <item algoitem="AFFICHER &quot;La chaine &quot;" code="4#La chaine #0"/>
                <item algoitem="AFFICHER Texte" code="3#Texte#0#pasliste"/>
                <item algoitem="AFFICHER &quot; n'est pas un palindrome&quot;" code="4# n'est pas un palindrome#1"/>
                <item algoitem="FIN_SINON" code="11#finsinon"/>
            </item>
        </item>
    </item>
    <item algoitem="FIN_ALGORITHME" code="102#finalgo"/>
</Algo>
