<?php
session_start();
require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/bdd/bdd.php");

$title="- section Admin";
$style="Panier";
$js="admin";


ob_start();?>

<!-- Zone de navigation sur la droite-->
<div class="pagedroite">

    <div class="bloc">
        <div class="titresection"><p>ESPACE ADMIN</p></div><br>
            
			Les fichiers de ce dossier et sous-dossiers sont tous securises par des mots de passe, configurés dans le fichier .htpasswd<br>
			Voir le fichier README pour le mot de passe (code admin admin pour l'instant)<br> <br>

            Ici vous pouvez ajouter ou supprimer une catégorie ou un produit, et aussi en augmenter le stock. 
            <br>Pour créer une catégorie, créez un produit et rentrez une catégorie qui n'existe pas encore afin de la créer automatiquement <br><br>
            ATTENTION, supprimer une catégorie entrainera aussi la suppression de TOUS SES PRODUITS. Si vous voulez les restaurer ensuite, vous pouvez utiliser le script d'insertion de valeurs fourni avec le site

            <br><br> <a href='/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/admin/navigation/ajouterProduit.php'> AJOUTER UN PRODUIT </a>

            <br><br><br> <h2> LISTE DES CATEGORIES : </h2><br> 

            <?php $reponse=getCategories();
            if($reponse!=null)
            {

                while ($donnees = $reponse->fetch() )//Va tout parcourir tant que aucune erreur ou pas terminé
                { 
                    $cat=$donnees['categorie']; ?>

                <div class="panier">

                    <div class="midCenter">                        
                        <a href="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/admin/navigation/liste.php?cat=<?=$cat?>"><strong>NOS <?=strtoupper($cat)?></strong></a> <br>
                    </div>

                    
                    <form method='POST' onsubmit="return deleteConfirm('categorie')" action="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/admin/php/deleteCategorie.php">
                        <input type="hidden" class="input<?=$cat?>" name="cat" value="<?=$cat?>">
                        <input class="boutonSupprCategorie" type="submit" value="x"/>
                    </form>
                
                </div>
            
                <?php 
                }		 
                $reponse->closeCursor();
            } ?>

            <br><br><br><br><br><br><br>

    
    </div>
</div>
</div>


<?php $content=ob_get_clean();

require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/php/template.php");
?>

