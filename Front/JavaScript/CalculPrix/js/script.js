function calculer_prix() {

    var error = 0;
    var messagaeError = "";

    // document.getElementById("prix1").value : récupération de la valeur du champs prix1
    // parseFloat() : convertir le champs en nombre
    var prix1 = document.getElementById("prix1").value;
    var prix2 = document.getElementById("prix2").value;
    var total = "";

    // masquer le bloque alerte
    document.getElementById("alerte").style.display = "none";

    // vérifier que le champs prix1 n'est poas vide
    if (prix1 == "") {
        // le champs prix1 est vide
        error = 1;
        messagaeError = messagaeError + "Saisir le prix 1!<br />";
    }
    if (prix2 == "") {
        error = 1;
        messagaeError = messagaeError + "Saisir le prix 2!<br />";
    }

    if (error == 1) {
        document.getElementById("alerte").innerHTML = messagaeError;
        document.getElementById("alerte").style.display = "block";
    } else {
        total = parseFloat(prix1) + parseFloat(prix2);
        alert("Le prix total est : " + total + " €");
        document.getElementById("total").value = total;
    }


}