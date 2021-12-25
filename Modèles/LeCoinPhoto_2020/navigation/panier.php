<?php
session_start();
require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/bdd/bdd.php"); //Pour les fcts de BDD

//Verification Session : Si pas connecté on renvoie vers la connexion
if (!isset($_SESSION['profil']['login']) ) //si pas connecté
{
	header('Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/connexion.php');
}

if (!isset($_SESSION['erreurPaiement']) ) 
{
	$_SESSION['erreurPaiement']="";
}


$title="- Mon panier";//Partie du nom de l'onglet 
$style="Panier";
$js="panier";



require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/php/fonctionsPanier.php");//Fonctions liées au panier
$login=$_SESSION['profil']['login'];

ob_start();?>

<!-- Zone de navigation sur la droite-->
<div class="pagedroite">

<div class="bloc">
    <div class="titresection"><p>MON PANIER</p></div><br>
                   
<?php //Affiche le panier d'un utilisateur à partir de son login, unique 

$panier=getPanier($login);//Sous la forme de references à virgules
$panierTab=explode(',',$panier);//Le panier en tableau, l'elt 0 est vide dans notre système


echo $_SESSION['erreurPaiement']."<br><br>"; //Si on est renvoyé ici par une erreur de paiement
$_SESSION['erreurPaiement']="";?>

	<div id="ajaxPanier">
	<?php 
	if(end($panierTab)=='Vide')//Si panier vide
	{
		echo "Votre panier est vide pour le moment <br><br><br><br><br><br><br><br><br><br><br><br>";
	}
	else
	{
		unset($panierTab[0]);//Pour ne plus le compter par la suite
		$nbArticles=count($panierTab);
		?>
        
		<a class="boutonPayer" href="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/paiement.php"> PAYER </a>	<br>
		<p>Vous avez <label id="ajaxNbArticles"><?=$nbArticles;?></label> <label id="ajaxArticles">article<?php if ($nbArticles>1) echo "s"?></label></p>
		<br>
        <?php
		$i=1;//Utile pour cibler l'indice de l'element du panier qu'on veut supprimer

		$qte=array();//Va compter les quantités présentes dans le panier

		foreach ($panierTab as $ref => $value) { //On parcourt tout le panier. $value contiendra les references
			
			if(!isset($qte[$value])){ //Si on compte cet article pour la 1ere fois, on doit initialiser l'element
				$qte[$value]=0;
			}
			$qte[$value]++;
		}

		echo "<br>"	;


		foreach ($qte as $ref => $value) { //Parcourt les articles différents

			for ($i=1; $i <=$value ; $i++) { //Pour trier le panier par article. Affichera des articles identiques à la suite
			

           		$donneesProduit=infosProduit($ref); //Sort les infos completes d'un produit à partir de sa référence complète
				$empty=empty($donneesProduit);

				if($empty){ //Si le produit à la référence donnée n'existe pas 
					
					$donneesProduit['reference']=$ref;
					$donneesProduit['image']="blank.png";
					$donneesProduit['nom']="Indisponible";
					$donneesProduit['prix']=0;
					$donneesProduit['stock']=0; //Peu importe tant que >=1, pour ne pas afficher le texte d'indisponibilité temporaire
					$donneesProduit['categorie']="";//La page produits ne reconnaitra pas la catégorie et renverra vers l'accueil

				
				} ?>
			
				<div class="panier <?=$donneesProduit['reference']?>">
					
					<div class="imageAppareil">
						<img class="imageAppareil2" src="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/img/<?=$donneesProduit['image']?>" alt=<?=$donneesProduit['nom']?> onerror="this.onerror=null; this.src='/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/img/blank.png'" >
					</div>

								
					<div class="nomProduit1"> 
						<?php 
						if($empty){ //Si le produit à la référence donnée n'existe pas 
						?>
							<strong>Ce produit a été retiré de la vente</strong><br>
						<?php }
						else
						{ ?>
						Nom : <strong><a class="nomProduit" href="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/produits.php?cat=<?=$donneesProduit['categorie']?>"><?=$donneesProduit['nom'];?></a></strong><br>
					<?php } ?>
					</div>
								
					<div class="prixProduit"> 
									
					<?php if ($donneesProduit['stock']<=0 || $i>$donneesProduit['stock']) { //Si stock vidé entre temps ?>

							<strong> INDISPONIBLE</strong>, pour le moment 
					</div> <br>

						<?php } 
						else { ?>
									
							Prix : <strong><?=$donneesProduit['prix'];?> €</strong>
					</div> <br>
								
							<?php } ?>
			
					<form onsubmit="return confirmerSuppression(document.getElementsByClassName('input<?=$donneesProduit['reference']?>')[0].value)">
						<input type="hidden" class="input<?=$donneesProduit['reference']?>" name="ref" value="<?=$donneesProduit['reference']?>">
						<input class="boutonSupprimer" type="submit" value="x"/>
					</form><br>
			
				</div>
				
				<?php					
			}
		}
		 echo "<br><br><br><br><br>";
	}?>
	</div>



</div>
</div>
</div>

<?php $content=ob_get_clean(); 

require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/php/template.php");
?>
