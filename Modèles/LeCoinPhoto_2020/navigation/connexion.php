<?php
session_start();


//Verification Session : Si deja connecté on renvoie vers le panier
if (isset($_SESSION['profil']['login']) ) //si deja connecté
{
	header('Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/index.php');
}

if (!isset($_SESSION['erreurConnexion']) ) 
{
	$_SESSION['erreurConnexion']="";
}


$title="- Connexion";
$style="Connexion";
$js="connexion";


ob_start();?>

<!-- Zone de navigation sur la droite-->
<div class="pagedroite">
                <div class="background">

                    <div class="bloc">
                        <div class="titresection"><p>SE CONNECTER</p></div>
                        <div class="texte">

                        <?php if($_SESSION['erreurConnexion']!=""){ ?>
                            <span class="error"><?=$_SESSION['erreurConnexion']?></span> <?php
                            $_SESSION['erreurConnexion']="";
                        }                 
                        ?> 

                            <form name="Formulaire" onsubmit="return envoyer()" method="POST" action="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/php/S_connexion.php">
                                <fieldset>                        

                                    <div class="centerAlign">
                                        <label class="label">Login :</label><br><br>
                                        <input type="text" id="login" name="login" class="forminput" placeholder="Ex: eisti95" /><br><br>
                                  
                                        <label class="label">Mot de passe :</label><br><br>
                                        <input type="password" id="pwd" name="pwd" class="forminput" placeholder="Mot de passe"/><br><br>
                                    </div>
                                
                                    <input class="boutonConnexion" type="submit" value="Connexion"/>                  
                                </fieldset>
                            </form>

                        <h3>Pas encore inscrit ? <a href="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/inscription.php">Inscrivez-vous</a> </h3>

                        </div>
                    </div>
                </div>
            </div>
        </div>

<?php $content=ob_get_clean();
require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/php/template.php");


?>
