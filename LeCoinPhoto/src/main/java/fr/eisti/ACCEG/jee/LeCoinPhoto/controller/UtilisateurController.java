package fr.eisti.ACCEG.jee.LeCoinPhoto.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fr.eisti.ACCEG.jee.LeCoinPhoto.dao.UtilisateursRepository;
import fr.eisti.ACCEG.jee.LeCoinPhoto.model.Utilisateurs;


@Controller("utilisateursController")
public class UtilisateurController {

	@Autowired
	UtilisateursRepository uR;
	
	
	@PostMapping(value = "/userConnect") //Pt etre besoin de faire une Servlet ici, pour recuperer les donnees du formulaire (voir le cours)
	public String userConnect() {//CONNECTER l'utilisateur, puis l'envoyer à son profil (ou l'accueil, à decider)
		
		//...
		return "utilisateur/profil"; 
	}
	
	@GetMapping(value = "/userDeconnect")
	public String userDeconnect() {//DECONNECTER l'utilisateur, puis l'envoyer à l'accueil
		
		//...
		return "index"; 
	}
	
	
	@PostMapping(value = "/userInscription") 
	public String addUser(@ModelAttribute(name = "Utilisateurs") Utilisateurs u, Model model) { //Doit correspondre à th:object="${Utilisateurs}"
		
		//Rajouter un cryptage de son mdp. + verif que login pas deja pris
		
		
		uR.save(u); //On ajoute un user
		
		if (true==true) {
			model.addAttribute("success", true);//On notifie à l'utilisateur que ça c'est bien passé
		}
		else {
			model.addAttribute("fail", true);
		}
	
		return "utilisateur/inscription"; 
	}
	
	
	
	@PostMapping(value = "/deleteProduitPanier")
	public String deleteProduitPanier() {//PAYER, puis retourner au panier (ou autre, à decider)
		
		//...
		return "index"; 
	}
	
	@PostMapping(value = "/payerPanier")
	public String payerPanier() {//VIDER PANIER + MAJ Stocks, puis retourner au panier (ou autre, à decider)
		
		//...
		return "utilisateur/panier"; 
	}
	
	//etc.
}
