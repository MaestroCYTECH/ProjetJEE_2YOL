<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html xmlns:th="https://www.thymeleaf.org">    
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
                
                Les fichiers de ce dossier et sous-dossiers sont tous securises par des mots de passe, configurés dans le fichier .htpasswd<br>
                Voir le fichier README pour le mot de passe (code admin admin pour l'instant)<br> <br>

                Ici vous pouvez ajouter ou supprimer un produit, et aussi en augmenter le stock. 
             
                <br><br> <a href='adminFormulaireProduit'> AJOUTER UN PRODUIT </a>

                <br><br><br> <h2> LISTE DES CATEGORIES : </h2><br> 

                <!--Faire un while pour automatiser l'affichage des catégories-->
            
                <div class="panier">

                    <div class="midCenter">                        
                        <a href="adminListe?cat=appareils"><strong>NOS APPAREILS</strong></a> <br>
                    </div>   
                    
                    <div class="midCenter">                        
                        <a href="adminListe?cat=objectifs"><strong>NOS OBJECTIFS</strong></a> <br>
                    </div> 

                    <div class="midCenter">                        
                        <a href="adminListe?cat=accessoires"><strong>NOS ACCESSOIRES</strong></a> <br>
                    </div> 
                    
                </div>           

                <br><br><br><br><br><br><br>

        
        </div>
    </div>
</div>

</div>

</body>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>