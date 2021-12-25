package ING2projet.LaGuilde.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Membre implements Comparable<Membre> {
    
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;
    private String nom;
    private String prenom;
    private String email;
    private String password;
    private int statut;


    public Membre() {
    }

    public Membre(String nom, String prenom, String email, String password){
        this.nom = nom;
        this.prenom = prenom;
        this.email = email;
        this.password = password;
        this.statut = 6;
    }
    

    public String getNom() {
        return this.nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return this.prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getStatut() {
        return this.statut;
    }

    public void setStatut(int statut) {
        this.statut = statut;
    }

    @Override
    public int compareTo(Membre membre) {
        if (this.getNom() == null || membre.getNom() == null) {
            return 0;
          }
          return this.getNom().compareTo(membre.getNom());
        
    }


}
