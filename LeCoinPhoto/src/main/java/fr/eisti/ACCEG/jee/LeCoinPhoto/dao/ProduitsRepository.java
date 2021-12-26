package fr.eisti.ACCEG.jee.LeCoinPhoto.dao;


import org.springframework.data.repository.CrudRepository;

import fr.eisti.ACCEG.jee.LeCoinPhoto.model.Produits;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public interface ProduitsRepository extends CrudRepository<Produits,Integer> {
	Produits findById(int id);

	Produits findByNom(String nom);
}
