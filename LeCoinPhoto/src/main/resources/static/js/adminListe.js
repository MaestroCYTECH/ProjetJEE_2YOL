                                                                                
                                                                                /*Page LISTE */

function deleteConfirm() /*Pour la suppression de produit */
{

    var confirm = prompt("Supprimer ce PRODUIT ? Action IRREVERSIBLE. Rentrez 'OUI' pour continuer");
    
    if (confirm=="OUI")
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

