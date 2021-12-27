package fr.eisti.ACCEG.jee.LeCoinPhoto.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class AdminController {

	
	@GetMapping(value = "/adminHome")
	public String accueilAdmin() {
		return "admin/secured";
	}
	
	
	@GetMapping(value = "/adminFormulaireProduit")
	public String pageAjouterProduit() {
		return "admin/pages/formAjouterProduit";
	}
	
	@GetMapping(value = "/adminListe") //Rajouter le parametre catégorie.
	public String pageListeProduits() {
		return "admin/pages/liste";
	}
	
	
	@PostMapping(value = "/adminDeleteProduit")
	public String deleteProduit() {
		
		//... Doit récuperer la référence (ou l'ID) du produit puis le supprimer de la BDD
		
		return "admin/pages/liste";
	}
	
	@PostMapping(value = "/adminAddProduit")
	public String addProduit(Model model) {
		
		//...
		
		if (true==true) {
			model.addAttribute("success", true);//On notifie à l'utilisateur que ça c'est bien passé
		}
		else {
			model.addAttribute("fail", true);
		}
		
		return "admin/pages/formAjouterProduit";
	}
	
	
	@PostMapping(value = "/adminAddStock")
	public String addStock() {
		
		//...
		
		
		return "admin/pages/liste";
	}
	
	
}
