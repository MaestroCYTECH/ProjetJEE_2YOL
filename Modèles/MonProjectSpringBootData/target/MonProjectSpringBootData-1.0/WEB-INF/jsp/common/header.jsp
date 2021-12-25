<header>
		<nav class="navbar">
		<div class="container">
		<div class="navbar-header">
		 
		<ul class="menu">
			<li><a href="#">Accueil</a></li>
			<li><a href="#s1">Gestion Client</a>
				<ul class="submenu">
					<li><a href="${pageContext.request.contextPath}/client/new">Nouveau Client</a></li>
					<li><a href="${pageContext.request.contextPath}/client/search">Rechercher</a></li>
					<li><a href="${pageContext.request.contextPath}/client/listAll">Lister Tous</a></li>
				</ul>
			</li>
			<li class="active"><a href="#s2">Gestion Commande</a>
				<ul class="submenu">
					<li><a href="${pageContext.request.contextPath}/commande/new">Nouvelle</a></li>
					<li><a href="${pageContext.request.contextPath}/commande/search">Rechercher</a></li>
					<li><a href="${pageContext.request.contextPath}/commande/listAll">Lister Tous</a></li>
				</ul>
			</li> 
			<li><a href="#">Gestion Produit</a>
				<ul class="submenu">
					<li><a href="${pageContext.request.contextPath}/produit/new">Nouveau Produit</a></li>
					<li><a href="${pageContext.request.contextPath}/produit/search">Rechercher</a></li>
					<li><a href="${pageContext.request.contextPath}/produit/listAll">Lister Tous</a></li>
				</ul>
			</li>
			<li><a href="#">Gestion Catégorie</a>
				<ul class="submenu">
					<li><a href="${pageContext.request.contextPath}/categorie/new">Nouvelle</a></li>
					<li><a href="${pageContext.request.contextPath}/categorie/search">Rechercher</a></li>
					<li><a href="${pageContext.request.contextPath}/categorie/listAll">Lister Tous</a></li>
				</ul>
			</li>
 			 <li> <form class="navbar-form navbar-left" action="/produit/search" method="get">
			        <div class="form-group">
			          <input type="text" class="form-control" placeholder="Rechercher Produit">
			        </div>
			        <button type="submit" class="btn btn-default">OK</button>
			     </form>
			 </li>     
 		</ul>	
		 
	 </div>
   </div>
  </nav>
 </header>