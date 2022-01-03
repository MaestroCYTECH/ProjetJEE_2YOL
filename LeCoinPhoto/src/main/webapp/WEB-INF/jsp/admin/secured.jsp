<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>    
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<!-- Lien avec le CSS -->
<link rel="stylesheet" type="text/css" href="css/stylePanier.css"/>

<!-- Titre du site dans le navigateur-->
<title>Le coin photo - section Admin</title>

<script type="text/javascript" src="js/admin.js"></script>



    <!-- Zone principale -->
	<div class="w-full place-content-center p-10">
        <div class="md:w-3/5 sm:w-full m-auto mb-10 bg-neutral-100 backdrop-blur-lg rounded-xl text-neutral-800 shadow-xl border border-neutral-200">
            
            <div class="w-full p-5 rounded-t-xl upppercase font-bold text-left text-xl pb-5 border-b border-neutral-200 text-indigo-500"><p>ESPACE ADMIN</p></div><br>
                
            <div class="w-full p-5 text-center">

                Ici vous pouvez ajouter ou supprimer un produit, et aussi en augmenter le stock. </p>
             
                <a class="w-52 m-auto mt-8 p-3 block rounded-md text-white bg-neutral-400 hover:bg-neutral-300" href='adminFormulaireProduit'> AJOUTER UN PRODUIT </a>

                <h2 class="bold mt-8"> LISTE DES CATEGORIES : </h2><br>      
                <div class="w-full bg-neutral-100 flex">

                    <c:forEach items="${cat}" var="entry">
                        <div class="text-center flex-1">                        
                            <a class="block uppercase text-xl font-bold bg-neutral-400 text-white p-3 w-full hover:bg-neutral-300" href="adminListe?cat=${entry.categorie}"><strong>NOS ${entry.categorie}</strong></a>
                        </div>   
                    </c:forEach>

                </div>
            </div>           

        </div>
    </div>

</body>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>