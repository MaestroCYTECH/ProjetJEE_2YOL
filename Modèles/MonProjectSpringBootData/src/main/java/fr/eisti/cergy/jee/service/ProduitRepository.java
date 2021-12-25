package fr.eisti.cergy.jee.service;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.Repository;

import fr.eisti.cergy.jee.model.Produit;


public interface ProduitRepository extends Repository <Produit, Long>{


	Produit findByIdProduit(Long idProduit);
	
	 
	List<Produit> findAll();
	
	Produit save (Produit produit);
	 
	@Modifying
	@Query("update Produit u set u.idProduit = ?1")
	int updateIdProduit(Long idProduit);
	
	@Modifying
	@Query("update Produit u set u.desigProduit = ?1, u.qteProduit = ?2  where u.idProduit = ?3")
	int updateDesigProduit(String desigProduit, Long qteProduit, Long idProduit);

}