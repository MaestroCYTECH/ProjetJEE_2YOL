package fr.eisti.ACCEG.jee.LeCoinPhoto.dao;


import org.springframework.data.repository.CrudRepository;
import fr.eisti.ACCEG.jee.LeCoinPhoto.model.Produits;


public interface ProduitsRepository extends CrudRepository<Produits,Integer> {
	
	Produits findById(int id);
	
	Produits findByReference(String ref);
	
	Produits findByNom(String nom);
}
