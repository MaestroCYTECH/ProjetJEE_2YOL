package fr.eisti.ACCEG.jee.LeCoinPhoto.dao;


import org.springframework.data.repository.CrudRepository;
import fr.eisti.ACCEG.jee.LeCoinPhoto.model.Utilisateurs;


public interface UtilisateursRepository extends CrudRepository<Utilisateurs,Integer> {
	Utilisateurs findById(int id);

	Utilisateurs findByNom(String nom);
	
	Utilisateurs findByLogin(String login);
	
}
