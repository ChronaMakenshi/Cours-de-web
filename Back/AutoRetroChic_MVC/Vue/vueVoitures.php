<?php ob_start();?>

                <h1>Bienvenue sur le site du club <br><span>Auto Rétro Chic</span></h1>
                <h2>La galerie des voitures</h2>
                <div class="lead vueVoiture">
                    <div class="container">
                        <div class="row">
                            <?php
                            
                                foreach ($voitures as $data):
                                    echo'<div class="col-12 col-md-4 mt-4 ">';
                                    //echo '<p><a href="constructeur.php?id='.$const['id'].'">'.$const['nom'].'</a></h3>';
                                    echo '<a href="index.php?action=voiture&id='.$data['id'].'" title="'.$data['modele'].'"><img class="img-fluid" src="./contenu/img/'.$data['img'].'" alt='.$data['modele'].'></a>';
                                    echo'</div>';
                                endforeach;
                                
                            ?>
                        </div> <!-- ./row -->
                    </div> <!-- ./container -->
                </div> <!-- ./lead-->

<?php $contenu = ob_get_clean();?>

<?php require 'gabarit.php'; ?>