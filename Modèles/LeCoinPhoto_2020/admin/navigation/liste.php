<?php
session_start();
require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/bdd/bdd.php");

$title="- section Admin";
$style="Panier";//On réutilise le css de l'affichage des articles
$js="admin";


if (!isset($_GET['cat']) )
{
	header('Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/admin/secured.php'); //Si pas de parametre, on met la 1ère catégorie par défaut
}
else
{
    $atrouve=false;
    $reponse=getCategories();
       
    while ($donnees = $reponse->fetch() )//Va tout parcourir tant que aucune erreur ou pas terminé
    { 
        $cat=$donnees['categorie']; 
        
        if ($_GET['cat']==$cat){

            $type=$cat;

            $titreSection="NOS ".strtoupper($cat);    
            $atrouve=true;    
        }
    }		 
    $reponse->closeCursor();

    
    if(!$atrouve){
        header('Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/admin/secured.php');//Si le parametre existe mais ne correspond pas à une categorie
    }  
}



ob_start();?>


<!-- Zone de navigation sur la droite-->
<div class="pagedroite">

    <div class="bloc">
        <div class="titresection"><p>LISTE DES PRODUITS</p></div><br>

        <a href='/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/admin/secured.php'> Retourner à la section ADMIN </a> <br><br>
        
        <h2><?=$titreSection?></h2> <br>
			
        <?php  //Affiche la liste des produits demandés
			
            
        $reponse=getProduits($type);
           
        $i=0;
        while ($donnees = $reponse->fetch() )
        { ?> 
            
        <div class="panier">

            <div class="imageAppareil">
				<img class="imageAppareil2" src="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/img/<?=htmlspecialchars($donnees['image'])?>" alt=<?=$donnees['nom']?>onerror="this.onerror=null; this.src='/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/img/blank.png'" >
			</div>

            <div class="nomProduit1">
                <strong> <?=htmlspecialchars($donnees['nom'])?> </strong>
			</div>

        
            <div class="prixProduit"> 
                Prix : <strong> <?=htmlspecialchars($donnees['prix'])." €"?> </strong>
                Stock : <strong> <?=htmlspecialchars($donnees['stock'])?> </strong>     
            </div>

            <br><br>  
            

            <div class="midCenter">
                <form name="Form" class="form" method='GET' action='/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/admin/php/addStock.php' onsubmit="return confirmStock(<?=$i?>)">
                    
                    <button class="moins" onclick="moins(<?=$i?>)" type="button"> - </button>
                                        
                                        
                    <input type="number" name="quantite" min="0" value="0" class="form-control">
                    <button class="plus" onclick="plus(<?=$i?>)" type="button"> + </button> <br><br>

                    <input type="hidden" name="ref" value="<?=$donnees['reference'];?>">
                    <input type="hidden" name="cat" value="<?=$donnees['categorie'];?>">

                    <input class="boutonVert" type="submit" value="AJOUTER DU STOCK"/>
    
                </form>
            </div>
            
        
     
            <form method="POST" onsubmit="return deleteConfirm('produit')" action="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/admin/php/deleteProduit.php">
				<input type="hidden" name="refSuppr" value="<?=$donnees['reference']?>">
                <input type="hidden" name="catSuppr" value="<?=$donnees['categorie']?>">

				<input class="boutonSupprimer" type="submit" value="x"/>
			</form><br>


        </div>
        <?php
        $i++;
        }                 
        $reponse->closeCursor();?>  
        <br>

            
    </div>
</div>
</div>

<?php $content=ob_get_clean();

require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/php/template.php");
?>

