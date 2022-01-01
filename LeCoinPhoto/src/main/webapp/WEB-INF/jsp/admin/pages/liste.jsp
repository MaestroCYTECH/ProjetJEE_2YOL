
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
            
            <h2>TITRESECTION (Appareils/objectifs/accessoires, en fct de l'URL)</h2> <br>
            ${error} 
                
            <div class="panier">

                <div class="imageAppareil">
                    <img class="imageAppareil2" src="img/FXT4.jpg" alt="NOM" onerror="this.onerror=null; this.src='img/blank.png'" >
                </div>

                <div class="nomProduit1">
                    <strong> NOM </strong>
                </div>

            
                <div class="prixProduit"> 
                    Prix : <strong> PRIX € </strong>
                    Stock : <strong> STOCK </strong>     
                </div>

                <br><br>  
                

                <div class="midCenter">
                    <form name="Form" class="form" method='GET' action='adminAddStock' onsubmit="return confirmStock(0)">
                        
                        <button class="moins" onclick="moins(0)" type="button"> - </button>
                                            
                                            
                        <input type="number" name="quantite" min="0" value="0" class="form-control">
                        <button class="plus" onclick="plus(0)" type="button"> + </button> <br><br>

                        <input type="hidden" name="ref" value="app1">
                        <input type="hidden" name="cat" value="appareils">

                        <input class="boutonVert" type="submit" value="AJOUTER DU STOCK"/>
        
                    </form>
                </div>
                
            
        
                <form method="POST" onsubmit="return deleteConfirm()" action="adminDeleteProduit">
                    <input type="hidden" name="id" value="0">
                   <!-- <input type="hidden" name="catSuppr" value="appareils">-->

                    <input class="boutonSupprimer" type="submit" value="x"/>
                </form><br>


            </div>
          
            
            <div class="panier">

                <div class="imageAppareil">
                    <img class="imageAppareil2" src="img/FXT4.jpg" alt="NOM" onerror="this.onerror=null; this.src='img/blank.png'" >
                </div>

                <div class="nomProduit1">
                    <strong> NOM 2</strong>
                </div>

            
                <div class="prixProduit"> 
                    Prix : <strong> PRIX € </strong>
                    Stock : <strong> STOCK </strong>     
                </div>

                <br><br>  
                

                <div class="midCenter">
                    <form name="Form" class="form" method='POST' action='adminAddStock' onsubmit="return confirmStock(1)">
                        
                        <button class="moins" onclick="moins(1)" type="button"> - </button>
                                            
                                            
                        <input type="number" name="quantite" min="0" value="0" class="form-control">
                        <button class="plus" onclick="plus(1)" type="button"> + </button> <br><br>

                        <input type="hidden" name="ref" value="app2">
                        <input type="hidden" name="cat" value="appareils">

                        <input class="boutonVert" type="submit" value="AJOUTER DU STOCK"/>
        
                    </form>
                </div>
                
            
        
                <form method="POST" onsubmit="return deleteConfirm()" action="adminDeleteProduit">
                    <input type="hidden" name="refSuppr" value="app2">
                    <input type="hidden" name="catSuppr" value="appareils">

                    <input class="boutonSupprimer" type="submit" value="x"/>
                </form><br>


            </div>
            

            <br> 
        </div>
    </div>
    </div>
    
</div>

</body>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>