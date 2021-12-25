<?php
session_start();


$title="- Nous contacter";
$style="Contact";
$js="contact";

$btnContact='class="btnclick"';


$erreurNom=$erreurPrenom=$erreurNaissance=$erreurSexe=$erreurMail=$erreurMetier=$erreurSujet=$erreurContenu="";
$nom=$prenom=$dateNaissance=$sexe=$mail=$metier=$sujet=$contenu="";
$erreurEnvoi="";


//Si on vient ici pour envoyer le formulaire

$envoi=false;
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/php/S_contact.php");
}



ob_start();?>

   <!-- Zone de navigation sur la droite-->
   <div class="pagedroite">
        <div class="background">


            <div class="bloc">
                <div class="titresection"><p>NOUS CONTACTER</p></div>
                <div class="texte">
                    <?=$erreurEnvoi?>
                    
                    <form name="Formulaire" method="POST" action="<?=htmlspecialchars($_SERVER["PHP_SELF"]);?>">
                        <fieldset>
                        
                              <div class="box3">
                                  <div class="gauche">
                                      <label class="label">Nom :</label> <span class="error">*<?=$erreurNom;?></span> <br><br>
                                      <input type="text" id="nom" name="nom" class="forminput <?php if (!empty($erreurNom)) echo "rouge";?>" placeholder="Ex: NOM" value="<?=$nom?>"/><br><br>
                                            
                                      <label class="label">Sexe :</label> <span class="error">*<?=$erreurSexe;?></span> <br><br>	
                                      <div id="sexe" class="minibox <?php if (!empty($erreurSexe)) echo "rouge";?>">
                                           <input type="radio" name="sexe" value="Homme" id="Homme" <?php if (isset($sexe) && $sexe=="Homme") echo "checked";?>>
                                           <label for="Homme"> Homme </label>&nbsp&nbsp&nbsp
                                           <input type="radio" name="sexe" value="Femme" id="Femme" <?php if (isset($sexe) && $sexe=="Femme") echo "checked";?>>
                                           <label for="Femme"> Femme </label>                                        
                                       </div><br><br>
                                   </div>

                                  <div class="droite">                           
                                    <label class="label">Prénom :</label> <span class="error">*<?=$erreurPrenom;?></span> <br><br>
                                    <input type="text" id="prenom" name="prenom" class="forminput <?php if (!empty($erreurPrenom)) echo "rouge";?>" placeholder="Ex: Prénom" value="<?=$prenom?>"/><br><br>
                                   
                                   <label class="label">Date de naissance :</label> <span class="error">*<?=$erreurNaissance;?></span> <br><br>
                                   <input type="date" name="dateNaissance" id="date" max="2021-04-25" class="forminput <?php if (!empty($erreurNaissance)) echo "rouge";?>" placeholder="jj/mm/aaaa" value="<?=$dateNaissance?>"/><br><br>
                                </div>
                            </div>

                            <div class="box3">
                                <div class="gauche">
                                    <label class="label">Adresse email :</label> <span class="error">*<?=$erreurMail;?></span> <br><br>
                                    <input type="email" id="mailClient" name="mailClient" class="forminput <?php if (!empty($erreurMail)) echo "rouge";?>" placeholder="Ex: monmail@monsite.org" value="<?=$mail?>"/><br><br>
                                </div>
                                       
                                <div class="droite">                           
                                    <label class="label">Métier :</label> <span class="error">*<?=$erreurMetier;?></span> <br><br>
                                    <div class="box2 <?php if (!empty($erreurMetier)) echo "rouge";?>" id="metier">
                                        <select name="metier">
                                            <option value="">--Veuillez choisir une option--</option>
                                            <option <?php if (isset($metier) && $metier=="Etudiant") echo "selected";?>>Etudiant</option>
                                            <option <?php if (isset($metier) && $metier=="Enseignant") echo "selected";?>>Enseignant</option>
                                            <option <?php if (isset($metier) && $metier=="Commerçant") echo "selected";?>>Commerçant</option>
                                            <option <?php if (isset($metier) && $metier=="Fonctionnaire") echo "selected";?>>Fonctionnaire</option>
                                        </select>
                                    </div><br>
                                </div>
                            </div>

                            <div class="leftalign">
                                <label class="label" for="sujet">Sujet :</label> <span class="error">*<?=$erreurSujet;?></span> <br><br>
                                <textarea class="textarea1 <?php if (!empty($erreurSujet)) echo "rouge";?>" rows="1" name="sujet" id="sujet" placeholder="Entrez le sujet de votre mail"><?=$sujet?></textarea><br><br>
                                        
                                <label class="label" for="contenu">Contenu :</label> <span class="error">*<?=$erreurContenu;?></span> <br><br>
                                <textarea class="textarea2 <?php if (!empty($erreurContenu)) echo "rouge";?>" name="contenu" id="contenu" wrap="hard" placeholder="Tapez ici votre mail"><?=$contenu?></textarea><br><br>
                            </div>
                                
                            <input class="boutonEnvoyer" type="submit" value="Envoyer"/>
                            <a class="boutonEffacer" href="/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/navigation/contact.php">Effacer</a>

                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<?php $content=ob_get_clean(); 

require_once($_SERVER['DOCUMENT_ROOT']."/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/php/template.php");


if($envoi){ //Si les données sont bonnes
    /* Avec un serveur de mail, faire ici un vrai envoi de mail à partir des données */

    echo '<script type="text/javascript">
            location.href = "mailto:lecoinphoto@gmail.com?subject='.$tmpSujet.'&body= Expéditeur : '.$tmpMail.'%0d%0aNom : '.$tmpNom.'%0d%0a Prenom : '.$tmpPrenom.'%0d%0a Date de naissance : '.$tmpDateNaissance.'%0d%0a Sexe : '.$tmpSexe.'%0d%0a Métier : '.$tmpMetier.'%0d%0a Contenu : '.$tmpContenu.'";
        </script>';
    //%0d%0a fait un saut de ligne dans le mail

}

?>