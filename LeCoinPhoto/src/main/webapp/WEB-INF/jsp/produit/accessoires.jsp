 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
    
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<!-- Lien avec le CSS -->
<link rel="stylesheet" type="text/css" href="css/styleProduits.css"/>

<!-- Titre du site dans le navigateur-->
<title>Le coin photo - Nos accessoires</title>

<script type="text/javascript" src="js/produits.js"></script>


	
	<!-- Zone de navigation sur la droite-->
	<div class="pagedroite">
	    
	    <div class="bloc">
	    
	        <div class="titresection"><p>NOS ACCESSOIRES</p></div><br> 
	        
	        <div class="blocProduits">
	                    
	            <div class="blocProduit">
	                <br><img class="imageProduit" src="img/FXT4.jpg" alt="Fujifilm X-T4" onerror="this.onerror=null; this.src='img/blank.png'" ><br><br>
	                <p><b>Fujifilm X-T4 (Boitier nu)</b></p>
	                <div class="texteProduit">
	                    <p>Capteur Format APS-C de 26Mp, monture Fuji X</p>
	                </div> 
	             
	             	<div class="prixProduit"><p>1699 €</p></div>
	                <div class=stock>   
	                    <form  name="Form" class="form" method='POST' onsubmit="return envoyer(0)" action='addToCart'>
	    
	                        <button class="moins" onclick="moins(0)" type="button"> - </button>
	                        <input type="number" name="quantite" min="1" max="3" value="1" class="form-control" readonly>
	                        <button class="plus" onclick="plus(0)" type="button"> + </button><br><br>
	                        <input type="hidden" name="REF" value="app1">
	                </div>
	                        <input class="boutonAcheter" type="submit" name="addProduit" value="Ajouter au panier" onclick='alert("Ajouté au panier");'/>
	                                    
	                    </form>                   
	    
	            </div>
	            
	            <div class="blocProduit">
	                <br><img class="imageProduit" src="img/FXT4.jpg" alt="Fujifilm X-T4" onerror="this.onerror=null; this.src='img/blank.png'" ><br><br>
	                <p><b>Fujifilm X-T4 (Boitier nu)</b></p>
	                <div class="texteProduit">
	                    <p>Capteur Format APS-C de 26Mp, monture Fuji X</p>
	                </div> 
	             
	             	<div class="prixProduit"><p>1699 €</p></div>
	                <div class=stock>   
	                    <form  name="Form" class="form" method='POST' onsubmit="return envoyer(1)" action='addToCart'>
	    
	                        <button class="moins" onclick="moins(1)" type="button"> - </button>
	                        <input type="number" name="quantite" min="1" max="3" value="1" class="form-control" readonly>
	                        <button class="plus" onclick="plus(1)" type="button"> + </button><br><br>
	                        <input type="hidden" name="REF" value="app1">
	                </div>
	                        <input class="boutonAcheter" type="submit" name="addProduit" value="Ajouter au panier" onclick='alert("Ajouté au panier");'/>
	                                    
	                    </form>                   
	    
	            </div>
	            
	            <div class="blocProduit">
	                <br><img class="imageProduit" src="img/FXT4.jpg" alt="Fujifilm X-T4" onerror="this.onerror=null; this.src='img/blank.png'" ><br><br>
	                <p><b>Fujifilm X-T4 (Boitier nu)</b></p>
	                <div class="texteProduit">
	                    <p>Capteur Format APS-C de 26Mp, monture Fuji X</p>
	                </div> 
	             
	             	<div class="prixProduit"><p>1699 €</p></div>
	                <div class=stock>   
	                    <form  name="Form" class="form" method='POST' onsubmit="return envoyer(2)" action='addToCart'>
	    
	                        <button class="moins" onclick="moins(2)" type="button"> - </button>
	                        <input type="number" name="quantite" min="1" max="3" value="1" class="form-control" readonly>
	                        <button class="plus" onclick="plus(2)" type="button"> + </button><br><br>
	                        <input type="hidden" name="REF" value="app1">
	                </div>
	                        <input class="boutonAcheter" type="submit" name="addProduit" value="Ajouter au panier" onclick='alert("Ajouté au panier");'/>
	                                    
	                    </form>                   
	    
	            </div>
	               
	        </div><br> 
	        
	        <div class="blocProduits">
	        	
	        	<div class="blocProduit">
	                <br><img class="imageProduit" src="img/FXT4.jpg" alt="Fujifilm X-T4" onerror="this.onerror=null; this.src='img/blank.png'" ><br><br>
	                <p><b>Fujifilm X-T4 (Boitier nu)</b></p>
	                <div class="texteProduit">
	                    <p>Capteur Format APS-C de 26Mp, monture Fuji X</p>
	                </div> 
	             
	             	<div class="prixProduit"><p>1699 €</p></div>
	                <div class=stock>   
	                    <form  name="Form" class="form" method='POST' onsubmit="return envoyer(3)" action='addToCart'>
	    
	                        <button class="moins" onclick="moins(3)" type="button"> - </button>
	                        <input type="number" name="quantite" min="1" max="3" value="1" class="form-control" readonly>
	                        <button class="plus" onclick="plus(3)" type="button"> + </button><br><br>
	                        <input type="hidden" name="REF" value="app1">
	                </div>
	                        <input class="boutonAcheter" type="submit" name="addProduit" value="Ajouter au panier" onclick='alert("Ajouté au panier");'/>
	                                    
	                    </form>                   
	            </div>
	    
	        </div> 
	
	    </div>
	</div>
</div>

</body>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>