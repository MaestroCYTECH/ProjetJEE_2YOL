package fr.eisti.ACCEG.jee.LeCoinPhoto.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import fr.eisti.ACCEG.jee.LeCoinPhoto.dao.*;
import fr.eisti.ACCEG.jee.LeCoinPhoto.model.*;


@Controller
public class ProduitController {

	@Autowired //Sert à "lier" appR à la BDD
	ProduitsRepository pR;
	 
	
	//Idem pour afficher produits, etc.
	
    
	
	

	@GetMapping(value = "/appareils")
	public String displayAppareils(Model model) { //Doit envoyer à la vue la liste des appareils
		
		model.addAttribute("produits", pR.findByCategorie("appareils"));
		
		return "produit/appareils";
	}
	
	@GetMapping(value = "/objectifs")
	public String pageObjectifs() {
		return "produit/objectifs";
	}
	
	@GetMapping(value = "/accessoires")
	public String pageAccessoires() {
		return "produit/accessoires";
	}
	
	
}
