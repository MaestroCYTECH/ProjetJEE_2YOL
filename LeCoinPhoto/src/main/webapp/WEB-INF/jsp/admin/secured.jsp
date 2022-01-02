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
            <div class="titresection"><p>ESPACE ADMIN</p></div><br>
                
                Ici vous pouvez ajouter ou supprimer un produit, et aussi en augmenter le stock. 
             
                <br><br> <a href='adminFormulaireProduit'> AJOUTER UN PRODUIT </a>

                <br><br><br> <h2> LISTE DES CATEGORIES : </h2><br> 

                <!--Faire un while pour automatiser l'affichage des catégories-->
            
                <div class="panier">

                    <c:forEach items="${cat}" var="entry">
                        <div class="midCenter">                        
                            <a href="adminListe?cat=${entry.categorie}"><strong style="text-transform:uppercase;">NOS ${entry.categorie}</strong></a> <br>
                        </div>  
                    </c:forEach>                
                    
                </div>           

                <br><br><br><br><br><br><br>

        
        </div>
    </div>
</div>

</div>

</body>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>