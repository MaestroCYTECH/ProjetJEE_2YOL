package ING2projet.LaGuilde.controler;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ING2projet.LaGuilde.dao.InscriptionRepository;
import ING2projet.LaGuilde.model.Membre;

@Controller
public class admin_membresControler {

    @Autowired
    private InscriptionRepository inscriptionRepository;

    @GetMapping(value= "/admin_membres")
    public String chargerAccueil(Model model) {
        model.addAttribute("erreurs", new HashMap<String, String>());


        /*Récupération et classement par nom des différents membres de l'association en fonction de leur statut*/
        List<Membre> ListePresidents = inscriptionRepository.findBystatut(0);
        ListePresidents.sort(Comparator.comparing(t -> t.getNom()));

        List<Membre> ListeElus = inscriptionRepository.findBystatut(1);
        ListeElus.sort(Comparator.comparing(t -> t.getNom()));

        List<Membre> ListeBureaux = inscriptionRepository.findBystatut(2);
        ListeBureaux.sort(Comparator.comparing(t -> t.getNom()));

        List<Membre> ListeAdherants = inscriptionRepository.findBystatut(3);
        ListeAdherants.sort(Comparator.comparing(t -> t.getNom()));

        List<Membre> ListeMembres = inscriptionRepository.findBystatut(4);
        ListeMembres.sort(Comparator.comparing(t -> t.getNom()));

        List<Membre> ListeAttente = inscriptionRepository.findBystatut(5);
        ListeAttente.sort(Comparator.comparing(t -> t.getNom()));


        /*Passage des listes au model*/
        model.addAttribute("ListePresidents", ListePresidents);
        model.addAttribute("ListeElus", ListeElus);
        model.addAttribute("ListeBureaux", ListeBureaux);
        model.addAttribute("ListeAdherants", ListeAdherants);
        model.addAttribute("ListeMembres", ListeMembres);
        model.addAttribute("ListeAttente", ListeAttente);
        
        return "admin_membres";
    }

    /*Pour promouvoir un membre*/
    @PostMapping(value="/promouvoir")
    public String promouvoir(HttpSession session, Model model, @RequestParam("membre") String email){

        Membre membre = inscriptionRepository.findByemail(email);
        int statut = membre.getStatut();
        membre.setStatut(statut-1);

        
        inscriptionRepository.save(membre);



        /*Récupération et classement par nom des différents membres de l'association en fonction de leur statut*/
        List<Membre> ListePresidents = inscriptionRepository.findBystatut(0);
        ListePresidents.sort(Comparator.comparing(t -> t.getNom()));

        List<Membre> ListeElus = inscriptionRepository.findBystatut(1);
        ListeElus.sort(Comparator.comparing(t -> t.getNom()));

        List<Membre> ListeBureaux = inscriptionRepository.findBystatut(2);
        ListeBureaux.sort(Comparator.comparing(t -> t.getNom()));

        List<Membre> ListeAdherants = inscriptionRepository.findBystatut(3);
        ListeAdherants.sort(Comparator.comparing(t -> t.getNom()));

        List<Membre> ListeMembres = inscriptionRepository.findBystatut(4);
        ListeMembres.sort(Comparator.comparing(t -> t.getNom()));

        List<Membre> ListeAttente = inscriptionRepository.findBystatut(5);
        ListeAttente.sort(Comparator.comparing(t -> t.getNom()));


        /*Passage des listes au model*/
        model.addAttribute("ListePresidents", ListePresidents);
        model.addAttribute("ListeElus", ListeElus);
        model.addAttribute("ListeBureaux", ListeBureaux);
        model.addAttribute("ListeAdherants", ListeAdherants);
        model.addAttribute("ListeMembres", ListeMembres);
        model.addAttribute("ListeAttente", ListeAttente);
        
        return "admin_membres";
    }


