
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