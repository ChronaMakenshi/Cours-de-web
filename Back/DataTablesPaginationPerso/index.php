<!doctype html>
<html>
<head>
    <title>Datatable AJAX Pagination</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- Datatable CSS -->
    <link href='DataTables/datatables.css' rel='stylesheet' type='text/css'>

    <!-- jQuery Library -->
    <script src="jquery-3.3.1.min.js"></script>

    <!-- Datatable JS -->
    <script src="DataTables/datatables.min.js"></script>

    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Fredericka+the+Great" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css"/> 
</head>
<body >

    <div class='MonTableau'>
        <h2 align="center">DataTable et Pagination</h2>
        <!-- Table -->
        <table id='monTableau' class='display dataTable'>
            <thead>
                <tr>
                    <th>Nom Salarié</th>
                    <th>Prénom Salarié</th>
                    <th>Téléphone</th>
                    <th>Email</th>
                </tr>
            </thead>
        </table>
    </div>
    <script>
        $(document).ready(function(){
            $('#monTableau').DataTable({
                'processing': true,
                'serverSide': true,
                'serverMethod': 'post',
                'ajax': {
                    'url':'ajaxfile.php'
                },
                "dom": "lftip",
                "lengthMenu":[5,10,15,20,25],

                "pageLength": 10,
                "language": {
                    "sProcessing": "Traitement en cours ...",
                    "sLengthMenu": "Afficher _MENU_ lignes",
                    "sZeroRecords": "Aucun résultat trouvé",
                    "sEmptyTable": "Aucune donnée disponible",
                    "sInfo": "Lignes _START_ à _END_ sur _TOTAL_",
                    "sInfoEmpty": "Aucune ligne affichée",
                    "sInfoFiltered": "(Filtrer un maximum de_MAX_)",
                    "sInfoPostFix": "",
                    "sSearch": "Chercher:",
                    "sUrl": "",
                    "sInfoThousands": ",",
                    "sLoadingRecords": "Chargement...",
                    "oPaginate": {
                      "sFirst": "Premier", "sLast": "Dernier", "sNext": "Suivant", "sPrevious": "Précédent"
                  },
                  "oAria": {
                      "sSortAscending": ": Trier par ordre croissant", "sSortDescending": ": Trier par ordre décroissant"
                  }
              },
              'columns': [
              { data: 'nom' },
              { data: 'prenom' },
              { data: 'telephone' },
              { data: 'email' }
              ]
          });
        });
    </script>
</body>
</html>
