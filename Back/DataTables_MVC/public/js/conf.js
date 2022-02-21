jQuery(document).ready(function () {
    $('#table_id').DataTable({
        "language": {
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/French.json"
        }
    });

    $(".ligne").on("click", "#suppr", function () {
        console.log("toto");
        $id = $(this).parent().siblings("#id")[0].innerText;
        $name = $(this).parent().siblings("#nom")[0].innerText;
        $prenom = $(this).parent().siblings("#prenom")[0].innerText;
        $message = "Voulez-vous supprimer " + $prenom + " " + $name + " ?";
        if (confirm($message)) {
            window.location.replace("index.php?action=suppr&id=" + $id);
        }
    })
});
