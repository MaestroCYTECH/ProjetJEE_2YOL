package ING2projet.LaGuilde.controler;

import ING2projet.LaGuilde.dao.NewsRepository;
import ING2projet.LaGuilde.model.ImageStore;
import ING2projet.LaGuilde.model.News;
import ING2projet.LaGuilde.storage.StorageProperties;
import ING2projet.LaGuilde.storage.StorageService;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;

@Controller
public class ManageNewsControler {

    private final int NB_NEWS = 5;

    @Autowired
    NewsRepository newsRepository;

    @GetMapping(value = "/Management-Actualité")

    public String manageNews(Model model) {

        model.addAttribute("erreurs", new HashMap<String, String>());

        Iterable news = newsRepository.findAll();
        List listNews = Lists.newArrayList(news);

        model.addAttribute("news", news);

        return "manageNews";
    }

    @PostMapping(value = "/Management-Actualité")
    public String deleteNews(Model model, @RequestParam("id") int id) {

        newsRepository.delete(newsRepository.findById(id));
        // model.addAttribute("id", id);
        model.addAttribute("erreurs", new HashMap<String, String>());

        Iterable<News> listNews = newsRepository.findAll();

        model.addAttribute("news", listNews);

        return "manageNews";
    }
}
