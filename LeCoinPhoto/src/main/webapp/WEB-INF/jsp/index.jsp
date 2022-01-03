<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

  <script src="https://cdn.tailwindcss.com"></script>


<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<!-- Lien avec le CSS -->
<link rel="stylesheet" type="text/css" href="css/style.css"/>

<!-- Titre du site dans le navigateur-->
<title>Le coin photo</title>

<div class="backgroundimage">
	<div class="w-full place-content-center p-10">
		<div class="md:w-3/5 sm:w-full m-auto mb-10 bg-neutral-50 bg-opacity-75 backdrop-blur-lg rounded-xl text-neutral-800 shadow-md">
    		<div class="w-full p-5 bg-neutral-100 rounded-t-xl bg-opacity-75	 upppercase font-bold text-left text-xl pb-5">QUI SOMMES NOUS ?</div>
    		<p class="text-justify p-5">Nous sommes une petite équipe de passionnés de la photographie et de la technologie. Nous avons un jour eu l'idée de créer un site de vente de matériel professionnel, et uniquement professionnel. Vous trouverez ici les meilleurs appareils, les meilleurs objectifs et accessoires, et tout cela à des prix qui vous éviteront la banqueroute !<br><br>
    		Nous travaillons en étroite collaboration avec de nombreux photographes pour savoir quels sont les besoins exacts pour exercer la photographie professionnelle et amateure. Ceci nous permet de ne pas polluer le site avec du mauvais matériel, ou du matériel inutile. C'est ainsi que tous les produits que nous vendons ont été testés et recommandés par des photographes confirmés. <br><br>
    		Nous proposons uniquement les meilleures marques de matériel photo, avec lesquelles nous négocions des prix les plus bas possibles. Vous méritez des produits de qualité pour un coût réduit ! Les livraisons sont rapides et nous vous garantissons le service après-vente le plus efficace !</p>
    	</div>
    	<div class="md:w-3/5 sm:w-full m-auto mb-10 bg-neutral-50 bg-opacity-75 backdrop-blur-lg rounded-xl text-neutral-800 shadow-md">
        	<div class="w-full p-5 bg-neutral-100 rounded-t-xl 	bg-opacity-75 upppercase font-bold text-left text-xl pb-5">NOS MARQUES PARTENAIRES</div>
            <div class="w-full p-5 place-content-center text-center items-center text-center grid grid-cols-4 grid-rows-2 gap-4">
                <div><img src="img/fujiLogo.png" class="h-8 m-auto" alt="Fujifilm" title="Partenaires depuis 2014"></div>
            	<div><img src="img/sonyLogo.png" class="h-8 m-auto" alt="Sony" title="Partenaires depuis 2014"></div>
                <div><img src="img/tiffenLogo.png" class="h-8 m-auto" alt="Tiffen" title="Partenaires depuis 2012"></div>
                <div><img src="img/tamronLogo.png" class="h-8 m-auto" alt="Tamron" title="Partenaires depuis 2010"></div>  
                <div><img src="img/sigmaLogo.png" class="h-8 m-auto" alt="Sigma" title="Partenaires depuis 2010"></div>
                <div><img src="img/pentaxLogo.png" class="h-8 m-auto" alt="Pentax" title="Partenaires depuis 2011"></div>
                <div><img src="img/samyangLogo.png" class="h-8 m-auto" alt="Samyang" title="Partenaires depuis 2011"></div>
                <div><img src="img/smallrigLogo.png" class="h-8 m-auto" alt="Smallrig" title="Partenaires depuis 2012"></div>
        	</div>
        </div>
        <div class="md:w-3/5 sm:w-full m-auto bg-neutral-50 bg-opacity-75 backdrop-blur-lg rounded-xl text-neutral-800 shadow_md">
        	<div class="w-full p-5 bg-neutral-100 rounded-t-xl 	bg-opacity-75 upppercase font-bold text-left text-xl pb-5">ET LE SERVICE APRES-VENTE DANS TOUT CA ?</div>
        	<p class="text-justify p-5">Vous vous dites sûrement : "Du bon matos pas cher ça cache forcément quelque chose !"<br><br>
            Eh non ! Même après la vente nous nous occupons toujours de vous ! Nous vous garantissons une expédition dans les 48 heures, mais ce n'est pas tout ! Si le matériel ne vous convient pas vous avez deux semaines pour nous le renvoyer et nous vous rembourserons. De plus, pour chaque produit nous appliquons la garantie de deux ans, donc si vous rencontrez le moindre problème durant ce délai, renvoyez-nous le produit et nous nous occupons de tout.</p>
    	</div>
	</div>
</div>

</body class="m-0">

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
