<?php

require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/bdd/bdd.php"); //Pour les fcts de BDD

if ( !isset($_GET['ref']) || !isset($_GET['quantite']) || !isset($_GET['cat']) ){
    header('Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/admin/secured.php');
}



$ref=formater($_GET['ref']);
$qte=formater($_GET['quantite']);
$cat=formater($_GET['cat']);


addStock($ref, $qte);


header('Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/admin/navigation/liste.php?cat='.$cat);



function formater($data){ 
	
	$data = trim($data);
 	$data = stripslashes($data);
  	$data = htmlspecialchars($data);

	return $data;
}
?>