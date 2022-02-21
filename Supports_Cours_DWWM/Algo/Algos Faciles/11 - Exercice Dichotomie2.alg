<?xml version="1.0" encoding="UTF-8"?>
<Algo>
    <description courant="FIN_SINON" texte=""/>
    <extension extnom="inactif"/>
    <fonction fctetat="inactif" fctcode=""/>
    <F2 F2lignes="" F2para="" F2defaut="" F2etat="inactif"/>
    <repere repetat="inactif" repcode="-10#10#-10#10#2#2"/>
    <param totalAffichages="1000" epaisseurLigne="2" nbDecimales="8" totalBoucles="5000000" epaisseurPoint="2" arrondiAuto="vrai" maxBoucle="500000"/>
    <item algoitem="FONCTIONS_UTILISEES" code="200#declarationfonctions"/>
    <item algoitem="VARIABLES" code="100#declarationsvariables">
        <item algoitem="Tab EST_DU_TYPE LISTE" code="1#LISTE#Tab"/>
        <item algoitem="min EST_DU_TYPE NOMBRE" code="1#NOMBRE#min"/>
        <item algoitem="max EST_DU_TYPE NOMBRE" code="1#NOMBRE#max"/>
        <item algoitem="milieu EST_DU_TYPE NOMBRE" code="1#NOMBRE#milieu"/>
        <item algoitem="x EST_DU_TYPE NOMBRE" code="1#NOMBRE#x"/>
        <item algoitem="trouve EST_DU_TYPE NOMBRE" code="1#NOMBRE#trouve"/>
    </item>
    <item algoitem="DEBUT_ALGORITHME" code="101#debutalgo">
        <item algoitem="Tab[0] PREND_LA_VALEUR -2" code="5#Tab#-2#0"/>
        <item algoitem="Tab[1] PREND_LA_VALEUR -1" code="5#Tab#-1#1"/>
        <item algoitem="Tab[2] PREND_LA_VALEUR 0" code="5#Tab#0#2"/>
        <item algoitem="Tab[3] PREND_LA_VALEUR 3" code="5#Tab#3#3"/>
        <item algoitem="Tab[4] PREND_LA_VALEUR 6" code="5#Tab#6#4"/>
        <item algoitem="Tab[5] PREND_LA_VALEUR 8" code="5#Tab#8#5"/>
        <item algoitem="Tab[6] PREND_LA_VALEUR 19" code="5#Tab#19#6"/>
        <item algoitem="Tab[7] PREND_LA_VALEUR 33" code="5#Tab#33#7"/>
        <item algoitem="Tab[8] PREND_LA_VALEUR 55" code="5#Tab#55#8"/>
        <item algoitem="trouve PREND_LA_VALEUR 0" code="5#trouve#0#pasliste"/>
        <item algoitem="min PREND_LA_VALEUR 0" code="5#min#0#pasliste"/>
        <item algoitem="max PREND_LA_VALEUR Tab.length - 1" code="5#max#Tab.length - 1#pasliste"/>
        <item algoitem="milieu PREND_LA_VALEUR floor((min+max)/2)" code="5#milieu#floor((min+max)/2)#pasliste"/>
        <item algoitem="LIRE x" code="2#x#pasliste"/>
        <item algoitem="TANT_QUE (trouve== 0 ET min &lt;= max) FAIRE" code="15#trouve== 0 ET min &lt;= max">
            <item algoitem="DEBUT_TANT_QUE" code="16#debuttantque"/>
            <item algoitem="SI (x == Tab[milieu]) ALORS" code="6#x == Tab[milieu]">
                <item algoitem="DEBUT_SI" code="7#debutsi"/>
                <item algoitem="trouve PREND_LA_VALEUR 1" code="5#trouve#1#pasliste"/>
                <item algoitem="FIN_SI" code="8#finsi"/>
                <item algoitem="SINON" code="9#sinon">
                    <item algoitem="DEBUT_SINON" code="10#debutsinon"/>
                    <item algoitem="SI (Tab[milieu] &lt; x) ALORS" code="6#Tab[milieu] &lt; x">
                        <item algoitem="DEBUT_SI" code="7#debutsi"/>
                        <item algoitem="min PREND_LA_VALEUR milieu+1" code="5#min#milieu+1#pasliste"/>
                        <item algoitem="FIN_SI" code="8#finsi"/>
                        <item algoitem="SINON" code="9#sinon">
                            <item algoitem="DEBUT_SINON" code="10#debutsinon"/>
                            <item algoitem="max PREND_LA_VALEUR milieu-1" code="5#max#milieu-1#pasliste"/>
                            <item algoitem="FIN_SINON" code="11#finsinon"/>
                        </item>
                    </item>
                    <item algoitem="FIN_SINON" code="11#finsinon"/>
                </item>
            </item>
            <item algoitem="milieu PREND_LA_VALEUR floor((min+max)/2)" code="5#milieu#floor((min+max)/2)#pasliste"/>
            <item algoitem="FIN_TANT_QUE" code="17#fintantque"/>
        </item>
        <item algoitem="SI (trouve==1) ALORS" code="6#trouve==1">
            <item algoitem="DEBUT_SI" code="7#debutsi"/>
            <item algoitem="AFFICHER &quot;la valeur de x est au rang :&quot;" code="4#la valeur de x est au rang :#0"/>
            <item algoitem="AFFICHER milieu" code="3#milieu#0#pasliste"/>
            <item algoitem="FIN_SI" code="8#finsi"/>
            <item algoitem="SINON" code="9#sinon">
                <item algoitem="DEBUT_SINON" code="10#debutsinon"/>
                <item algoitem="AFFICHER &quot;La valeur de x n'est pas dans ce tableau&quot;" code="4#La valeur de x n'est pas dans ce tableau#0"/>
                <item algoitem="FIN_SINON" code="11#finsinon"/>
            </item>
        </item>
    </item>
    <item algoitem="FIN_ALGORITHME" code="102#finalgo"/>
</Algo>
