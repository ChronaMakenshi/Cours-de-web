$(document).ready(function() {
    var map = undefined;

    $("#liste").hide();
    $("#div").hide();

    $("#chercher").on("keyup", function() {
        ajaxPays($(this).val());
    });

    $("#chercher").on("focus", function() {
        $("#div").hide();
        $("#chercher").val("");

    });

    $("#ok").on("click", function() {
        $("#div").show();
        //ajaxDetail($(this).val());
    });

    function ajaxPays(mot) {
        console.clear();
        console.log("Mot saisi : " + mot);

        $.ajax({
            url: "pays.json",
            type: 'GET',
            dataType: 'json',
            // Paramétre success de retour qui est exécuté lorsque la requête Ajax est une réussite
            success: function(monjson) {
                var html = "";
                monjson.forEach(element => {
                    var position = element.nom_fr_fr.toUpperCase().search(mot.toUpperCase());
                    if (position !== -1) {

                        //html += "<li id='" + element.id + "'>" + element.nom_fr_fr + element.alpha2 + "</li><br>";
                        html += "<li id='" + element.alpha2 + "'>" + element.nom_fr_fr + "</li><br>";

                    }

                });

                $("#liste").show();
                $("#liste").empty();
                $("#liste").append(html);
            },
            // Paramétre error de retour qui est exécuté lorsqu'il y a une erreur 
            error: function(resultat, statut, erreur) {
                console.log(resultat.statusText);
                erreur = alert("Il y a eu un problème avec votre requête Ajax !!!");
            },

            complete: function(resultat, statut) {
                //console.log(resultat.responseJSON);
            }

        })
    }

    $("#liste").on("click", "li", function(e) {
        $("#chercher").val($(this).html());
        $("#liste").hide();
        ajaxDetail(e.target.id);
    });


    function ajaxDetail(truc) {

        var code = truc;
        //var code = $("#chercher").val().substr(-2);
        $.ajax({
            url: "https://restcountries.eu/rest/v2/alpha?codes=" + code,
            type: 'GET',
            dataType: 'json',
            success: function(response, code) {
                console.log(map);
                var html = "";
                response.forEach(element => {
                    html += "<li id=' '>" + element.capital + "<br>" + element.region + "<br>" + element.subregion + "<br>" + element.population + "<br>" + "<img src = '" + element.flag + "' width=250px>" + "<br>" + element.currencies[0].name + "</li><br>";
                    var lat = element.latlng[0];
                    var lng = element.latlng[1];

                    console.log(lat);
                    var key = 'b33be33843627a';
                    var streets = L.tileLayer.Unwired({ key: key, scheme: "streets" });

                    if (map == undefined) {
                        map = L.map('map', {
                            center: [lat, lng],
                            zoom: 5,
                            layers: [streets]
                        });

                        L.control.scale().addTo(map);
                        L.control.layers({
                            "Streets": streets
                        }).addTo(map);
                    } else {
                        map.setView([lat, lng], 5);
                    }

                    var marker = L.marker([lat, lng], { title: "Mon Marker" }).addTo(map);
                    var popup = marker.bindPopup('<b>Vous êtes ici</b><br />');

                });

                $("#plop").empty();
                $("#plop").append(html);
            }
        });

    }
});