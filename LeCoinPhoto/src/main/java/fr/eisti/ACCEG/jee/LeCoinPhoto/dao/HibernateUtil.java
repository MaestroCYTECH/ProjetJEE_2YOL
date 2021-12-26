package fr.eisti.ACCEG.jee.LeCoinPhoto.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil
{
	public static Session getCurrentSessionFromConfig() {
		  // SessionFactory in Hibernate 5 example
		  Configuration config = new Configuration();
		  config.configure();
		  // local SessionFactory bean created
		  SessionFactory sessionFactory = config.buildSessionFactory();
		  Session session = sessionFactory.getCurrentSession();
		  return session;
		}
	
	private static final SessionFactory sessionFactory;
	
	static
	{
		try
		{
			// Cree l'objet SessionFactory à partir de hibernate.cfg.xml
			sessionFactory = new Configuration().configure().buildSessionFactory();
		}
		catch (Throwable ex)
		{
			System.err.println("Initial SessionFactorycreation failed." + ex);
			throw new ExceptionInInitializerError(ex);
		}
	}
	
	public static SessionFactory getSessionFactory()
	{
		return sessionFactory;
	}
}