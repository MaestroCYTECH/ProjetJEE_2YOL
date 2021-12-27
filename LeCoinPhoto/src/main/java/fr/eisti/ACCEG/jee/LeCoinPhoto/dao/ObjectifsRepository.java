package fr.eisti.ACCEG.jee.LeCoinPhoto.dao;


import org.springframework.data.repository.CrudRepository;
import fr.eisti.ACCEG.jee.LeCoinPhoto.model.Objectifs;


public interface ObjectifsRepository extends CrudRepository<Objectifs,Integer> {
	
	Objectifs findById(int id);
	
	Objectifs findByReference(String ref);
}
