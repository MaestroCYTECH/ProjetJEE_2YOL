
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
<!DOCTYPE html>
<html>    
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<!-- Lien avec le CSS -->
<link rel="stylesheet" type="text/css" href="css/stylePanier.css"/>

<!-- Titre du site dans le navigateur-->
<title>Le coin photo - section Admin</title>

<script type="text/javascript" src="js/admin.js"></script>


    <!-- Zone de navigation sur la droite-->
    <div class="pagedroite">

        <div class="bloc">
            <div class="titresection"><p>LISTE DES PRODUITS</p></div><br>

            <a href='adminHome'> Retourner à la section ADMIN </a> <br><br>
            
            <h2><p style="text-transform:uppercase;">${cat}</p></h2> <br>
            ${error} 
               
            <%int i=0;%>
            <c:forEach items="${produits}" var="entry">

            
                <div class="panier">

                    <div class="imageAppareil">
                        <img class="imageAppareil2" src="img/${entry.image}" alt="${entry.nom}" onerror="this.onerror=null; this.src='img/blank.png'" >
                    </div>

                    <div class="nomProduit1">
                        <strong> ${entry.nom}</strong>
                    </div>

                
                    <div class="prixProduit"> 
                        Prix : <strong> ${entry.prix} € </strong>
                        Stock : <strong class="stock">${entry.stock}</strong>     
                    </div>

                    <br><br>  
                    

                    <div class="midCenter">
                        <form name="Form" class="form" method='POST' action='adminAddStock' onsubmit="return confirmStock(<%=i%>)">
                            
                            <button class="moins" onclick="moins(<%=i%>)" type="button"> - </button>
                                                
                                                
                            <input type="number" name="quantite" min="0" value="0" class="form-control">
                            <button class="plus" onclick="plus(<%=i%>)" type="button"> + </button> <br><br>

                            <input type="hidden" name="id" value="${entry.id}">
                            <input type="hidden" name="cat" value="${entry.categorie}">

                            <input class="boutonVert" type="submit" value="AJOUTER DU STOCK"/>
            
                        </form>
                    </div>
                    
                
            
                    <form method="POST" onsubmit="return deleteConfirm()" action="adminDeleteProduit">
                        <input type="hidden" name="id" value="${entry.id}">
                        <input type="hidden" name="cat" value="${entry.categorie}">
                        <input class="boutonSupprimer" type="submit" value="x"/>
                    </form><br>

                </div>
                <%i++;%>
            </c:forEach>
         
            <br> 
        </div>
    </div>
    </div>
    
</div>

</body>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>