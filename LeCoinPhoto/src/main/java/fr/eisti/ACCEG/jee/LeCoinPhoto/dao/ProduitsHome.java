package fr.eisti.ACCEG.jee.LeCoinPhoto.dao;
// Generated Dec 26, 2021, 11:28:54 AM by Hibernate Tools 5.4.14.Final

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

import fr.eisti.ACCEG.jee.LeCoinPhoto.model.Produits;

/**
 * Home object for domain model class Produits.
 * @see fr.eisti.ACCEG.jee.LeCoinPhoto.dao.Produits
 * @author Hibernate Tools
 */
public class ProduitsHome {

	private static final Logger logger = Logger.getLogger(ProduitsHome.class.getName());

	private final SessionFactory sessionFactory = getSessionFactory();

	protected SessionFactory getSessionFactory() {
		try {
			return (SessionFactory) new InitialContext().lookup("SessionFactory");
		} catch (Exception e) {
			logger.log(Level.SEVERE, "Could not locate SessionFactory in JNDI", e);
			throw new IllegalStateException("Could not locate SessionFactory in JNDI");
		}
	}

	public void persist(Produits transientInstance) {
		logger.log(Level.INFO, "persisting Produits instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			logger.log(Level.INFO, "persist successful");
		} catch (RuntimeException re) {
			logger.log(Level.SEVERE, "persist failed", re);
			throw re;
		}
	}

	public void attachDirty(Produits instance) {
		logger.log(Level.INFO, "attaching dirty Produits instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			logger.log(Level.INFO, "attach successful");
		} catch (RuntimeException re) {
			logger.log(Level.SEVERE, "attach failed", re);
			throw re;
		}
	}

	public void attachClean(Produits instance) {
		logger.log(Level.INFO, "attaching clean Produits instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			logger.log(Level.INFO, "attach successful");
		} catch (RuntimeException re) {
			logger.log(Level.SEVERE, "attach failed", re);
			throw re;
		}
	}

	public void delete(Produits persistentInstance) {
		logger.log(Level.INFO, "deleting Produits instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			logger.log(Level.INFO, "delete successful");
		} catch (RuntimeException re) {
			logger.log(Level.SEVERE, "delete failed", re);
			throw re;
		}
	}

	public Produits merge(Produits detachedInstance) {
		logger.log(Level.INFO, "merging Produits instance");
		try {
			Produits result = (Produits) sessionFactory.getCurrentSession().merge(detachedInstance);
			logger.log(Level.INFO, "merge successful");
			return result;
		} catch (RuntimeException re) {
			logger.log(Level.SEVERE, "merge failed", re);
			throw re;
		}
	}

	public Produits findById(java.lang.Integer id) {
		logger.log(Level.INFO, "getting Produits instance with id: " + id);
		try {
			Produits instance = (Produits) sessionFactory.getCurrentSession()
					.get("fr.eisti.ACCEG.jee.LeCoinPhoto.dao.Produits", id);
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

	public List findByExample(Produits instance) {
		logger.log(Level.INFO, "finding Produits instance by example");
		try {
			List results = sessionFactory.getCurrentSession()
					.createCriteria("fr.eisti.ACCEG.jee.LeCoinPhoto.dao.Produits").add(Example.create(instance)).list();
			logger.log(Level.INFO, "find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			logger.log(Level.SEVERE, "find by example failed", re);
			throw re;
		}
	}
}
