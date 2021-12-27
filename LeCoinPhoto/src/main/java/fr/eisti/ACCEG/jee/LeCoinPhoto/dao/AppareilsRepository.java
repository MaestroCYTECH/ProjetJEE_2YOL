package fr.eisti.ACCEG.jee.LeCoinPhoto.dao;


import org.springframework.data.repository.CrudRepository;
import fr.eisti.ACCEG.jee.LeCoinPhoto.model.Appareils;


public interface AppareilsRepository extends CrudRepository<Appareils,Integer> {
	Appareils findById(int id);
	
	Appareils findByReference(String ref);
}
