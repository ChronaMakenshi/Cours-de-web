<!DOCTYPE html>
<html>
<head>
	<title>Table de Multiplication</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="css/bootstrap.css" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Fredericka+the+Great" rel="stylesheet">
	<link rel="stylesheet" href="css/style.css"/>
</head>
<body>
	<h2>Une table de multiplication</h2>
	<table border="1" width="90%" class='table table-bordered table-dark'>
		<?php for ($i=1; $i<=10; $i++) { ?>
			<tr <?php if ($i==1) echo "bgcolor=#F50EB6"; ?>>
				<?php for($j=1; $j<=10; $j++) { ?>
					<td <?php if($j==1) echo "bgcolor=#F50EB6" ; ?> align="center">
						<?php echo $i*$j; ?>
					</td>
				<?php } ?>
			</tr>
		<?php } ?>
	</table>
</body>
</html>	