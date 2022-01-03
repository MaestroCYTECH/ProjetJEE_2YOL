                                                                                
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
    else{
        alert("Abandon")
        return false;
    }
}


                                                                                /*Page AJOUT */


function confirmerAjout(){ 
            
    
        var cat=document.Formulaire.categorie.value.trim();//Cible la valeur rentree en saisie
        var prix=document.Formulaire.prix.value.trim();
        var image=document.Formulaire.image.value.trim();
        var stock=document.Formulaire.stock.value.trim();
        var nom=document.Formulaire.nom.value.trim();
        var desc=document.Formulaire.description.value.trim();

        var compteur=0;
        var element;
        
    
        //Par défaut, pas de rouge
        element = document.getElementById("categorie");
        element.style.border = null;
    
        element = document.getElementById("prix");
        element.style.border = null;
    
        element = document.getElementById("image");
        element.style.border = null;
    
        element = document.getElementById("stock");
        element.style.border = null;
    
        element = document.getElementById("nom");
        element.style.border = null;
    
        element = document.getElementById("description");
        element.style.border = null;
     
    
    
        if ( (cat.trim()=="")  ){	
            
            alert("La catégorie n'a pas été spécifiée");
            element = document.getElementById("categorie");
            element.style.border = "solid red";//Entoure la zone de catégorie	
            compteur++;
        }
    
        if (prix.toString().length==0){	
    
            alert("Le prix n'a pas été spécifié");
            element = document.getElementById("prix");
            element.style.border = "solid red";
    
            compteur++;
        }
    
        if (image.trim()==""){
               
            alert("L'image n'a pas été spécifiée");
            element = document.getElementById("image");
            element.style.border = "solid red";
            compteur++;
        }
        
        if (stock.toString().length==0){
    
            alert("Le stock de départ n'a pas été spécifié");
            element = document.getElementById("stock");
            element.style.border = "solid red";
            compteur++;
        }

        if (nom.trim()==""){

            alert("Le nom du produit n'a pas été spécifié");
            element = document.getElementById("nom");
            element.style.border = "solid red";
            compteur++;
        }
    
        if (desc.trim()==""){
            alert("La description n'a pas été remplie");
            element = document.getElementById("description");
            element.style.border = "solid red";
            compteur++;
        }
    
    
        if (compteur>0)
        {
            alert('Formulaire incomplet. Saisies restantes : '+compteur);
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