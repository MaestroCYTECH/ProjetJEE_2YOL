package fr.eisti.ACCEG.jee.LeCoinPhoto.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import fr.eisti.ACCEG.jee.LeCoinPhoto.dao.CategoriesRepository;
import fr.eisti.ACCEG.jee.LeCoinPhoto.dao.ProduitsRepository;
import fr.eisti.ACCEG.jee.LeCoinPhoto.model.Produits;

@Controller
public class AddProduitController {
	
	@Autowired
	ProduitsRepository pR;
	@Autowired
	CategoriesRepository cR;
	
	
	@GetMapping(value = "/adminFormulaireProduit")
	public String pageAjouterProduit(Model model) {
		
		
	    model.addAttribute("categories", cR.findAll());
		
		return "admin/pages/formAjouterProduit";
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
	
}
