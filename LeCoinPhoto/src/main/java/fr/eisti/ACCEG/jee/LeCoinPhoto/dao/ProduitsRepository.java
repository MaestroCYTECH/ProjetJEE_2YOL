package fr.eisti.ACCEG.jee.LeCoinPhoto.dao;


import org.springframework.data.repository.CrudRepository;
import fr.eisti.ACCEG.jee.LeCoinPhoto.model.Produits;


public interface ProduitsRepository extends CrudRepository<Produits,Integer> {
	
	Produits findById(int id);
	
	Iterable<Produits> findByCategorie(String cat); //Mettre Iterable<Produits> si on attend plusieurs résultats (cad dans la majorité des cas). Pour dire que le résultat sera une sorte de liste et pas un objet unique
	
	Produits findByReference(String ref);
	
	Produits findByNom(String nom);
}
