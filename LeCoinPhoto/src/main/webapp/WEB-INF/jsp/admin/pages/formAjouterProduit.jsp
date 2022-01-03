<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>    
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<!-- Lien avec le CSS -->
<link rel="stylesheet" type="text/css" href="css/styleContact.css"/>

<!-- Titre du site dans le navigateur-->
<title>Le coin photo - section Admin</title>

<script type="text/javascript" src="js/adminAjout.js"></script>

    <!-- Zone de navigation sur la droite-->
<div class="pagedroite">
	<div class="md:w-1/5 sm:w-full m-auto px-5 pt-5">
	<a class="p-3 block rounded-md text-white bg-neutral-400 hover:bg-neutral-300 shadow-md text-center" href='adminHome'> Retourner à la section ADMIN </a> <br>
	</div>
        <div class="w-full place-content-center px-10 pb-10">


            <div class="md:w-2/5 sm:w-full m-auto mb-10 bg-neutral-100 bg-opacity-60 backdrop-blur-lg rounded-xl text-neutral-800 shadow-xl border border-neutral-200">
                <div class="w-full p-5 rounded-t-xl upppercase font-bold text-left text-xl pb-5 border-b border-neutral-200 text-indigo-500"><p>AJOUTER UN PRODUIT</p></div>
                <div class="w-full p-5 font-sans m-auto">
                    <div class="mb-8" style="color:green">${success}</div>
	            	<div class="mb-8" style="color:red">${fail}</div>

                    <form name="Formulaire" method="POST" onsubmit="return confirmerAjout()" action="adminAddProduit">
                        <fieldset>
                        
                                <div class="">
                                    <div class="w-full items-center justify-center place-content-center">
 
                                        <label class="label">Catégorie :</label> <span class="error">*</span> <br>
                                        <div class="box2 w-full items-center justify-center place-content-center" id="categorie">                                                       
                                                                                                  
                                            <select id="categorie" name="categorie" class="w-full p-3 rounded-md bg-neutral-100 bg-opacity-50 my-4">		
                                                <c:forEach items="${categories}" var="entry">
												    <option value=${entry.categorie}>${entry.categorie}</option>
												</c:forEach>							                        
							                </select>
                                        </div><br>

									    <label class="label">Prix :</label> <span class="error">*</span>
                                        <input type="number" step="0.01" name="prix" id="prix" min="0" class="w-full p-3 rounded-md bg-neutral-100 bg-opacity-50 my-4" placeholder="Ex: 1699" value=""/>
                                           
                                                              
                                        <label class="label">Image :</label> <span class="error">*</span> <br><br>
                                        <input class="w-full p-3 rounded-md bg-neutral-100 bg-opacity-50 mb-8" list="image" id="image" name="image" value="" placeholder="blank.png">
                                        <datalist id="image">
                                                		
                                            <c:forEach items="${produits}" var="entry">
                                                <option value="${entry.image}">${entry.image}</option>
                                            </c:forEach>							                        
                            
                                        </datalist>

                                    </div>
                                </div>

                            <div class="box3">
                                <div class="gauche">
								<label class="label">Stock de départ :</label> <span class="error">*</span>
                                   <input type="number" name="stock" id="stock" min="0" class="w-full p-3 rounded-md bg-neutral-100 bg-opacity-50 mb-8 my-4" placeholder="Ex: 10" value=""/>
                                </div> 
                                                              
                            </div>

                            <div class="leftalign"> 
                                <label class="label">Nom du produit :</label> <span class="error">*</span>
                                <input type="text" id="nom" name="nom" class="w-full p-3 rounded-md bg-neutral-100 bg-opacity-50 mb-8 my-4" placeholder="Ex: Fujifilm X-T4" value=""/>
                         
                                <label class="label" for="desc">Description :</label> <span class="error">*</span>
                                <textarea class="w-full p-3 rounded-md bg-neutral-100 bg-opacity-50 mb-8 my-4" name="description" id="description" wrap="hard" placeholder="Description du produit"></textarea>
                            </div>
                            <div class="flex gap-4">   
                            <a class="flex-1 rounded-md uppercase text-white text-center p-3 bg-neutral-400 hover:bg-neutral-300" href="adminFormulaireProduit">Effacer</a> 
                            <input class="flex-1 rounded-md uppercase text-white p-3 bg-indigo-500 hover:bg-indigo-400" type="submit" value="Ajouter ce produit"/>
                            
                            </div>

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