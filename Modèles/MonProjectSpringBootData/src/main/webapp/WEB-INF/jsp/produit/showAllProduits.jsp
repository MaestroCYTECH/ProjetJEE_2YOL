<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html>
<head>
<title>:::Tutoriel Spring MVC Boot Data -  JPA Hibernate Bootstrap Jquery- 2017-2018:::</title>

<meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
<meta name="Content-Language" content="fr" />
<meta name="Description" content="" />
<meta name="Keywords" content=" Tutoriel Spring MVC DAO JPA Hibernate Bootstrap - 2016-2017" />
<meta name="Subject" content="" />
<meta name="Content-Type" content="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<spring:url value="/css/bootstrap-theme.min.css" var="bootstrapThemeCss" />
<spring:url value="/css/bootstrap.min.css" var="bootstrapCss" />
<spring:url value="/css/dataTables.bootstrap.min.css" var="bootstrapdataTablesCss" />


<spring:url value="/js/jquery-3.1.1.min.js" var="jqueryJs" />
<spring:url value="/js/jquery.dataTables.min.js" var="jquerydataTablesJs" />
<spring:url value="/js/bootstrap.min.js" var="bootstrapJs" />
<spring:url value="/js/dataTables.bootstrap.min.js" var="bootstrapdataTablesJs" />

<spring:url value="/css/style.css" var="styleCss" />
<spring:url value="/css/footer.css" var="footerCss" />

<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${bootstrapThemeCss}" rel="stylesheet" />
<link href="${bootstrapdataTablesCss}" rel="stylesheet" />

<script src="${jqueryJs}"></script>
<script src="${jquerydataTablesJs}"></script>
<script src="${bootstrapJs}"></script>
<script src="${bootstrapdataTablesJs}"></script>

<link href="${styleCss}" rel="stylesheet" />
<link href="${footerCss}" rel="stylesheet" />

<style>
  .modal-header, h4, .close {
      background-color: #DF7401;
      color:white !important;
      text-align: left;
      font-size: 30px;
  }
  .modal-footer {
      background-color: #E6E6E6;
  }
  </style>
  
</head>


<body>

	<jsp:include page="../common/header.jsp" />
<body>

 <div class="container">

		<c:if test="${not empty msgAlert}">
			<div class="alert alert-${typeAlert} alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<strong>${msgAlert}</strong>
			</div>
		</c:if>

		
 <c:choose>  <%-- Debut c:choose  --%>
		<c:when test="${empty produits}">
			<div class="alert alert-warning alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
				<strong>Aucun produit trouvé ! La liste des produits est vide !</strong>
			</div>
		</c:when>
		
 <c:otherwise>  <%-- Debut c:otherwise  --%>
		
		<div class="row">
		<div class="col-md-7">
			<h1> Liste des Produits </h1>
		</div>
		<div class="col-md-5">
			<button class="btn btn-warning pull-right"	data-toggle="modal" data-target="#clearModal" data-dismiss="modal">
			 clear
			</button>
		</div>
		</div>


