<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html xmlns:th="https://www.thymeleaf.org">    
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<!-- Lien avec le CSS -->
<link rel="stylesheet" type="text/css" href="css/styleContact.css"/> <!-- Car formulaire très similaire à celui de contact -->

<!-- Titre du site dans le navigateur-->
<title>Le coin photo - M'inscrire</title>

<script type="text/javascript" src="js/inscription.js"></script>


<!-- Zone principale -->
<div class="pagedroite">
	<div class="w-full place-content-center p-10">
	
	    <div class="md:w-2/5 sm:w-full m-auto mb-10 bg-neutral-100 bg-opacity-60 backdrop-blur-lg rounded-xl text-neutral-800 shadow-xl border border-neutral-200">
	        <div class="w-full p-5 rounded-t-xl upppercase font-bold text-left text-xl pb-5 border-b border-neutral-200 text-indigo-500"><p>S'INSCRIRE</p></div>
	            
	        <div class="font-sans m-auto w-full p-5">	            	
	       	
	            <form name="Formulaire" method="POST" onsubmit="return envoyer()" action="userInscription" th:action=@{/userInscription} th:object=${Utilisateurs}>
	                    
					<span class="mb-8" style="color:red">${erreur}</span>
					<span class="mb-8" style="color:green">${OK}</span>
					<c:remove var = "OK"/><c:remove var = "erreur"/> 
					<!--Comme ces variable viennent de la session, permet de ne pas réafficher le succès quand on revient sur la page plus tard-->	

	                <fieldset>                     
	                    <div class="">
	                        <div class="w-full items-center justify-center place-content-center">
	    
	                            <input type="text" id="nom" name="nom" class="w-full p-3 rounded-md bg-neutral-100 bg-opacity-50 mb-8" placeholder="Nom" />
	                            <input type="text" id="prenom" name="prenom" class="w-full p-3 rounded-md bg-neutral-100 bg-opacity-50 mb-8" placeholder="Prénom"/>   
	                                
								<div id="sexe" class="w-full block m-auto items-center mb-8">
	                            	<div class="w-full m-auto text-center block mb-3">
	                                	<input type="radio" class="focus:ring-indigo-500 h-4 w-4 text-indigo-400 border-neutral-300 m-auto" name="sexe" value="Homme" id="Homme">
	                                	<label for="Homme" class="text-sm font-sans text-neutral-400"> Homme </label>
	                                </div>
	                                <div class="w-full block text-center text-neutral-400">
	                                	<input type="radio" class="focus:ring-indigo-500 h-4 w-4 text-indigo-400 border-neutral-300 m-auto mr-1"  name="sexe" value="Femme" id="Femme">
	                                	<label for="Femme" class="text-sm font-sans text-neutral-400"> Femme </label>
	                                </div>
	                            </div>

	                            <input type="email" id="email" name="email" class="w-full p-3 rounded-md bg-neutral-50 bg-opacity-50 mb-8" placeholder="Email"/>
	                            <input type="text" id="login" name="login" class="w-full p-3 rounded-md bg-neutral-50 bg-opacity-50 mb-8" placeholder="Login" />
	                            <input type="password" id="pwd" name="pwd" class="w-full p-3 rounded-md bg-neutral-50 bg-opacity-50 mb-8" placeholder="Mot de passe"/>
	                            <input type="password" id="pwdConfirm" name="pwdConfirm" class="w-full p-3 rounded-md bg-neutral-50 bg-opacity-50 mb-8" placeholder="Confirmer le mot de passe"/>
	                            	
	                            <input type="hidden" id="panier" name="panier" value="Vide"/>
								<input type="hidden" id="statut" name="statut" value="simple"/>
							
								<div class="flex gap-4">
									<input class="flex-1 rounded-md uppercase text-white p-3 bg-neutral-400 hover:bg-neutral-300" type="reset" value="Effacer" />
	                        		<input class="flex-1 rounded-md uppercase text-white p-3 bg-indigo-500 hover:bg-indigo-400" type="submit" value="M'inscrire"/>
	                        	</div>
	                        
	                        </div>
	                    </div>
	
                    </fieldset>
	            </form>

	        </div>
	    </div>
	</div>
</div>

</body>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>