<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html xmlns:th="https://www.thymeleaf.org">    
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<!-- Lien avec le CSS -->
<link rel="stylesheet" type="text/css" href="css/styleProfil.css"/>

<!-- Titre du site dans le navigateur-->
<title>Le coin photo - Mon profil</title>

<!-- FAIRE VERIF si deja connecté, l'envoyer sur la page de profil. Idem pour panier et inscription-->


    <!-- Zone de navigation sur la droite-->
    <div class="pagedroite">
        
        <div class="bloc">
            <div class="titresection"><p>MON PROFIL</p></div><br><br>
                
                <a class="boutonPayer" href="userDeconnect">Me déconnecter</a><br><br>
                <p>Bonjour, Admin !</p>
    
            
            <!--Affichage du profil-->
            <div id="Profil"> Mes informations personnelles : <br><br> 
                <div class="panier">
                <div class="profil2">
                Login :  admin <br>
                Email :  admin@gmail.com <br>
                Nom :  Admin<br>
                Prenom :  Admin<br>
                Sexe :  Homme<br>
                Date de naissance : 2021-12-24<br>
            </div>
        </div>
        <br>
        <br> <a class="boutonPayer" href="adminHome">Section ADMIN</a> <br><br> <br>   

    </div>
</div>

</body>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>