 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>    
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<!-- Lien avec le CSS -->
<link rel="stylesheet" type="text/css" href="css/styleProduits.css"/>

<!-- Titre du site dans le navigateur-->
<title>Le coin photo - Nos appareils</title>

<script type="text/javascript" src="js/produits.js"></script>



    
	<!-- Zone de navigation sur la droite-->
	<div class="pagedroite">
	    
	    <div class="bloc">
	    
	        <div class="titresection"><p>NOS APPAREILS</p></div><br> 
	        
	        <div class="blocProduits">
       
				<%int i=0;//Utile pour notre fonction moins et plus, et l'affichage par lignes%>
				

				<c:forEach items="${produits}" var="entry">
					<div class="blocProduit">
						<br><img class="imageProduit" src="img/${entry.image}" alt="${entry.nom} onerror="this.onerror=null; this.src='img/blank.png'" ><br><br>
						<p><b>${entry.nom}</b></p>
						<div class="texteProduit">
							<p>${entry.description}</p>
						</div> 

						<c:choose>
                            <c:when test="${entry.stock<=0}">

								<p><strong> INDISPONIBLE</strong>, pour le moment</p>
								<div style="display:none;" class="affichageStock">
									Stock : ${entry.stock} <br><br>
									<input type="hidden" class="form-control">
								</div>
                            </c:when>
                                                
                        	<c:otherwise>
 		
								<div class="prixProduit">
									<p>${entry.prix} €</p>		
								</div>

								<div class=stock>   
									<form  name="Form" class="form" method='POST' onsubmit="return envoyer(<%=i%>)" action='addToCart'>
					
										<button class="moins" onclick="moins(<%=i%>)" type="button"> - </button>
										<input type="number" name="quantite" min="1" max="${entry.stock}" value="1" class="form-control" readonly>
										<button class="plus" onclick="plus(<%=i%>)" type="button"> + </button><br><br>
										<input type="hidden" name="ID" value="${entry.id}">
								</div>
										<input class="boutonAcheter" type="submit" name="addProduit" value="Ajouter au panier" onclick='alert("Ajouté au panier")'/>
													
									</form>                   
			
							</c:otherwise>
						</c:choose>
					</div>
					<%if((i+1)%3==0){ //3 correspond au nb de produits qu'on veut par ligne %>

            </div>

            <div class="blocProduits">      

                    <%
                    }
                	i++;%>

	            </c:forEach>
    
			
	        </div><br>
	        
	    </div>
	</div>
</div>

</body>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>