<?php
session_start();
require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/bdd/bdd.php"); //Pour les fcts de BDD

if (!isset($_SESSION['erreurAchat']) ) 
{
	$_SESSION['erreurAchat']="";//Affiche une erreur de connexion
}


$style="Produits";//Partie du nom du fichier CSS (styleXXX.css par défaut)
$js="produits";



//En fonction de la catégorie et du nombre de produits, afficher :

if (!isset($_GET['cat']) )
{
	header('Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/index.php'); //Si pas de parametre (cad URL modifiée manuellement)
}
else
{
    $atrouve=false;
    $reponse=getCategories();
       
    if($reponse!=null)
    {
        while ($donnees = $reponse->fetch() )//Va tout parcourir tant que aucune erreur ou pas terminé
        { 
            $cat=$donnees['categorie']; 
            
            if ($_GET['cat']==$cat){

                $type=$cat;

                $title="- Nos ".$cat;
                $titreSection="NOS ".strtoupper($cat);    
                ${"btn".$cat}='class="btnclick"';

                $atrouve=true;    
            }
        }		 
        $reponse->closeCursor();
    }
    
    if(!$atrouve){
        header('Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/index.php');//Si le parametre existe mais ne correspond pas à une categorie, ou bien si on a une erreur de BDD
    }
  
}



ob_start(); //Mettre ici toute la vue qui est spécifique à cette page, donc non comprise dans le template ?>

<!-- Zone de navigation sur la droite-->
<div class="pagedroite">

<div class="bloc">

    <div class="titresection"><p><?=$titreSection?></p></div><br> 
    <?=$_SESSION['erreurAchat']; //Affiche une éventuelle erreur de la mise au panier
    $_SESSION['erreurAchat']="";//Puis efface l'erreur pour les prochains passages
    

    if ( isset($_SESSION['profil']['login']) && $_SESSION['profil']['statut']=="admin"){ ?>
        <button class="boutonStock" name="answer" value="Show Div" onclick="showDiv()">Stock</button>
    <?php }
    ?>
    

    <div class="blocProduits">

        <?php //Affichage qui s'adapte au nombre de produits présents dans le fichier, + s'adapte à la catégorie choisie
       
        $i=0; //Utile pour notre fonction moins et plus

  
        $reponse=getProduits($type);

        if($reponse!=null)
        {    while ($donnees = $reponse->fetch() )//Va tout parcourir tant que aucune erreur ou pas terminé
            {

            //Pour chaque produit, on recupere les données dans la BDD
                $imgSrc=$donnees['image'];
                $produitNom=$donnees['nom'];
                $produitDescription=$donnees['description'];
                $produitPrix=$donnees['prix'];
                $produitStock=$donnees['stock']; 
                $ref=$donnees['reference']; 
                ?>

    


                
                <div class="blocProduit">
                        <br><img class="imageProduit" src="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/img/<?=$imgSrc?>" alt=<?=$produitNom?> onerror="this.onerror=null; this.src='/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/img/blank.png'" ><br><br>
                        <p><b><?=$produitNom?></b></p>
                        <div class="texteProduit">
                            <p><?=$produitDescription?></p>
                        </div> <?php

                        if ($produitStock==0) { //Si stock écoulé ?>
                            <strong> INDISPONIBLE</strong>, pour le moment
                            <div style="display:none;" class="affichageStock">
                            Stock : <?=$produitStock?> <br><br>
                            <input type="hidden" class="form-control">
                            </div>
                        <?php
                        }
                        else{ ?>

                            <div class="prixProduit"><p><?=$produitPrix?> €</p></div>
                            <div style="display:none;" class="affichageStock">
                                Stock : <?=$produitStock?> <br><br>
                            </div>
                            
                            <?php if (isset($_SESSION['profil']['login'])) //Si connecté, on peut afficher la mise au panier
                            {?>
                            <div class=stock>   
                                <form  name="Form" class="form" method='POST' onsubmit="return envoyer(<?=$i?>)" action='/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/php/addProduit.php'>

                                    <button class="moins" onclick="moins(<?=$i?>)" type="button"> - </button>
                                    <input type="number" name="quantite" min="1" max="<?=$produitStock?>" value="1" class="form-control" readonly>
                                    <button class="plus" onclick="plus(<?=$i?>)" type="button"> + </button><br><br>
                                    <input type="hidden" name="REF" value="<?=$ref?>">
                            </div>
                                    <input class="boutonAcheter" type="submit" name="addProduit" value="Ajouter au panier" onclick='alert("Ajouté au panier");'/>
                                
                                </form>
                            <?php
                            } 

                        }
                        ?>

                    </div>
                    <?php
                    if(($i+1)%3==0){ //Correspond au nb de produits qu'on veut par ligne
                    ?>
            </div>

            <div class="blocProduits">      

                    <?php
                    }
                $i++;
            } 
            $reponse->closeCursor(); 
            }
            else{
                echo "Aucun produit de cette catégorie n'est disponible à l'achat";
            } ?>
            
        </div><br>
                
    </div> 
</div>       
</div>

<?php $content=ob_get_clean(); // Tout ce qui est entre ob_start et ob_get_clean est l'équivalent d'un grand texte mis dans une variable, ici $content. 


if ($atrouve){ //Si le GET est valide, on affiche la page
    require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/php/template.php");
}

?>