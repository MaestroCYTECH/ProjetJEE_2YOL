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


   <!-- Zone de navigation sur la droite-->
   <div class="pagedroite">
   <div class="w-full place-content-center p-10">
		<div class="md:w-3/5 sm:w-full m-auto border-neutral-400">
		
            <div class="m-1/2 font-sans bg-neutral-50 bg-opacity-75 rounded-xl shadow-md">
                <div class="w-full p-5 rounded-t-xl upppercase font-bold text-left text-xl pb-5 border-b border-neutral-200 text-orange-500"><p>NOUS CONTACTER</p></div>
                <div class="p-1/4 font-sm m-auto rounded-b-xl backdrop-blur-lg">
                    
                    <form name="Formulaire" method="POST" onsubmit="return envoyer()" action="contact">
                        <fieldset>
                    
                    		<div class="box3">
                                  <div class="gauche">
                                      <label class="font-sans text-md text-center color-neutral-900">Nom :</label> <span class="error">*</span> <br><br>
                                      <input type="text" id="nom" name="nom" class="w-full h-10 rounded-md p-4 box-border border border-neutral-400 bg-neutral-50 bg-opacity-25 break-all color-neutral-600" placeholder="Ex: Nom" value=""/><br><br>
                                            
                                      <label class="font-sans text-md text-center color-neutral-900">Sexe :</label> <span class="error">*<?=$erreurSexe;?></span> <br><br>	
                                      <div id="sexe" class="font-sans w-full p-2 text-base inline-block box-border border-none bg-neutral-50 bg-opacity-0 color-neutral-900">
                                       <div class="flex">
                						<div class="flex items-center ml-16">
                  							<input id="Homme" name="sexe" type="radio" value="Homme" class="focus:ring-indigo-500 h-4 w-4 text-indigo-600 border-neutral-300">
                  							<label for="Homme" class="text-sm font-sans text-neutral-900">
                    							Homme
                  							</label>
                						</div>
                						<div class="flex items-center ml-16">
                  							<input id="Femme" name="sexe" type="radio" value="Femme" class="focus:ring-indigo-500 h-4 w-4 text-indigo-600 border-neutral-300">
                  							<label for="Femme" class="text-sm font-sans text-neutral-900">
                    							Femme
                  							</label>
                						</div>                                      
                                       </div><br><br>
                                   	  </div>
                                   </div>

                                  <div class="droite">                           
                                    <label class="font-sans text-md text-center color-neutral-900">Prénom :</label> <span class="error">*</span> <br><br>
                                    <input type="text" id="prenom" name="prenom" class="w-full h-10 rounded-md p-4 box-border border border-neutral-400 bg-neutral-50 bg-opacity-25 break-all color-neutral-600" placeholder="Ex: Prénom" value=""/><br><br>
                                   
                                   <!-- Pas utile ?? Si on supprime, penser à supprimer aussi ses références du fichier js sinon ça le casse-->
                                   <label class="font-sans text-md text-center color-neutral-900">Date de naissance :</label> <span class="error">*</span> <br><br>
                                   <input type="date" name="dateNaissance" id="date" max="2022-01-01" class="w-full h-10 rounded-md p-4 box-border border border-neutral-400 bg-neutral-50 bg-opacity-25 break-all color-neutral-600" placeholder="jj/mm/aaaa" value=""/><br><br>
                                </div>
                            </div>

                            <div class="box3">
                                <div class="gauche">
                                    <label class="font-sans text-md text-center color-neutral-900">Adresse email :</label> <span class="error">*</span> <br><br>
                                    <input type="email" id="mailClient" name="mailClient" class="w-full h-10 rounded-md p-4 box-border border border-neutral-400 bg-neutral-50 bg-opacity-25 break-all color-neutral-600" placeholder="Ex: monmail@monsite.org" value=""/><br><br>
                                </div>
                                       
                                <div class="droite">                           
                                    <label class="font-sans text-md text-center color-neutral-900">Métier :</label> <span class="error">*</span> <br><br>
                                    <div class="box2" id="metier">
                                        <select name="metier">
                                            <option value="">--Veuillez choisir une option--</option>
                                            <option>Etudiant</option>
                                            <option>Enseignant</option>
                                            <option>Commerçant</option>
                                            <option>Fonctionnaire</option>
                                        </select>
                                    </div><br>
                                </div>
                            </div>
                    

                            <div class="leftalign">
                                <label class="font-sans text-md text-center color-neutral-900" for="sujet">Sujet :</label> <span class="error">*</span> <br><br>
                                <textarea class="w-full rounded-md p-4 box-border border border-neutral-400 bg-neutral-50 bg-opacity-25 break-all color-neutral-600" rows="1" name="sujet" id="sujet" placeholder="Entrez le sujet de votre mail"></textarea><br><br>
                                        
                                <label class="font-sans text-md text-center color-neutral-900" for="contenu">Contenu :</label> <span class="error">*</span> <br><br>
                                <textarea class="w-full rounded-md p-4 box-border border border-neutral-400 bg-neutral-50 bg-opacity-25 break-all color-neutral-600" name="contenu" id="contenu" wrap="hard" placeholder="Tapez ici votre mail"></textarea><br><br>
                            </div>
                                
                            <a class="boutonEffacer font-base rounded-md box-border border-none break-all inline-block decoration-none bg-neutral-400 shadow-md" href="contact">Effacer</a>&nbsp&nbsp&nbsp    
                            <input class="boutonEnvoyer font-base rounded-md box-border border-none break-all bg-orange-500 shadow-md" type="submit" value="Envoyer"/>

                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
