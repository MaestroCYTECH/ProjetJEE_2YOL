package fr.eisti.ACCEG.jee.LeCoinPhoto.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	
	@GetMapping(value = "/panier")
	public String pagePanier(Model model) {

		Utilisateurs u = uR.findByLogin("admin"); // PERSONNALISER : Prendre le login de la personne connectée par session
		String panier = u.getPanier();

		if (panier.trim().equals("Vide")) {
			model.addAttribute("panierVide", true);
		} else { // On convertit le tableau des references, en un tableau ayant toutes les infos du produit voulu

			String[] panierArray = panier.split(",");
			ArrayList<Produits> list = new ArrayList<Produits>();

			Map<Integer, Integer> qte = new HashMap<Integer, Integer>();// Va compter les quantités présentes dans le panier
			int tmp;

			for (int i = 1; i < panierArray.length; i++) {

				if (pR.findById(Integer.parseInt(panierArray[i].trim())) == null) { // Si produit non trouvé, on ne l'envoie pas à la vue
					/*
					 * float f=0; Produits p = new Produits("", "", "",
					 * "Produit retiré de la vente", "Inconnu", f, 0); list.add(p);
					 */
					//Choisir si on veut qd meme l'afficher en tant qu'inconnu, ou alors le supprimer automatiquement du panier/ne pas l'afficher

				} else {

					Produits pTest = new Produits();
					pTest = pR.findById(Integer.parseInt(panierArray[i].trim()));

					if (qte.get(Integer.parseInt(panierArray[i].trim())) == null) {// Si c'est la 1ere fois qu'on compte cet article

						if (pTest.getStock() <= 0) {

						} // Si l'article est hors stock, tous ceux du panier seront hors stock aussi
						else {
							qte.put(Integer.parseInt(panierArray[i].trim()), 1);
						}
					} else {
						tmp = qte.get(Integer.parseInt(panierArray[i].trim()));
						tmp++;

						if (tmp > pTest.getStock()) {
							// Stock indisponible pour ces articles seulement
							pTest.setStock(-1);
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
	public String deleteProduitPanier(@RequestParam String id) throws Exception {

		Utilisateurs u = uR.findByLogin("admin"); // PERSONNALISER : Prendre le login de la personne connectée par session
		String panier = u.getPanier();
		String[] panierArray = panier.split(",");

		if (ArrayUtils.contains(panierArray, id)) { // On supprime l'element du panier, puis on le met à jour dans la BDD

			List<String> list = new ArrayList<String>(Arrays.asList(panierArray));
			int index = list.lastIndexOf(id);
			list.remove(index);

			panierArray = list.toArray(new String[0]);
			panier = String.join(",", panierArray);

			Utilisateurs u1 = uR.findByLogin("admin");
			u1.setPanier(panier);
			uR.save(u1);

		} else {
			throw new Exception("Erreur : ce produit n'est pas dans votre panier");
		}

		return "utilisateur/panier";
	}
	
}
