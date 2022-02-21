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

const inputs = document.querySelectorAll('input');

const patterns = {
  nom: /^[A-Za-z]{4,}/,
  prenom: /^[A-Za-z]{4,}/,
  email: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
};

inputs.forEach((input) => {
    if(input.type !== "date"){
        input.addEventListener("keyup", (e) => {
            validate(e.target, patterns[e.target.id]);
          });

    }
  
});

function validate(field, regex) {

  if (regex.test(field.value)) {
    field.className = 'form-control valid';
    field.style.borderColor = "green";
    field.nextElementSibling.textContent = "OK";
    field.nextElementSibling.style.color = "green";
  } else {
    field.className = 'form-control invalid';
    field.style.borderColor = "red";
    field.nextElementSibling.textContent = "Cette saisie n'est pas conforme";
    field.nextElementSibling.style.color = "red";
  }
}