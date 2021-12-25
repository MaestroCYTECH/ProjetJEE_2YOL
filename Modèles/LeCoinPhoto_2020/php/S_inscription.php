<?php
session_start();
require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/bdd/bdd.php"); //Pour les fcts de BDD

if (isset($_SESSION['profil']['login']) ) //si deja connecté
{
	header('Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/index.php');
}
else //si pas deja connecté (controle utile si on utilise l'URL pour tricher)
{
  
	if ( (isset($_POST['nom'])) && (isset($_POST['prenom'])) && (isset($_POST['sexe'])) && (isset($_POST['dateNaissance'])) && (isset($_POST['mailClient'])) && (isset($_POST['login'])) && (isset($_POST['pwd'])) && (isset($_POST['pwdConfirm'])) )
	{	//Si tout existe, cad si formulaire envoyé par POST, mais peut etre vide pour l'instant

		if ( (($_POST['pwd'])!=($_POST['pwdConfirm'])) ) //si mdps differents
		{
            $_SESSION['erreurInscription']="Mot de passe differents";
			header("Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/inscription.php");
		}

		elseif ( (preg_match("#^[a-z0-9._-]+@[a-z0-9._-]{2,}\.[a-z]{2,4}$#", $_POST['mailClient']))==False ) //Regex, autant de caracteres, puis @, puis au moins 2 caracteres, puis .entre 2 et 4 caracteres
		//Bref si l'email a une forme invalide, par ex un jjjj@fsf.fdslfpslfp est invalide car trop de lettres apres le .
		{ 
            $_SESSION['erreurInscription']="Email non valide";
			header("Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/inscription.php");
		}
       

		elseif ( (!empty($_POST['login'])) && (!empty($_POST['pwd'])) && (!empty($_POST['pwdConfirm'])) && (!empty($_POST['mailClient'])) && (!empty($_POST['nom'])) && (!empty($_POST['prenom'])) && (!empty($_POST['dateNaissance'])) && (!empty($_POST['sexe'])) )//Si le formulaire est bien rempli
		{
			$login= formater($_POST['login']);
			$pwdHash= password_hash(formater($_POST['pwd']), PASSWORD_DEFAULT);//On hache le mdp pour la confidentialité
			$email= formater($_POST['mailClient']);
			$nom= formater($_POST['nom']);
			$prenom= formater($_POST['prenom']);
			$dateNaissance= formater($_POST['dateNaissance']);
			$sexe= formater($_POST['sexe']);


			if (addInscription($nom, $prenom, $sexe, $dateNaissance, $email, $login, $pwdHash))//Si true
			{
                //Si OK, on se connecte avec le nouvel inscrit
                unset($_SESSION['erreurInscription']);//Plus d'erreur

                $_SESSION['profil']['nom']=$nom;
                $_SESSION['profil']['prenom']=$prenom;
                $_SESSION['profil']['sexe']=$sexe;
                $_SESSION['profil']['naissance']=$dateNaissance;
                $_SESSION['profil']['email']=$email;
                $_SESSION['profil']['login']=$login;
				$_SESSION['profil']['statut']="simple";


				header("Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/profil.php");//puis envoie au profil
			}
			else
			{
                //Erreur de session faite par la fonction
				header("Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/inscription.php");
			}

		} 	
		else //Si un champ non rempli ou non existant
		{		
            $_SESSION['erreurInscription']="Au moins un champ est vide";
			header("Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/inscription.php");
		}	

	}
	else //Si tout le formulaire n'a pas été envoyé
	{
        $_SESSION['erreurInscription']="Formulaire non valide";
		header("Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/inscription.php");
	}

}


function addInscription($nom, $prenom, $sexe, $dateNaissance, $email, $login, $pwd) //Verifie si le login est pris, et l'inscrit si il est libre
{

	if (loginLibre($login)==true) //Si login libre, retourne true ou false
	{
		//On l'inscrit dans la BDD :    
        if(!insertUser($nom, $prenom, $sexe, $dateNaissance, $email, $login, $pwd)){ //Si on a eu une erreur
			$_SESSION['erreurInscription']="Erreur d'inscription";
        	header('Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/inscription.php');
		}

		return true;//Inscription réussie
	}
	else
	{
        //Login occupé
        $_SESSION['erreurInscription']="Erreur, login non disponible";
		return false;//Inscription non réussie, à cause d'un login deja pris
	}
}


function loginLibre($login) //Lors de l'inscription, renvoit true si le login est disponible
{    


	$result=isLoginFree($login);//Vérifie la disponibilité du login en une seule requete SQL


    if(empty($result)){ //Si on a pas trouvé ce login dans la BDD
        return true;
    }
    else{
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
