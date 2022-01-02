<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html xmlns:th="https://www.thymeleaf.org">    

	<script src="https://cdn.tailwindcss.com"></script>
	
	
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<!-- Lien avec le CSS -->
<link rel="stylesheet" type="text/css" href="css/stylePanier.css"/>

<!-- Titre du site dans le navigateur-->
<title>Le coin photo - Paiement</title>

<script type="text/javascript" src="js/panier.js"></script>


<!-- FAIRE VERIF si deja connecté, l'envoyer sur la page de profil. Idem pour panier et inscription-->


<!-- Zone de navigation sur la droite-->
<div class="pagedroite">     
    <div class="w-full place-content-center p-10">
		<div class="md:w-2/5 sm:w-full m-auto border-neutral-400">

        <div class="m-1/2 font-sans text-center bg-neutral-50 bg-opacity-75 rounded-xl shadow-md">
            <div class="w-full p-5 rounded-t-xl upppercase font-bold text-left text-xl pb-5 border-b border-neutral-200 text-indigo-500"><p>PAIEMENT</p></div><br>
        
            <p class="flex font-bold text-left ml-4 mb-8"> Vos articles : </p>
           
            <div class="flex p-4 m-4 bg-white border border-neutral-300 rounded-lg text-center hover:border-indigo-400 hover:shadow-lg">
                <div class="flex-auto ">Nom :</div><div class="flex-auto font-bold">FujiFilm X-T4</div>
                <div class="flex-auto">Prix :</div><div class="flex-auto font-bold">1699 €</div>                                   
            </div>

            <div class="flex p-4 m-4 bg-white border border-neutral-300 rounded-lg text-center hover:border-indigo-400 hover:shadow-lg">
                <div class="flex-auto ">Nom :</div><div class="flex-auto font-bold">FujiFilm X-T4</div>
                <div class="flex-auto">Prix :</div><div class="flex-auto font-bold">1699 €</div>                                   
            </div>
            
            <div class="flex m-4 mt-14">
            	<div class="flex-auto text-left ml-4">Montant Total :</div> 
            	<div class="flex-auto text-right mr-4 font-bold">3398 €</div>
            </div>     
                    
            <form class="w-full p-5" name="Form" method='POST' onsubmit="return confirmerPaiement()" action='payerPanier'>
                <input type="hidden" name="login" value="admin">
                <input type="hidden" name="total" value="3398">
                <input type="hidden" name="panierString" value="Vide,app1,app1">
                <input class="boutonPayer w-20 h-10 text-center decoration-none block py-2 my-3 mx-auto rounded-md box-border border-none break-all bg-indigo-500 hover:bg-indigo-400 text-white shadow-xl" type="submit" name="payer" value="PAYER"/>
            </form>  
            
            </div>      
        
        </div>




        </div>
    </div>
</div>

</body>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>