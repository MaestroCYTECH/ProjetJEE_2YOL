package fr.eisti.ACCEG.jee.LeCoinPhoto.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import fr.eisti.ACCEG.jee.LeCoinPhoto.dao.CategoriesRepository;
import fr.eisti.ACCEG.jee.LeCoinPhoto.dao.ProduitsRepository;
import fr.eisti.ACCEG.jee.LeCoinPhoto.model.Produits;
import fr.eisti.ACCEG.jee.LeCoinPhoto.model.Utilisateurs;

@Controller
public class AddProduitController {
	
	@Autowired
	ProduitsRepository pR;
	@Autowired
	CategoriesRepository cR;
	
	
	@GetMapping(value = "/adminFormulaireProduit")
	public String pageAjouterProduit(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		if (session.getAttribute("user")==null) { //Si on ne s'est pas connecté
			
			return "redirect:/connexion";
		}
		Utilisateurs u= (Utilisateurs) session.getAttribute("user");
		if ( !u.getStatut().equals("admin") ) { //L'accès à la section Admin est reservée aux admins
			
			return "redirect:/profil";
		}
		
		
		
	    model.addAttribute("categories", cR.findAll());
	    model.addAttribute("produits", pR.findAll());
		
		return "admin/pages/formAjouterProduit";
	}
	
	

	@PostMapping(value = "/adminAddProduit")
	public String addProduit(@ModelAttribute(name = "Produit") Produits p, Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		if (session.getAttribute("user")==null) { //Si on ne s'est pas connecté
			
			return "redirect:/connexion";
		}
		Utilisateurs u= (Utilisateurs) session.getAttribute("user");
		if ( !u.getStatut().equals("admin") ) { //L'accès à la section Admin est reservée aux admins
			
			return "redirect:/profil";
		}
		
		
		try {
			pR.save(p);
			model.addAttribute("success", "Ajout réussi");
		} catch (Exception e) {
			model.addAttribute("fail", "Erreur lors de l'ajout : "+e.getMessage());
		}		
		
		return "admin/pages/formAjouterProduit";
	}
	
}
