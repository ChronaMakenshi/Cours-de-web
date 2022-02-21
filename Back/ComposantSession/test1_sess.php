<?php include "session.php"; 

if(!empty($_POST["message"]))
{
	$session->message = $_POST["message"];
}
?>
<!DOCTYPE html>
<html>
<head>
	<title>Test Session</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="css/bootstrap.css" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Fredericka+the+Great" rel="stylesheet">
	<link rel="stylesheet" href="css/style.css"/>
</head>
<body>
	<h2>Test Composant de Session</h2>
	<form method="post" action="test1_sess.php">
	<table class='table table-bordered table-dark table-hover'>
		<div class='form-group'>
			<tr>
				<td>
					<label for='message'>Votre message :</label>
				</td>
				<td>
					<input type="text" name="message" value="<?php if(!empty($_POST["message"])){echo $_POST['message']; }?>">
				</td>
				<td>
					<input type="submit" value="Envoyer">
				</td>
			</tr>
		</div>
	</table>
	<hr>
	<a href="test2_sess.php?monmessage=test">Page 2 du test</a>
</form>
</body>
</html>