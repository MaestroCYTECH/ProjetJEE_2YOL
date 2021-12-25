package ING2projet.LaGuilde.dao;

import ING2projet.LaGuilde.model.Membre;
import ING2projet.LaGuilde.model.News;
import org.springframework.data.repository.CrudRepository;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public interface NewsRepository extends CrudRepository<News,String> {
    News findById(int id);

    News findByTitre(String titre);
}
