package fr.eisti.ACCEG.jee.LeCoinPhoto.model;
// Generated Dec 29, 2021, 3:03:24 PM by Hibernate Tools 5.4.14.Final

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * Categories generated by hbm2java
 */
@Entity
public class Categories implements java.io.Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String categorie;

	public Categories() {
	}

	public Categories(String categorie) {
		this.categorie = categorie;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCategorie() {
		return this.categorie;
	}

	public void setCategorie(String categorie) {
		this.categorie = categorie;
	}

}
