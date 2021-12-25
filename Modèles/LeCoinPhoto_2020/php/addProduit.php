<?php
session_start();
require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/bdd/bdd.php"); //Pour les fcts de BDD

if ( !isset($_SESSION['profil']['login'])){ //Si pas connecté
    header('Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/connexion.php');
}

if ( !isset($_POST['REF']) ){ //Si pas d'article choisi
    $_SESSION['erreurAchat']="Erreur d'article";
    header('Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto//navigation/produits.php?cat=appareils'); 
}

if ( !isset($_POST['quantite']) ){ //Si pas de valeur choisi (pour une quelconque raison)
    $_SESSION['erreurAchat']="Erreur de quantité"; 
    header('Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto//navigation/produits.php?cat=appareils'); 
}


require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/php/fonctionsPanier.php");//Fonctions liées au panier




if ( (isset($_SESSION['profil']['login'])) && (isset($_POST['addProduit']))  )  //Si connecté, et on a bien demandé un ajout au panier
{
    $REF_produit=$_POST['REF']; //Reference complete du produit à ajouter, unique
	$login=trim($_SESSION['profil']['login']);
    $qte=$_POST['quantite'];


	addProduit($REF_produit, $login, $qte);//On met dans le panier du login connecté, avec la quantité voulue
    unset($_SESSION['erreurAchat']);//Plus d'erreur

	header("Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/panier.php");
}



?>