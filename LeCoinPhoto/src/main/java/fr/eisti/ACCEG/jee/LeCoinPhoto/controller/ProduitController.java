package fr.eisti.ACCEG.jee.LeCoinPhoto.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fr.eisti.ACCEG.jee.LeCoinPhoto.dao.*;
import fr.eisti.ACCEG.jee.LeCoinPhoto.model.*;


@Controller
public class ProduitController {

	@Autowired //Sert à "lier" appR à la BDD
	ProduitsRepository pR;
	 
	
	//Idem pour afficher produits, etc.
		
	

	@GetMapping(value = "/produits")
	public String displayAppareils(Model model, @RequestParam String cat) { //Doit envoyer à la vue la liste des appareils
		
		if (!cat.equals("appareils") && !cat.equals("objectifs") && !cat.equals("accessoires")) {
			return "redirect:/";
		}
		
		model.addAttribute("produits", pR.findByCategorie(cat));
		model.addAttribute("cat", cat);
		
		
		return "produit/produits";
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
