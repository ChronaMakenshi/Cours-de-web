<?php ob_start();?>

                <h1>Bienvenue sur le site du club <br><span>Auto Rétro Chic</span></h1>
                <h2 class="my-5">La liste des constructeurs</h2>
                <div class="lead vueConstructeurs">
                    <div class="container">
                        <div class="row">
                            <?php
                            
                                foreach ($constructeurs as $const):
                                    echo'<div class="col-12 col-md-4">';
                                    //echo '<p><a href="constructeur.php?id='.$const['id'].'">'.$const['nom'].'</a></h3>';
                                    echo '<a href="index.php?action=constructeur&id='.$const['id'].'"><img class="img-fluid" src="./contenu/img/'.$const['logo'].'" alt='.$const['logo'].'></a>';
                                    echo'</div>';
                                endforeach;
                                
                            ?>
                        </div> <!-- ./row -->
                    </div> <!-- ./container -->
                </div> <!-- ./lead-->

<?php $contenu = ob_get_clean(); ?>

<?php require 'gabarit.php'; ?>