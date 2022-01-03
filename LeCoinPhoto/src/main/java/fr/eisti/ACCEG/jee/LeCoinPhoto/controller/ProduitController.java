package fr.eisti.ACCEG.jee.LeCoinPhoto.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fr.eisti.ACCEG.jee.LeCoinPhoto.dao.*;


@Controller
public class ProduitController {

	@Autowired //Sert à lier pR à la BDD
	ProduitsRepository pR;
	 

	@GetMapping(value = "/produits")
	public String displayAppareils(Model model, @RequestParam String cat) { //Envoie à la vue la liste des appareils
		
		if (!cat.equals("appareils") && !cat.equals("objectifs") && !cat.equals("accessoires")) { //Si on triche par l'URL
			return "redirect:/";
		}
		
		model.addAttribute("produits", pR.findByCategorie(cat));
		model.addAttribute("cat", cat);		
		
		return "produit/produits";
	}
	
}
