<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>    
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
            <p>Bonjour, ${user.nom} !</p>
    
            
            <!--Affichage du profil-->
            <div id="Profil"> Mes informations personnelles : <br><br> 
                <div class="panier">
                    <div class="profil2">
                        Login :  ${user.login} <br>
                        Email :  ${user.email} <br>
                        Nom : ${user.nom}<br>
                        Prenom :  ${user.prenom}<br>
                        Sexe :  ${user.sexe}<br>
                    </div>
                </div>
        <br>
        <br> <a class="boutonPayer" href="adminHome">Section ADMIN</a> <br><br> <br>   

            </div>
        </div>

</body>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>