package ING2projet.LaGuilde.controler;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import ING2projet.LaGuilde.dao.InscriptionRepository;
import ING2projet.LaGuilde.dao.NewsRepository;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
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
//import org.thymeleaf.expression.Lists;
import com.google.common.collect.Lists;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import java.util.HashMap;

@Controller
public class DisplayNews {

    private final int NB_NEWS = 5;

    @Autowired
    NewsRepository newsRepository;

    @GetMapping(value = "/Actualité")
    public String displayNews(Model model) {

        model.addAttribute("erreurs", new HashMap<String, String>());

        Iterable<News> news = newsRepository.findAll();
        List listNews = Lists.newArrayList(news);

        model.addAttribute("news", news);

        return "displayNews";
    }
}
