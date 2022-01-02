package fr.eisti.ACCEG.jee.LeCoinPhoto.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import fr.eisti.ACCEG.jee.LeCoinPhoto.dao.*;
import fr.eisti.ACCEG.jee.LeCoinPhoto.model.*;

@Controller
public class PaiementController {

	@Autowired
	UtilisateursRepository uR;
	
	@Autowired
	ProduitsRepository pR;
	
	
	@GetMapping(value = "/paiement")
	public String pagePaiement(Model model) {
		
		model.addAttribute("login", "admin");
		Utilisateurs u=uR.findByLogin("admin"); //PERSONNALISER : Prendre le login de la personne connectée par session 
		
    	String panier = u.getPanier();
    	float total=0;
    	
    	boolean isValid=false;
    	
    	if (panier.trim().equals("Vide")) {
    		return "redirect:/panier";
    	}
    	else { //On convertit le tableau des references, en un tableau ayant toutes les infos du produit voulu
    		
    		String[] panierArray = panier.split(",");
    		ArrayList<Produits> list = new ArrayList<Produits>();
    		
    		for (int i = 1; i < panierArray.length; i++) {
    			
    			if (pR.findById(Integer.parseInt(panierArray[i].trim())) == null) { //Si produit non trouvé, on ne l'envoie pas à la vue
  
    			}
    			else {
    				if (pR.findById(Integer.parseInt(panierArray[i].trim())).getStock()<=0 ) {
    					
    				}
    				else {
    					Produits uTmp=pR.findById(Integer.parseInt(panierArray[i].trim()));
        				list.add(uTmp);
        				total=total+uTmp.getPrix();	
        				
        				isValid=true;//Notifie qu'au moins 1 produit a un stock valide
    				}			
    			}			
			}
    		
    		if (!isValid) {
    			return "redirect:/panier";
    		}
    		
    		model.addAttribute("panier", list);	
    		model.addAttribute("total", total);
    	}
		
		return "utilisateur/paiement";
	}
	
	@PostMapping(value = "/payerPanier")//PAYER, puis retourner au panier (ou autre, à decider)
	public String payerPanier() throws Exception{//VIDER PANIER acheté+ MAJ Stocks, puis retourner au panier (ou autre, à decider)
		
		
		Utilisateurs u=uR.findByLogin("admin"); //PERSONNALISER : Prendre le login de la personne connectée par session
		String panier = u.getPanier();
    	String[] panierArray = panier.split(",");
    	List<String> list = new ArrayList<String>(Arrays.asList(panierArray));//Pour utiliser certaines fonctions
    	
    	int index;
    	int stockActuel;
    	
    	for (String entry : panierArray) {
    		
    		if (!(entry.trim().equals("Vide"))) {
    			
    			if(pR.findById(Integer.parseInt(entry.trim()))!= null) {
    				
    				if(pR.findById(Integer.parseInt(entry.trim())).getStock()<=0) {
    					//On le laisse dans le panier
    				}
    				else {
    					//Si le produit est éligible à un achat
        				
        	    		index=list.lastIndexOf(entry);
        	    		list.remove(index);	 
        	    		
        	    		//On met à jour le stock 1 par 1 pour qu'il détecte si le stock n'est plus suffisant
        	        	
        	        	stockActuel=pR.findById(Integer.parseInt(entry.trim())).getStock();
        	        	pR.findById(Integer.parseInt(entry.trim())).setStock(stockActuel-1);
    				}
    				   	
        		}
        		else { //On fait rien
            		//throw new Exception("Erreur : ce produit n'est pas dans votre panier"); Pour le debug
            	}   			
    		}					
    	}   	
    	
    	panierArray = list.toArray(new String[0]);
		panier = String.join(",", panierArray);
		
		Utilisateurs u1=uR.findByLogin("admin");
    	u1.setPanier(panier);
    	uR.save(u1);
		
    	return "redirect:/panier"; //Redirige vers le controlleur gérant le panier et son affichage
	}
	
}