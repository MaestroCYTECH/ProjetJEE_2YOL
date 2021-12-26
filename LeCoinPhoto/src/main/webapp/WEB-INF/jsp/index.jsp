<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<!-- Lien avec le CSS -->
<link rel="stylesheet" type="text/css" href="css/style.css"/>

<!-- Titre du site dans le navigateur-->
<title>Le coin photo</title>




 <!-- Zone de navigation sur la droite-->
 <div class="pagedroite">

<div class="backgroundimage">
<div class="centered">
    <h4 style="text-align: center;">QUI SOMMES NOUS ?</h4>
    <p style="text-align: justify;">Nous sommes une petite équipe de passionnés de la photographie et de la technologie. Nous avons un jour eu l'idée de créer un site de vente de matériel professionnel, et uniquement professionnel. Vous trouverez ici les meilleurs appareils, les meilleurs objectifs et accessoires, et tout cela à des prix qui vous éviteront la banqueroute !<br><br>
    Nous travaillons en étroite collaboration avec de nombreux photographes pour savoir quels sont les besoins exacts pour exercer la photographie professionnelle et amateure. Ceci nous permet de ne pas polluer le site avec du mauvais matériel, ou du matériel inutile. C'est ainsi que tous les produits que nous vendons ont été testés et recommandés par des photographes confirmés. <br><br>
    Nous proposons uniquement les meilleures marques de matériel photo, avec lesquelles nous négocions des prix les plus bas possibles. Vous méritez des produits de qualité pour un coût réduit ! Les livraisons sont rapides et nous vous garantissons le service après-vente le plus efficace !</p>
        <h4 style="text-align: center;">NOS MARQUES PARTENAIRES</h4>
        <div class="boxlogo">
            <div class="colonnelogo">
                <img src="img/fujiLogo.png" class="imageLogo" alt="Fujifilm" title="Partenaires depuis 2014"><br><br> 
                <img src="img/sonyLogo.png" class="imageLogo" alt="Sony" title="Partenaires depuis 2014">  
            </div>
            <div class="colonnelogo">
                <img src="img/tiffenLogo.png" class="imageLogo" alt="Tiffen" title="Partenaires depuis 2012"><br><br> 
                <img src="img/tamronLogo.png" class="imageLogo" alt="Tamron" title="Partenaires depuis 2010"><br>  
            </div>
            <div class="colonnelogo">
                <img src="img/sigmaLogo.png" class="imageLogo" alt="Sigma" title="Partenaires depuis 2010"><br><br>
                <img src="img/pentaxLogo.png" class="imageLogo" alt="Pentax" title="Partenaires depuis 2011"> 
            </div>
            <div class="colonnelogo">
                <img src="img/samyangLogo.png" class="imageLogo" alt="Samyang" title="Partenaires depuis 2011"><br><br>
                <img src="img/smallrigLogo.png" class="imageLogo" alt="Smallrig" title="Partenaires depuis 2012">
            </div>
        </div>
        <h4>ET LE SERVICE APRES-VENTE DANS TOUT CA ?</h4>
        <p style="text-align: justify;">Vous vous dites sûrement : "Du bon matos pas cher ça cache forcément quelque chose !"<br><br>
            Eh non ! Même après la vente nous nous occupons toujours de vous ! Nous vous garantissons une expédition dans les 48 heures, mais ce n'est pas tout ! Si le matériel ne vous convient pas vous avez deux semaines pour nous le renvoyer et nous vous rembourserons. De plus, pour chaque produit nous appliquons la garantie de deux ans, donc si vous rencontrez le moindre problème durant ce délai, renvoyez-nous le produit et nous nous occupons de tout.</p>
    
    
    	<%String s="Hello";%>
    	
		<br>
    	Votre age : <%=s %>
    	
    
    
    </div>
</div>

</div>
</div>


    </body>

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
