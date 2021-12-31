<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>    
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<!-- Lien avec le CSS -->
<link rel="stylesheet" type="text/css" href="css/stylePanier.css"/>

<!-- Titre du site dans le navigateur-->
<title>Le coin photo - Mon panier</title>

<script type="text/javascript" src="js/panier.js"></script>

<!-- FAIRE VERIF si deja connecté, l'envoyer sur la page de profil. Idem pour panier et inscription-->


    <!-- Zone de navigation sur la droite-->
    <div class="pagedroite">
            
        <div class="bloc">
            <div class="titresection"><p>MON PANIER</p></div><br>
                    
            <div id="ajaxPanier">

                <c:choose>
                    <c:when test="${panierVide}">
                      <br>  Votre panier est vide pour le moment <br><br><br><br><br><br><br><br><br><br><br><br>
                    </c:when>
                    <c:otherwise>  

                        <a class="boutonPayer" href="paiement"> PAYER </a>	<br>
                  
                        <p>Vous avez <label id="ajaxNbArticles">${nbArticles}</label> <label id="ajaxArticles">article${pluriel}</label></p>
                        <br>
                                
                        
                        <c:forEach items="${panier}" var="entry">

                            <div class="panier ${entry.id}">  
                                <c:choose>
                                    <c:when test="${entry.stock==0}">

                                        <div class="imageAppareil">
                                            <img class="imageAppareil2" src="img/${entry.image}" alt="${entry.nom}" onerror="this.onerror=null; this.src='img/blank.png'" >
                                        </div>      
                                                                
                                        <div class="nomProduit1"> 
                                            Nom : <strong><a class="nomProduit" href="${entry.categorie}">${entry.nom}</a></strong><br>
                                        </div>
                                                                
                                        <div class="prixProduit">                                         
                                            <strong> INDISPONIBLE</strong>, pour le moment 
                                        </div> <br>
                                                                                                
                                        <form onsubmit="return confirmerSuppression(${entry.id})">
                                            <input class="boutonSupprimer" type="submit" value="x"/>
                                        </form><br> 

                                    </c:when>
                                    <c:otherwise> 

                                        <div class="imageAppareil">
                                            <img class="imageAppareil2" src="img/${entry.image}" alt="${entry.nom}" onerror="this.onerror=null; this.src='img/blank.png'" >
                                        </div>      
                                                                
                                        <div class="nomProduit1"> 
                                            Nom : <strong><a class="nomProduit" href="${entry.categorie}">${entry.nom}</a></strong><br>
                                        </div>
                                                                
                                        <div class="prixProduit">                                         
                                            Prix : <strong>${entry.prix} €</strong>
                                        </div> <br>
                                                                                                
                                        <form onsubmit="return confirmerSuppression(${entry.id})">
                                            <input class="boutonSupprimer" type="submit" value="x"/>
                                        </form><br> 
                                        
                                    </c:otherwise>
                                </c:choose>

                               
            
                            </div>

                        </c:forEach>

                    </c:otherwise>
                </c:choose>


            </div><br>

        </div>
    </div>
</div>

</body>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>