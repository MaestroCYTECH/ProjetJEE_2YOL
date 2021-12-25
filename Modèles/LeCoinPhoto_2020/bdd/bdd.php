<?php

//Toutes les fcts en lien avec la BDD.
require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/bdd/bddData.php");

                                                                        /*Fonctions de connexions */

function connectBDD()
{
	try
	{
		$bdd = new PDO("mysql:host=".$_SESSION['bddData']['host'].";dbname=".$_SESSION['bddData']['db'], $_SESSION['bddData']['user'], $_SESSION['bddData']['pwd']);
		$bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 

	}
	catch (PDOException $e) 
	{
		echo('Erreur de connexion : '.$e->getMessage());
        $bdd=false;
        exit();
	}
	return $bdd; //Se lie à la BDD
} 

function deconnectBDD($bdd){

    $bdd->query('KILL CONNECTION_ID()');
    $bdd = null;
}


                                                                /* Fonctions de requetes */


                                                                
                                                                /*Produits et catégories */


function getCategories() //Sort toutes les catégories existantes, pour l'affichage du menu
{

    try {

        $bdd=connectBDD();
        $reponse = $bdd->query('SELECT * FROM categories ORDER BY ID'); 
        $reponse->setFetchMode(PDO::FETCH_ASSOC); 

    } catch (PDOException $e) {
        /*echo('Erreur de BDD : '.$e->getMessage());
        exit();*/
        $reponse=null;
    }
    
    
    return $reponse; 
}

//Si on a besoin de débugger, enlever les commentaires du bloc catch pour afficher l'erreur éventuelle


function getProduits($categorie) //Sort tous les produits d'une catégorie donnée
{

    try{

        $bdd=connectBDD();
        $reponse=$bdd->prepare('SELECT * FROM produits WHERE categorie=:cat ORDER BY ID');
        $reponse->execute(['cat'=>$categorie]);
        $reponse->setFetchMode(PDO::FETCH_ASSOC); 

    } catch (PDOException $e) {
        /*echo('Erreur de BDD : '.$e->getMessage());
        exit();*/
        $reponse=null;
    }


    return $reponse; 	
}




                                                                                        /* Panier */


function getPanier($login)//Sort le contenu du panier sous forme de chaine de caracteres
{
	
    try{

        $bdd=connectBDD();
        $reponse = $bdd->prepare('SELECT panier FROM utilisateurs WHERE login=:login'); 
        $reponse->execute(['login'=>$login]); 

        $result=$reponse->fetch(); //Quand la réponse ne fait qu'une ligne, on peut faire le fetch ici
        $result=$result['panier']; 

    } catch (PDOException $e) {
        /*echo('Erreur de BDD : '.$e->getMessage());
        exit();*/
        $result="Vide";
    }

	return $result;

}

function updatePanier($newPanier, $login)//Actualise le panier dans la BDD, sous la forme à virgules
{

    try{

        $bdd=connectBDD();

        $reponse = $bdd->prepare('UPDATE utilisateurs SET panier = :panier WHERE login = :login');
        $reponse->execute(['panier'=>$newPanier, 'login'=>$login]);
        $reponse->closeCursor();
        $status=true;

    } catch (PDOException $e) {
        /*echo('Erreur de BDD : '.$e->getMessage());
        exit();*/
        $status=false;
    }

    return $status;   
}


function getInfosProduit($ref){ //Sort les infos d'un produit dans la BDD à partir de sa référence

    try{

        $bdd=connectBDD();

        $reponse = $bdd->prepare('SELECT * FROM produits WHERE reference=:ref'); 
        $reponse->execute(['ref'=>$ref]); 
        $reponse->setFetchMode(PDO::FETCH_ASSOC); 
        
        $result=$reponse->fetch(); //Quand la réponse ne fait qu'une ligne

    } catch (PDOException $e) {
        /*echo('Erreur de BDD : '.$e->getMessage());
        exit();*/
        $result=null;
    }
    
	return $result;
}




                                                                            /*Utilisateurs */

function getUsers(){ //Sort la liste des utilisateurs. Utile pour savoir si un login est pris ou non, et pour verifier une combinaison login/mdp

    try{

        $bdd=connectBDD();
        $reponse = $bdd->query('SELECT * FROM utilisateurs');
        $reponse->setFetchMode(PDO::FETCH_ASSOC); 

    } catch (PDOException $e) {
        /*echo('Erreur de BDD : '.$e->getMessage());
        exit();*/
        $reponse=null;
    }

    return $reponse;
}


function isLoginFree($login){

    try{
    
        $bdd=connectBDD();

        $reponse=$bdd->prepare('SELECT login FROM utilisateurs WHERE login=:login');
        $reponse->execute(['login'=>$login]);
        $reponse->setFetchMode(PDO::FETCH_ASSOC); 

        $result=$reponse->fetch(); //Quand la réponse ne fait qu'une ligne

    } catch (PDOException $e) {
        /*echo('Erreur de BDD : '.$e->getMessage());
        exit();*/
        $result=null;
    }

    return $result;
}



