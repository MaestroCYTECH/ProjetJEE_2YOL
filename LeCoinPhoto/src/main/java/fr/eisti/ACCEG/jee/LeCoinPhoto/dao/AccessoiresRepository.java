package fr.eisti.ACCEG.jee.LeCoinPhoto.dao;


import org.springframework.data.repository.CrudRepository;
import fr.eisti.ACCEG.jee.LeCoinPhoto.model.Accessoires;


public interface AccessoiresRepository extends CrudRepository<Accessoires,Integer> {
	
	Accessoires findById(int id);
	
	Accessoires findByReference(String ref);
}
