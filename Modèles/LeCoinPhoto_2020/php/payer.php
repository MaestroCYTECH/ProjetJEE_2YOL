<?php
session_start(); 
require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/bdd/bdd.php"); //Pour les fcts de BDD
//ce script recoit les donnees POST, et doit actualiser le panier et réduire le stock



if ( !isset($_SESSION['profil']['login'])  ) //Si non connecté
{
	header("Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/connexion.php");
}



if ( (!isset($_POST['login'])) ||(!isset($_POST['total'])) || (!isset($_POST['panierString'])) ) //Si on "triche" en passant par l'URL
{
    $_SESSION['erreurPaiement']="Panier invalide";
	header("Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/panier.php");
}
/*Récupération du total pas utile ici si on veut pas faire de vrai achat*/


require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/php/fonctionsPanier.php");//Fonctions liées au panier
$login=$_SESSION['profil']['login'];


$panierPaiement=$_POST['panierString'];
$panierPaiement=explode(',',$panierPaiement);//Le panier du paiement en tableau, l'elt 0 est vide

$nbArticles=count($panierPaiement);


if($nbArticles==0)//Si panier vide
{
    header("Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/panier.php");
}	
else{ //On met à jour le panier. On ne vient sur cette page que si le panier est non vide


    for ($i=0; $i < $nbArticles; $i++) { 
       

        //On enleve du panier les elements achetés
        $panier=getPanier($login);//Forme à virgules
        $panierTab=explode(',',$panier);//Le panier complet en tableau

        $ref=$panierPaiement[$i];
        if(deleteProduitPanier($ref, $login)){ //Supprime 1 article du panier pour un produit donnée. Si aucune erreur, on met aussi à jour le stock
            updateStockProduit($ref);//Soustrait de 1 le stock d'un produit dans le fichier à partir de sa référence
        }
        else{

        }
    }
      
    header("Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/index.php"); //renvoie apres avoir mis à jour
}
?>