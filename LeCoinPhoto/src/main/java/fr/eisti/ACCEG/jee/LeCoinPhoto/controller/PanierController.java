package fr.eisti.ACCEG.jee.LeCoinPhoto.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.thymeleaf.util.ArrayUtils;

import fr.eisti.ACCEG.jee.LeCoinPhoto.dao.*;
import fr.eisti.ACCEG.jee.LeCoinPhoto.model.Produits;
import fr.eisti.ACCEG.jee.LeCoinPhoto.model.Utilisateurs;

@Controller
public class PanierController {

	
	@Autowired
	UtilisateursRepository uR;
	
	@Autowired
	ProduitsRepository pR;
	
	
	@PostMapping(value = "/addToCart")
	public String addToCart(Model model, @RequestParam String ID, @RequestParam String quantite, HttpServletRequest request) {
	
		int qte=Integer.parseInt(quantite);
			
		HttpSession session = request.getSession();
		if (session.getAttribute("user")==null) { //Si on ne s'est pas connecté
			
			model.addAttribute("error", "Veuillez vous connecter");
			return "utilisateur/connexion";
		}
		Utilisateurs u=(Utilisateurs) session.getAttribute("user");
		
		String panier = u.getPanier();
		String newPanier=panier;
		
		for (int i = 0; i < qte; i++) {
			newPanier=newPanier+","+ID.trim();
		}	
		
		u.setPanier(newPanier);
		uR.save(u);
		
		return "redirect:/panier";
	}
	
	
	
	@GetMapping(value = "/panier")
	public String pagePanier(Model model, HttpServletRequest request) {

		
		HttpSession session = request.getSession();
		if (session.getAttribute("user")==null) { //Si on ne s'est pas connecté
			
			model.addAttribute("error", "Veuillez vous connecter");
			return "utilisateur/connexion";
		}	
		Utilisateurs uTmp=(Utilisateurs) session.getAttribute("user");
		int id=uTmp.getId();
		Utilisateurs u=uR.findById(id);//Sert à actualiser depuis la BDD. Sert si le panier a été modifié depuis la BDD après la dernière connexion à la session
		String panier = u.getPanier();
		
		
		
		
		
		if (panier.trim().equals("Vide")) {
			model.addAttribute("panierVide", true);
		} else { // On convertit le tableau des ID, en un tableau ayant toutes les infos du produit voulu

			String[] panierArray = panier.split(",");
			ArrayList<Produits> list = new ArrayList<Produits>();

			Map<Integer, Integer> qte = new HashMap<Integer, Integer>();// Va compter les quantités présentes dans le panier
			int tmp;
			Produits pTest = new Produits();
			
			
			
			for (int i = 1; i < panierArray.length; i++) {

				if (pR.findById(Integer.parseInt(panierArray[i].trim())) == null) { // Si produit non trouvé, on ne l'envoie pas à la vue
					/*
					 * float f=0; Produits p = new Produits("", "", "","Produit retiré de la vente", "Inconnu", f, 0); 
					 * list.add(p);
					 */
					//On ne l'affiche pas

				} else {

			
					pTest=pR.findById(Integer.parseInt(panierArray[i].trim()));

					if (qte.get(Integer.parseInt(panierArray[i].trim())) == null) {// Si c'est la 1ere fois qu'on compte cet article

						if (pTest.getStock() <= 0) {

						} // Si l'article est hors stock, tous ceux du panier seront hors stock aussi, on augmente pas le compteur (mais le produit est quand meme envoyé à la vue)
						else {
							qte.put(Integer.parseInt(panierArray[i].trim()), 1);
						}
					} 
					else {
						tmp = qte.get(Integer.parseInt(panierArray[i].trim()));
						tmp++;
						
						pTest= new Produits(pTest.getCategorie(), pTest.getImage(), pTest.getNom(), pTest.getDescription(), pTest.getPrix(), pTest.getStock());
						//Copie profonde. Sinon le changement de stock plus bas affectait tous les exemplaires du meme produit
						
						if (tmp > pTest.getStock()) {
							// Stock indisponible pour ces articles seulement
							pTest.setStock(-1); //Sera affiché hors stock par la vue (Note : N'affecte pas le stock de la BDD si on appelle pas pR.save(pTest)
						}
						qte.put(Integer.parseInt(panierArray[i].trim()), tmp);
					}

					list.add(pTest);
					
				}
			}
			
			// qte est donc un tableau qui associe un ID et le nombre de fois qu'il apparait dans le panier

			model.addAttribute("panier", list);
			model.addAttribute("nbArticles", list.size());

			if (list.size() > 1) {
				model.addAttribute("pluriel", "s");
			}
		}

		return "utilisateur/panier";
	}
	    
		
	@PostMapping(value = "/deleteProduitPanier")
	public String deleteProduitPanier(@RequestParam String id, HttpServletRequest request) throws Exception { //Appelé par Ajax

		HttpSession session = request.getSession();
		if (session.getAttribute("user")==null) { //Si on ne s'est pas connecté
			
			return "redirect:/connexion";
		}	
		Utilisateurs u=(Utilisateurs) session.getAttribute("user");
		
		
		String panier = u.getPanier();
		String[] panierArray = panier.split(",");

		if (ArrayUtils.contains(panierArray, id)) { // On supprime l'element du panier, puis on le met à jour dans la BDD

			List<String> list = new ArrayList<String>(Arrays.asList(panierArray));
			int index = list.lastIndexOf(id);
			list.remove(index);

			panierArray = list.toArray(new String[0]);
			panier = String.join(",", panierArray);

			u.setPanier(panier);
			uR.save(u);

		} else {
			//throw new Exception("Erreur : ce produit n'est pas dans votre panier"); Pour le debug
		}

		return "utilisateur/panier";
	}
	
}
