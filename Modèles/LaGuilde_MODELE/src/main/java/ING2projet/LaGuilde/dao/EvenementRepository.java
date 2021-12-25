package ING2projet.LaGuilde.dao;

import org.springframework.data.repository.CrudRepository;
import ING2projet.LaGuilde.model.Evenement;

public interface EvenementRepository extends CrudRepository<Evenement,Integer>{
    public Evenement findByTitre(String titre);
    
}
