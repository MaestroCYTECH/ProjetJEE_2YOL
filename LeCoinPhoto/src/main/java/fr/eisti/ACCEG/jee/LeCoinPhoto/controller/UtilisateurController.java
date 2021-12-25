package fr.eisti.ACCEG.jee.LeCoinPhoto.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class UtilisateurController {

	@GetMapping(value = "/userConnect") //Pt etre besoin de faire une Servlet ici, pour recuperer les donnees du formulaire (voir le cours)
	public String userConnect() {//CONNECTER l'utilisateur, puis l'envoyer à son profil (ou l'accueil, à decider)
		
		//...
		return "/utilisateur/profil"; 
	}
	
	@GetMapping(value = "/userDeconnect")
	public String userDeconnect() {//DECONNECTER l'utilisateur, puis l'envoyer à l'accueil
		
		//...
		return "index"; 
	}
	
	@GetMapping(value = "/userInscription")
	public String userInscription() {
		
		//...
		return "/utilisateur/profil"; 
	}
	
	@GetMapping(value = "/payer")
	public String payer() {//PAYER, puis retourner au panier (ou autre, à decider)
		
		//...
		return "/utilisateur/panier"; 
	}
	
	//etc.
}
