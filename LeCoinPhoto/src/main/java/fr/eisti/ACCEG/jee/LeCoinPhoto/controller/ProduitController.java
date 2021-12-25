package fr.eisti.ACCEG.jee.LeCoinPhoto.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class ProduitController {

	@GetMapping(value = "/addToCart")
	public String addToCart() {//AJOUTER au panier, puis renvoyer à ce panier
		
		//..
		return "/utilisateur/panier"; 
	}
	
	//Idem pour supprimer panier, etc.
}
