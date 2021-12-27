package fr.eisti.ACCEG.jee.LeCoinPhoto.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController { //Controleur gerant l'accès aux pages principales. 

	@GetMapping(value = "/")
	public String index() {
		return "index"; //Cherche par défaut dans /WEB-INF/jsp (changeable dans application.properties)
	}
	
	@GetMapping(value = "/contact")
	public String pageContact() {
		return "contact/contact";
	}
	
	/* Géré par ProduitController :
	@GetMapping(value = "/appareils")*/
	
	@GetMapping(value = "/objectifs")
	public String pageObjectifs() {
		return "produit/objectifs";
	}
	
	@GetMapping(value = "/accessoires")
	public String pageAccessoires() {
		return "produit/accessoires";
	}
	//Les 2 du dessus devront etre géré par ProduitController aussi, plus logique
	
	
	@GetMapping(value = "/connexion")
	public String pageConnexion() {
		return "utilisateur/connexion";
	}
	
	@GetMapping(value = "/inscription")
	public String pageInscription() {
		return "utilisateur/inscription";
	}
	
	@GetMapping(value = "/panier")
	public String pagePanier() {
		return "utilisateur/panier";
	}
	
	@GetMapping(value = "/paiement")
	public String pagePaiement() {
		return "utilisateur/paiement";
	}
	
	
	@GetMapping(value = "/profil")
	public String pageProfil() {
		return "utilisateur/profil";
	}
	
}
