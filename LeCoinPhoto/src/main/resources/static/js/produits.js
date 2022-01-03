function plus(i){
  var input = document.getElementsByClassName('form-control');
  var max = parseInt(input[i].getAttribute('max'));
  
  var value = parseInt(input[i].value);
  if(input[i].value<max){
    input[i].value = value + 1;
  }
}

function moins(i){
  var input = document.getElementsByClassName('form-control');
  
  var value = parseInt(input[i].value);
  if(input[i].value>1) input[i].value = value - 1;
}


function envoyer(i){
  var element=document.getElementsByClassName('quantite')[i];
  

  var quantite=element.value;//Cible la valeur rentree en saisie
  var max=element.getAttribute('max');
  var min=element.getAttribute('min');

  if (quantite>max || min<quantite){
    alert('Quantité invalide');
    return false;
  }
  alert("Ajouté au panier");
  return true;
}