package ING2projet.LaGuilde.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import ING2projet.LaGuilde.model.Membre;

public interface InscriptionRepository extends CrudRepository<Membre, Integer> {
    Membre findByid(int id);

    Membre findByemail(String email);

    List<Membre> findBystatut(int statut);
}