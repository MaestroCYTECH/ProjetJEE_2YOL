package fr.eisti.cergy.jee.service;

import java.util.List;

 

import fr.eisti.cergy.jee.model.Produit;

public interface ProduitService {

	public Long save (Produit produit) throws Exception ;
	
	List<Produit> getAll();
 
	Produit getByIdProduit(Long idProduit) throws Exception;
	
	int updateId (Long idProduit);
	
  	int updateDesig (String desigProduit, Long qteProduit, Long idProduit); 

   
}
