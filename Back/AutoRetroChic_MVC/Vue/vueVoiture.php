<?php ob_start();?>


                <div class="lead vueVoiture">
                    <div class="container">
                        <div class="row">
                            <?php
                            
                                echo'<div class="col-12 my-5">';
                                echo '<h2>'.$voiture['modele_voiture'].'</h2>';
                                echo '<h3 >'.$voiture['dmc_voiture'].'</h3>';
                                echo'</div>';
                                echo'<div class="col-12 col-md-6">';
                                echo '<img class="img-fluid" src="./contenu/img/'.$voiture['img_voiture'].'" alt='.$voiture['modele_voiture'].'></a>';
                                echo'</div>';
                                echo'<div class="col-12 col-md-6">';
                                echo '<p>'.$voiture['text_voiture'].'</p>';
                                echo'</div>';
                                
                            ?>
                                       </div> <!-- ./row -->
                    </div> <!-- ./container -->
                </div> <!-- ./lead-->

<?php $contenu = ob_get_clean(); ?>

<?php require 'gabarit.php'; ?>