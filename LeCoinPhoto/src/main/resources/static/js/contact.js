
function envoyer() {
    
	var nom=document.Formulaire.nom.value.trim();//Cible la valeur rentree en saisie
	var prenom=document.Formulaire.prenom.value.trim();
    var sexe=document.Formulaire.sexe.value.trim();
    var date=document.Formulaire.date.value.trim();
	var mail=document.Formulaire.mailClient.value.trim();
	var metier=document.Formulaire.metier.value.trim();
    var sujet=document.Formulaire.sujet.value.trim();
    var contenu=document.Formulaire.contenu.value.trim();

	var compteurNom=0;//Compte les erreurs
	var compteurPrenom=0;
    var compteurSexe=0;
    var compteurDate=0;
    var compteurMail=0;
	var compteurMetier=0;
    var compteurSujet=0;
    var compteurContenu=0;

	var element;
	

	//Par défaut, pas de rouge
	element = document.getElementById("nom");
	element.style.border = null;

	element = document.getElementById("prenom");
	element.style.border = null;

	element = document.getElementById("sexe");
	element.style.border = null;

	element = document.getElementById("date");
	element.style.border = null;

	element = document.getElementById("mailClient");
	element.style.border = null;

	element = document.getElementById("metier");
	element.style.border = null;

	element = document.getElementById("sujet");
	element.style.border = null;

	element = document.getElementById("contenu");
	element.style.border = null;



	if(nom =="")  
	{
		alert("Le nom n'a pas été spécifié");
		compteurNom=1;
		element = document.getElementById("nom");//Cible la zone de saisie
		element.style.border = "solid red";//Change sa bordure	
	}	
	
	if(prenom == "") 
	{
		alert("Le prenom n'a pas été spécifié");
		compteurPrenom=1;
		element = document.getElementById("prenom");//Cible la zone de saisie
		element.style.border = "solid red";//Change sa bordure
		
	}
	
    if(sexe == "") 
	{
		alert("Le sexe n'a pas été spécifié");
		compteurSexe=1;
		element = document.getElementById("sexe");//Cible la zone de saisie
		element.style.border = "solid red";//Change sa bordure
	}

    if(date == "") 
	{
		alert("La date de naissance n'a pas été spécifié");
		compteurDate=1;
		element = document.getElementById("date");//Cible la zone de saisie
		element.style.border = "solid red";//Change sa bordure
	}

	
	regexMail=/^[a-z0-9._-]+@[a-z0-9._-]{2,}\.[a-z]{2,4}$/;
	//Regex : verifie si l'email respecte un modele. Ici :autant de caracteres, puis un @, puis au moins 2 caracteres, puis . puis entre 2 et 4 lettres (entre a et z)

	if( (mail == "") || regexMail.test(mail)==false ) 
	{
		alert("Le mail n'est pas valide");
		compteurMail=1;
		element = document.getElementById("mailClient");//Cible la zone de saisie
		element.style.border = "solid red";//Change sa bordure
	}

	if(metier == "") 
	{
		alert("Le métier n'a pas été spécifié");
		compteurMetier=1;
		element = document.getElementById("metier");//Cible la zone de saisie
		element.style.border = "solid red";//Change sa bordure
	}

    if(sujet == "") 
	{
		alert("Le sujet n'a pas été spécifié");
		compteurSujet=1;
		element = document.getElementById("sujet");//Cible la zone de saisie
		element.style.border = "solid red";//Change sa bordure
	}

    if(contenu == "") 
	{
		alert("Le contenu n'a pas été spécifié");
		compteurContenu=1;
		element = document.getElementById("contenu");//Cible la zone de saisie
		element.style.border = "solid red";//Change sa bordure
	}


	var compteur=compteurNom+compteurPrenom+compteurSexe+compteurDate+compteurMail+compteurSujet+compteurContenu+compteurMetier;
	if(compteur>0) //Si au moins un des champs est vide, affiche une erreur
	{
        alert("Veuillez remplir tous les champs \nChamps restants invalides : "+compteur);
		return false;
	}	
	
	if(compteur==0)//Si aucune erreur
	{
        location.href = "mailto:lecoinphoto@gmail.com?subject="+sujet+"&body= Expéditeur : "+mail+"%0d%0aNom : "+nom+"%0d%0a Prenom : "+prenom+"%0d%0a Date de naissance : "+date+"%0d%0a Sexe : "+sexe+"%0d%0a Métier : "+metier+"%0d%0a Contenu : "+contenu;

		return true;//Permet alors l'envoi des donnees
	}
	
}
