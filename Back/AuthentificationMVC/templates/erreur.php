
<?php ob_start() ?>
<p><strong>Une erreur est survenue : </strong><span id="messageexception"><?= $msgErreur ?></span></p>
<?php echo "<a href='.\index.php' >Retour à la page de connexion</a>" ?>
<?php $content = ob_get_clean(); 
include "baselayout.php";
?>
