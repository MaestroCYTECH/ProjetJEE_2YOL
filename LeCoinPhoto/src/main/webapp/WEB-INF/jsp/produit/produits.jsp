<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>    
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<!-- Lien avec le CSS -->
<link rel="stylesheet" type="text/css" href="css/styleProduits.css"/>

<!-- Titre du site dans le navigateur-->
<title>Le coin photo - Nos ${cat}</title>

<script type="text/javascript" src="js/produits.js"></script>



    
	<!-- Zone de navigation sur la droite-->

	    <div class="w-full place-content-center p-10">
	    
	    <div class="md:w-3/5 sm:w-full m-auto mb-10 bg-neutral-100 backdrop-blur-lg rounded-xl text-neutral-800 shadow-xl border border-neutral-200">
	    
	        <div class="w-full p-5 rounded-t-xl upppercase font-bold text-left text-xl pb-5 border-b border-neutral-200 text-indigo-500 "><p style="text-transform:uppercase;">NOS ${cat}</p></div>
	        
	        <div class="w-full p-5 grid gap-4 grid-cols-3">
	            
				<%int i=0;//Utile pour notre fonction moins et plus, et l'affichage par lignes%>
				
				<c:forEach items="${produits}" var="entry">					

<<<<<<< HEAD
					<div class="rounded-lg border border-indigo-500 bg-white place-content-center text-center relative hover:ring-2 hover:ring-indigo-500">
						<div class="w-full p-1 shadow-b shadow-md"><p class="font-bold my-2">Stock : ${entry.stock} </p></div><!--Faire un design sympa ou bien comme ça c'est bon ?-->
=======
					<div class="rounded-lg border border-indigo-500 bg-white place-content-center text-center relative">
						<c:choose>
							<c:when test="${user.statut=='admin'}">
						Stock : ${entry.stock} <br> <!--Faire un design sympa ou bien comme ça c'est bon ?-->
							</c:when>
						</c:choose>
						
>>>>>>> Back+UX
						<br><img class="m-auto h-32" src="img/${entry.image}" alt="${entry.nom}" onerror="this.onerror=null; this.src='img/blank.png'" ><br><br>
						<p class="truncate m-4"><b>${entry.nom}</b></p>
						<div class="truncate m-4 text-sm text-neutral-500">
							<p>${entry.description}</p>
						</div> 
					
						<c:choose>
                            <c:when test="${entry.stock<=0}">

								<div class="font-bold text-xl"><p><strong> Hors stock</strong></p></div>			

							</c:when>
							<c:otherwise>

								<div class="prixProduit"><p>${entry.prix} €</p></div>
								
								<c:choose>
                					<c:when test="${user!=null}">

								<div class="font-bold text-xl pb-2"><p>${entry.prix} €</p></div>

								<div class="bottom-10 w-full">   
									<form  name="Form" class="form" method='POST' onsubmit="return envoyer(<%=i%>)" action='addToCart'>
					
										<button class="flex-1 bg-neutral-200 hover:bg-neutral-100" onclick="moins(<%=i%>)" type="button"> - </button>
										<input type="number" name="quantite" min="1" max="${entry.stock}" value="1" class="form-control" readonly>
										<button class="flex-1 bg-neutral-200 hover:bg-neutral-100" onclick="plus(<%=i%>)" type="button"> + </button><br><br>
										<input type="hidden" name="ID" value="${entry.id}">
								</div>
										<input class="bottom-0 left-0 bg-indigo-500 w-full rounded-b-md p-2 hover:bg-indigo-400 text-white" type="submit" name="addProduit" value="Ajouter au panier" onclick='alert("Ajouté au panier");'/>
													
									</form>

									</c:when>
								</c:choose> <!--Pour l'instant indentation pourrie pour pas que Git voit tout ça comme des changements, et donc fasse des conflits avec la team UX-->
							</c:otherwise>
						</c:choose>
					</div>


					<%i++;%>

				<%i++;%>

				</c:forEach>
	           
			

	        </div>
	        		
	        </div><br>
	        
	    </div>
	</div>

</div>
</body>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>