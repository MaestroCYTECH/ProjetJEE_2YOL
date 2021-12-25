<?php
require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/bdd/bdd.php"); //Pour les fcts de BDD

$title="- section Admin";
$style="Contact";
$js="admin";


$erreurNom=$erreurImage=$erreurRef=$erreurPrix=$erreurStock=$erreurCategorie=$erreurDesc="";
$nom=$image=$ref=$prix=$stock=$categorie=$desc=$icone="";
$erreurEnvoi="";

//Si on vient ici pour envoyer le formulaire

$envoi=false;
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/admin/php/S_ajouterProduit.php");
}


ob_start();?>




<!-- Zone de navigation sur la droite-->
<div class="pagedroite">
	<br><a href='/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/admin/secured.php'> Retourner à la section ADMIN </a> <br>
        <div class="background">


            <div class="bloc">
                <div class="titresection"><p>AJOUTER UN PRODUIT</p></div>
                <div class="texte">
                    <?=$erreurEnvoi?>

                    <form name="Formulaire" method="POST" action="<?=htmlspecialchars($_SERVER["PHP_SELF"]);?>">
                        <fieldset>
                        
                                <div class="box3">
                                    <div class="gauche">
                                        <label class="label">Référence :</label> <span class="error">*<?=$erreurRef;?></span> <br><br>
                                        <input type="text" id="ref" name="ref" class="forminput <?php if (!empty($erreurRef)) echo "rouge";?>" placeholder="Ex: app1" value="<?=$ref?>"/><br><br>
                                            
									    <label class="label">Prix :</label> <span class="error">*<?=$erreurPrix;?></span> <br><br>
                                        <input type="number" step="0.01" name="prix" id="prix" min="0" class="forminput <?php if (!empty($erreurPrix)) echo "rouge";?>" placeholder="Ex: 1699" value="<?=$prix?>"/><br><br>
                                           
                                    </div>

                                    <div class="droite">                           
                                        <label class="label">Image : </label> <span class="error">*<?=$erreurImage;?></span> <br><br>
                                        <input type="text" id="image" name="image" class="forminput <?php if (!empty($erreurImage)) echo "rouge";?>" placeholder="Ex: blank.png" value="<?=$image?>"/><br><br>
                                   
                                        <label class="label">Catégorie : Écrire une qui n'existe pas pour la créer</label> <span class="error">*<?=$erreurCategorie;?></span> <br><br>
                                        <div class="box2 <?php if (!empty($erreurCategorie)) echo "rouge";?>" id="categorie">
                                        
                                  
                                            <input class="forminput" list="categories" name="categorie" value="<?php if (isset($categorie)) echo $categorie;?>">
                                            <datalist id="categories">
                                                
                                                <?php 
                                                $reponse=getCategories();
                                                if($reponse!=null)
                                                {
                                                    while ($donnees = $reponse->fetch() )//Va tout parcourir tant que aucune erreur ou pas terminé
                                                    { 
                                                        $cat=$donnees['categorie']; ?>

                                                        <option value="<?=$cat?>"></option>
                                                        <?php 
                                                    }		 
                                                    $reponse->closeCursor();
                                                } ?>
                            
                                            </datalist>

                                        </div><br>

                                    </div>
                                </div>

                            <div class="box3">
                                <div class="gauche">
								<label class="label">Stock de départ :</label> <span class="error">*<?=$erreurStock;?></span> <br><br>
                                   <input type="number" name="stock" id="stock" min="0" class="forminput <?php if (!empty($erreurStock)) echo "rouge";?>" placeholder="Ex: 10" value="<?=$stock?>"/><br><br>
                                </div> 
                                       
                                <div class="droite">                           
                                    
                                    <label class="label">Icone de catégorie : </label> <span class="error">Nécessaire que dans le cas d'une création de catégorie. blankWhite.png par défaut</span> <br><br>
                                    <input type="text" id="icone" name="icone" class="forminput" placeholder="Ex: pellicule.png" value="<?=$icone?>"/><br><br>          

                                </div>
                            </div>

                            <div class="leftalign"> 
                                <label class="label">Nom du produit :</label> <span class="error">*<?=$erreurNom;?></span> <br><br>
                                <input type="text" id="nom" name="nom" class="forminput <?php if (!empty($erreurNom)) echo "rouge";?>" placeholder="Ex: Fujifilm X-T4" value="<?=$nom?>"/><br><br>
                         
                                <label class="label" for="desc">Description :</label> <span class="error">*<?=$erreurDesc;?></span> <br><br>
                                <textarea class="textarea2 <?php if (!empty($erreurDesc)) echo "rouge";?>" name="desc" id="desc" wrap="hard" placeholder="Description du produit"><?=$desc?></textarea><br><br>
                            </div>
                                
                            <input class="boutonEnvoyer" type="submit" value="Ajouter ce produit"/>
                            <a class="boutonEffacer" href="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/admin/navigation/ajouterProduit.php">Effacer</a>

                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<?php $content=ob_get_clean();

require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/php/template.php");


?>

