package fr.eisti.ACCEG.jee.LeCoinPhoto.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	public String accueilAdmin(Model model) {
		
		model.addAttribute("cat", cR.findAll());
		
		return "admin/secured";
	}
	
	
	@GetMapping(value = "/adminListe")
	public String pageListeProduits(@RequestParam String cat, Model model) {
		
		if (!cat.equals("appareils") && !cat.equals("objectifs") && !cat.equals("accessoires")) {
			return "redirect:/adminHome";
		}
		
		model.addAttribute("produits", pR.findByCategorie(cat));
		model.addAttribute("cat", cat);
		
		return "admin/pages/liste";
	}
	
	
	@PostMapping(value = "/adminDeleteProduit")
	public String deleteProduit(@RequestParam String id, @RequestParam String cat, Model model) {
		
		//... Doit récuperer la référence (ou l'ID) du produit puis le supprimer de la BDD	
		
		try {
			pR.deleteById(Integer.parseInt(id.trim()));
			model.addAttribute("error", "PRODUIT SUPPRIMÉ");
		} catch (Exception e) {
			model.addAttribute("error", e.getMessage());
		}		
		
		return "redirect:/adminListe?cat="+cat;
	}
	
	
	
	@PostMapping(value = "/adminAddStock")
	public String addStock(@RequestParam String id, @RequestParam String cat, @RequestParam String quantite) {
		
		
		int n=Integer.parseInt(id.trim());
		int qte=Integer.parseInt(quantite.trim());

		if (qte>0){
			int newQte=pR.findById(n).getStock()+qte;
	    	
			Produits pTmp=pR.findById(n);
			pTmp.setStock(newQte);
			pR.save(pTmp);
		}
		
		return "redirect:/adminListe?cat="+cat;
	}
}
