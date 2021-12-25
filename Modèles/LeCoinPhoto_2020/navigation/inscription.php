<?php
session_start();


//Verification Session : Si deja connecté on renvoie vers le panier
if (isset($_SESSION['profil']['login']) )
{
	header('Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/index.php');
}

if (!isset($_SESSION['erreurInscription']) )
{
	$_SESSION['erreurInscription']="";//Affiche une erreur d'inscription si il y en a. Login deja pris par ex
}

$title="- M'inscrire";
$style="Contact";//Car formulaire très similaire à celui du contact
$js="inscription";

ob_start(); ?>

    <!-- Zone de navigation sur la droite-->
    <div class="pagedroite">
                <div class="background">

                <div class="bloc">
                    <div class="titresection"><p>S'INSCRIRE</p></div>
                    <div class="texte">
                      
                    <?php if($_SESSION['erreurInscription']!=""){ ?>
                            <span class="error"><?=$_SESSION['erreurInscription']?></span> <?php
                            $_SESSION['erreurInscription']="";
                        }                 
                    ?> 

                        <form name="Formulaire" onsubmit="return envoyer()" method="POST" action="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/php/S_inscription.php">
                            <fieldset>
                                
                                    <div class="box3">
                                        <div class="gauche">
                                            <label class="label" id="labelNom">Nom :</label><br><br>
                                            <input type="text" id="nom" name="nom" class="forminput" placeholder="Ex: NOM" /><br><br>
                                            
                                            <label class="label" id="labelSexe">Sexe :</label><br><br>	
                                            <div id="sexe" class="minibox">
                                                <input type="radio" name="sexe" value="Homme" id="Homme">
                                                <label for="Homme"> Homme </label>&nbsp&nbsp&nbsp
                                                <input type="radio" name="sexe" value="Femme" id="Femme">
                                                <label for="Femme"> Femme </label><br>
                                            </div><br><br>
                                        </div>

                                        <div class="droite">                           
                                            <label class="label" id="labelPrenom">Prénom :</label><br><br>
                                            <input type="text" id="prenom" name="prenom" class="forminput" placeholder="Ex: Prénom"/><br><br>
                                           
                                            <label class="label" id="labelDate">Date de naissance :</label><br><br>
                                            <input type="date" name="dateNaissance" id="dateNaissance" max='<?=date("Y-m-d")?>' class="forminput" placeholder="jj/mm/aaaa"/><br><br>
                                        </div>
                                    </div>

                                    <div class="leftalign">
                                        <label class="label" id="labelMail">Adresse email :</label><br><br>
                                        <input type="email" id="mailClient" name="mailClient" class="forminput" placeholder="Ex: monmail@monsite.org"/><br><br>

                                        <label class="label" id="labelLogin">Login :</label><br><br>
                                        <input type="text" id="login" name="login" class="forminput" placeholder="Ex: eisti95" /><br><br>
                                      
                                        <label class="label" id="labelPwd">Mot de passe :</label><br><br>
                                        <input type="password" id="pwd" name="pwd" class="forminput" placeholder="Mot de passe"/><br><br>

                                        <label class="label" id="labelConfirm">Confirmation du mot de passe :</label><br><br>
                                        <input type="password" id="pwdConfirm" name="pwdConfirm" class="forminput"/><br><br>
                                    </div>

                                    <input class="boutonEnvoyer" type="submit" value="M'inscrire"/>
                                    <input class="boutonEffacer" type="reset" value="Effacer" />

                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<?php $content=ob_get_clean(); 
require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/php/template.php");

?>
