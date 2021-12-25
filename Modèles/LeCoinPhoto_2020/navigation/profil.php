<?php
session_start();

//Verification Session : Si pas connecté on renvoie vers la connexion
if ( (!isset($_SESSION['profil']['login'])) ) //si pas connecté
{ 
	header('Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/connexion.php');
}


$title="- Mon profil";
$style="profil";
$js="";

ob_start();?>

<!-- Zone de navigation sur la droite-->
<div class="pagedroite">

    <div class="bloc">
        <div class="titresection"><p>MON PROFIL</p></div><br><br>
            
            <a class="boutonPayer" href="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/php/deconnexion.php">Me déconnecter</a><br><br>
            <p>Bonjour, <?=$_SESSION['profil']['nom']?> !</p>

            <!--Affichage du profil-->

        <div id="Profil"> Mes informations personnelles : <br><br> 
            <div class="panier">
            <div class="profil2">
            Login :  <?=$_SESSION['profil']['login']; ?> <br>
            Email :  <?=$_SESSION['profil']['email']; ?> <br>
            Nom :  <?=$_SESSION['profil']['nom']; ?><br>
            Prenom :  <?=$_SESSION['profil']['prenom']; ?><br>
            Sexe :  <?=$_SESSION['profil']['sexe']; ?><br>
            Date de naissance : <?=$_SESSION['profil']['naissance']; ?><br>
            </div>

            </div> 
            <br>
        </div>

       <?php if ($_SESSION['profil']['statut']=="admin"){ ?>
       <br> <a class="boutonPayer" href="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/admin/secured.php">Section ADMIN</a> <br>
    <?php }
    ?>
    <br><br>
    </div>
</div>
</div>

<?php $content=ob_get_clean();


require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/php/template.php");
?>