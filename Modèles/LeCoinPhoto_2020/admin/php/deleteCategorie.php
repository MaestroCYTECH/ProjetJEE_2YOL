<?php

require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/bdd/bdd.php"); //Pour les fcts de BDD

if ( !isset($_POST['cat'])){ //Si pas de catégorie selectionnée
    header('Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/admin/secured.php');
}


require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/php/fonctionsPanier.php");//Fonctions liées au panier




//Si on vient là parce que on veut mettre le produit au panier

$cat=$_POST['cat'];
deleteCategorie($cat); 
header('Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/admin/secured.php');


?>