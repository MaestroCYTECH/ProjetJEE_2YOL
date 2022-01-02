package fr.eisti.ACCEG.jee.LeCoinPhoto.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import fr.eisti.ACCEG.jee.LeCoinPhoto.dao.*;
import fr.eisti.ACCEG.jee.LeCoinPhoto.model.*;


@Controller
public class UtilisateurController {

	@Autowired
	UtilisateursRepository uR;
	
	@Autowired
	ProduitsRepository pR;
	
	
	@PostMapping(value = "/userConnect")
	public String userConnect() {//CONNECTER l'utilisateur, puis l'envoyer à son profil (ou l'accueil, à decider)
		
		//... Créer Session. Pour l'instant en considérant que le mdp n'est pas chiffré dans la BDD
		
		
		
		return "utilisateur/profil"; 
	}
	
	@GetMapping(value = "/userDeconnect")
	public String userDeconnect() {//DECONNECTER l'utilisateur, puis l'envoyer à l'accueil
		
		//...
		return "index"; 
	}
	   

	
	//etc.
}
