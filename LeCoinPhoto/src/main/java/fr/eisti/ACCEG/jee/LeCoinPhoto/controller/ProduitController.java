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
	 
	 
	@GetMapping(value = "/addToCart")
	public String addToCart() {//AJOUTER au panier, puis renvoyer à ce panier
		
		//..
		return "/utilisateur/panier"; 
	}
	
	//Idem pour afficher produits, etc.
	
    
	
	

	@GetMapping(value = "/appareils")
	public String displayAppareils(Model model) { //Doit envoyer à la vue la liste des appareils
		 

		//Appareils appareil = appR.findById(2);
		Produits appareil1 = pR.findByReference("app4");

		model.addAttribute("prod", appareil1);
		model.addAttribute("debug", "peu importe");//Teste la bonne liaison entre le controleur et la vue
		
		/*Iterable<Appareils> news = appR.findAll();
	    List listNews = new ArrayList();
	    listNews.add(news);
	    model.addAttribute("produits", listNews);*/
		
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