function insertUser($nom, $prenom, $sexe, $dateNaissance, $email, $login, $pwd){ //Ajoute un utilisateur dans la BDD

    try{

        $bdd=connectBDD();

        $reponse=$bdd->prepare('INSERT INTO utilisateurs(ID, nom, prenom, sexe, naissance, email, login, pwd, panier, statut) VALUES(0, :nom, :prenom, :sexe, :naissance, :email, :login, :pwd, "Vide", "simple")');
        $reponse->execute(['nom'=>$nom, 'prenom'=>$prenom, 'sexe'=>$sexe, 'naissance'=>$dateNaissance, 'email'=>$email, 'login'=>$login, 'pwd'=>$pwd]);//On cree le profil associé au login

        $reponse->closeCursor();

    } catch (PDOException $e) {
        /*echo('Erreur de BDD : '.$e->getMessage());
        exit();*/
       return false;
    }

    return true;
}


function updateStock($ref){

    try{
    
        $bdd=connectBDD();

        $reponse = $bdd->prepare('SELECT stock FROM produits WHERE reference=:ref'); //On récupère le stock
        $reponse->execute(['ref'=>$ref]);
        $stock=$reponse->fetch(); //Quand la réponse ne fait qu'une ligne
        $reponse->closeCursor();

        $stock=$stock['stock'];
        if ($stock>0){
            $stock--;
        
            //On le change puis on le remet à jour dans la BDD
            $reponse = $bdd->prepare('UPDATE produits SET stock = :stock WHERE reference = :ref');
            $reponse->execute(['stock'=>$stock, 'ref'=>$ref]);

            $reponse->closeCursor();
            return true;
        }
        else{
            return false;//On fait rien, le stock est deja vide
        }

    } catch (PDOException $e) {
        /*echo('Erreur de BDD : '.$e->getMessage());
        exit();*/
        return false;
    }  
}




                                                                                /*ADMIN*/

function deleteCategorie($cat){ //Supprime la catégorie de la BDD

    try{
   
        $bdd=connectBDD();

        //Suppression catégorie
        $reponse = $bdd->prepare('DELETE FROM categories WHERE categorie= :cat'); 
        $reponse->execute(['cat'=>$cat]);

        $reponse->closeCursor();

        //Suppression produits associés
        $reponse = $bdd->prepare('DELETE FROM produits WHERE categorie= :cat'); 
        $reponse->execute(['cat'=>$cat]);

        $reponse->closeCursor();
       

    } catch (PDOException $e) {
        /*echo('Erreur de BDD : '.$e->getMessage());
        exit();*/
        return;
    }  
}

function addStock($ref, $qte){

    try{

        $bdd=connectBDD();

        $reponse = $bdd->prepare('SELECT stock FROM produits WHERE reference=:ref');
        $reponse->execute(['ref'=>$ref]);
        $stock=$reponse->fetch(); //Quand la réponse ne fait qu'une ligne
        $reponse->closeCursor();

        $stock=$stock['stock'];
        $stock=$stock+$qte;


        $reponse = $bdd->prepare('UPDATE produits SET stock = :stock WHERE reference = :ref');
        $reponse->execute(['stock'=>$stock, 'ref'=>$ref]);
        $reponse->closeCursor();
       

    } catch (PDOException $e) {
        /*echo('Erreur de BDD : '.$e->getMessage());
        exit();*/
        return;
    } 
}


function deleteProduit($ref){

    try{
   
        $bdd=connectBDD();

        //Suppression produits 
        $reponse = $bdd->prepare('DELETE FROM produits WHERE reference= :ref'); 
        $reponse->execute(['ref'=>$ref]);

        $reponse->closeCursor();
       

    } catch (PDOException $e) {
        /*echo('Erreur de BDD : '.$e->getMessage());
        exit();*/
    }  
}


//AJOUT de produit et catégorie

function getCategorie($cat){

    try {

        $bdd=connectBDD();
        $reponse = $bdd->prepare('SELECT * FROM categories WHERE categorie= :cat'); 
        $reponse->execute(['cat'=>$cat]); 
       // $reponse->setFetchMode(PDO::FETCH_ASSOC); 

        $infosCategorie=$reponse->fetch(); //Quand la réponse ne fait qu'une ligne
        $reponse->closeCursor();

    } catch (PDOException $e) {
        echo('Erreur de requête : '.$e->getMessage());
        exit();
        $infosCategorie=null;
    }
    
    
    return $infosCategorie; 
}


function ajoutCategorie($cat, $icone){

    try{

        $bdd=connectBDD();

        $reponse=$bdd->prepare('INSERT INTO categories(ID, categorie, icone) VALUES(0, :cat, :icone)'); //0 en ID car il est en auto-increment, il va automatiquement choisir le nombre suivant le dernier existant
        $reponse->execute(['cat'=>$cat, 'icone'=>$icone]);

        $reponse->closeCursor();

    } catch (PDOException $e) {
        /*echo('Erreur de BDD : '.$e->getMessage());
        exit();*/
       return false;
    }

    return true;
}


function ajoutProduit($nom, $image, $ref, $prix, $stock, $categorie, $desc, $cat){

    try{

        $bdd=connectBDD();

        $reponse=$bdd->prepare('INSERT INTO produits(ID, categorie, reference, image, nom, description, prix, stock) VALUES(0, :cat, :ref, :image, :nom, :desc, :prix, :stock)');
        $reponse->execute(['cat'=>$cat, 'ref'=>$ref, 'image'=>$image, 'nom'=>$nom, 'desc'=>$desc, 'prix'=>$prix, 'stock'=>$stock]);

        $reponse->closeCursor();

    } catch (PDOException $e) {
        /*echo('Erreur de BDD : '.$e->getMessage());
        exit();*/
       return false;
    }

    return true;
}

?>