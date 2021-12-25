<?php
session_start();
require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/bdd/bdd.php"); //Pour les fcts de BDD

if (isset($_SESSION['profil']['login']) ) //si deja connecté
{
	header('Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/index.php');
}
else //si pas deja connecté (controle utile si on utilise l'URL ou bien l'historique pour tricher)
{

    if ( (isset($_POST['login'])) && (isset($_POST['pwd'])) )
	{	//Si tout existe, cad si formulaire envoyé par POST, mais peut etre vide pour l'instant

		if ( (!empty($_POST['login'])) && (!empty($_POST['pwd'])) )//Si le formulaire est bien rempli
		{
			$login= formater($_POST['login']);
			$pwd=formater($_POST['pwd']);

			if (compareLogins($login,$pwd))//Cherche la combinaison login/pwd dans la BDD, et crée la var de session si connexion réussie
			{       
				unset($_SESSION['erreurConnexion']);//Plus d'erreur
                header("Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/profil.php");//Connexion réussie. On l'envoie au profil, avec de nouveaux boutons disponibles
			}
			else{
				//Si aucune correspondance dans la bdd, on renvoit à la connexion
				$_SESSION['erreurConnexion']="Mauvais login ou mot de passe";
		    	header("Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/connexion.php");//On avertit puis renvoit
			}

		} 	
		else //Si un champ non rempli ou non existant
		{		
            $_SESSION['erreurConnexion']="Au moins un champ est vide";
			header("Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/connexion.php");
		}	

	}
	else //Si tout le formulaire n'a pas été envoyé
	{
        $_SESSION['erreurConnexion']="Formulaire non valide";
		header("Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/connexion.php");
	}

}


function compareLogins($login,$pwd)//Cherche la combinaison login/pwd dans la BDD, et crée la var de session si connexion réussie
{ 
	$atrouve=false;

	$reponse=getUsers();
	if($reponse==null){
		$_SESSION['erreurConnexion']="Erreur de BDD";
		return false;
	}

	while ($donnees = $reponse->fetch() )//Va parcourir ligne apres ligne si aucune erreur ou array non terminé
	{

		if ( $login==$donnees['login'] && password_verify($pwd, $donnees['pwd'])){ //Si le pwd haché, correspond au hachage de la bdd
		
			$_SESSION['profil']['nom']=$donnees['nom'];
			$_SESSION['profil']['prenom']=$donnees['prenom'];
			$_SESSION['profil']['sexe']=$donnees['sexe'];
			$_SESSION['profil']['naissance']=$donnees['naissance'];
			$_SESSION['profil']['email']=$donnees['email'];
			$_SESSION['profil']['login']=$donnees['login'];
			$_SESSION['profil']['statut']=$donnees['statut'];

			$reponse->closeCursor();
			$atrouve=true;
            return true;
        }     
	}

	
	if (!$atrouve){
        return false;
	}
}


function formater($data){ 
	
	$data = trim($data);
 	$data = stripslashes($data);
  	$data = htmlspecialchars($data);

	return $data;
}
?>