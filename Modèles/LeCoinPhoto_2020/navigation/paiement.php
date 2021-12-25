<?php
session_start();
require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/bdd/bdd.php"); //Pour les fcts de BDD

//Verification Session : Si pas connecté on renvoie vers la connexion
if (!isset($_SESSION['profil']['login']) ) //si pas connecté
{
	header('Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/connexion.php');
}


$title="- Paiement";
$style="Panier";
$js="panier";


require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/php/fonctionsPanier.php");//Fonctions liées au panier
$login=$_SESSION['profil']['login'];

ob_start();?>

<!-- Zone de navigation sur la droite-->
<div class="pagedroite">

<div class="bloc">
    <div class="titresection"><p>PAIEMENT</p></div><br>
                   
<?php //Affiche le panier d'un utilisateur à partir de son login, unique 

$panier=getPanier($login);//Sous la forme de references à virgules
$panierTab=explode(',',$panier);//Le panier en tableau, l'elt 0 est vide
$panierPaiement=array();//Panier réel lors de l'achat, qui ne compte pas les articles indisponibles

unset($panierTab[0]);//Pour ne plus le compter par la suite
?>

    <p> Votre paiement : </p>
    <?php


	$total=0;//Pour compter le montant total du panier
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

			if(!empty($donneesProduit)){ //Si le produit à la référence donnée existe, on le compte dans le paiement

				if ($donneesProduit['stock']<=0 || $i>$donneesProduit['stock']) { //Si stock vidé entre temps 
					//On fait rien, le montant n'est pas compté et le produit indisponible n'apparait pas dans le recap de paiement
				}
				else { ?>			

				<div class="panier">
					<div class="nomProduit2">Nom : <strong><?=$donneesProduit['nom'];?></strong><br></div>
					<div class="prixProduit2">Prix : <strong><?=$donneesProduit['prix'];?> €</strong><br></div>
						
					<?php $total=$total+$donneesProduit['prix'];
					array_push($panierPaiement, $donneesProduit['reference']);//On met la référence dans le panier de paiement
					?>

				</div>
			<?php 
				}	
			}
			else {
			//Si le produit n'existe pas, on le compte pas dans le paiement
			}
		}  
	}
		
	if(count($panierPaiement)>=1){ //Si au moins un article, non en rupture de stock, est disponible 
		$panierPaiement=implode(',', $panierPaiement) ;//Pour passer de l'array aux virgules, pour pouvoir le passer par le formulaire
		?>
		<br>
		MONTANT TOTAL : <strong><?=$total?> €</strong> <br><br>
			
		<form name="Form" method='POST' onsubmit="return confirmerPaiement()" action='/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/php/payer.php'>
			<input type="hidden" name="login" value="<?=$login?>">
			<input type="hidden" name="total" value="<?=$total?>">
			<input type="hidden" name="panierString" value="<?=$panierPaiement?>">
			<input class="boutonPayer" type="submit" name="payer" value="PAYER"/>
		</form>
		<br><br>
<?php
	}
	else{ 
		echo "Aucun de vos articles n'est disponible à l'achat<br>Veuillez nous excuser pour la gêne occasionée";	
		echo "<br><br><br><br><br><br><br><br>";
	}		
?>


</div>
</div>
</div>

<?php $content=ob_get_clean();
require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/php/template.php");
?>
