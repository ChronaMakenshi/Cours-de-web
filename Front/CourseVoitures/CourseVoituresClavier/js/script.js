window.addEventListener("load", function() {

    var Voiture = function(x, y, img) {
        this.x = x;
        this.y = y;
        this.dessiner(x, y, img);
    };
    var reset = document.getElementById("reset");
    var play = document.getElementById("play");
    var timer = document.getElementById("decompte");
    var troisdeuxun = 3;
    var stopdte = null;
    var winj1 = document.getElementById("winj1");
    var winj2 = document.getElementById("winj2");

    reset.addEventListener("click", function() { location.reload() });
    play.addEventListener("click", chrono);
    play.addEventListener("click", repeat);


    function repeat() {
        stopdte = setInterval(chrono, 1000);
        play.style.visibility = "hidden";
    }


    function chrono() {
        for (var i = 0; i < 1; i++) {
            timer.innerHTML = troisdeuxun--;
        }
        if (timer.innerHTML == (-1)) {
            timer.style.visibility = "hidden";
            clearInterval(stopdte);
            document.addEventListener("keyup", DeplacerAgauche);

            function DeplacerAgauche(e) {

                var vroumVroumPouet = document.getElementsByClassName('vroumVroum')[0];
                var VroumvroumPouet = document.getElementsByClassName("vroumVroum")[1];

                if (e.keyCode == "A".charCodeAt(0)) {
                    vroumVroumPouet.style.left = parseInt(vroumVroumPouet.style.left) - 65 + "px";
                    console.log(vroumVroumPouet.style.left);
                    arriver();
                } else if (e.keyCode == "P".charCodeAt(0)) {
                    VroumvroumPouet.style.left = parseInt(VroumvroumPouet.style.left) - 65 + "px";
                    console.log(VroumvroumPouet.style.left);
                    arriver();
                }
            }

            function arriver() {

                var vroumVroumPouet = document.getElementsByClassName('vroumVroum')[0];
                var VroumvroumPouet = document.getElementsByClassName("vroumVroum")[1];

                if (vroumVroumPouet.style.left === 98 + "px") {
                    winj1.style.visibility = "visible";
                    winj2.style.visibility = "hidden";
                    document.removeEventListener("keyup", DeplacerAgauche);
                } else if (VroumvroumPouet.style.left === 98 + "px") {
                    winj1.style.visibility = "hidden";
                    winj2.style.visibility = "visible";
                    document.removeEventListener("keyup", DeplacerAgauche);
                }

            }

        }
    }

    Voiture.prototype.dessiner = function(x, y, img, ) {
        var circuit = document.getElementById("tyty");
        var newcar = document.createElement("img");
        circuit.appendChild(newcar);
        newcar.setAttribute("src", img);
        newcar.setAttribute("class", "vroumVroum")
        newcar.style.position = "absolute";
        newcar.style.top = x + "px";
        newcar.style.left = y + "px";
        newcar.style.width = "250" + "px";
    }
    var car1 = new Voiture(145, 2178, "./img/car1.png");
    var car2 = new Voiture(390, 2178, "./img/car2.png");

});