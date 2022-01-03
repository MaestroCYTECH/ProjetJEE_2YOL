<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<script src="https://cdn.tailwindcss.com"></script>
	    
<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

<!-- Lien avec le CSS -->
<link rel="stylesheet" type="text/css" href="css/stylePanier.css"/>

<!-- Titre du site dans le navigateur-->
<title>Le coin photo - Mon panier</title>

<script type="text/javascript" src="js/panier.js"></script>


<!-- Zone principale -->
<div class="w-full place-content-center p-10">
	<div class="md:w-3/5 sm:w-full m-auto border-neutral-400">          
        <div class="m-1/2 font-sans bg-neutral-50 bg-opacity-75 rounded-xl shadow-md">
            <div class="w-full p-5 rounded-t-xl upppercase font-bold text-left text-xl pb-5 border-b border-neutral-200 text-indigo-500"><p>MON PANIER</p></div>
                        
            <div id="ajaxPanier" class="p-5">
                
                <c:choose>
                    <c:when test="${panierVide}">
                        <div class="px-5 pt-5 pb-96"><br>  Votre panier est vide pour le moment</div>
                    </c:when>

                    <c:otherwise>  
                        <div class="w-full p-5">
                            <a class="boutonPayer w-24 h-10 text-center decoration-none block py-2 mb-3 mx-auto rounded-md box-border border-none break-all bg-indigo-500 hover:bg-indigo-400 text-white shadow-xl" href="paiement"> PAYER </a>
                            <p class="text-center mx-auto">Vous avez <label id="ajaxNbArticles">${nbArticles}</label> <label id="ajaxArticles">article${pluriel}</label></p>
                        </div>                          
                            
                        <c:forEach items="${panier}" var="entry">     
                            <div class="flex p-2 bg-white border border-neutral-300 rounded-lg text-center hover:border-indigo-400 hover:shadow-lg ${entry.id}">                
                                
                                <div class="flex-1 text-left pl-4">
                                    <img class="h-20" src="img/${entry.image}" alt="${entry.nom}" onerror="this.onerror=null; this.src='img/blank.png'" >
                                </div>  
                                                            
                                <div class="flex-auto my-auto"> 
                                    Nom : <strong><a class="flex-3" href="produits?cat=${entry.categorie}">${entry.nom}</a></strong><br>
                                </div>
                                                            
                                <div class="flex-auto my-auto">                                         
                                    <c:choose>
                                        <c:when test="${entry.stock<=0}">
                                            <strong> INDISPONIBLE pour le moment </strong>
                                        </c:when>
                                                            
                                        <c:otherwise>
                                            Prix : <strong>${entry.prix} €</strong>
                                        </c:otherwise>
                                    </c:choose>
                                </div> <br>
                                                                                    
                                <form class="flex-auto my-auto" onsubmit="return confirmerSuppression(${entry.id})">
                                    <input class="h-6 w-6  m-auto rounded-xl box-border break-all hover:shadow-xl ring-offset-3 ring-2 ring-white  border-white hover:ring-red-500" type="submit" value="&#x274C;"/>
                                </form><br> 

                            </div>
                        </c:forEach>    

                    </c:otherwise>
                </c:choose>
            
            </div>
        </div>
    </div>
</div>


</body>
<jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>