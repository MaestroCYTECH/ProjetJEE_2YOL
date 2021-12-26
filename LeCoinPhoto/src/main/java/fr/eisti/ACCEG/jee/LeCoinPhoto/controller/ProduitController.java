package fr.eisti.ACCEG.jee.LeCoinPhoto.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import fr.eisti.ACCEG.jee.LeCoinPhoto.dao.ProduitsHome;
import fr.eisti.ACCEG.jee.LeCoinPhoto.model.Produits;


@Controller
public class ProduitController {

	@GetMapping(value = "/addToCart")
	public String addToCart() {//AJOUTER au panier, puis renvoyer à ce panier
		
		//..
		return "/utilisateur/panier"; 
	}
	
	//Idem pour supprimer panier, etc.
	


   /* @Autowired
    ProduitsHome produitsHome;
*/
    
}