    /*Pour baisser le rang d'un membre*/
    @PostMapping(value="/degrader")
    public String degrader(HttpSession session, Model model, @RequestParam("membre") String email){

        Membre membre = inscriptionRepository.findByemail(email);
        int statut = membre.getStatut();
        membre.setStatut(statut+1);

        
        inscriptionRepository.save(membre);



        /*Récupération et classement par nom des différents membres de l'association en fonction de leur statut*/
        List<Membre> ListePresidents = inscriptionRepository.findBystatut(0);
        ListePresidents.sort(Comparator.comparing(t -> t.getNom()));

        List<Membre> ListeElus = inscriptionRepository.findBystatut(1);
        ListeElus.sort(Comparator.comparing(t -> t.getNom()));

        List<Membre> ListeBureaux = inscriptionRepository.findBystatut(2);
        ListeBureaux.sort(Comparator.comparing(t -> t.getNom()));

        List<Membre> ListeAdherants = inscriptionRepository.findBystatut(3);
        ListeAdherants.sort(Comparator.comparing(t -> t.getNom()));

        List<Membre> ListeMembres = inscriptionRepository.findBystatut(4);
        ListeMembres.sort(Comparator.comparing(t -> t.getNom()));

        List<Membre> ListeAttente = inscriptionRepository.findBystatut(5);
        ListeAttente.sort(Comparator.comparing(t -> t.getNom()));


        /*Passage des listes au model*/
        model.addAttribute("ListePresidents", ListePresidents);
        model.addAttribute("ListeElus", ListeElus);
        model.addAttribute("ListeBureaux", ListeBureaux);
        model.addAttribute("ListeAdherants", ListeAdherants);
        model.addAttribute("ListeMembres", ListeMembres);
        model.addAttribute("ListeAttente", ListeAttente);
        
        return "admin_membres";
    }

    /*Pour bloquer une adresse mail*/
    @PostMapping(value="/bloquer")
    public String bloquer(HttpSession session, Model model, @RequestParam("membre") String email){

        Membre membre = inscriptionRepository.findByemail(email);
        membre.setStatut(10);

        
        inscriptionRepository.save(membre);



        /*Récupération et classement par nom des différents membres de l'association en fonction de leur statut*/
        List<Membre> ListePresidents = inscriptionRepository.findBystatut(0);
        ListePresidents.sort(Comparator.comparing(t -> t.getNom()));

        List<Membre> ListeElus = inscriptionRepository.findBystatut(1);
        ListeElus.sort(Comparator.comparing(t -> t.getNom()));

        List<Membre> ListeBureaux = inscriptionRepository.findBystatut(2);
        ListeBureaux.sort(Comparator.comparing(t -> t.getNom()));

        List<Membre> ListeAdherants = inscriptionRepository.findBystatut(3);
        ListeAdherants.sort(Comparator.comparing(t -> t.getNom()));

        List<Membre> ListeMembres = inscriptionRepository.findBystatut(4);
        ListeMembres.sort(Comparator.comparing(t -> t.getNom()));

        List<Membre> ListeAttente = inscriptionRepository.findBystatut(5);
        ListeAttente.sort(Comparator.comparing(t -> t.getNom()));


        /*Passage des listes au model*/
        model.addAttribute("ListePresidents", ListePresidents);
        model.addAttribute("ListeElus", ListeElus);
        model.addAttribute("ListeBureaux", ListeBureaux);
        model.addAttribute("ListeAdherants", ListeAdherants);
        model.addAttribute("ListeMembres", ListeMembres);
        model.addAttribute("ListeAttente", ListeAttente);
        
        return "admin_membres";
    }

    /*Pour supprimer un compte*/
    @PostMapping(value="/supprimer")
    public String supprimer(HttpSession session, Model model, @RequestParam("membre") String email){

        Membre membre = inscriptionRepository.findByemail(email);

        
        inscriptionRepository.delete(membre);



        /*Récupération et classement par nom des différents membres de l'association en fonction de leur statut*/
        List<Membre> ListePresidents = inscriptionRepository.findBystatut(0);
        ListePresidents.sort(Comparator.comparing(t -> t.getNom()));

        List<Membre> ListeElus = inscriptionRepository.findBystatut(1);
        ListeElus.sort(Comparator.comparing(t -> t.getNom()));

        List<Membre> ListeBureaux = inscriptionRepository.findBystatut(2);
        ListeBureaux.sort(Comparator.comparing(t -> t.getNom()));

        List<Membre> ListeAdherants = inscriptionRepository.findBystatut(3);
        ListeAdherants.sort(Comparator.comparing(t -> t.getNom()));

        List<Membre> ListeMembres = inscriptionRepository.findBystatut(4);
        ListeMembres.sort(Comparator.comparing(t -> t.getNom()));

        List<Membre> ListeAttente = inscriptionRepository.findBystatut(5);
        ListeAttente.sort(Comparator.comparing(t -> t.getNom()));


        /*Passage des listes au model*/
        model.addAttribute("ListePresidents", ListePresidents);
        model.addAttribute("ListeElus", ListeElus);
        model.addAttribute("ListeBureaux", ListeBureaux);
        model.addAttribute("ListeAdherants", ListeAdherants);
        model.addAttribute("ListeMembres", ListeMembres);
        model.addAttribute("ListeAttente", ListeAttente);
        
        return "admin_membres";
    }
    
}