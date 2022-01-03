function envoyer() {
    
	var login=document.Formulaire.login.value.trim();//Cible la valeur rentree en saisie
	var pwd=document.Formulaire.pwd.value.trim();
   
	var compteurLogin=0;//Compte les erreurs
	var compteurPwd=0;

	var element;
	
	//Par défaut, pas de rouge
	element = document.getElementById("login");
	element.style.border = null;

	element = document.getElementById("pwd");
	element.style.border = null;

	
	if(login =="")  
	{
		compteurLogin=1;
		element = document.getElementById("login");//Cible la zone de saisie
		element.style.border = "solid red";//Change sa bordure	
	}
	
	
	if(pwd == "") 
	{
		compteurPwd=1;
		element = document.getElementById("pwd");//Cible la zone de saisie
		element.style.border = "solid red";//Change sa bordure
		
	}


	var compteur=compteurLogin+compteurPwd;
	if(compteur>0) //Si au moins un des champs est vide, affiche une erreur
	{
        alert("Veuillez remplir tous les champs \nChamps restants : "+compteur);
		return false;
	}	
	
	if(compteur==0)//Si aucune erreur
	{
		return true;//Permet alors l'envoi des donnees
	}
	
		
}