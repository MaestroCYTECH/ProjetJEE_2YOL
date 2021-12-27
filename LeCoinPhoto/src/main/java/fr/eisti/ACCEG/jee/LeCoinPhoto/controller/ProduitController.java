package fr.eisti.ACCEG.jee.LeCoinPhoto.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import fr.eisti.ACCEG.jee.LeCoinPhoto.dao.ProduitsRepository;
import fr.eisti.ACCEG.jee.LeCoinPhoto.model.Produits;


@Controller
public class ProduitController {

	@Autowired
	ProduitsRepository pR;
	 
	 
	@GetMapping(value = "/addToCart")
	public String addToCart() {//AJOUTER au panier, puis renvoyer à ce panier
		
		//..
		return "/utilisateur/panier"; 
	}
	
	//Idem pour afficher produits, etc.
	
    
	
	

	@GetMapping(value = "/appareils")
	public String displayAppareils(Model model) { //Doit envoyer à la vue la liste des appareils
		
		// Iterable<Produits> appareils = pR.findAll(); //Si on veut tous les produits
		 

		//Produits appareils = pR.findById(2);
		Produits produit1 = pR.findByReference("app4");

		model.addAttribute("prod", produit1);
		model.addAttribute("debug", "peu importe");//Teste la bonne liaison entre le controleur et la vue
		
		/*Iterable<Produits> news = pR.findAll();
	    List listNews = new ArrayList();
	    listNews.add(news);
	    model.addAttribute("produits", listNews);*/
		
		//model.addAttribute("produits", pR.findAll());
		
		return "produit/appareils";
	}
}
