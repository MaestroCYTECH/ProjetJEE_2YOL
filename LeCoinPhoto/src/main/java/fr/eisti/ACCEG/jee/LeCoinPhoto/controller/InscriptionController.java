package fr.eisti.ACCEG.jee.LeCoinPhoto.controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fr.eisti.ACCEG.jee.LeCoinPhoto.dao.UtilisateursRepository;
import fr.eisti.ACCEG.jee.LeCoinPhoto.model.Utilisateurs;


@Controller("InscriptionController")
public class InscriptionController {

	@Autowired
	UtilisateursRepository uR;
	
	
	
	@GetMapping(value = "/inscription")
	public String pageInscription() {
		return "utilisateur/inscription";
	}
	
	
	@PostMapping(value = "/userInscription") 
	public String addUser(@ModelAttribute(name = "Utilisateurs") Utilisateurs u, Model model, @RequestParam("pwdConfirm") String confirmation) { //Doit correspondre à th:object="${Utilisateurs}"
		
		//Rajouter un cryptage de son mdp.
		
		
		//Verif des données
		Map<String,String> erreurs = new HashMap<String,String>();	
		
		
		try {
			validationNom(u.getNom());
		} catch (Exception e) {
			erreurs.put("nom", e.getMessage());
		}
		
		try {
			validationPrenom(u.getPrenom());
		} catch (Exception e) {
			erreurs.put("prenom", e.getMessage());
		}
		
		try { //Vérif à fixer
			validationSexe(u.getSexe());
		} catch (Exception e) {
			erreurs.put("sexe", e.getMessage());
		}
		
	    try {
	        validationEmail(u.getEmail());
	    } catch (Exception e) {
	        erreurs.put("email", e.getMessage());
	    } 

	 
	    try {
			loginLibre(u.getLogin());
		} catch (Exception e) {
			erreurs.put("login", e.getMessage());
		}
	    
		try {
			validationMotsDePasse(u.getPwd(), confirmation);
		} catch (Exception e) {
			erreurs.put("password", e.getMessage());
		}


		
	
		if (erreurs.isEmpty()) {		
			uR.save(u);
			model.addAttribute("OK", "inscription réussie");
		}
		else {
			model.addAttribute("erreur", "Erreur lors de l'inscription : "+erreurs);	
		}
		
	
		return "utilisateur/inscription"; 
	}
	
	
	//Fcts de vérif d'inscription :
	//Vérifie que le nom et le prenom soient d'au moins 2 caracteres
    private void validationNom(String nom) throws Exception{

    	if (nom==null) {
        	throw new Exception("Veuillez saisir votre nom");
        }
        if (nom != null && nom.trim().length() < 2) {
            throw new Exception( "Votre nom doit contenir au moins 2 caractères." );
        }
    }
    private void validationPrenom(String prenom) throws Exception{

    	if (prenom==null) {
        	throw new Exception("Veuillez saisir votre prénom");
        }
        if (prenom != null && prenom.trim().length() < 2) {
            throw new Exception( "Votre prénom doit contenir au moins 2 caractères." );
        }
    }
    
    
    private void validationSexe( String sexe ) throws Exception{
        if ( sexe != null) {
            if ( !sexe.equals("Homme") && !sexe.equals("Femme") ) {
                throw new Exception("Merci de saisir un genre valide.");
            }
        } else {
            throw new Exception("Veuillez saisir un genre.");
        }
    }
    
    
    private void validationEmail( String email ) throws Exception{
        if ( email != null) {
            if ( !(email.contains("@") && email.contains("."))) {
                throw new Exception("Merci de saisir une adresse mail valide.");
            }
        } else {
            throw new Exception("Veuillez saisir une adresse mail.");
        }
    }
    
    //Login
    private void loginLibre(String login) throws Exception{

    	if (login==null) {
        	throw new Exception("Veuillez saisir votre login");
        }
    	
    	Utilisateurs uTest = uR.findByLogin(login);
        if (login != null && uTest!=null) {
            throw new Exception( "Login déjà pris." );
        }
    }
    

    private void validationMotsDePasse(String pwd, String confirmation) throws Exception{

        if (pwd != null && confirmation != null) {
            if (!pwd.equals(confirmation)) {
                throw new Exception("Les mots de passe sont différents, veuillez réessayer.");
            }
        } else {
            throw new Exception("Veuillez saisir et confirmer votre mot de passe.");
        }
    }
    
    
    
}
