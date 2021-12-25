
function envoyer() {

	var nom=document.Formulaire.nom.value.trim();//Cible la valeur rentree en saisie
	var prenom=document.Formulaire.prenom.value.trim();
    var sexe=document.Formulaire.sexe.value.trim();
    var date=document.Formulaire.dateNaissance.value.trim();
	var mail=document.Formulaire.mailClient.value.trim();
    var login=document.Formulaire.login.value.trim();
    var pwd=document.Formulaire.pwd.value.trim();
	var pwdConfirm=document.Formulaire.pwdConfirm.value.trim();
	
	var compteurNom=0;//Compte les erreurs
	var compteurPrenom=0;
    var compteurSexe=0;
    var compteurDate=0;
	var compteurMail=0;
    var compteurLogin=0;
    var compteurPwd=0;
    var compteurPwdConfirm=0;

	var compteur=0;
	var element;
	



	//Par défaut, pas de rouge
	element = document.getElementById("nom");
	element.style.border = null;
	document.getElementById('labelNom').innerText="Nom :";


	element = document.getElementById("prenom");
	element.style.border = null;
	document.getElementById('labelPrenom').innerText="Prénom :";

	element = document.getElementById("sexe");
	element.style.border = null;
	document.getElementById('labelSexe').innerText="Sexe :";

	element = document.getElementById("dateNaissance");
	element.style.border = null;
	document.getElementById('labelDate').innerText="Date de naissance :";

	element = document.getElementById("mailClient");
	element.style.border = null;
	document.getElementById('labelMail').innerText="Adresse email :";

	element = document.getElementById("login");
	element.style.border = null;
	document.getElementById('labelLogin').innerText="Login :";

	element = document.getElementById("pwd");
	element.style.border = null;
	document.getElementById('labelPwd').innerText="Mot de passe :";

	element = document.getElementById("pwdConfirm");
	element.style.border = null;
	document.getElementById('labelConfirm').innerText="Confirmation de mot de passe :";

	
	if(nom =="")  
	{
		compteur++;
		element = document.getElementById("nom");//Cible la zone de saisie
		element.style.border = "solid red";//Change sa bordure	
		document.getElementById('labelNom').innerText="Nom : *Nom obligatoire";
	}
	
	if(prenom == "") 
	{
		compteur++;
		element = document.getElementById("prenom");//Cible la zone de saisie
		element.style.border = "solid red";//Change sa bordure
		document.getElementById('labelPrenom').innerText="Prenom : *Prénom obligatoire";
	}

    if(sexe == "") 
	{
		compteur++;
		element = document.getElementById("sexe");//Cible la zone de saisie
		element.style.border = "solid red";//Change sa bordure
		document.getElementById('labelSexe').innerText="Sexe : *Sexe obligatoire";
	}

    if(date == "") 
	{
		compteur++;
		element = document.getElementById("dateNaissance");//Cible la zone de saisie
		element.style.border = "solid red";//Change sa bordure
		document.getElementById('labelDate').innerText="Date de naissance : *Date obligatoire";
	}


	regexMail=/^[a-z0-9._-]+@[a-z0-9._-]{2,}\.[a-z]{2,4}$/;
	//Regex : verifie si l'email respecte un modele. Ici :autant de caracteres, puis un @, puis au moins 2 caracteres, puis . puis entre 2 et 4 lettres (entre a et z)

	if( (mail == "") ) 
	{
		compteur++;
		element = document.getElementById("mailClient");//Cible la zone de saisie
		element.style.border = "solid red";//Change sa bordure
		document.getElementById('labelMail').innerText="Adresse email : *Mail obligatoire";
	}

	if ( mail!="" && regexMail.test(mail)==false)
	{
		compteur++;
		element = document.getElementById("mailClient");//Cible la zone de saisie
		element.style.border = "solid red";//Change sa bordure
		document.getElementById('labelMail').innerText="Adresse email : *Format de mail non valide";

	}

	
	if(login == "") 
	{
		compteur++;
		element = document.getElementById("login");//Cible la zone de saisie
		element.style.border = "solid red";//Change sa bordure
		document.getElementById('labelLogin').innerText="Login : *Login obligatoire";
	}

    if(pwd == "") 
	{
		compteur++;
		element = document.getElementById("pwd");//Cible la zone de saisie
		element.style.border = "solid red";//Change sa bordure
		document.getElementById('labelPwd').innerText="Mot de passe : *Obligatoire";
	}

    if(pwdConfirm == "") 
	{
		compteur++;
		element = document.getElementById("pwdConfirm");//Cible la zone de saisie
		element.style.border = "solid red";//Change sa bordure
		document.getElementById('labelConfirm').innerText="Confirmation du mot de passe : *Obligatoire";
	}

	if( pwd!=pwdConfirm){
		compteur=compteur+2;//2 fois, pour le mdp et sa confirmation

		alert("Les 2 mots de passe sont différents");

		element = document.getElementById("pwd");//Cible la zone de saisie
		element.style.border = "solid red";//Change sa bordure
		document.getElementById('labelPwd').innerText="Mot de passe : *Les 2 mots de passe ne correspondent pas";

		element = document.getElementById("pwdConfirm");//Cible la zone de saisie
		element.style.border = "solid red";//Change sa bordure
		document.getElementById('labelConfirm').innerText="Confirmation du mot de passe : *Les 2 mots de passe ne correspondent pas";
	}



	if(compteur>0) //Si au moins un des champs est vide, affiche une erreur
	{
        alert("Veuillez remplir tous les champs \nChamps restants : "+compteur);
		return false;
	}
	
	if(compteur==0 && pwd==pwdConfirm)//Si aucune erreur
	{
		return true;//Permet alors l'envoi des donnees
	}
	
		
}