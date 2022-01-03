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
public class UtilisateurController {

	@Autowired
	UtilisateursRepository uR;
	
	
	@GetMapping(value = "/connexion")
	public String pageConnexion(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		if (session.getAttribute("user")!=null) { //Si on s'est déjà connecté
			
			return "redirect:/profil";
		}
		
		return "utilisateur/connexion";
	}
	
	@PostMapping(value = "/userConnect")
	public String userConnect(@RequestParam String login, @RequestParam String pwd, Model model, HttpServletRequest request) {
		
		//... Créer Session. Pour l'instant en considérant que le mdp n'est pas chiffré dans la BDD
		
		HttpSession session = request.getSession();
		if (session.getAttribute("user")!=null) { //Si on s'est déjà connecté
			
			return "redirect:/profil";
		}
		
		
		Utilisateurs u=uR.findByLogin(login); //Comme le login est unique dans notre table
		if (u==null) {
			model.addAttribute("error", "Login introuvable");
			return "utilisateur/connexion";
		}
		
		String pwdTmp=u.getPwd();
		
		if (!pwdTmp.equals(pwd)) {
			model.addAttribute("error", "Login ou mot de passe erroné");
			return "utilisateur/connexion";
		}
		
		session.setAttribute("user", u);//On stocke les infos de l'utilisateur connecté. Sera utilisé à plusieurs autres endroits
		
		return "redirect:/profil"; 
	}
	
	
	@GetMapping(value = "/userDeconnect")
	public String userDeconnect(HttpServletRequest request) {
		
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute("user")==null) { //Si on ne s'est pas connecté
			
			return "redirect:/connexion";
		}

		session.removeAttribute("user");
		
		return "redirect:/"; 
	}
	   

	@GetMapping(value = "/profil")
	public String pageProfil(Model model, HttpServletRequest request) {	
		
		HttpSession session = request.getSession();
		if (session.getAttribute("user")==null) { //Si on ne s'est pas connecté
			
			model.addAttribute("error", "Veuillez vous connecter");
			return "utilisateur/connexion";
		}
		
		model.addAttribute("user", session.getAttribute("user"));
		
		return "utilisateur/profil";
	}
	
}
