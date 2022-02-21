  // Example starter JavaScript for disabling form submissions if there are invalid fields
  (function () {
    'use strict'

    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.querySelectorAll('.needs-validation')

    // Loop over them and prevent submission
    Array.prototype.slice.call(forms)
        .forEach(function (form) {
            form.addEventListener('submit', function (e) {
                if (!form.checkValidity()) {
                    e.preventDefault()
                    e.stopPropagation()
                }
                // La classe was-validated permet d'activer l'apparition des messages relatifs 
                // aux classes valid_feedback et invalid-feedback
                form.classList.add('was-validated')
            }, false)
        })
})()

$(document).ready(function () {

    $("#nom").on("keyup", function () {

        $(this).val($(this).val().toUpperCase());

    });

    $("#prenom").on("keyup", function () {

        $(this).val($(this).val().charAt(0).toUpperCase() + $(this).val().substr(1).toLowerCase());

    });
});