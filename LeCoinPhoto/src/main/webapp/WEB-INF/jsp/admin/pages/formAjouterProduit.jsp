<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html xmlns:th="https://www.thymeleaf.org">    
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<!-- Lien avec le CSS -->
<link rel="stylesheet" type="text/css" href="css/styleContact.css"/>

<!-- Titre du site dans le navigateur-->
<title>Le coin photo - section Admin</title>

<script type="text/javascript" src="js/admin.js"></script>

    <!-- Zone de navigation sur la droite-->
<div class="pagedroite">
	<div class="md:w-1/5 sm:w-full m-auto px-5 pt-5">
	<a class="p-3 block rounded-md text-white bg-neutral-400 hover:bg-neutral-300 shadow-md text-center" href='adminHome'> Retourner à la section ADMIN </a> <br>
	</div>
        <div class="w-full place-content-center px-10 pb-10">


            <div class="md:w-2/5 sm:w-full m-auto mb-10 bg-neutral-100 bg-opacity-60 backdrop-blur-lg rounded-xl text-neutral-800 shadow-xl border border-neutral-200">
                <div class="w-full p-5 rounded-t-xl upppercase font-bold text-left text-xl pb-5 border-b border-neutral-200 text-indigo-500"><p>AJOUTER UN PRODUIT</p></div>
                <div class="w-full p-5 font-sans m-auto">
                    <div class="mb-8" th:if=${success} style="color:green">Ajout réussi </div>
	            	<div class="mb-8" th:if=${fail} style="color:red">Erreur lors de l'ajout </div>

                    <form name="Formulaire" method="POST" onsubmit="return confirmerAjout()" action="adminAddProduit">
                        <fieldset>
                        
                                <div class="">
                                    <div class="w-full items-center justify-center place-content-center">
                                        <label class="label">Référence :</label> <span class="error">*</span>
                                        <input type="text" id="ref" name="ref" class="w-full p-3 rounded-md bg-neutral-100 bg-opacity-50 my-4" placeholder="Référence (ex: app1)" value=""/>
                                            
									    <label class="label">Prix :</label> <span class="error">*</span>
                                        <input type="number" step="0.01" name="prix" id="prix" min="0" class="w-full p-3 rounded-md bg-neutral-100 bg-opacity-50 my-4" placeholder="Ex: 1699" value=""/>
                                           
                                                              
                                        <label class="label">Image : (faire upload d'image ?)</label> <span class="error">*</span> <br><br>
                                        <input type="text" id="image" name="image" class="w-full p-3 rounded-md bg-neutral-100 bg-opacity-50 mb-8" placeholder="Ex: blank.png" value=""/>
                                   
                                        <label class="label">Catégorie :</label> <span class="error">*</span> <br><br>
                                        <div class="box2" id="categorie">
                                        
                                  
                                          
                                            
                                            <select id="categories">
                                                <option value="appareils">Appareil</option>   
                                                <option value="objectifs">Objectif</option>   
                                                <option value="accessoires">Accessoire</option>                      
                                            </select>

                                        </div><br>

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
                                <textarea class="w-full p-3 rounded-md bg-neutral-100 bg-opacity-50 mb-8 my-4" name="desc" id="desc" wrap="hard" placeholder="Description du produit"></textarea>
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