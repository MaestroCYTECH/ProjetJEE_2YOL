<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html xmlns:th="https://www.thymeleaf.org">    

	<script src="https://cdn.tailwindcss.com"></script>
	
	    
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<!-- Lien avec le CSS -->
<link rel="stylesheet" type="text/css" href="css/stylePanier.css"/>

<!-- Titre du site dans le navigateur-->
<title>Le coin photo - section Admin</title>

<script type="text/javascript" src="js/admin.js"></script>


    <!-- Zone de navigation sur la droite-->
    <div class="pagedroite">  
    <div class="w-full place-content-center p-10">
		<div class="md:w-3/5 sm:w-full m-auto border-neutral-400">

        <div class="m-1/2 pb-2 font-sans text-center bg-neutral-50 bg-opacity-75 rounded-xl shadow-md">
            <div class="w-full p-5 rounded-t-xl upppercase font-bold text-left text-xl pb-5 border-b border-neutral-200 text-indigo-500"><p>LISTE DES PRODUITS</p></div>
			
			<div class="w-full pl-8 mt-4">
            	<a class="w-2/5 h-10 decoration-none block py-2 px-4 bg-indigo-500 rounded-md box-border break-all hover:bg-indigo-400 text-white shadow-xl" href='adminHome'> Retourner à la section ADMIN </a>
            </div>
            
            <h2 class="m-8 pt-4 font-bold">TITRESECTION (Appareils/objectifs/accessoires, en fct de l'URL)</h2>
                
                
            <div class="flex p-2 m-4 bg-white border border-neutral-50 rounded-lg text-center hover:border-indigo-400 hover:shadow-lg">

                <div class="flex-1 text-left pl-4">
                    <img class="h-20" src="img/FXT4.jpg" alt="NOM" onerror="this.onerror=null; this.src='img/blank.png'" >
                </div>

                <div class="flex-auto my-auto"> 
                    Nom : <strong><a class="flex-3" href="appareils">FujiFilm X-T4</a></strong><br>
                    Prix : <strong>1699 €</strong>
                </div>
                
                <div class="flex-auto my-auto">                                         
                    
                    Stock : <strong> STOCK </strong>   
                </div>
                
                <div class="flex-auto ">
                	<form  name="Form" class="form mt-2" method='POST' onsubmit="return envoyer(0)" action='addToCart'>
	    
	                        <button class="moins flex-1 px-2 border-none bg-neutral-400 color-neutral-900 rounded-xl" onclick="moins(0)" type="button"> - </button>
	                        <input type="number" name="quantite" min="1" max="3" value="1" class="form-control flex-1 text-center border-none bg-neutral-400 color-neutral-900 rounded-xl" readonly>
	                        <button class="plus flex-1 px-1.5 border-none bg-neutral-400 color-neutral-900 rounded-xl" onclick="plus(0)" type="button"> + </button><br>
	                        <input type="hidden" name="REF" value="app1">
	                        
                        	<input class="boutonVert p-1 mt-2 rounded-xl box-border border-none break-all text-white shadow-md" type="submit" value="AJOUTER DU STOCK"/>       
	            	</form> 
                </div>             
            
				<div class="flex-auto my-auto">        
                	<form method="POST" onsubmit="return deleteConfirm()" action="adminDeleteProduit">
                    	<input type="hidden" name="refSuppr" value="app1">
                    	<input type="hidden" name="catSuppr" value="appareils">

                    	<input class="h-6 w-6 m-auto rounded-xl box-border break-all border-none hover:shadow-xl hover:shadow-red-500" type="submit" value="&#x274C;"/>
                	</form>
                </div>

            </div>
          
            
            <div class="flex p-2 m-4 bg-white border border-neutral-50 rounded-lg text-center hover:border-indigo-400 hover:shadow-lg">

                <div class="flex-1 text-left pl-4">
                    <img class="h-20" src="img/FXT4.jpg" alt="NOM" onerror="this.onerror=null; this.src='img/blank.png'" >
                </div>

                <div class="flex-auto my-auto"> 
                    Nom : <strong><a class="flex-3" href="appareils">FujiFilm X-T4</a></strong><br>
                    Prix : <strong>1699 €</strong>
                </div>
                
                <div class="flex-auto my-auto">                                         
                    
                    Stock : <strong> STOCK </strong>   
                </div>
                
                <div class="flex-auto ">
                	<form  name="Form" class="form mt-2" method='POST' onsubmit="return envoyer(0)" action='addToCart'>
	    
	                        <button class="moins flex-1 px-2 border-none bg-neutral-400 color-neutral-900 rounded-xl" onclick="moins(1)" type="button"> - </button>
	                        <input type="number" name="quantite" min="1" max="3" value="1" class="form-control flex-1 text-center border-none bg-neutral-400 color-neutral-900 rounded-xl" readonly>
	                        <button class="plus flex-1 px-1.5 border-none bg-neutral-400 color-neutral-900 rounded-xl" onclick="plus(1)" type="button"> + </button><br>
	                        <input type="hidden" name="REF" value="app1">
	                        
                        	<input class="boutonVert p-1 mt-2 rounded-xl box-border border-none break-all text-white shadow-md" type="submit" value="AJOUTER DU STOCK"/>       
	            	</form> 
                </div>             
            
				<div class="flex-auto my-auto">        
                	<form method="POST" onsubmit="return deleteConfirm()" action="adminDeleteProduit">
                    	<input type="hidden" name="refSuppr" value="app1">
                    	<input type="hidden" name="catSuppr" value="appareils">

                    	<input class="h-6 w-6 m-auto rounded-xl box-border break-all border-none hover:shadow-xl hover:shadow-red-500" type="submit" value="&#x274C;"/>
                	</form>
                </div>

            </div>
        </div>
    </div>
    </div>
    
</div>

</body>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>