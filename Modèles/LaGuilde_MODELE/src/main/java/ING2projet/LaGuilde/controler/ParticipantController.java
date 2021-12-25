package ING2projet.LaGuilde.controler;

import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;
import java.util.Queue;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ING2projet.LaGuilde.dao.EvenementRepository;
import ING2projet.LaGuilde.dao.InscriptionRepository;
import ING2projet.LaGuilde.dao.ParticipantRepository;
import ING2projet.LaGuilde.model.Evenement;
import ING2projet.LaGuilde.model.Membre;
import ING2projet.LaGuilde.model.Participants;

@Controller
public class ParticipantController {
    @Autowired
    ParticipantRepository participantRepository;
    @Autowired
    EvenementRepository evenementRepository;
    @Autowired
    InscriptionRepository membreRepository;

    @PostMapping(value = "/Events")
    public String inscrireEvent(Model model,HttpSession session, @ModelAttribute("participants")Participants participant ){
        int count=0;
        Optional<Evenement> event;// obliger pour que le code compile mais le optional n'est pas nécessaire
		if (evenementRepository.existsById(participant.getIdevent()) && membreRepository.existsById(participant.getIdmembre())){
            Iterable<Participants> participants=participantRepository.findAll();

            for (Participants particip: participants) {
                if(particip.getIdevent()==participant.getIdevent() && particip.getIdmembre()==participant.getIdmembre()){
                    model.addAttribute("resultat", "vous êtes déjà inscrit");
                    return "events";
                }
                else if(particip.getIdevent()==participant.getIdevent()){
                    count++;
                }
            }
            event=evenementRepository.findById(participant.getIdevent());
            if(event.get().getNbParticipant()!=null){
                if(count<event.get().getNbParticipant()){
                    participantRepository.save(participant);
                    model.addAttribute("resultat", "vous avez bien été inscrits");
                    return voirEvent(model, session);
                }
                else{
                    model.addAttribute("resultat", "L'événement a déjà atteint le nombre maximum d'inscrit, vous ne pourrez donc pas participer");
                    return voirEvent(model, session);
                }
            }else{
                participantRepository.save(participant);
                    model.addAttribute("resultat", "vous avez bien été inscrits");
                    return voirEvent(model, session);
            }
        }
        model.addAttribute("resultat", "l'événement n'existe pas ou vous n'etes pas connecter");
                return "Inscription";
    }


    @GetMapping(value = "/Events")
    public String voirEvent(Model model,HttpSession session){
        Integer inviter;//permettra de récuperer si la personne est déjà inscrit à un event avant d'être rajouter à eventParticipe
        Iterable<Evenement> events=evenementRepository.findAll();
        List<Evenement> eventUtil=  new ArrayList<Evenement>();
        Queue<Integer> eventParticipe= new LinkedList<Integer>(); 
        for (Evenement evenement : events) {
            if(!session.isNew()){
                Iterable<Participants> participe=participantRepository.findAllByIdmembre((Integer)session.getAttribute("id"));//impossible de mieux le placer
                if( evenement.getVisible()==1 && (evenement.getDate().after(new Date()) && (int)session.getAttribute("statutCo")<=3)){
                    eventUtil.add(evenement);
                    inviter=0;
                    for (Participants particip: participe) {
                        if(particip.getIdevent()==evenement.getId()){//si on a l'égalité le membre s'est déjà inscrit
                            inviter=1;
                            break;
                        }
                    }
                    eventParticipe.add(inviter);
                }
                else if(evenement.getVisible()==0 && (evenement.getDate().after(new Date()))){
                    eventUtil.add(evenement);
                    inviter=0;
                    for (Participants particip: participe) {
                        if(particip.getIdevent()==evenement.getId()){
                            inviter=1;
                            break;
                        }
                    }
                    eventParticipe.add(inviter);
                    
                }
                
            }
            else if((evenement.getDate().after(new Date())) && evenement.getVisible()==0){
                eventUtil.add(evenement);   
            }
            
        }
        model.addAttribute("events", eventUtil);
        model.addAttribute("participe", eventParticipe);
        
        return "events";
    }

    @PostMapping(value="/creerEvent")
    public String evenementCreer(HttpSession session,Model model, @ModelAttribute("evenement")Evenement event ){
        String resultat=new String();
        model.addAttribute("resultat", resultat);
        if(event.getDate()==null || event.getTitre()==null || (Integer)event.getVisible()==null){
            resultat="Veuillez remplir les champs obligatoires";
            model.addAttribute("resultat", resultat);
            return"create_events";
        }
        else if(event.getDate().before(new Date())){
            resultat="la date ne doit pas être passée";
            model.addAttribute("resultat", resultat);
            return "create_events";
        }
        else if (event.getVisible()!=0 && event.getVisible()!=1 ){
            resultat="vous devez annoncer si l'evenement est pour les cotisants ou non";
            model.addAttribute("resultat", resultat);
            return "create_events";

        }
        else{
            evenementRepository.save(event);
            resultat="Votre événement a bien été créée";
            model.addAttribute("resultat", resultat);
            return voirEvent(model, session);
        }

    }
 

    @GetMapping(value = "/admin_events")
    public String visualiserEvents(Model model,HttpSession session){

        if(session.getAttribute("statutCo")==null){//verification du droit à l'acces
            String erreur="veuillez vous connecter";
            model.addAttribute("erreur", erreur);
            return("inscription");
        }
        else if((int)session.getAttribute("statutCo")>2){
            return("/index");
        }
        else{//debut du code de la page
            Iterable<Evenement> events=evenementRepository.findAll();
            List<Evenement> eventUtile= new ArrayList<Evenement>();
            for (Evenement evenement : events) {
                if(evenement.getDate().after(new Date())){
                    eventUtile.add(evenement);
                }
            }
            model.addAttribute("events", eventUtile);
            return("admin_events");
        }
    }
    @GetMapping(value="admin_event/{id}")
    public String voirunEvent(Model model,HttpSession session,@PathVariable int id){
        Optional<Evenement> event;
        List<Membre> inscritEvent=new ArrayList<Membre>();
        if(session.getAttribute("statutCo")==null){//verification du droit à l'acces
            String erreur="veuillez vous connecter";
            model.addAttribute("erreur", erreur);
            return("inscription");
        }
        else if((int)session.getAttribute("statutCo")>2){
            return("/index");
        }
        else{
            event=evenementRepository.findById(id);
            if(event.isEmpty()){
                return "/index";
            }
            else{
                model.addAttribute("event", event.get());
                Iterable<Participants> participants=participantRepository.findAllByIdevent(id);
                
                for (Participants participant : participants) {
                    inscritEvent.add(membreRepository.findByid(participant.getIdmembre()));
                }
                model.addAttribute("inscrits", inscritEvent);
                return("admin_event");//et pas admin_events
            }
        }
            
    }
    @PostMapping(value="admin_event/{id}")
    public String supprimer(Model model,HttpSession session,@PathVariable int id, @RequestParam("supprimer") int supprimer){
        Iterable<Participants> participants;
        if(session.getAttribute("statutCo")==null){//verification du droit à l'acces
            String erreur="veuillez vous connecter";
            model.addAttribute("erreur", erreur);
            return("inscription");
        }
        else if((int)session.getAttribute("statutCo")>2){
            return("/index");
        }
        else{
            participants=participantRepository.findAllByIdevent(id);
            for (Participants participant : participants) {
                if(participant.getIdmembre()==supprimer){
                    participantRepository.delete(participant);
                    break;
                }
            }
            return voirunEvent(model, session, id);
        }

    }
}
