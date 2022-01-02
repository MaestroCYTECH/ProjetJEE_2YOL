package fr.eisti.ACCEG.jee.LeCoinPhoto.dao;


import org.springframework.data.repository.CrudRepository;
import fr.eisti.ACCEG.jee.LeCoinPhoto.model.Produits;


public interface ProduitsRepository extends CrudRepository<Produits,Integer> {
	
	Produits findById(int id);
	
	Iterable<Produits> findByCategorie(String cat);
	
	Produits findByNom(String nom);
}
