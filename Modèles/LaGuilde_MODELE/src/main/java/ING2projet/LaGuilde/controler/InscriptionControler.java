package ING2projet.LaGuilde.controler;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ING2projet.LaGuilde.dao.InscriptionRepository;
import ING2projet.LaGuilde.model.Membre;

@Controller
public class InscriptionControler {
    
    @Autowired
    private InscriptionRepository inscriptionRepository;

    @GetMapping(value="/Inscription")
    public String chargerAccueil(Model model){
        model.addAttribute("erreurs", new HashMap<String,String>());
        return "Inscription";
    }

    @PostMapping(value="/ajouter-membre")
    public String ajouterMembre(HttpSession session, Model model, @ModelAttribute("membre") Membre membre, @RequestParam("confirmation") String confirmation){
        Map<String,String> erreurs = new HashMap<String,String>();
        String resu;

        /* Validation du champ email.*/
        try {
            validationEmail(membre.getEmail());
        } catch (Exception e) {
            erreurs.put("email", e.getMessage());
        } 

        /* Validation des champs mot de passe et confirmation.*/
        try {
            validationMotsDePasse(membre.getPassword(), confirmation);
        } catch (Exception e) {
            erreurs.put("password", e.getMessage());
        } 

        /* Validation du champ nom.*/
        try {
            validationNom(membre.getNom());
        } catch (Exception e) {
            erreurs.put("nom", e.getMessage());
        } 

        /* Validation du champ prenom. */
        try {
            validationNom(membre.getPrenom());
        } catch (Exception e) {
            erreurs.put("prenom", e.getMessage());
        }

        /* Initialisation du résultat  de la validation.*/ 
        if (erreurs.isEmpty()) {
            resu = "Votre inscription a bien été prise en compte et va être vérifiée par un membre du bureau";
            membre.setStatut(5);
            inscriptionRepository.save(membre);
        } else {
            resu = "Erreur lors de l'inscription.";
        }

        model.addAttribute("erreurs", erreurs);
        model.addAttribute("resuInscri", resu);
        model.addAttribute("confi", confirmation);
        return "/index";
    }


    /*Vérifie que l'email est valide*/
    private void validationEmail( String email ) throws Exception{
        if ( email != null) {
            if ( !(email.contains("@") && email.contains("."))) {
                throw new Exception("Merci de saisir une adresse mail valide.");
            }
        } else {
            throw new Exception("Veuillez saisir une adresse mail.");
        }
    }

    /*Verifie que le mot de passe et sa confirmation sont identiques et suffisamment long*/
    private void validationMotsDePasse(String motDePasse, String confirmation) throws Exception{

        if (motDePasse != null && confirmation != null) {
            if (!motDePasse.equals(confirmation)) {
                throw new Exception("Les mots de passe entrés sont différents, veuillez réessayer.");
            } else if (motDePasse.trim().length() < 8) {
                throw new Exception("Les mots de passe doivent contenir au moins 8 caractères.");
            }
        } else {
            throw new Exception("Veuillez saisir et confirmer votre mot de passe.");
        }
    }
    

    /*Vérifie que le nom et le prenom soient d'au moins 2 caracteres*/
    private void validationNom(String nom) throws Exception{

        if (nom != null && nom.trim().length() < 2) {
            throw new Exception( "Vos nom et prénom doivent contenir au moins 2 caractères chacun." );
        }
    }




    @PostMapping(value="/se-connecter")
    public String seConnecter(HttpSession session, Model model,@RequestParam("connexionEmail") String email, @RequestParam("connexionPassword") String password){
        
        Map<String,String> erreurs = new HashMap<String,String>();
        String resu;
        try {
            Membre membre = inscriptionRepository.findByemail(email);
            if (membre.getPassword().equals(password)){

                session.setAttribute("statutCo", membre.getStatut());
                resu = "Vous êtes bien connecté en tant que : " + membre.getPrenom() + " " + membre.getNom();
    
            } else {
    
                resu = "Erreur lors de la connexion";
                erreurs.put("passwordCo", "Mot de passe erroné");
    
            }
        }
        catch (Exception e) {
            erreurs.put("emailCo", "Votre adresse email est erronée ou vous n'êtes pas encore inscrit");
            resu = "Erreur lors de la connexion";
        }

        
        
        model.addAttribute("resuCo", resu);
        model.addAttribute("erreurs", erreurs);
        return "/index";
    }


    @GetMapping(value="/deco")
    public String deco(Model model, HttpSession session){

        session.setAttribute("statutCo", null);

        return "/index";
    }


}
