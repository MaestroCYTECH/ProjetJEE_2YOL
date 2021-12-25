<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>:::Tutoriel Spring MVC Boot Data -  JPA Hibernate Bootstrap Jquery- 2017-2018:::</title>
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
<!-- http://formvalidation.io/download/ -->
<!-- http://www.formvalidator.net/ -->
<!-- http://www.formvalidator.net/#configuration_html5 -->
<!-- http://www.formvalidator.net/#localization_submit -->
<!-- http://www.jqueryscript.net/form/Powerful-Form-Validation-Plugin-For-jQuery-Bootstrap-3.html -->
<!-- http://www.jqueryscript.net/form/HTML5-Form-Validation-Plugin-For-Bootstrap-Bootstrap-Validator.html -->

<body>

<jsp:include page="../common/header.jsp" />
 
<div class="container">

   <c:choose>
		<c:when test="${produitForm.idProduit  != null}">
			<div class="row">
				<div class="col-md-offset-2 col-md-8">
				<h1>Modifier produit <br/> <small>Merci de renseigner ces données </small></h1>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="row">
				<div class="col-md-offset-2 col-md-8">
				<h1>Nouveau produit <br/> <small>Merci de renseigner ces données </small></h1>
				</div>
			</div>
		</c:otherwise>
	</c:choose>

	<spring:url value="/produit/save" var="produitActionUrl" />

	<form:form id="produitform"  class="form-horizontal"  method="post"  modelAttribute="produitForm"  action="${produitActionUrl}" >

		<form:hidden path="idProduit"  value="${produitForm.idProduit}" />
		
  
		<spring:bind path="categorie.idCateg">
		<div class="row">
			<div class="col-md-offset-2 col-md-1">
				<div class="form-group">
				<label>Catégorie</label>
				<form:input type="text" path="categorie.idCateg"  class="form-control"   value="${produitForm.categorie.idCateg}" placeholder="Catégorie" 
                			required="required" 
                			data-validation="required number"
                			data-validation-allowing="range[1;101]" 
                			data-validation-length="max3"
                			data-validation-error-msg-required="Champs categorie est Obligatoire !"
                			data-validation-error-msg-number="Champs categoriedoit être numérique !"/>
				<form:errors path="categorie.idCateg" class="control-label" />		
                										
				</div>
			</div>
		</div>
		</spring:bind>
		
	
		<spring:bind path="desigProduit">
		<div class="row">
			<div class="col-md-offset-2 col-md-4">
				<div class="form-group">
				<label>Désignation</label>
				<form:input type="text"   path="desigProduit"  class="form-control"  value="${produitForm.desigProduit}" placeholder="Désignation" 
							required="required" 
							data-validation-length="max100"
							data-validation-allowing="-_ éèà'&"
							data-validation="required alphanumeric length"
  							data-validation-error-msg-required="Champs designation est Obligatoire"
 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacartères alphanumérique"
 							data-validation-error-msg-length="Taille du champs designation ne doit pas dépasser 100"/> 
				<form:errors path="desigProduit" class="control-label" />		
				</div>
			</div>
		</div>
		</spring:bind>

		<spring:bind path="puProduit">
			<div class="row">
				<div class="col-md-offset-2 col-md-1">
					<div class="form-group">
					<label>Prix</label>
					<form:input type="text"    path="puProduit"  class="form-control"  value="${produitForm.puProduit}" placeholder="Prix" 
								required="required"
								data-validation="required number"
								data-validation-ignore=".,,"
								data-validation-error-msg-required="Champs prixest Obligatoire"
								data-validation-error-msg-number="Champs prix doit être numérique décimal"
								/>
 
					<form:errors path="puProduit" class="control-label" />		
					</div>
				</div>
		</div>
		</spring:bind>

		<spring:bind path="qteProduit">
			<div class="row">
				<div class="col-md-offset-2 col-md-1">
					<div class="form-group">
					<label>Quantité</label>
					<form:input type="text"  path="qteProduit"  class="form-control"  value="${produitForm.qteProduit}" placeholder="Quantité" 
								required="required" 
								data-validation="number" 
								data-validation-allowing="range[1;100001]" 
								data-validation-length="max5"  
								data-validation-error-msg-required="Champs Quantité est Obligatoire"
								data-validation-error-msg-number="Champs Quantité doit être numérique entier ne dépassant pas la valeur 100000 "/>
					<form:errors path="qteProduit" class="control-label" />		
					</div>
				</div>
		</div>
		</spring:bind>

		<spring:bind path="configProduit">
		<div class="row">
			<div class="col-md-offset-2 col-md-4">
				<div class="form-group">
				<label>Config.</label>
				<form:input type="text" path="configProduit"  class="form-control"  value="${produitForm.configProduit}" placeholder="config" 
							required="required" 
							data-validation-length="max100"
							data-validation="required length"
  							data-validation-error-msg-required="Champs config est Obligatoire"
 							data-validation-error-msg-length="Taille du champs config ne doit pas dépasser 100"/>
				<form:errors path="configProduit" class="control-label" />		
				</div>
			</div>
		</div>
		</spring:bind>
		
		<spring:bind path="marqueProduit">
		<div class="row">
			<div class="col-md-offset-2 col-md-4">
				<div class="form-group">
				<label>Marque</label>
				<form:input type="text" path="marqueProduit"  class="form-control"  value="${produitForm.marqueProduit}" placeholder="Marque" 
							required="required" 
							data-validation-length="max50"
							data-validation="required length"
  							data-validation-error-msg-required="Champs Marque est Obligatoire"
 							data-validation-error-msg-length="Taille du champs Marque ne doit pas dépasser 50"/> 
				<form:errors path="marqueProduit" class="control-label" />		
				</div>
			</div>
		</div>
		</spring:bind>		
		   	
		<spring:bind path="modeleProduit">
		<div class="row">
			<div class="col-md-offset-2 col-md-4">
				<div class="form-group">
				<label>Modèle</label>
				<form:input type="text" path="modeleProduit"  class="form-control"  value="${produitForm.modeleProduit}" placeholder="Modèle"
							required="required" 
							data-validation-length="max50"
							data-validation="required length"
  							data-validation-error-msg-required="Champs Modèle est Obligatoire"
 							data-validation-error-msg-length="Taille du champs Modèle ne doit pas dépasser 50" />
				<form:errors path="modeleProduit" class="control-label" />		
				</div>
			</div>
		</div>
		</spring:bind>
		
		<div class="row">
			<div class="col-md-offset-2 col-md-1">
			   <c:choose>
					<c:when test="${produitForm.idProduit  != null}">
						<button type="submit" class="btn  btn-primary pull-left">Modifier</button>
					</c:when>
					<c:otherwise>
						<button type="submit" class="btn  btn-primary pull-left">Enregistrer</button>
					</c:otherwise>
				</c:choose>
	       </div>
	       <div class="col-md-offset-1 col-md-1 pull-left">
						<button type="reset" class="btn  btn-default">Reset</button>
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