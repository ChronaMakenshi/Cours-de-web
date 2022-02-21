
<?php ob_start(); ?>
                <h1>Bienvenue sur le site du club <br><span>Auto Rétro Chic</span></h1>
                <div class="lead">
                    <p>Dans les années 30 et 40, les constructeurs automobiles français allièrent à l’aérodynamisme de la carrosserie, l'esthétisme stylistique.</p>
                    <p>Au cours d'une trentaine d’années on était passé de la voiture à caisse carrée, dérivée du fiacre ou de la calèche, aux somptueuses carrosseries aux courbes et galbes voluptueux. L'élan dynamique et affiné des lignes se mariait à l'ondoiement et aux volutes des ailes, capots, habitacles et coffres.</p>
                    <p>Dès lors, Les profils s'étirent en mouvance féminine, les proues, parées de chromes, s'élargissent et se virilisent avec cette retenue tout à fait remarquable dans l’agressivité, les poupes s'abaissent et s’allongent, la ligne de fuite veut que l'auto colle à la route.
                    </p>
                    
                    <div class="container">
                        <div class="row voitures">
                            <div class="col-12 text-center">
                                <h2>Les derniers modèles...</h2>
                            </div>
                        <?php
                           // lecture des données les 3 dernières voitures
                           foreach ($voitures as $voiture):                               
                               echo '<div class="col-12 col-md-4"><a href="index.php?action=voiture&id='.$voiture['id'].'"><img class="img-fluid" src="./contenu/img/'.$voiture['image'].'" alt='.$voiture['modele'].'></a></div>';
                           endforeach;
                           
                           
                        ?>
                        </div><!-- ./row -->
                        <div class="row constructeur">
                            <div class="col-12 text-center">
                                <div class="col-12 text-center">
                                    <h2>Un constructeur, une marque, une histoire...</h2>
                                </div>
                        <?php
                            // lecture des données 1 constructeur aléatoire
                            foreach ($constructeur as $const):
                                echo'<div class="col-12">';
                                echo '<h3><a href="index.php?action=constructeur&id='.$const['id'].'">'.$const['nom'].'</a></h3>';
                                echo '<img class="img-fluid" src="./contenu/img/'.$const['logo'].'" alt='.$const['logo'].'>';
                                echo'</div>';
                            endforeach;
                            
                            
                        ?>
                        </div> <!-- ./row -->
                    </div> <!-- ./container -->
                    
                </div> <!-- ./lead -->
                
<?php $contenu = ob_get_clean(); ?>

<?php require 'gabarit.php'; ?>
