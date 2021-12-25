<?php 


$valide=true;

if ($_SERVER["REQUEST_METHOD"] == "POST") {

	if (empty($_POST["nom"])) {
		$erreurNom = "Nom obligatoire";
		$valide=false;
	} else {
		$nom = formater($_POST["nom"]); //Enleve les espaces, guillemets et protege des injections
	}
	
	if (empty($_POST["prenom"])) {
		$erreurPrenom = "Prenom obligatoire";
		$valide=false;
	} else {
		$prenom = formater($_POST["prenom"]);
	}

	if (empty($_POST["dateNaissance"])) {
		$erreurNaissance = "Date obligatoire";
		$valide=false;
	} else {
		$dateNaissance = formater($_POST["dateNaissance"]);
	}

	if (empty($_POST["sexe"])) {
		$erreurSexe = "Sexe obligatoire";
		$valide=false;
	} else {
		$sexe = formater($_POST["sexe"]);
	}

	if (empty($_POST["mailClient"])) {
		$erreurMail = "Mail obligatoire";
		$valide=false;
	} else {
		$mail = formater($_POST["mailClient"]);
		
		if ( preg_match("#^[a-z0-9._-]+@[a-z0-9._-]{2,}\.[a-z]{2,4}$#", $mail)==False ){  //Regex : autant de caracteres, puis @, puis au moins 2 caracteres, puis . entre 2 et 4 caracteres
		//Bref, si l'email a une forme invalide, par ex aaa@bbb.cccccccc est invalide car plus de 4 lettres apres le .	
			$erreurMail="Forme non valide";
			$valide=false;
		}
	}

	if (empty($_POST["metier"])) {
		$erreurMetier = "Metier obligatoire";
		$valide=false;
	} else {
		$metier = formater($_POST["metier"]);
	}

	if (empty($_POST["sujet"])) {
		$erreurSujet = "Sujet obligatoire";
		$valide=false;
	} else {
		$sujet = formater($_POST["sujet"]);
	}

	if (empty($_POST["contenu"])) {
		$erreurContenu = "Contenu obligatoire";
		$valide=false;
	} else {
		$contenu = formater($_POST["contenu"]);
	}


	if($valide){ //Si le formulaire est bien rempli

		$tmpNom=$nom; //Vars qui vont servir à l'envoi de mail. Parce que en attendant l'envoi on veut effacer le formulaire
		$tmpPrenom=$prenom;
		$tmpDateNaissance=$dateNaissance;
		$tmpSexe=$sexe;
		$tmpMetier=$metier;
		$tmpSujet=$sujet;
		$tmpContenu=$contenu;
		$tmpMail=$mail;

		$nom=$prenom=$dateNaissance=$sexe=$mail=$metier=$sujet=$contenu="";
		$erreurEnvoi="MESSAGE ENVOYÉ AVEC SUCCES";
		$envoi=true;

	}
}


	

function formater($data){ 
	
	$data = trim($data);
 	$data = stripslashes($data);
  	$data = htmlspecialchars($data);

	return $data;
}
		
?>