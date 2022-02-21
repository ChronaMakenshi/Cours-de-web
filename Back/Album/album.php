<!DOCTYPE html>
<?php
	function menu()
	{
		$base = "photos";
		$dir = $_SERVER["DOCUMENT_ROOT"].dirname($_SERVER["PHP_SELF"])."/$base";
		parcourir($dir, $base);

	}

	function parcourir ($dir, $uri)
	{
		// affiche le nom du dossier
		echo "<span class='monrep'><b>".basename($dir)."</b></span>";

		// augmente le retrait
		echo "<ul>";

		// parcourir tout le dossier
		$d = new DirectoryIterator($dir);

		foreach ($d as $file)
		{
			// l'entrée courante doit être oubliée
			if (!$file->isDot())
			{
				if($file->isDir())
				{
					// C'est un répertoire on descend d'un niveau
					$newdir = $file->getPathname();
					parcourir ($newdir, $uri."/".basename($newdir));

				}else{

					// C'est un fichier, on génère un lien
					$image = basename($file->getPathname());  // xxx.png
					$page = $_SERVER["PHP_SELF"]; // Ce script
					$url = $page . "?image=".$uri."/".$image; // Chaîne de requête

					$titre = titre_image($image); // supprime l'extension .png
					echo "<a href=\"$url\">$titre</a><br>";

				}
			}
		}

		echo "</ul>";
	}

	// 6 - Afin de ne pas afficher d'image si la chaîne de requête est vide :
	function contenu()
	{
		if (isset($_GET["image"]))
		{
			$uri = $_GET["image"];
			if ($uri =="" || !file_exists($uri))
				return;
			echo "<img src=\"$uri\">";
		}else{
			echo "Pas d'image";
		}
	}

	// 7 - La fonction titre_image(param) utilise pathinfo() pour retourner le nom du fichier sans l'extension :
	function titre_image($image)
	{
		$fileInfo = pathinfo($image);
		return $fileInfo['filename'];

		//return preg_replace("(\\.png)?|\\.gif)?|\\.jpg)?", "", $image);

	}

	// Du même coup la fonction legende() est très courte :
	function legende()
	{
		
		if(isset($_GET["image"]))
		{
			$uri = $_GET["image"];
			$legende = basename($uri);
			$legende = titre_image($legende);
			echo "<i class='malegende'>$legende</i>";
		}else{
			echo "Pas de Légende";
		}
	}
?>
<html>
<head>
	<title>Album Photo</title>
	<link href="css/bootstrap.css" rel="stylesheet" />
	<link rel="stylesheet" href="css/style.css"/>
	<link href="https://fonts.googleapis.com/css?family=Fredericka+the+Great" rel="stylesheet">
</head>
<body>
	<div class='MonTableau'>
	<h2>Mon Album d'Animaux</h2>
	<table border="0" width="600">
		<tr>
			<td colspan="2" align="center">	
			</td>
		</tr>
		<tr>
		 	<td valign="top">
		 		<?php menu(); ?>
		 	</td>
		 	<td valign="top">
		 		<div align="center" style="background-color: black;">
		 			<div style="border: 5px solid white;">
		 				<?php contenu(); ?>
		 			</div>
		 		<?php legende(); ?>
		 		</div>	
		 	</td>
		</tr>
	</table>
</div>
</body>
</html>