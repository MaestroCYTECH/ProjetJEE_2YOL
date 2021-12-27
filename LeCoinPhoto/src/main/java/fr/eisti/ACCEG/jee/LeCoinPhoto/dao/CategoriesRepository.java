package fr.eisti.ACCEG.jee.LeCoinPhoto.dao;


import org.springframework.data.repository.CrudRepository;

import fr.eisti.ACCEG.jee.LeCoinPhoto.model.Categories;


public interface CategoriesRepository extends CrudRepository<Categories,Integer> {
	Categories findById(int id);

	Categories findByCategorie(String cat);
}
