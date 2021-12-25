<?php

require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/bdd/bdd.php"); //Pour les fcts de BDD

if ( !isset($_POST['refSuppr']) || !isset($_POST['catSuppr']) ){
    header('Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/admin/secured.php');
}



$ref=formater($_POST['refSuppr']);
$cat=formater($_POST['catSuppr']);


deleteProduit($ref);
header('Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/admin/navigation/liste.php?cat='.$cat);



function formater($data){ 
	
	$data = trim($data);
 	$data = stripslashes($data);
  	$data = htmlspecialchars($data);

	return $data;
}
?>