<!-- 		<table  id="prodtable" class="table table-striped"> -->
		<table id="prodtable" class="table table-striped table-bordered">
		
			<thead>
				<tr>
				   <th>id</th>
					<th>categorie</th>
					<th>designation</th>
					<th>prix</th>
					<th>qte</th>
					<th>config</th>
					<th>marque</th>
					<th>modele</th>
					
					<th>Action</th>
				</tr>
			</thead>
			<tfoot>
        	    <tr>
 
				    <th>id</th>
					<th>categorie</th>
					<th>designation</th>
					<th>prix</th>
					<th>qte</th>
					<th>config</th>
					<th>marque</th>
					<th>modele</th>
         	   </tr>
       		 </tfoot>
       	   <tbody>
			<c:forEach var="prod" items="${produits}">
			
				<spring:url value="/produit/get/${prod.idProduit}"	var="prodUrl" /> 
				<spring:url value="/produit/delete/${prod.idProduit}" var="deleteUrl" />
				<spring:url value="/produit/update/${prod.idProduit}" var="updateUrl" />
				<spring:url value="/produit/clear" var="clearUrl" />
				
				<tr>
					<td width="5%">${prod.idProduit}</td>
					<td width="5%">${prod.categorie.idCateg}</td>
					<td width="10%">${prod.desigProduit}</td>
					<td width="10%">${prod.puProduit}</td>
					<td width="10%">${prod.qteProduit}</td>
					<td width="30%">${prod.configProduit}</td>
					<td width="15%">${prod.marqueProduit}</td>
					<td width="15%">${prod.modeleProduit}</td>
					<td>
						<button class="btn btn-success"	onclick="location.href='${prodUrl}'">
						show
						</button>
						<button class="btn btn-primary" onclick="location.href='${updateUrl}'">
						update
						</button>
  						
						<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteModal" data-dismiss="modal" >
							detele
						</button>
					</td>
				</tr>
				
			</c:forEach>
		 </tbody>	
		</table>
		
		
		 <div class="modal fade" id="deleteModal" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
			    	<h4> <span class="glyphicon  glyphicon-trash"></span> Confirmer Suppresion</h4>
		        </div>
		        <div class="modal-body">
			       <h3>Êtes-vous sûr de vouloir supprimer définitivement ce produit ?
			      	 <br><small>Sa suppression va engendrer la suppression de toutes ses commandes !</small>
			         <br><br><small>NB: Cette opération est irréversible !</small>
			        </h3>
		        </div>
		        <div class="modal-footer">
		           <button type="button" class="btn btn-default" data-dismiss="modal">
		          	 	<span class="glyphicon glyphicon-remove"></span>Annuler
		           </button>
		           <button type="button" class="btn btn-danger" data-toggle="modal" onclick="location.href='${deleteUrl}'"  >
						<span class="glyphicon glyphicon-trash"></span> Supprimer
				  </button>
		        </div>
		      </div>
		      
		    </div>
		  </div>
		  
		
		<div class="modal fade" id="clearModal" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
			    	<h4> <span class="glyphicon  glyphicon-trash"></span> Confirmer Vidage</h4>
		        </div>
		        <div class="modal-body">
			       <h3>Êtes-vous sûr de vouloir vider la liste de toutes les produits ? 
			      	 <br><small>Ce vidage engendrer systématiquement la suppression de toutes ses commandes!</small>
			      	 <br><br><small>NB: Cette opération est irréversible !</small>
			      	 
				   </h3>
		        </div>
		        <div class="modal-footer">
		           <button type="button" class="btn btn-default" data-dismiss="modal">
		          	 	<span class="glyphicon glyphicon-remove"></span>Annuler
		           </button>
		           <button type="button" class="btn btn-warning" onclick="location.href='${clearUrl}'" >
						<span class="glyphicon glyphicon-trash"></span> Clear
				  </button>
		        </div>
		      </div>
		    </div>
	   </div>

</c:otherwise> <%-- Fin c:otherwise  --%>
</c:choose> <%-- Fin c:choose  --%>
</div> <%-- Fin div class="container" --%>

<!-- https://datatables.net/examples/styling/bootstrap.html -->
<script>	
// $(document).ready(function() {
//     $('#prodtable').DataTable();
// } );

// $(document).ready(function() {
//     $('#prodtable').dataTable( {
//         "language": {
//             "url": "dataTables.frensh.lang"
//         }
//     } );
// } );

$('#prodtable').DataTable( {
    language: {
        processing:     "Traitement en cours...",
        search:         "Rechercher&nbsp;:",
        lengthMenu:    "Afficher _MENU_ &eacute;l&eacute;ments",
        info:           "Affichage de l'&eacute;lement _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
        infoEmpty:      "Affichage de l'&eacute;lement 0 &agrave; 0 sur 0 &eacute;l&eacute;ments",
        infoFiltered:   "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
        infoPostFix:    "",
        loadingRecords: "Chargement en cours...",
        zeroRecords:    "Aucun &eacute;l&eacute;ment &agrave; afficher",
        emptyTable:     "Aucune donnée disponible dans le tableau",
        paginate: {
            first:      "Premier",
            previous:   "Pr&eacute;c&eacute;dent",
            next:       "Suivant",
            last:       "Dernier"
        },
        aria: {
            sortAscending:  ": activer pour trier la colonne par ordre croissant",
            sortDescending: ": activer pour trier la colonne par ordre décroissant"
        }
    }
} );
</script>

<jsp:include page="../common/footer.jsp" />

</body>
</html>