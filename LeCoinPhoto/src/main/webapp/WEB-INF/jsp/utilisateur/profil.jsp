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
        <div class="w-full place-content-center p-10 flex justify-center items-center">
        <div class="md:w-2/5 sm:w-full mx-auto bg-neutral-100 bg-opacity-60 backdrop-blur-lg rounded-xl text-neutral-800 shadow-xl border border-neutral-200 text-center">
            <div class="max-w-full p-5 rounded-t-xl upppercase font-bold text-lefttext-xl pb-5 border-b border-neutral-200 text-indigo-500"><p>MON PROFIL</p></div>
            <div class="w-full p-5"> 
            	<p class="mb-4">Bonjour, Admin !</p>  
                
                
    
            
            <!--Affichage du profil-->
            <div id="Profil" class="my-4"> Vos informations personnelles :
                <div class="w-full p-10 mt-5 text-left grid grid-cols-1 divide-y divide-neutral-400 rounded-md bg-neutral-100 shadow-inner">
                <div class="py-3">Login :  admin</div>
                <div class="py-3">Email :  admin@gmail.com</div>
                <div class="py-3">Nom :  Admin</div>
                <div class="py-3">Prenom :  Admin</div>
                <div class="py-3">Sexe :  Homme</div>
                <div class="py-3">Date de naissance : 2021-12-24</div>
                </div>
        </div>
        <div class="flex gap-4">
        <a class="flex-1 rounded-md uppercase text-white p-3 bg-neutral-400 hover:bg-neutral-300" href="userDeconnect">Me déconnecter</a>
        <a class="flex-1 rounded-md uppercase text-white p-3 bg-indigo-500 hover:bg-neutral-400" href="adminHome">Section ADMIN</a>
        </div> 
	</div>
    </div>
    </div>
</div>

</body>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>