$(document).ready(function() {

    // affecter un évement onchange sur toutes les class="select_produit"
    $(".select_produit").change(function() {
        var montant_produit = $(this).val(); // récupération de la valeur du select
        // rechercher le class="text_montant" le plus proche et lui attribuer la valeur du select
        $(this).parent().parent().find(".text_montant").val(montant_produit);
        calculer_total(); // on recalcule le montant total
    });


    function calculer_total() {
        var montant_total = 0; // initilisation du montant total
        $(".text_montant").each(function() { // on parcours tous nos élements ayant pour class="text_montant"
            if ($(this).val() != "") {
                // incrémentation du montant total avec le value="" du text_montant 
                montant_total += parseFloat($(this).val());
            }
        });
        $("#total").val(montant_total);
    }

    $(".remove_produit").click(function() {
        console.log($("tbody tr").length);
        // S'il reste plus de 2 éléments on peut supprimer un élément sinon impossible et on en informe
        // l'utilisateur.
        if ($("tbody tr").length != 1) {
            // Valider la suppression
            if (confirm("Valider la suppression?")) {
                // l'utilisateur a validé la suppression
                $(this).parent().parent().remove(); // on supprime le <tr>
                calculer_total(); // on recalcule le montant total
            }
        } else {
            alert("Vous ne pouvez pas supprimer ce dernier élément !!!");
        }
    });

    // ajouter une ligne
    $("#bt-add").click(function() {
        // On sélectionne le contenu du premier tr du tbody et on en fait une copie dans une balise tr
        // puis, on met à vide les valeurs des champs select et input ...
        var html_ligne = "<tr>" + $("tbody tr").first().html() + "</tr>";
        $("tbody").prepend(html_ligne);
        $(".select_produit").first().val(""); // initialise la valeur du select ajouté à vide
        $(".text_montant").first().val(""); // initialise la valeur du text_montant ajouté à vide

        // affecter un événement onchange au dernier class="select_produit" ajouté qui est en première position
        $(".select_produit").first().change(function() {
            var montant_produit = $(this).val(); // récupération de la valeur du select

            // rechercher le class="text_montant" le plus proche et lui attribuer la valeur du select
            $(this).parent().parent().find(".text_montant").val(montant_produit);

            calculer_total(); // on recalcule le montant total
        });

        $(".remove_produit").first().click(function() {

            if ($("tbody tr").length != 1) {
                // Valider la suppression
                if (confirm("Valider la suppression?")) {
                    // l'utilisateur a validé la suppression
                    $(this).parent().parent().remove(); // on supprime le <tr>
                    calculer_total(); // on recalcule le montant total
                }
            } else {
                alert("Vous ne pouvez pas supprimer ce dernier élément !!!");
            }
        });
    });

});