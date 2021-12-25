package ING2projet.LaGuilde.controler;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import ING2projet.LaGuilde.dao.EvenementRepository;

@Controller
public class EventController {
    @Autowired
    EvenementRepository evenementRepository;

    @GetMapping(value = "/create_events")
    public String creerEvenement(HttpSession session, Model model) {

        if (session.getAttribute("statutCo") == null) {
            String erreur = "veuillez vous connecter";
            model.addAttribute("erreur", erreur);
            return ("inscription");
        } else if ((int) session.getAttribute("statutCo") <= 2) { // nécessite confirmation
            return ("create_events");
        } else {
            return ("/index");
        }
    }

}
