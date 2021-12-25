
function ajaxDeleteProduit(ref){ //Ajax quand l'utilisateur supprime un article du panier supprime un article du panier

    if (ref == "") { //Si rien n'a été demandé
        return;
    } else {

        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {

            if (this.readyState == 4 && this.status == 200) { //Si la requete est prete, on fait : 
                
                var nb=document.getElementById('ajaxNbArticles').textContent;
                nb=nb-1;
                var indice=document.getElementsByClassName(ref).length-1; //On cible le dernier et non le premier, utile dans le cas où premiers produits sont considérés en stock et pas les derniers
                document.getElementsByClassName(ref)[indice].remove(); //Supprime le produit de l'affichage du panier (mais pas encore de la BDD)

                //On met aussi à jour l'affichage du nombre d'articles
                if(nb==0){              
                    document.getElementById('ajaxPanier').innerHTML="Votre panier est vide pour le moment <br><br><br><br><br><br><br><br><br><br><br><br>"; 
                }
                else{
                    document.getElementById('ajaxNbArticles').textContent=nb;

                    if(nb==1){
                        document.getElementById('ajaxArticles').textContent="article";
                    }
                    else{
                        document.getElementById('ajaxArticles').textContent="articles";
                    }
                }              
                
            }
        };

        xmlhttp.open("POST","/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/php/deleteProduitPanier.php",true); //Supprime le produit de la BDD
        xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xmlhttp.send("ref="+ref);
        }
}


function confirmerSuppression(ref){ /*Demande confirmation et supprime avec Ajax */

    var confirmer= confirm("Voulez-vous supprimer cet article du panier ?");
    if (confirmer==true)
    {	
        alert("Article supprimé");
        ajaxDeleteProduit(ref);
        return false;
    }
    else
    {
        alert("Abandon")
        return false;
    }
}

function confirmerPaiement(){ //Pour la page paiement

    var total=document.Form.total.value;
    var confirmer= confirm("Vous allez payer "+total+" €\nConfirmer ?");
    if (confirmer==true)
    {	
        alert("Paiement effectué \nMerci de votre achat chez nous");
        return true;
    }
    else
    {
        alert("Abandon")
        return false;
    }
}

