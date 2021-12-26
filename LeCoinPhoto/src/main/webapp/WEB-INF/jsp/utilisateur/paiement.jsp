<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html xmlns:th="https://www.thymeleaf.org">    
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<!-- Lien avec le CSS -->
<link rel="stylesheet" type="text/css" href="css/stylePanier.css"/>

<!-- Titre du site dans le navigateur-->
<title>Le coin photo - Paiement</title>

<script type="text/javascript" src="js/panier.js"></script>


<!-- FAIRE VERIF si deja connecté, l'envoyer sur la page de profil. Idem pour panier et inscription-->


    <!-- Zone de navigation sur la droite-->
    <div class="pagedroite">     

        <div class="bloc">
            <div class="titresection"><p>PAIEMENT</p></div><br>
        
            <p> Votre paiement : </p>
           
            <div class="panier">
                <div class="nomProduit2">Nom : <strong>FujiFilm X-T4</strong><br></div>
                <div class="prixProduit2">Prix : <strong>1699 €</strong><br></div>                                   
            </div>

            <div class="panier">
                <div class="nomProduit2">Nom : <strong>FujiFilm X-T4 bis</strong><br></div>
                <div class="prixProduit2">Prix : <strong>1699 €</strong><br></div>                                   
            </div>

            <br>
            MONTANT TOTAL : <strong>3398 €</strong> <br><br>
                    
            <form name="Form" method='POST' onsubmit="return confirmerPaiement()" action='payerPanier'>
                <input type="hidden" name="login" value="admin">
                <input type="hidden" name="total" value="3398">
                <input type="hidden" name="panierString" value="Vide,app1,app1">
                <input class="boutonPayer" type="submit" name="payer" value="PAYER"/>
            </form>
            <br><br>
        
        
        </div>




        </div>
    </div>
</div>

</body>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>