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

import fr.eisti.ACCEG.jee.LeCoinPhoto.dao.*;
import fr.eisti.ACCEG.jee.LeCoinPhoto.model.*;

@Controller
public class PaiementController {

	@Autowired
	UtilisateursRepository uR;
	@Autowired
	ProduitsRepository pR;
	
	
	@GetMapping(value = "/paiement")
	public String pagePaiement(Model model, HttpServletRequest request) {
		
		
		HttpSession session = request.getSession();
		if (session.getAttribute("user")==null) { //Si on ne s'est pas connecté
			
			model.addAttribute("error", "Veuillez vous connecter");
			return "utilisateur/connexion";
		}
		Utilisateurs uTmp=(Utilisateurs) session.getAttribute("user");
		int id=uTmp.getId();
		Utilisateurs u=uR.findById(id);//Sert à actualiser depuis la BDD. Sert si le panier a été modifié depuis la BDD après la dernière connexion à la session
		
		model.addAttribute("login", u.getLogin());
		
		
    	String panier = u.getPanier();
    	float total=0;
    	
    	boolean isValid=false; //Indique si au moins un produit valide a été trouvé
    	
    	if (panier.trim().equals("Vide")) {
    		return "redirect:/panier";
    	}
    	else { //On convertit le tableau des ID, en un tableau ayant toutes les infos du produit voulu
    		
    		String[] panierArray = panier.split(",");
    		ArrayList<Produits> list = new ArrayList<Produits>();
    		
    		Map<Integer, Integer> qte = new HashMap<Integer, Integer>();// Va compter les quantités présentes dans le panier
			int tmp=0;
			Produits pTest = new Produits();//Servira à vérifier que les quantités d'un meme produit ne dépasse pas le stock total
			
			
    		
    		for (int i = 1; i < panierArray.length; i++) {
    			
    			if (pR.findById(Integer.parseInt(panierArray[i].trim())) == null) { //Si produit non trouvé, on ne l'envoie pas à la vue
  
    			}
    			else {
    				if (pR.findById(Integer.parseInt(panierArray[i].trim())).getStock()<=0 ) {
    					
    				}
    				else {
    					if (qte.get(Integer.parseInt(panierArray[i].trim())) == null) {// Si c'est la 1ere fois qu'on compte cet article
    						qte.put(Integer.parseInt(panierArray[i].trim()), 1);
    						tmp = 1;
    					}
    					else {
    						tmp = qte.get(Integer.parseInt(panierArray[i].trim()));
    						tmp++;
    						qte.put(Integer.parseInt(panierArray[i].trim()), tmp);
    					}
    					
	    					
    					pTest=pR.findById(Integer.parseInt(panierArray[i].trim()));							
						if (tmp > pTest.getStock()) {//Si il y a plus d'exemplaires dans le panier que dans le stock, on n'affiche pas les exemplaires en trop
							
						}
						else {
		
		        			list.add(pTest);				
		        			total=total+pTest.getPrix();			        				
		        			isValid=true;//Notifie qu'au moins 1 produit a un stock valide
						}	
    					
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
	
	
	
	@PostMapping(value = "/payerPanier")//PAYER, puis retourner au panier (paiement factice)
	public String payerPanier(HttpServletRequest request, Model model) throws Exception{
		
		
		HttpSession session = request.getSession();
		if (session.getAttribute("user")==null) { //Si on ne s'est pas connecté
			
			model.addAttribute("error", "Veuillez vous connecter");
			return "utilisateur/connexion";
		}
		Utilisateurs uTmp=(Utilisateurs) session.getAttribute("user");
		int id=uTmp.getId();
		Utilisateurs u=uR.findById(id);//Sert à actualiser depuis la BDD. Sert si le panier a été modifié depuis la BDD après la dernière connexion à la session
		
		
		String panier = u.getPanier();
    	String[] panierArray = panier.split(",");
    	List<String> list = new ArrayList<String>(Arrays.asList(panierArray));//Pour utiliser certaines fonctions sur la listev
    	
    	int index;
    	int stockActuel;
    	
    	//Si désiré, on pourrait insérer un vrai paiement ici
    	
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
		
		
    	u.setPanier(panier);
    	uR.save(u);
		
    	return "redirect:/panier"; //Redirige vers le controlleur gérant le panier et son affichage
	}
	
}
