<?php
include 'config.php';

$stmt = $conn->prepare("SELECT * FROM personne WHERE id=".$_GET['id']);
$stmt->execute();
$records = $stmt->fetch();
?>
<!DOCTYPE html>
<html>
<head>
	<title>Page de Détail</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="css/bootstrap.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Fredericka+the+Great" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css"/> 
</head>
<body>
<div class='MonTableau' >
<h2>Détail de la Fiche Salarié</h2>
<table class='table table-bordered table-dark table-hover'>
 <tr>
    <td>Id</td>
    <td><input type='text' id='id' disabled value='<?php echo $records['id']; ?>'/></td>
</tr>
<tr>
    <td>Nom</td>
    <td><input type='text' id='nom' value='<?php echo $records['nom']; ?>'></td>
</tr>
<tr>
    <td>Prénom</td>
    <td><input type='text' id='prenom' value='<?php echo $records['prenom']; ?>'></td>
</tr>
<tr>
    <td>Téléphone</td>
    <td><input type='text' id='telephone' value='<?php echo $records['telephone']; ?>'></td>
</tr>
<tr>
    <td>Email</td>
    <td><input type='text' id='email' value='<?php echo $records['email']; ?>'></td>
</tr>
</table>
<a href="<?php echo $_SERVER['HTTP_REFERER']; ?>">Retour à la liste</a>
</div>	
</body>
</html>