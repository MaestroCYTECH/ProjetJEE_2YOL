<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<script src="https://cdn.tailwindcss.com"></script>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<!-- Lien avec le CSS -->
<link rel="stylesheet" type="text/css" href="css/styleContact.css"/>

<!-- Titre du site dans le navigateur-->
<title>Le coin photo - Nous contacter</title>

<script type="text/javascript" src="js/contact.js"></script>


    <!-- Zone principale -->
    <div class="pagedroite">
        <div class="w-full place-content-center p-10">
            <div class="md:w-3/5 sm:w-full m-auto mb-10 bg-neutral-100 bg-opacity-60 backdrop-blur-lg rounded-xl text-neutral-800 shadow-xl border border-neutral-200">
		
                <div class="w-full p-5 rounded-t-xl upppercase font-bold text-left text-xl pb-5 border-b border-neutral-200 text-orange-500"><p>NOUS CONTACTER</p></div>
                <div class="font-sm m-auto rounded-b-xl">
                    
                    <form class="p-5" name="Formulaire" method="GET" onsubmit="return envoyer()" action="contact">
                        <fieldset>
                    
                    		<div class="grid gap-4 grid-cols-2">
                                  
                                <div class="w-full">
                                    <label class="font-sans text-md text-center color-neutral-900">Nom :</label> <span class="error">*</span> <br><br>
                                    <input type="text" id="nom" name="nom" class="w-full h-10 rounded-md p-4 box-border bg-neutral-50 bg-opacity-50 break-all color-neutral-600" placeholder="Ex: Nom" value=""/><br><br>
                                           
                                    <label class="font-sans text-md text-center color-neutral-900">Sexe :</label> <span class="error">*</span> <br><br>	
                                    <div id="sexe" class="font-sans w-full p-2 text-base inline-block box-border border-none bg-neutral-50 bg-opacity-0 color-neutral-900">
                                     	<div class="grid grid-cols-2">
                							
                                            <div class="items-center">
                  								<input id="Homme" name="sexe" type="radio" value="Homme" class="focus:ring-indigo-500 h-4 w-4 text-indigo-600 border-neutral-300">
                  								<label for="Homme" class="text-sm font-sans text-neutral-900">Homme</label>
                							</div>
                							<div class="items-center">
                  								<input id="Femme" name="sexe" type="radio" value="Femme" class="focus:ring-indigo-500 h-4 w-4 text-indigo-600 border-neutral-300">
                  								<label for="Femme" class="text-sm font-sans text-neutral-900">Femme</label>
                							</div> 

                                      	</div><br>
                                   	</div>

                                   	<label class="font-sans text-md text-center color-neutral-900">Adresse email :</label> <span class="error">*</span> <br><br>
                                    <input type="email" id="mailClient" name="mailClient" class="w-full h-10 rounded-md p-4 box-border bg-neutral-50 bg-opacity-50 break-all color-neutral-600" placeholder="Ex: monmail@monsite.org" value=""/><br><br>
                                </div>

                                <div class="w-full">                           
                                  	<label class="font-sans text-md text-center color-neutral-900">Prénom :</label> <span class="error">*</span> <br><br>
                                    <input type="text" id="prenom" name="prenom" class="w-full h-10 rounded-md p-4 box-border border bg-neutral-50 bg-opacity-50 break-all color-neutral-600" placeholder="Ex: Prénom" value=""/><br><br>
                                   
                                   	<label class="font-sans text-md text-center color-neutral-900">Date de naissance :</label> <span class="error">*</span> <br><br>
                                   	<input type="date" name="dateNaissance" id="date" max="2022-01-01" class="w-full h-10 rounded-md p-4 box-border bg-neutral-50 bg-opacity-50 break-all color-neutral-600" placeholder="jj/mm/aaaa" value=""/><br><br>
                                	<label class="font-sans text-md text-center color-neutral-900">Métier :</label> <span class="error">*</span> <br><br>
                                    
                                    <div class="box2" id="metier">
                                        <select name="metier">
                                            <option value="">--Veuillez choisir une option--</option>
                                            <option value="Etudiant">Etudiant</option>
                                            <option value="Enseignant">Enseignant</option>
                                            <option value="Commercant">Commerçant</option>
                                            <option value="Fonctionnaire">Fonctionnaire</option>
                                        </select>
                                    </div><br>
                                </div>
                                
                            </div>

                            <div class="leftalign">
                                <label class="font-sans text-md text-center color-neutral-900" for="sujet">Sujet :</label> <span class="error">*</span> <br><br>
                                <textarea class="w-full rounded-md p-4 box-border bg-neutral-50 bg-opacity-50 break-all color-neutral-600" rows="1" name="sujet" id="sujet" placeholder="Entrez le sujet de votre mail"></textarea><br><br>
                                        
                                <label class="font-sans text-md text-center color-neutral-900" for="contenu">Contenu :</label> <span class="error">*</span> <br><br>
                                <textarea class="w-full rounded-md p-4 box-border bg-neutral-50 bg-opacity-50 break-all color-neutral-600" name="contenu" id="contenu" wrap="hard" placeholder="Tapez ici votre mail"></textarea><br><br>
                            </div>
                                
                            <div class="w-full text-center">    
                            	<a class="w-1/4 p-3 text-white font-base text-center rounded-md box-border break-all inline-block bg-neutral-400 hover:bg-neutral-300" href="contact">Effacer</a>&nbsp&nbsp&nbsp    
                            	<input class="w-1/4 p-3 text-white font-base text-center rounded-md box-border break-all bg-orange-500 hover:bg-orange-400" type="submit" value="Envoyer"/>
                            </div>       

                        </fieldset>
                    </form>                               
                </div>
                                       
            </div>
        </div>
    </div>
    
</body>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
