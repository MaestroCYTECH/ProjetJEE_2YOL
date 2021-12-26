package fr.eisti.ACCEG.jee.LeCoinPhoto.dao;
// Generated Dec 26, 2021, 11:28:54 AM by Hibernate Tools 5.4.14.Final

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

import fr.eisti.ACCEG.jee.LeCoinPhoto.model.Utilisateurs;

/**
 * Home object for domain model class Utilisateurs.
 * @see fr.eisti.ACCEG.jee.LeCoinPhoto.dao.Utilisateurs
 * @author Hibernate Tools
 */
public class UtilisateursHome {

	private static final Logger logger = Logger.getLogger(UtilisateursHome.class.getName());

	private final SessionFactory sessionFactory = getSessionFactory();

	protected SessionFactory getSessionFactory() {
		try {
			return (SessionFactory) new InitialContext().lookup("SessionFactory");
		} catch (Exception e) {
			logger.log(Level.SEVERE, "Could not locate SessionFactory in JNDI", e);
			throw new IllegalStateException("Could not locate SessionFactory in JNDI");
		}
	}

	public void persist(Utilisateurs transientInstance) {
		logger.log(Level.INFO, "persisting Utilisateurs instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			logger.log(Level.INFO, "persist successful");
		} catch (RuntimeException re) {
			logger.log(Level.SEVERE, "persist failed", re);
			throw re;
		}
	}

	public void attachDirty(Utilisateurs instance) {
		logger.log(Level.INFO, "attaching dirty Utilisateurs instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			logger.log(Level.INFO, "attach successful");
		} catch (RuntimeException re) {
			logger.log(Level.SEVERE, "attach failed", re);
			throw re;
		}
	}

	public void attachClean(Utilisateurs instance) {
		logger.log(Level.INFO, "attaching clean Utilisateurs instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			logger.log(Level.INFO, "attach successful");
		} catch (RuntimeException re) {
			logger.log(Level.SEVERE, "attach failed", re);
			throw re;
		}
	}

	public void delete(Utilisateurs persistentInstance) {
		logger.log(Level.INFO, "deleting Utilisateurs instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			logger.log(Level.INFO, "delete successful");
		} catch (RuntimeException re) {
			logger.log(Level.SEVERE, "delete failed", re);
			throw re;
		}
	}

	public Utilisateurs merge(Utilisateurs detachedInstance) {
		logger.log(Level.INFO, "merging Utilisateurs instance");
		try {
			Utilisateurs result = (Utilisateurs) sessionFactory.getCurrentSession().merge(detachedInstance);
			logger.log(Level.INFO, "merge successful");
			return result;
		} catch (RuntimeException re) {
			logger.log(Level.SEVERE, "merge failed", re);
			throw re;
		}
	}

	public Utilisateurs findById(java.lang.Integer id) {
		logger.log(Level.INFO, "getting Utilisateurs instance with id: " + id);
		try {
			Utilisateurs instance = (Utilisateurs) sessionFactory.getCurrentSession()
					.get("fr.eisti.ACCEG.jee.LeCoinPhoto.dao.Utilisateurs", id);
			if (instance == null) {
				logger.log(Level.INFO, "get successful, no instance found");
			} else {
				logger.log(Level.INFO, "get successful, instance found");
			}
			return instance;
		} catch (RuntimeException re) {
			logger.log(Level.SEVERE, "get failed", re);
			throw re;
		}
	}

	public List findByExample(Utilisateurs instance) {
		logger.log(Level.INFO, "finding Utilisateurs instance by example");
		try {
			List results = sessionFactory.getCurrentSession()
					.createCriteria("fr.eisti.ACCEG.jee.LeCoinPhoto.dao.Utilisateurs").add(Example.create(instance))
					.list();
			logger.log(Level.INFO, "find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			logger.log(Level.SEVERE, "find by example failed", re);
			throw re;
		}
	}
}
