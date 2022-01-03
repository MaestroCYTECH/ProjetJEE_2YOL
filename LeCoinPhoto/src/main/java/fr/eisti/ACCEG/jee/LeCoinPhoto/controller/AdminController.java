package fr.eisti.ACCEG.jee.LeCoinPhoto.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public String accueilAdmin(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		if (session.getAttribute("user")==null) { //Si on ne s'est pas connecté
			
			return "redirect:/connexion";
		}
		Utilisateurs u= (Utilisateurs) session.getAttribute("user");
		if ( !u.getStatut().equals("admin") ) { //L'accès à la section Admin est reservée aux admins
			
			return "redirect:/profil";
		}
		
		model.addAttribute("cat", cR.findAll());
		
		return "admin/secured";
	}
	
	
	
	@GetMapping(value = "/adminListe")
	public String pageListeProduits(@RequestParam String cat, Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		if (session.getAttribute("user")==null) { //Si on ne s'est pas connecté
			
			return "redirect:/connexion";
		}
		Utilisateurs u= (Utilisateurs) session.getAttribute("user");
		if ( !u.getStatut().equals("admin") ) { //L'accès à la section Admin est reservée aux statuts admin
			
			return "redirect:/profil";
		}
		
		
		
		if (!cat.equals("appareils") && !cat.equals("objectifs") && !cat.equals("accessoires")) {
			return "redirect:/adminHome";
		}
		
		model.addAttribute("produits", pR.findByCategorie(cat));
		model.addAttribute("cat", cat);
		
		return "admin/pages/liste";
	}
	
	
	@PostMapping(value = "/adminDeleteProduit")
	public String deleteProduit(@RequestParam String id, @RequestParam String cat, Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		if (session.getAttribute("user")==null) { //Si on ne s'est pas connecté
			
			return "redirect:/connexion";
		}
		Utilisateurs u= (Utilisateurs) session.getAttribute("user");
		if ( !u.getStatut().equals("admin") ) { //L'accès à la section Admin est reservée aux admins
			
			return "redirect:/profil";
		}
		
		
		
		try {
			pR.deleteById(Integer.parseInt(id.trim()));
			model.addAttribute("error", "PRODUIT SUPPRIMÉ");
		} catch (Exception e) {
			model.addAttribute("error", e.getMessage());
		}		
		
		return "redirect:/adminListe?cat="+cat;
	}
	
	
	
	@PostMapping(value = "/adminAddStock")
	public String addStock(@RequestParam String id, @RequestParam String cat, @RequestParam String quantite, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		if (session.getAttribute("user")==null) { //Si on ne s'est pas connecté
			
			return "redirect:/connexion";
		}
		Utilisateurs u= (Utilisateurs) session.getAttribute("user");
		if ( !u.getStatut().equals("admin") ) { //L'accès à la section Admin est reservée aux admins
			
			return "redirect:/profil";
		}
		
		
		
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
