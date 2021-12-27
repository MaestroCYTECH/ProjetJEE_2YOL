<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<!-- Lien avec le CSS -->
<link rel="stylesheet" type="text/css" href="css/styleContact.css"/>

<!-- Titre du site dans le navigateur-->
<title>Le coin photo - Nous contacter</title>

<script type="text/javascript" src="js/contact.js"></script>


   <!-- Zone de navigation sur la droite-->
   <div class="pagedroite">
        <div class="background">


            <div class="bloc">
                <div class="titresection"><p>NOUS CONTACTER</p></div>
                <div class="texte">
                    
                    <form name="Formulaire" method="POST" onsubmit="return envoyer()" action="contact">
                        <fieldset>
                    
                    		<div class="box3">
                                  <div class="gauche">
                                      <label class="label">Nom :</label> <span class="error">*</span> <br><br>
                                      <input type="text" id="nom" name="nom" class="forminput" placeholder="Ex: NOM" value=""/><br><br>
                                            
                                      <label class="label">Sexe :</label> <span class="error">*<?=$erreurSexe;?></span> <br><br>	
                                      <div id="sexe" class="minibox">
                                           <input type="radio" name="sexe" value="Homme" id="Homme">
                                           <label for="Homme"> Homme </label>&nbsp&nbsp&nbsp
                                           <input type="radio" name="sexe" value="Femme" id="Femme" >
                                           <label for="Femme"> Femme </label>                                        
                                       </div><br><br>
                                   </div>

                                  <div class="droite">                           
                                    <label class="label">Prénom :</label> <span class="error">*</span> <br><br>
                                    <input type="text" id="prenom" name="prenom" class="forminput" placeholder="Ex: Prénom" value=""/><br><br>
                                   
                                   <!-- Pas utile ?? Si on supprime, penser à supprimer aussi ses références du fichier js sinon ça le casse-->
                                   <label class="label">Date de naissance :</label> <span class="error">*</span> <br><br>
                                   <input type="date" name="dateNaissance" id="date" max="2022-01-01" class="forminput" placeholder="jj/mm/aaaa" value=""/><br><br>
                                </div>
                            </div>

                            <div class="box3">
                                <div class="gauche">
                                    <label class="label">Adresse email :</label> <span class="error">*</span> <br><br>
                                    <input type="email" id="mailClient" name="mailClient" class="forminput" placeholder="Ex: monmail@monsite.org" value=""/><br><br>
                                </div>
                                       
                                <div class="droite">                           
                                    <label class="label">Métier :</label> <span class="error">*</span> <br><br>
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
                                <label class="label" for="sujet">Sujet :</label> <span class="error">*</span> <br><br>
                                <textarea class="textarea1" rows="1" name="sujet" id="sujet" placeholder="Entrez le sujet de votre mail"></textarea><br><br>
                                        
                                <label class="label" for="contenu">Contenu :</label> <span class="error">*</span> <br><br>
                                <textarea class="textarea2" name="contenu" id="contenu" wrap="hard" placeholder="Tapez ici votre mail"></textarea><br><br>
                            </div>
                                
                            <input class="boutonEnvoyer" type="submit" value="Envoyer"/>
                            <a class="boutonEffacer" href="contact">Effacer</a>

                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
