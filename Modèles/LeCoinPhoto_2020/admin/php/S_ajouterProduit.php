<?php

//Recoit le formulaire et s'occupe de l'ajouter dans la BDD



$valide=true;

if ($_SERVER["REQUEST_METHOD"] == "POST") {

	if (empty($_POST["nom"])) {
		$erreurNom = "Nom obligatoire";
		$valide=false;
	} else {
		$nom = formater($_POST["nom"]); //Enleve les espaces, guillemets et protege des injections
	}
	
	if (empty($_POST["image"])){ 
		$erreurImage = "Lien d'image obligatoire. Vous pouvez choisir blank.png, fourni avec le site";
		$valide=false;
	} else {
		
		//Regex, va reconnaitre seulement les formats d'image, cad jpg, jpeg, png, gif, bmp 
		if( preg_match("([^\\s]+(\\.(?i)(jpe?g|png|gif|bmp))$)", $_POST["image"])==False){
			$erreurImage = "Format d'image non valide. Vous pouvez choisir blank.png, fourni avec le site";
			$valide=false;
			$image = formater($_POST["image"]);
		}
		else{
			$image = formater($_POST["image"]);
		}
	}	


	$icone = formater($_POST["icone"]); //Ne servira que si la catégorie est nouvelle
	

	if (empty($_POST["ref"])) {
		$erreurRef = "Référence obligatoire";
		$valide=false;
	} else {
		$ref = formater($_POST["ref"]);
	}


	if (empty($_POST["prix"])) {
		$erreurPrix = "Prix obligatoire";
		$valide=false;
	} else {
		$prix = formater($_POST["prix"]);

		$prixString=strval($prix);
		$prixString = str_replace(",", ".", $prixString); //Va remplacer tous les , par . , car mySQL ne reconnait pas les , dans les float
		$prix=floatval($prixString);
	}


	if (empty($_POST["stock"])) {
		$erreurStock = "Stock obligatoire";
		$valide=false;
	} else {
		$stock = formater($_POST["stock"]);
	}

	if (empty($_POST["categorie"])) {
		$erreurCategorie = "Catégorie obligatoire";
		$valide=false;
	} else {
		$categorie = formater($_POST["categorie"]);
	}

	if (empty($_POST["desc"])) {
		$erreurDesc = "Description obligatoire";
		$valide=false;
	} else {
		$desc = formater($_POST["desc"]);
	}


	if($valide){ //Si le formulaire est bien rempli

		$erreurCat=false;
		$erreurProd=false;
		$erreur=false;

		//On regarde si la catégorie est nouvelle ou non :
		
		if( empty(getCategorie($categorie)) ){ //Sort les infos de la catégorie demandée, vide si elle n'existe pas
			$exist=false;
		}
		else{
			$exist=true;
		}
		


		if(!$exist){ //Si elle n'existe pas, on la crée
			if(!ajoutCategorie($categorie, $icone)){
				$erreurCat=true;
			}
		}


		if(!$erreurCat){ //Si la catégorie existe ou n'a pas eu d'erreur, on crée ensuite le produit
			if(!ajoutProduit($nom, $image, $ref, $prix, $stock, $categorie, $desc, $categorie)){
				$erreurProd=true;
			}
		}


		if($erreurCat){
			$erreurEnvoi=$erreurEnvoi."<br>"."Erreur de BDD lors de la création de la catégorie";
			$erreur=true;
		}
		if($erreurProd){
			$erreurEnvoi=$erreurEnvoi."<br>"."Erreur de BDD lors de l'ajout du produit";
			$erreur=true;
		}



		if($erreur){ //Si on a au moins 1 erreur, on reste sur la page pour en informer l'utilisateur (cad on ne fait rien) 

		}
		else{ //Sinon on peut continuer

			$nom=$image=$ref=$prix=$stock=$categorie=$desc=$icone="";

			header('Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/admin/secured.php');
		}

	}
}


	

function formater($data){ 
	
	$data = trim($data);
 	$data = stripslashes($data);
  	$data = htmlspecialchars($data);

	return $data;
}
		


?>