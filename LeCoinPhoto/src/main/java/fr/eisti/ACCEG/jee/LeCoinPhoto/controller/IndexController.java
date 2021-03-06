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
	
}
