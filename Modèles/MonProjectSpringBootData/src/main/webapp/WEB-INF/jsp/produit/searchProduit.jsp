<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>:::Tutoriel Spring MVC DAO JPA Hibernate Bootstrap Jquery- 2016-2017:::</title>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta name="Content-Language" content="fr" />
<meta name="Description" content="" />
<meta name="Keywords" content=" Tutoriel Spring MVC DAO JPA Hibernate Bootstrap - 2016-2017" />
<meta name="Subject" content="" />
<meta name="Content-Type" content="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
  	
<spring:url value="/css/bootstrap-theme.min.css" var="bootstrapThemeCss" />
<spring:url value="/css/bootstrap.min.css" var="bootstrapCss" />

<!--  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!--  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"> -->


<spring:url value="/css/style.css" var="styleCss" />
<spring:url value="/css/footer.css" var="footerCss" />
 
<spring:url value="/js/bootstrap.min.js" var="bootstrapJs" />
<spring:url value="/js/jquery-3.1.1.min.js" var="jqueryJs" />
<spring:url value="/js/jquery.form-validator.min.js" var="controlformJs" />


<link href="${styleCss}" rel="stylesheet" />
<link href="${footerCss}" rel="stylesheet" />


<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${bootstrapThemeCss}" rel="stylesheet" />

<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
<script src="${bootstrapJs}"></script>
<script src="${jqueryJs}"></script>
<script src="${controlformJs}"></script>

</head>

<!-- http://www.formvalidator.net/#configuration_html5 -->

<body>

<jsp:include page="../common/header.jsp" />
 
<div class="container">
 
	<div class="row">
		<div class="col-md-offset-2 col-md-8">
		<h1>Rechercher Produit <br/> <small>Merci de sélectionner un critère de recherche et saisir le mot de recherche: </small></h1>
		</div>
	</div>
 

	<spring:url value="/produit/searchByCrieria" var="produitActionUrl" />

	<form:form id="searchproduitform" class="form-horizontal" method="get"  modelAttribute="rechercheForm"  action="${produitActionUrl}">


		<spring:message code="btn.search" var="msgBtnSsarch"/>
 
	    
	   <spring:bind path="critereRecherche">
	   		 <div class="col-md-offset-2 col-md-12">
				<div class="form-group">
					<div class="col-sm-12">
						<label class="radio-inline"> <form:radiobutton path="critereRecherche" value="idProduit" required="required" /> ID Produit
						</label> <label class="radio-inline"> <form:radiobutton path="critereRecherche" value="idCateg" /> Catégorie
					    </label> <label class="radio-inline"> <form:radiobutton path="critereRecherche" value="desigProduit" /> Désignation
   					    </label> <label class="radio-inline"> <form:radiobutton path="critereRecherche" value="configProduit" /> Configuration
   					    </label> <label class="radio-inline"> <form:radiobutton path="critereRecherche" value="marqueProduit" /> Marque
   					    </label> <label class="radio-inline"> <form:radiobutton path="critereRecherche" value="modeleProduit" /> Modéle
   					    </label> <label class="radio-inline"> <form:radiobutton path="critereRecherche" value="puProduitGreater" /> Prix > =
   				   		</label> <label class="radio-inline"> <form:radiobutton path="critereRecherche" value="puProduitLess" /> > = Prix 
    				    </label> <label class="radio-inline"> <form:radiobutton path="critereRecherche" value="qteProduitGreater" /> Quantité > =
   					    </label> <label class="radio-inline"> <form:radiobutton path="critereRecherche" value="qteProduitLess" /> > = Quantité 
   
						</label> <br />
						<form:errors path="critereRecherche" class="control-label" />
					</div>
				</div>
			</div>
		</spring:bind>
		
	
		<div class="row">
			<div class="col-md-offset-2 col-md-6">
				<div class="form-group">
				<label></label>
				<form:input type="text"  required="required" data-validation="length" data-validation-length="max50" path="motRecherche"  class="form-control"  value="${produitForm.motRecherche}" placeholder="Rechercher dans Produit" />
 			    <form:errors path="motRecherche" class="control-label" />
 				</div>
			</div>
		</div>


   	
		<div class="row">
			<div class="col-md-offset-3 col-md-1">
						<button type="submit" class="btn  btn-primary">${msgBtnSsarch}</button>
	       </div>
   </div>
 </form:form>

</div>
<script>
  $.validate({
  });
</script>
		
<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>