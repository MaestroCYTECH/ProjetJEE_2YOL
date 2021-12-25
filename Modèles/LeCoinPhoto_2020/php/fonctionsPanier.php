<?php
//Fichier séparé pour éviter les doublons car la page produits et panier utilisent des fonctions communes



/*Surtout pour la page PRODUITS : */ 

function addProduit($REF_produit, $login, $qte)  // Met un produit à la qte voulue dans le panier de l'utilisateur'. 
{
//Recupere le panier depuis le fichier users, puis en ajoute le nouveau produit, puis le remet dans le fichier

	$panier=getPanier($login);  //Sous la forme de references à virgules    


    for ($i=1; $i <=$qte ; $i++) { 
        $panier=$panier.",".$REF_produit; //On y ajoute la ref de l'article
    }
    //Pas besoin d'explode et implode quand on veut juste rajouter la fin. Par contre sera utile quand on veut supprimer une reference precise dans le panier
    //On réecrit le panier dans la BDD :

	if(!updatePanier($panier, $login)) //Si on a eu une erreur
    {
        $_SESSION['erreurAchat']="Erreur de panier";
        header('Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/index.php');
    }
}








/*Surtout pour la page PANIER : */ 

function infosProduit($REF_produit){ //Sort les infos completes d'un produit à partir de sa référence

    $result=getInfosProduit($REF_produit);

    return $result;
} 

function deleteProduitPanier($ref, $login) //Supprime un element du panier à une reference donnée
{
	$panier=getPanier($login);//Forme à virgules
    $panierTab=explode(',',$panier);//Le panier en tableau
    
   
    //On cherche l'element à la reference voulue  
    $key = array_search($ref, $panierTab);//Sort l'indice du premier element à la référence donnée

    if($panierTab[$key]=='Vide'){ //Si pour une raison ou une autre on essaie de supprimer l'element symbolisant le panier vide
        return false;
    }

	unset($panierTab[$key]);//Supprime l'element de l'array panier

	$newPanier=implode(',', $panierTab) ;//Pour passer de l'array aux virgules,
	
    $status=updatePanier($newPanier, $login);//Reactualise le panier dans la BDD

    return $status;
}


/*Surtout pour la page PAIEMENT : */ 

function updateStockProduit($REF_produit){
//Soustrait de 1 le stock d'un produit dans le fichier à partir de sa référence

    if(!updateStock($REF_produit)){
        $_SESSION['erreurPaiement']="Erreur lors de la mise à jour du stock";//Pour une quelconque raison, mais c'est la page paiement qui s'assure que le stock est >0 lors de l'achat
    }

}

?>