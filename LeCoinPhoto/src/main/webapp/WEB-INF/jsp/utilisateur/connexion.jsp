<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>   
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<!-- Lien avec le CSS -->
<link rel="stylesheet" type="text/css" href="css/styleConnexion.css"/>

<!-- Titre du site dans le navigateur-->
<title>Le coin photo - Me connecter</title>

<script type="text/javascript" src="js/connexion.js"></script>

<!-- FAIRE VERIF si deja connecté, l'envoyer sur la page de profil. Idem pour panier et inscription-->


    <!-- Zone de navigation sur la droite-->
    <div class="pagedroite">
        <div class="background">

            <div class="bloc">
                <div class="titresection"><p>SE CONNECTER</p></div>
                
                <div class="texte">
                    <form name="Formulaire" onsubmit="return envoyer()" method="POST" action="userConnect">
                        <fieldset>                        

                            <div class="centerAlign">
                                <label class="label">Login :</label><br><br>
                                <input type="text" id="login" name="login" class="forminput" placeholder="Ex: eisti95" /><br><br>
                        
                                <label class="label">Mot de passe :</label><br><br>
                                <input type="password" id="pwd" name="pwd" class="forminput" placeholder="Mot de passe"/><br><br>
                            </div>
                        
                            <input class="boutonConnexion" type="submit" value="Connexion"/>                  
                        </fieldset>
                    </form>

                    <h3>Pas encore inscrit ? <a href="inscription">Inscrivez-vous</a> </h3>

                </div>
            </div>
        </div>
    </div>
</div>

</body>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>