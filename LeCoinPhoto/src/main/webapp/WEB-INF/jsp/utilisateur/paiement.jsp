<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>    

	<script src="https://cdn.tailwindcss.com"></script>
	
	
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<!-- Lien avec le CSS -->
<link rel="stylesheet" type="text/css" href="css/stylePanier.css"/>

<!-- Titre du site dans le navigateur-->
<title>Le coin photo - Paiement</title>

<script type="text/javascript" src="js/paiement.js"></script>


<!-- FAIRE VERIF si deja connecté, l'envoyer sur la page de profil. Idem pour panier et inscription-->


<!-- Zone de navigation sur la droite-->
<div class="pagedroite">     
    <div class="w-full place-content-center p-10">
		<div class="md:w-2/5 sm:w-full m-auto border-neutral-400">

        <div class="m-1/2 font-sans text-center bg-neutral-50 bg-opacity-75 rounded-xl shadow-md">
            <div class="w-full p-5 rounded-t-xl upppercase font-bold text-left text-xl pb-5 border-b border-neutral-200 text-indigo-500"><p>PAIEMENT</p></div><br>
        
            <p class="flex font-bold text-left ml-4 mb-8"> Vos articles : </p>

            <c:forEach items="${panier}" var="entry">
                <c:choose>
                    <c:when test="${entry.stock==0}">
                        <!--On fait rien, le montant n'est pas compté et le produit indisponible n'apparait pas dans le recap de paiement-->
                    </c:when>
                    <c:otherwise>  
                        <div class="flex p-4 m-4 bg-white border border-neutral-300 rounded-lg text-center hover:border-indigo-400 hover:shadow-lg">
                            <div class="flex-auto ">Nom :</div><div class="flex-auto font-bold">${entry.nom}</div>
                            <div class="flex-auto">Prix :</div><div class="flex-auto font-bold">${entry.prix} €</div>                                   
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            
            <div class="flex m-4 mt-14">
            	<div class="flex-auto text-left ml-4">Montant Total :</div> 
            	<div class="flex-auto text-right mr-4 font-bold">${total} €</div>
            </div>     
                    
            <form class="w-full p-5" name="Form" method='POST' onsubmit="return confirmerPaiement()" action='payerPanier'>
                <input type="hidden" name="total" value="${total}">
                <input class="boutonPayer w-20 h-10 text-center decoration-none block py-2 my-3 mx-auto rounded-md box-border border-none break-all bg-indigo-500 hover:bg-indigo-400 text-white shadow-xl" type="submit" name="payer" value="PAYER"/>
            </form>  
            
            </div>      
        
        </div>




        </div>
    </div>
</div>

</body>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>