                                                                                
                                                                                /*Page LISTE */

function deleteConfirm() /*Pour la suppression de produit */
{

    var confirm = prompt("Supprimer ce PRODUIT ? Action IRREVERSIBLE. Rentrez 'OUI' pour continuer");
    var confirm2="OUI";/*Pour les produits on ne demande pas de 2eme validation*/
   
    
    if (confirm=="OUI" && confirm2=="OUI")
    {	
        alert("Produit supprimé");
        return true;     
    }
    else
    {
        alert("Abandon")
        return false;
    }
}


function plus(i){
    var input = document.getElementsByClassName('form-control');

    var value = parseInt(input[i].value);
    input[i].value = value + 1;
  }
  
  function moins(i){
    var input = document.getElementsByClassName('form-control');
  
    var value = parseInt(input[i].value);
    
    if(input[i].value>=1){
        input[i].value = value - 1;
    } 
  }


function confirmStock(i){

    var qte=document.getElementsByClassName("form-control")[i].value;

    if (qte<=0){
        alert("Veuillez saisir un montant supérieur à 0");
        return false;
    }

    var confirmer= confirm("Augmenter ce stock de "+qte+" ?");
    if (confirmer==true)
    {	
        alert("Stock augmenté");
        return true;
    }
    else
    {
        alert("Abandon")
        return false;
    }
}


                                                                                /*Page AJOUT */


function confirmerAjout(){ //A FIXER, pas les bons name
    alert('JS à fixer');
            
        var nom=document.Formulaire.nom.value.trim();//Cible la valeur rentree en saisie
        var prenom=document.Formulaire.prenom.value.trim();
        var sexe=document.Formulaire.sexe.value.trim();
        var date=document.Formulaire.date.value.trim();
        var mail=document.Formulaire.mailClient.value.trim();
        var sujet=document.Formulaire.sujet.value.trim();
        var contenu=document.Formulaire.contenu.value.trim();
    
        var compteurNom=0;//Compte les erreurs
        var compteurPrenom=0;
        var compteurSexe=0;
        var compteurDate=0;
        var compteurMail=0;
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
    
        element = document.getElementById("sujet");
        element.style.border = null;
    
        element = document.getElementById("contenu");
        element.style.border = null;
    
    
    
    
        
    
        
    
    
    
        if ( (entreeTitre.trim()=="")  )
        {	
    
            alert("Le titre n'a pas été spécifié");
            element = document.getElementById("titre");
            element.style.border = "solid red";//Change sa bordure	
    
            compteur=compteur+1;
        }
    
        if ( (entreeAuteur.trim()=="")  )
        {	
    
            alert("L'auteur n'a pas été spécifié");
            element = document.getElementById("auteur");
            element.style.border = "solid red";//Change sa bordure	
    
            compteur=compteur+1;
        }
    
        if ((entreePrix.toString().length)==0)
        {
    
            alert("Le prix n'a pas été spécifié");
            element = document.getElementById("prix");
            element.style.border = "solid red";//Change sa bordure	
    
            compteur=compteur+1;
        }
        
        if (entreeEmail.trim()=="")
        {
    
            alert("L'email n'a pas été spécifié");
            element = document.getElementById("email");
            element.style.border = "solid red";//Change sa bordure	
    
            compteur=compteur+1;
        }
    
        if (entreeDesc.trim()=="")
        {
            alert("La description n'a pas été spécifié");
            compteur=compteur+1;
        }
    
    
        if (compteur>0)
        {
            return false;
        }
        else
        {
            if (confirm("Ajouter ce produit ?"))
            {	
                alert("Produit ajouté");
                return true;
            }
            else
            {
                alert("Abandon");
                return false;
            }
        }	


}