<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
<!DOCTYPE html>
<html>    
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<!-- Lien avec le CSS -->
<link rel="stylesheet" type="text/css" href="css/styleContact.css"/>

<!-- Titre du site dans le navigateur-->
<title>Le coin photo - section Admin</title>

<script type="text/javascript" src="js/admin.js"></script>

    <!-- Zone de navigation sur la droite-->
<div class="pagedroite">
	<br><a href='adminHome'> Retourner à la section ADMIN </a> <br>
        <div class="background">


            <div class="bloc">
                <div class="titresection"><p>AJOUTER UN PRODUIT</p></div>
                <div class="texte">
                    <div style="color:green">${success}</div>
	            	<div style="color:red">${fail}</div>

                    <form name="Formulaire" method="POST" onsubmit="return confirmerAjout()" action="adminAddProduit" th:action=@{/adminAddProduit} th:object=${Produits}>
	            		
                        <fieldset>
                        
                                <div class="box3">
                                    <div class="gauche">
                                        <label class="label">Catégorie :</label> <span class="error">*</span> <br><br>
                                        <div class="box2" id="categorie">                                                       
                                                                                                  
                                            <select id="categorie" name="categorie">		
                                                <c:forEach items="${categories}" var="entry">
												    <option value=${entry.categorie}>${entry.categorie}</option>
												</c:forEach>							                        
							                </select>
                                        </div><br>
                                            
									    <label class="label">Prix :</label> <span class="error">*</span> <br><br>
                                        <input type="number" step="0.01" name="prix" id="prix" min="0" class="forminput" placeholder="Ex: 1699" value=""/><br><br>
                                           
                                    </div>

                                    <div class="droite">                           
                                        <label class="label">Image :</label> <span class="error">*</span> <br><br>     

                                        <input class="forminput" list="image" id="image" name="image" value="" placeholder="blank.png">
                                        <datalist id="image">
                                                		
                                            <c:forEach items="${produits}" var="entry">
                                                <option value="${entry.image}">${entry.image}</option>
                                            </c:forEach>							                        
                            
                                        </datalist>

                                    </div>
                                </div>

                                <br>
                            <div class="box3">
                                <div class="gauche">
								<label class="label">Stock de départ :</label> <span class="error">*</span> <br><br>
                                   <input type="number" name="stock" id="stock" min="0" class="forminput" placeholder="Ex: 10" value=""/><br><br>
                                </div> 
                                                              
                            </div>

                            <div class="leftalign"> 
                                <label class="label">Nom du produit :</label> <span class="error">*</span> <br><br>
                                <input type="text" id="nom" name="nom" class="forminput" placeholder="Ex: Fujifilm X-T4" value=""/><br><br>
                         
                                <label class="label" for="desc">Description :</label> <span class="error">*</span> <br><br>
                                <textarea class="textarea2" name="description" id="description" wrap="hard" placeholder="Description du produit"></textarea><br><br>
                            </div>
                                
                            <input class="boutonEnvoyer" type="submit" value="Ajouter ce produit"/>
                            <a class="boutonEffacer" href="adminFormulaireProduit">Effacer</a>

                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
   
    
</div>

</body>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>