<?xml version="1.0" encoding="UTF-8"?>
<Algo>
    <description courant="FIN_SINON" texte=""/>
    <extension extnom="inactif"/>
    <fonction fctetat="inactif" fctcode=""/>
    <F2 F2etat="inactif" F2defaut="" F2lignes="" F2para=""/>
    <repere repcode="-10#10#-10#10#2#2" repetat="inactif"/>
    <param totalAffichages="1000" arrondiAuto="vrai" maxBoucle="500000" totalBoucles="5000000" epaisseurLigne="2" epaisseurPoint="2" nbDecimales="8"/>
    <item algoitem="FONCTIONS_UTILISEES" code="200#declarationfonctions"/>
    <item algoitem="VARIABLES" code="100#declarationsvariables">
        <item algoitem="machaine EST_DU_TYPE CHAINE" code="1#CHAINE#machaine"/>
        <item algoitem="machaineCompresse EST_DU_TYPE CHAINE" code="1#CHAINE#machaineCompresse"/>
        <item algoitem="CarIdentique EST_DU_TYPE CHAINE" code="1#CHAINE#CarIdentique"/>
        <item algoitem="i EST_DU_TYPE NOMBRE" code="1#NOMBRE#i"/>
        <item algoitem="chainemilieu EST_DU_TYPE NOMBRE" code="1#NOMBRE#chainemilieu"/>
        <item algoitem="carG EST_DU_TYPE CHAINE" code="1#CHAINE#carG"/>
        <item algoitem="carD EST_DU_TYPE CHAINE" code="1#CHAINE#carD"/>
    </item>
    <item algoitem="DEBUT_ALGORITHME" code="101#debutalgo">
        <item algoitem="machaineCompresse PREND_LA_VALEUR &quot;&quot;" code="5#machaineCompresse#&quot;&quot;#pasliste"/>
        <item algoitem="AFFICHER &quot;Merci de fournir une chaine de caractères minuscules non accentués&quot;" code="4#Merci de fournir une chaine de caractères minuscules non accentués#0"/>
        <item algoitem="LIRE machaine" code="2#machaine#pasliste"/>
        <item algoitem="POUR i ALLANT_DE 0 A machaine.length-1" code="12#i#0#machaine.length-1">
            <item algoitem="DEBUT_POUR" code="13#debutpour"/>
            <item algoitem="SI (machaine.substr(i,1) != &quot; &quot;) ALORS" code="6#machaine.substr(i,1) != &quot; &quot;">
                <item algoitem="DEBUT_SI" code="7#debutsi"/>
                <item algoitem="machaineCompresse PREND_LA_VALEUR machaineCompresse + machaine.substr(i,1)" code="5#machaineCompresse#machaineCompresse + machaine.substr(i,1)#pasliste"/>
                <item algoitem="FIN_SI" code="8#finsi"/>
            </item>
            <item algoitem="FIN_POUR" code="14#finpour"/>
        </item>
        <item algoitem="i PREND_LA_VALEUR 0" code="5#i#0#pasliste"/>
        <item algoitem="CarIdentique PREND_LA_VALEUR &quot;1&quot;" code="5#CarIdentique#&quot;1&quot;#pasliste"/>
        <item algoitem="chainemilieu PREND_LA_VALEUR floor((machaine.length)/2)" code="5#chainemilieu#floor((machaine.length)/2)#pasliste"/>
        <item algoitem="TANT_QUE ((i &lt;= chainemilieu) ET (CarIdentique==&quot;1&quot;)) FAIRE" code="15#(i &lt;= chainemilieu) ET (CarIdentique==&quot;1&quot;)">
            <item algoitem="DEBUT_TANT_QUE" code="16#debuttantque"/>
            <item algoitem="carG PREND_LA_VALEUR machaineCompresse.substr(i,1)" code="5#carG#machaineCompresse.substr(i,1)#pasliste"/>
            <item algoitem="carD PREND_LA_VALEUR machaineCompresse.substr(machaineCompresse.length-1-i,1)" code="5#carD#machaineCompresse.substr(machaineCompresse.length-1-i,1)#pasliste"/>
            <item algoitem="SI (carG != carD) ALORS" code="6#carG != carD">
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
            <item algoitem="AFFICHER machaine" code="3#machaine#0#pasliste"/>
            <item algoitem="AFFICHER &quot; est un palindrome&quot;" code="4# est un palindrome#1"/>
            <item algoitem="FIN_SI" code="8#finsi"/>
            <item algoitem="SINON" code="9#sinon">
                <item algoitem="DEBUT_SINON" code="10#debutsinon"/>
                <item algoitem="AFFICHER &quot;La chaine &quot;" code="4#La chaine #0"/>
                <item algoitem="AFFICHER machaine" code="3#machaine#0#pasliste"/>
                <item algoitem="AFFICHER &quot; n'est pas un palindrome&quot;" code="4# n'est pas un palindrome#1"/>
                <item algoitem="FIN_SINON" code="11#finsinon"/>
            </item>
        </item>
    </item>
    <item algoitem="FIN_ALGORITHME" code="102#finalgo"/>
</Algo>
