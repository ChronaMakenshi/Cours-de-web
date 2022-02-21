// $(function() {
//     $('#aperçu').click(function(){ 
//       console.log('chargement en cours...');
//       var url = 'test1.json';
//       // Ici encore un exemple d'utilisation d'une fonction de CallBack passée en paramétre à la fonction JQuery : $.ajax()
//       $.ajax({
//         dataType: "json",
//         url: url,
//         success: function(donnees) {
//             console.log('les donnees du fichier :');
//             console.log(donnees);
//             $.each(donnees, function (index, d){
//               console.log('boucle : ' + index);
//               console.log(d);
//             });
//           },
//         error :function(jqXHR, textStatus, errorThrown) {
//             console.log("error ! " + textStatus + ' : '   + jqXHR.responseText);
//           }
//     });
//   });
// });

function Log() {
    const req = new XMLHttpRequest();
    const but = document.getElementById("postcode").value;
    req.onreadystatechange = function() {
        if (this.readyState === XMLHttpRequest.DONE) {
            var json = this.responseText;
            obj = JSON.parse(json);
            console.log(obj);
            document.getElementById('inputGroupSelect03').options.length = 0;
            for (var i = 0; i < obj.places.length; i++) {
                console.log(obj['places'][i]['place name']);
                var opt = document.createElement('OPTION');
                opt.value = i;
                opt.text = obj['places'][i]['place name'];
                try {
                    document.getElementById('inputGroupSelect03').add(opt, 1);
                } catch (e) {
                    document.getElementById('inputGroupSelect03').add(opt, null);
                }
            }
        } else {
            console.log("Status de la reponse: %d (%s)", this.status, this.statusText)
        }
    }
    req.open('GET', 'http://api.zippopotam.us/fr/' + but, true);
    req.send();
}