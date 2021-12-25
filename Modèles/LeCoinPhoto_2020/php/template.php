<?php require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/bdd/bdd.php");?>

<!DOCTYPE html>
<html>
    <head>
        <!-- Icone du site dans le navigateur -->
        <link rel="icon" type="image/png" href="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/img/lcpLogo.png"/>
        <meta charset="utf-8"/>
        <!-- Lien avec le CSS -->
        <link rel="stylesheet" type="text/css" href="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/css/style<?= $style;?>.css"/>
        <script type="text/javascript" src="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/js/<?=$js?>.js"></script>
        <!-- Titre du site dans le navigateur-->
        <title>Le coin photo <?= $title;?></title>
        
        <div id="titre">
            <img src="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/img/lcpLogo2.png" alt="Le coin photo" title="Le coin photo, vendeur de matériel photo" onclick="location.href='/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/index.php'">
        </div>



        <!-- Barre de navigation -->
        <div class="navbar">
            <a href="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/index.php" <?=@$btnAccueil?>><p>ACCUEIL</p></a>

        <?php 

        $reponse=getCategories();
       
        if($reponse!=null)
        {
            while ($donnees = $reponse->fetch() )//Va tout parcourir tant que aucune erreur ou pas terminé
            { 
                $cat=$donnees['categorie']; ?>
                <a href="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/produits.php?cat=<?=$cat?>" <?=@${"btn".$cat};?>><p><?=strtoupper($cat)?></p></a>
                
                <?php 
            }		 
            $reponse->closeCursor();
        } ?>
   

        <a href="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/contact.php" <?=@$btnContact?>><p>CONTACT</p></a>
            
        <!--En fonction de la session, afficher Se connecter ou Mon panier-->
        <?php 
        if (isset($_SESSION['profil']['login']))//si deja connecté. 
        { ?>

            <a href="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/panier.php"><img src="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/img/cart.png" class="icon2" title="MON PANIER"></a>
            <a href="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/profil.php"><img src="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/img/user.png" class="icon2" title="MON PROFIL"></a> 
            Bonjour, <?=$_SESSION['profil']['nom'];?>          
            
        <?php
        }
        else{
        ?>
           <a href="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/connexion.php"><img src="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/img/user.png" class="icon2" title="SE CONNECTER"></a>

        <?php
        }
        ?>       
           
        </div>
    </head>



    <body>
        <div class="box">

            <!-- Zone de navigation sur la gauche -->
            <div class="pagegauche">
                <div class="navbar2">
                    <a href="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/index.php" <?=@$btnAccueil?>><img src="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/img/home.png" class="icon" alt="accueil" title="accueil"><br></a><br>
                   
                   <?php
                    $reponse=getCategories();

                    if($reponse!=null)
                    {
                        while ($donnees = $reponse->fetch() )//Va tout parcourir tant que aucune erreur ou pas terminé
                        { 
                            $cat=$donnees['categorie']; 
                            $icon=$donnees['icone'];?>
                            <a href="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/produits.php?cat=<?=$cat?>" <?=@${"btn".$cat}?> ><img src="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/img/<?=$icon?>" class="icon" alt="<?=$cat?>" title="<?=$cat?>" onerror="this.onerror=null; this.src='/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/img/blankWhite.png'" ><br></a><br>
                
                        <?php 
                        } 
                        $reponse->closeCursor();
                    } ?>


                    <a href="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/contact.php" <?=@$btnContact?>><img src="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/img/mail.png" class="icon" alt="contact" title="contact"><br></a>
                </div>
            </div>


<?=$content;//Contiendra la partie du milieu, propre à chaque page?>


    </body>

    <footer>
        <div id="container">
            <div id="footerAdresses" class="colonneFooter">
                <br><img src="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/img/leCoinPhoto.png" alt="Le coin photo" title="Le coin photo, vendeur de matériel photo">
                <p style="font-size: 0.8em;"> Avenue du parc<br>95000, Cergy, France
                </p>
                <p style="font-size: 0.8em;">Tel : 01 61 61 61 61</p>
                <p style="font-size: 0.8em;">Mail : lecoinphoto@gmail.com</p>
            </div>

            <div id="footerLinks" class="colonneFooter">
                <h5>Liens utiles</h5>
                <hr size="1" width="100%" color="white">  
                <a href="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/index.php">Accueil</a>

                <?php
                $reponse=getCategories();
       
                if($reponse!=null)
                {
                    while ($donnees = $reponse->fetch() )//Va tout parcourir tant que aucune erreur ou pas terminé
                    { 
                        $cat=$donnees['categorie']; ?>
                        <a href="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/produits.php?cat=<?=$cat?>" <?=@${"btn".$cat};?>><p>Nos <?=$cat?></p></a>
                        
                        <?php 
                    }		 
                    $reponse->closeCursor();
                } ?>


                <a href="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/contact.php"><p>Nous contacter</p></a>
                
            </div>

            <div id="footerConditions" class="colonneFooter">
                <h5>Conditions</h5>
                <hr size="1" width="100%" color="white"> 
                <a href="#"><p>Nos formules</p></a>
                <a href="#"><p>Conditions générales de vente</p></a>
                <a href="#"><p>Politique de confidentialité</p></a>
                <a href="#"><p>Politique de cookies</p></a>
                <a href="#"><p>FAQ</p></a>
                </ul>

            </div>
        </div>
        <div class="mention">
            <h5 id="mentions">&copy; 2021 Le Coin Photo by 
            <a href="mailto:agoussalyo@eisti.eu" title="Envoyer un mail">Youssef AGOUSSAL</a> &amp; <a href="mailto:clipetluca@eisti.eu" title="Envoyer un mail">Lucas CLIPET</a> 
            , Webmasters CY TECH - ING1GI01</h5>
        </div>
    </footer>
</html> 