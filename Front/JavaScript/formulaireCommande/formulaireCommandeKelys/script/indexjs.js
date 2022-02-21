$(document).ready(function () {
    //fontion d'ajout des ligne et colone dans le tableau
    $("#ajoutprd").on("click", function () {
        $("#ligneajout:last").before("<tr id='ligneajout'><td><select size='1' class='select'><option disabled selected>- Sélectionner un produit -</option><option value=39>Tout Javascript</option><option value=45>Jquery</option><option value=57.5>PHP par la pratique</option><option value=69>Angular</option></select></td><td><input type='text' class='affiche' readonly></td><td><button type='button' class='btntrash'><span class='glyphicon glyphicon-trash'></span></button></td></tr>");
    })                               //cette ligne audessus est le même html que les lignes 23 à 31 
    //fontion de supression des lignes
    $("#myTable").on("click", ".btntrash", function () {
        if ($("tr").length > 3) {
            $(this).closest("tr").remove();
        }
        else{
            alert("Vous ne pouvez pas supprimer le dernier élément")
        }
        calcultt();
    })
    // fonction de changement des input en fontion des val du produit selectionné
    $("#myTable").on("change", ".select", function () {
        $(this).parent().parent().find(".affiche").val($(this).val() + " €");
        calcultt();
    })
    //fonction calcul du total
    function calcultt() {
        var total = 0
        $(".affiche").each(function () {
            if ($(this).val() != "") {
                total += parseFloat($(this).val())
            }
        })
        $(".total").val(total + " €")
    }
}) 