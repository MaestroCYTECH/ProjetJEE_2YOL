package ING2projet.LaGuilde.dao;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import ING2projet.LaGuilde.model.Participants;

public interface ParticipantRepository extends CrudRepository<Participants,Integer>{
    @Query(value="Select * from Participants p where p.idmembre= ?1", nativeQuery= true)
    public Iterable<Participants> findAllByIdmembre(int id);

    @Query(value="Select * from Participants p where p.idevent= ?1", nativeQuery= true)
    public Iterable<Participants> findAllByIdevent(int id);

    
}
