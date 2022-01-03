<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>   
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<!-- Lien avec le CSS -->
<link rel="stylesheet" type="text/css" href="css/styleConnexion.css"/>

<!-- Titre du site dans le navigateur-->
<title>Le coin photo - Me connecter</title>

<script type="text/javascript" src="js/connexion.js"></script>

<!-- FAIRE VERIF si deja connectÃ©, l'envoyer sur la page de profil. Idem pour panier et inscription-->


    <!-- Zone de navigation sur la droite-->
    <div class="pagedroite">
        <div class="w-full place-content-center px-10 py-5 flex h-screen justify-center items-center">
        
            <div class="-translate-y-1/4 md:w-1/5 sm:w-full mx-auto bg-neutral-100 bg-opacity-60 backdrop-blur-lg rounded-xl text-neutral-800 shadow-xl border border-neutral-200">
                <div class="max-w-full p-5 rounded-t-xl upppercase font-bold text-left text-xl pb-5 border-b border-neutral-200 text-indigo-500"><p>SE CONNECTER</p></div>

                <div class="p-5">
                	<span class="block mb-5" style="color:red">${error}</span>
                    <form name="Formulaire" onsubmit="return envoyer()" method="POST" action="userConnect">
                        <fieldset>                        
                            <div class="text-center">
	                            <input type="text" id="login" name="login" class="w-full bg-neutral-50 bg-opacity-50 rounded-md p-3 " placeholder="Login" /><br><br>
                                <input type="password" id="pwd" name="pwd" class="w-full bg-neutral-50 bg-opacity-50 rounded-md p-3" placeholder="Mot de passe"/><br><br>
                            </div>
                            <input class="w-full bg-indigo-500 rounded-md text-white p-3 uppercase hover:bg-indigo-400" type="submit" value="Connexion"/>                  
                        </fieldset>
                    </form>
                    <h3 class="text-sm bold pt-3">Pas encore inscrit ? <a href="inscription">Inscrivez-vous</a> </h3>
                </div>
            </div>
            
        </div>
    </div>

</body>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>