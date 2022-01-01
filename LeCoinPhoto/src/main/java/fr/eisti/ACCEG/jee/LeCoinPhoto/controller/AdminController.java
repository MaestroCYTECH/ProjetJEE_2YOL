package fr.eisti.ACCEG.jee.LeCoinPhoto.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fr.eisti.ACCEG.jee.LeCoinPhoto.dao.*;
import fr.eisti.ACCEG.jee.LeCoinPhoto.model.*;


@Controller
public class AdminController {

	
	@Autowired
	ProduitsRepository pR;
	
	@Autowired
	CategoriesRepository cR;
	
	
	@GetMapping(value = "/adminHome")
	public String accueilAdmin() {
		return "admin/secured";
	}
	
	
	@GetMapping(value = "/adminFormulaireProduit")
	public String pageAjouterProduit(Model model) {
		
		
	    model.addAttribute("categories", cR.findAll());
		
		return "admin/pages/formAjouterProduit";
	}
	
	@GetMapping(value = "/adminListe") //Rajouter le parametre catégorie.
	public String pageListeProduits() {
		return "admin/pages/liste";
	}
	
	
	@PostMapping(value = "/adminDeleteProduit")
	public String deleteProduit(@RequestParam String id, Model model) {
		
		//... Doit récuperer la référence (ou l'ID) du produit puis le supprimer de la BDD	
		
		try {
			pR.deleteById(Integer.parseInt(id.trim()));
			model.addAttribute("error", "PRODUIT SUPPRIMÉ");
		} catch (Exception e) {
			model.addAttribute("error", e.getMessage());
		}		
		
		return "redirect:/adminListe";
		//return "admin/pages/liste";
	}
	
	
	@PostMapping(value = "/adminAddProduit")
	public String addProduit(@ModelAttribute(name = "Produit") Produits p, Model model) {
		
		//... Verif des données
		
		
		Produits pTest = pR.findByNom(p.getNom());
		if (pTest==null) { //Si nom libre
						
			pR.save(p);
			model.addAttribute("success", true);
			
			
			//Rajouter ligne pour catch une exception
		}
		else {
			model.addAttribute("dejaPris", true);
		}
		
		return "admin/pages/formAjouterProduit";
	}
	
	
	@PostMapping(value = "/adminAddStock")
	public String addStock() {
		
		//...
		
		
		return "admin/pages/liste";
	}
	
	
}
