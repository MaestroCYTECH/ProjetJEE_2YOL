<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html xmlns:th="https://www.thymeleaf.org">

	<script src="https://cdn.tailwindcss.com"></script>
	
	    
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<!-- Lien avec le CSS -->
<link rel="stylesheet" type="text/css" href="css/stylePanier.css"/>

<!-- Titre du site dans le navigateur-->
<title>Le coin photo - Mon panier</title>

<script type="text/javascript" src="js/panier.js"></script>

<!-- FAIRE VERIF si deja connecté, l'envoyer sur la page de profil. Idem pour panier et inscription-->


    <!-- Zone de navigation sur la droite-->
    <div class="pagedroite">
    <div class="w-full place-content-center p-10">
		<div class="md:w-3/5 sm:w-full m-auto border-neutral-400">
            
        <div class="m-1/2 font-sans bg-neutral-50 bg-opacity-75 rounded-xl shadow-md">
            <div class="w-full p-5 rounded-t-xl upppercase font-bold text-left text-xl pb-5 border-b border-neutral-200 text-indigo-500"><p>MON PANIER</p></div>
                    
            <div id="ajaxPanier">
                        
                <div class="flex p-2 m-4 bg-white border border-neutral-300 rounded-lg text-center hover:border-indigo-400 hover:shadow-lg">                
                    <div class="flex-1 text-left pl-4">
                        <img class="h-20" src="img/FXT4.jpg" alt="Fujifilm X-T4" onerror="this.onerror=null; this.src='img/blank.png'" >
                    </div>
            
                                            
                    <div class="flex-auto my-auto"> 
                        Nom : <strong><a class="flex-3" href="appareils">FujiFilm X-T4</a></strong><br>
                    </div>
                                            
                    <div class="flex-auto my-auto">                                         
                        Prix : <strong>1699 €</strong>
                    </div> <br>
                                                                            
                    <form class="flex-auto my-auto" onsubmit="return confirmerSuppression(document.getElementsByClassName('inputapp1')[0].value)">
                        <input type="hidden" class="inputapp1" name="ref" value="app1">
                        <input class="h-6 w-6 m-auto rounded-xl box-border break-all border-none hover:shadow-xl hover:shadow-red-500" type="submit" value="&#x274C;"/>
                	</form><br> 

                </div>
                
                <div class="flex p-2 m-4 bg-white border border-neutral-300 rounded-lg text-center hover:border-indigo-400 hover:shadow-lg">                
                    <div class="flex-1 text-left pl-4">
                        <img class="h-20" src="img/FXT4.jpg" alt="Fujifilm X-T4" onerror="this.onerror=null; this.src='img/blank.png'" >
                    </div>
            
                                            
                    <div class="flex-auto my-auto"> 
                        Nom : <strong><a class="flex-3" href="appareils">FujiFilm X-T4</a></strong><br>
                    </div>
                                            
                    <div class="flex-auto my-auto">                                         
                        Prix : <strong>1699 €</strong>
                    </div> <br>
                                                                            
                    <form class="flex-auto my-auto" onsubmit="return confirmerSuppression(document.getElementsByClassName('inputapp1')[0].value)">
                        <input type="hidden" class="inputapp1" name="ref" value="app1">
                        <input class="h-6 w-6 m-auto rounded-xl box-border break-all border-none hover:shadow-xl hover:shadow-red-500" type="submit" value="&#x274C;"/>
                	</form><br> 

                </div>
                
                <div class="w-full p-5">
                	<a class="boutonPayer w-20 h-10 text-center decoration-none block py-2 my-3 mx-auto rounded-md box-border border-none break-all bg-indigo-500 hover:bg-indigo-400 text-white shadow-xl" href="paiement"> PAYER </a>
                	<p class="text-center mx-auto">Vous avez <label id="ajaxNbArticles">2</label> <label id="ajaxArticles">article</label></p>
                </div>

            </div>

        </div>
        </div>
        </div>
    </div>


</body>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>