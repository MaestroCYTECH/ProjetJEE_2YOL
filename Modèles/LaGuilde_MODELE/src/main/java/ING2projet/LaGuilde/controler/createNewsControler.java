package ING2projet.LaGuilde.controler;

import ING2projet.LaGuilde.dao.InscriptionRepository;
import ING2projet.LaGuilde.dao.NewsRepository;
import ING2projet.LaGuilde.model.ImageStore;
import ING2projet.LaGuilde.storage.StorageProperties;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;
import ING2projet.LaGuilde.model.Membre;
import ING2projet.LaGuilde.model.News;
import ING2projet.LaGuilde.storage.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.awt.*;
import java.nio.file.Path;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Controller
public class createNewsControler {

    @Autowired
    NewsRepository newsRepository;
    StorageService storageService;

    public createNewsControler(StorageService storageService) {
        this.storageService = new ImageStore(new StorageProperties());
    }

    @GetMapping(value = "/CreationActualité")
    public String chargerAccueil(Model model) {
        model.addAttribute("erreurs", new HashMap<String, String>());

        // file
        /*
         * model.addAttribute("files", storageService.loadAll().map( path ->
         * MvcUriComponentsBuilder.fromMethodName(createNewsControler.class,
         * "serveFile", path.getFileName().toString()).build().toUri().toString())
         * .collect(Collectors.toList()));
         */
        return "createNews";
    }

    // file
    /*
     * @GetMapping("/files/{filename:.+}")
     * 
     * @ResponseBody public ResponseEntity<Resource> serveFile(@PathVariable String
     * filename) {
     * 
     * Resource file = storageService.loadAsResource(filename); return
     * ResponseEntity.ok().header(HttpHeaders.CONTENT_DISPOSITION,
     * "attachment; filename=\"" + file.getFilename() + "\"").body(file); }
     */

    @PostMapping(value = "/CreationActualité", produces = MediaType.APPLICATION_JSON_VALUE)
    public String ajouterNews(@RequestParam("image") MultipartFile file, HttpSession session, Model model,
            @ModelAttribute("news") News news) {
        Map erreurs = new HashMap<String, String>();
        // file
        news.setImage(file.getOriginalFilename());
        news.setDate(new Date());
        storageService.store(file);
        newsRepository.save(news);

        // model.addAttribute("file", file);
        /* session.setAttribute("dis", discipline); */

        /*
         * Iterable<Discipline> disciplines = disciplineRepository.findAll(); Discipline
         * d = disciplineRepository.findBynom("Splatoon 2");
         */

        /*
         * model.addAttribute("liste", disciplines); model.addAttribute("discipline",
         * d);
         */

        // file

        model.addAttribute("erreurs", erreurs);
        model.addAttribute("discipline", "0");
        return "index";
    }

}
