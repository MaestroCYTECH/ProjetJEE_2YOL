<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <head>
        <!-- Icone du site dans le navigateur -->
        <link rel="icon" type="image/png" href="img/lcpLogo.png"/>
          <script src="https://cdn.tailwindcss.com"></script>
        
        <meta charset="utf-8"/>       
        
        <div class="bg-neutral-300 p-2 h-16 place-content-center flex">
            <img src="img/lcpLogo2.png" class="h-full" alt="Le coin photo" title="Le coin photo, vendeur de mat�riel photo" onclick="location.href='/'">
        </div>

        <!-- Barre de navigation -->
        <div class="bg-neutral-400 flex font-sans place-content-center sticky top-0 z-10 shadow-lg">
            <a class="px-4 py-2 h-full text-white hover:bg-neutral-300" href="/"><p>ACCUEIL</p></a>
            <a class="px-4 py-2 h-full text-white hover:bg-neutral-300" href="produits?cat=appareils"><p>APPAREILS</p></a>
            <a class="px-4 py-2 h-full text-white hover:bg-neutral-300" href="produits?cat=objectifs"><p>OBJECTIFS</p></a>
            <a class="px-4 py-2 h-full text-white hover:bg-neutral-300" href="produits?cat=accessoires"><p>ACCESSOIRES</p></a>
        	<a class="px-4 py-2 h-full text-white hover:bg-neutral-300" href="contact"><p>CONTACT</p></a>  
        	

            <c:choose>
                <c:when test="${user!=null}">
        	        <a class="p-3 h-full hover:bg-neutral-300" href="panier"><img src="img/cart.png" class="h-4" title="MON PANIER"></a>
                    <a class="p-3 h-full hover:bg-neutral-300" href="profil"><img src="img/user.png" class="h-4" title="MON PROFIL"></a> 
                </c:when>

                <c:otherwise>
                    <a class="p-3 h-full hover:bg-neutral-300" href="connexion"><img src="img/user.png" class="h-4" title="SE CONNECTER"></a>
                </c:otherwise>
            </c:choose>  
	
        </div>
        
    </head>

    <body class="m-0">