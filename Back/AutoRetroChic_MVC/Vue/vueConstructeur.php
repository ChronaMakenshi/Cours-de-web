<?php ob_start();?>


                <div class="lead vueConstructeur">
                    <div class="container">
                        <div class="row">
                            <?php
                            
                                echo'<div class="col-12 my-5">';
                                echo '<h2>'.$constructeur['nom_construct'].'</h2>';
                                echo'</div>';
                                echo'<div class="col-12 my-5">';
                                echo '<img class="img-fluid" src="./contenu/img/'.$constructeur['logo_construct'].'" alt='.$constructeur['logo_construct'].'></a>';
                                echo'</div>';
                                echo'<div class="col-12 col-md-6">';
                                echo '<img class="img-fluid" src="./contenu/img/'.$constructeur['img_construct'].'" alt='.$constructeur['img_construct'].'></a>';
                                echo'</div>';
                                echo'<div class="col-12 col-md-6">';
                                echo '<p>'.$constructeur['text_construct'].'</p>';
                                echo'</div>';
                                
                            ?>
                                       </div> <!-- ./row -->
                    </div> <!-- ./container -->
                </div> <!-- ./lead-->

<?php $contenu = ob_get_clean(); ?>

<?php require 'gabarit.php'; ?>