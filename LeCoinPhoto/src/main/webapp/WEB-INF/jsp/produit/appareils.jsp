<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html xmlns:th="https://www.thymeleaf.org">    
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<!-- Lien avec le CSS -->
<link rel="stylesheet" type="text/css" href="css/styleProduits.css"/>

<!-- Titre du site dans le navigateur-->
<title>Le coin photo - Nos appareils</title>

<script type="text/javascript" src="js/produits.js"></script>



    
	<!-- Zone de navigation sur la droite-->
	<div class="pagedroite">
	    <div class="w-full place-content-center p-10">
	    
	    <div class="md:w-3/5 sm:w-full m-auto mb-10 bg-neutral-100 backdrop-blur-lg rounded-xl text-neutral-800 shadow-xl border border-neutral-200">
	    
	        <div class="w-full p-5 rounded-t-xl upppercase font-bold text-left text-xl pb-5 border-b border-neutral-200 text-indigo-500 "><p>NOS APPAREILS</p></div>
	        
	        <div class="w-full p-5 grid gap-4 grid-cols-3">
	                    
	            <div class="rounded-lg border border-indigo-500 bg-white place-content-center text-center relative">
	                <br><img class="m-auto h-32" src="img/FXT4.jpg" alt="Fujifilm X-T4" onerror="this.onerror=null; this.src='img/blank.png'" ><br><br>
	                <p class="truncate m-4"><b>Fujifilm X-T4 (Boitier nu)</b></p>
	                <div class="truncate m-4 text-sm text-neutral-500">
	                    <p>Capteur Format APS-C de 26Mp, monture Fuji X</p>
	                </div> 
	             
					<div class="prixProduit"><p>1699 €</p></div>
	                <div class="bottom-10 w-full">   
	                    <form  name="Form" class="form" method='POST' onsubmit="return envoyer(0)" action='addToCart'>
	    
	                        <button class="moins" onclick="moins(0)" type="button"> - </button>
	                        <input type="number" name="quantite" min="1" max="3" value="1" class="form-control" readonly>
	                        <button class="plus" onclick="plus(0)" type="button"> + </button><br><br>
	                        <input type="hidden" name="REF" value="app1">
	                </div>
	                        <input class="bottom-0 left-0 bg-indigo-500 w-full rounded-b-md p-2 hover:bg-indigo-400 text-white" type="submit" name="addProduit" value="Ajouter au panier" onclick='alert("Ajouté au panier");'/>
	                                    
	                    </form>                   
	    
	            </div>
	            
	            <div class="rounded-lg border border-indigo-500 bg-white place-content-center text-center relative">
	                <br><img class="m-auto h-32" src="img/FXT4.jpg" alt="Fujifilm X-T4" onerror="this.onerror=null; this.src='img/blank.png'" ><br><br>
	                <p class="truncate m-4"><b>Fujifilm X-T4 (Boitier nu)</b></p>
	                <div class="truncate m-4 text-sm text-neutral-500">
	                    <p>Capteur Format APS-C de 26Mp, monture Fuji X</p>
	                </div> 
	             
	             	<div class="prixProduit"><p>1699 €</p></div>
	                <div class="bottom-10 w-full">   
	                    <form  name="Form" class="form" method='POST' onsubmit="return envoyer(1)" action='addToCart'>
	    
	                        <button class="moins" onclick="moins(1)" type="button"> - </button>
	                        <input type="number" name="quantite" min="1" max="3" value="1" class="form-control" readonly>
	                        <button class="plus" onclick="plus(1)" type="button"> + </button><br><br>
	                        <input type="hidden" name="REF" value="app1">
	                </div>
	                        <input class="bottom-0 left-0 bg-indigo-500 w-full rounded-b-md p-2 hover:bg-indigo-400 text-white" type="submit" name="addProduit" value="Ajouter au panier" onclick='alert("Ajouté au panier");'/>
	                                    
	                    </form>                   
	    
	            </div>
	            
	            <div class="rounded-lg border border-indigo-500 bg-white place-content-center text-center relative">
	                <br><img class="m-auto h-32" src="img/FXT4.jpg" alt="Fujifilm X-T4" onerror="this.onerror=null; this.src='img/blank.png'" ><br><br>
	                <p class="truncate m-4"><b>Fujifilm X-T4 (Boitier nu)</b></p>
	                <div class="truncate m-4 text-sm text-neutral-500">
	                    <p>Capteur Format APS-C de 26Mp, monture Fuji X</p>
	                </div> 
	             
	             	<div class="prixProduit"><p>1699 €</p></div>
	                <div class="bottom-0 w-full">   
	                    <form  name="Form" class="form" method='POST' onsubmit="return envoyer(2)" action='addToCart'>
	    
	                        <button class="moins" onclick="moins(2)" type="button"> - </button>
	                        <input type="number" name="quantite" min="1" max="3" value="1" class="form-control" readonly>
	                        <button class="plus" onclick="plus(2)" type="button"> + </button><br><br>
	                        <input type="hidden" name="REF" value="app1">
	                </div>
	                        <input class="bottom-0 left-0 bg-indigo-500 w-full rounded-b-md p-2 hover:bg-indigo-400 text-white" type="submit" name="addProduit" value="Ajouter au panier" onclick='alert("Ajouté au panier");'/>
	                                    
	                    </form>                   
	    
	            </div>
	        	
	        	<div class="rounded-lg border border-indigo-500 bg-white place-content-center text-center relative">
	                <br><img class="m-auto h-32" src="img/FXT4.jpg" alt="Fujifilm X-T4" onerror="this.onerror=null; this.src='img/blank.png'" ><br><br>
	                <p class="truncate m-4"><b>Fujifilm X-T4 (Boitier nu)</b></p>
	                <div class="truncate m-4 text-sm text-neutral-500">
	                    <p>Capteur Format APS-C de 26Mp, monture Fuji X</p>
	                </div> 
	             
	             	<div class="prixProduit"><p>1699 €</p></div>
	                <div class="bottom-10 w-full">   
	                    <form  name="Form" class="form" method='POST' onsubmit="return envoyer(3)" action='addToCart'>
	    
	                        <button class="moins" onclick="moins(3)" type="button"> - </button>
	                        <input type="number" name="quantite" min="1" max="3" value="1" class="form-control" readonly>
	                        <button class="plus" onclick="plus(3)" type="button"> + </button><br><br>
	                        <input type="hidden" name="REF" value="app1">
	                </div>
	                        <input class="bottom-0 left-0 bg-indigo-500 w-full rounded-b-md p-2 hover:bg-indigo-400 text-white" type="submit" name="addProduit" value="Ajouter au panier" onclick='alert("Ajouté au panier");'/>
	                                    
	                    </form>                   
	            </div>
	            
	            <div class="rounded-lg border border-indigo-500 bg-white place-content-center text-center relative">
	                <br><img class="m-auto h-32" src="img/${prod.image}" alt="${prod.nom}" onerror="this.onerror=null; this.src='img/blank.png'" ><br><br>
	                <p class="truncate m-4"><b>ref=${prod.reference} : ${prod.nom}</b></p>
	                <div class="truncate m-4 text-sm text-neutral-500">
	                    <p>${prod.description}</p>
	                </div> 
	             
	             	<div class="prixProduit"><p>${prod.prix} €</p></div>
	                <div class="bottom-10 w-full">   
	                    <form  name="Form" class="form" method='POST' onsubmit="return envoyer(4)" action='addToCart'>
	    
	                        <button class="moins" onclick="moins(4)" type="button"> - </button>
	                        <input type="number" name="quantite" min="1" max="3" value="1" class="form-control" readonly>
	                        <button class="plus" onclick="plus(4)" type="button"> + </button><br><br>
	                        <input type="hidden" name="REF" value="REF">
	                </div>
	                        <input class="bottom-0 left-0 bg-indigo-500 w-full rounded-b-md p-2 hover:bg-indigo-400 text-white" type="submit" name="addProduit" value="Ajouter au panier" onclick='alert("Ajouté au panier");'/>
	                                    
	                    </form>                   
	            </div>
	               
	        </div>
	        
	        
	           <!--<div> Liste de produits : (A fixer)
		            <tr th:each="produit: ${produits}">
				        <span th:text="${produit.nom}"></span>
				        <br/>
				        <span th:text="${produit.description}"></span>
				        <br/>
				        <span th:text="${produit.prix}"></span>
				        <br/>
				        <img th:src="@{img/{path}(path=${produit.image})}"/>
				    </tr>
	    			<div th:if=${debug} style="color:green">Bien reçu en vert </div>
	    		</div>-->
	    		
	    		
<%-- 	    		<table>
			
				<thead>
					<tr>
						<th>Nom</th>
						<th>Description</th>
						<th>Prix</th>
					</tr>
				</thead>
				<tbody>
					<tr th:each="produit: ${produits}">
						<td th:text="${produit.nom}" />
						<td th:text="${produit.description}" />
						<td th:text="${produit.prix}" />
					</tr>
				</tbody>
				
			</table> --%>
			
	        </div><br>
	        
	    </div>
	</div>
</div>
</div>
</body>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>