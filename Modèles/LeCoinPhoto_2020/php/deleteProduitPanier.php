<?php
session_start();
require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/bdd/bdd.php"); //Pour les fcts de BDD

if ( !isset($_SESSION['profil']['login'])){ //Si pas connecté
    header('Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/connexion.php');
}
if ( !isset($_POST['ref'])){ //Si pas d'article selectionné
    header('Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/panier.php');
}


require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/php/fonctionsPanier.php");//Fonctions liées au panier
$login=$_SESSION['profil']['login'];



//Si on vient là parce que on veut supprimer le produit du panier

$ref=$_POST['ref'];
deleteProduitPanier($ref, $login); //Supprime l'article du panier de l'utilisateur
header('Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/panier.php');

?>