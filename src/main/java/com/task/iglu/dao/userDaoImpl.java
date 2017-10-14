package com.task.iglu.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.task.iglu.model.User;

@Component
@Repository
@Transactional
public class userDaoImpl implements userDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	@Override
	public User addUser(User user) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(user);
		user.getPassword();
		return user;
	}

	@Override
	public void saveUser(String userName, String password) {
		Session session = sessionFactory.openSession();
		try {
			System.out.println("Saving user into database");
			User user = new User();
			user.setUserName(userName);
			user.setPassword(password);
			session.saveOrUpdate(user);
		} catch (HibernateException e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean validateUser(String userName, String password) {
		Session session = sessionFactory.openSession();
		try {
			boolean userFound = false;
			// Query using Hibernate Query Language
			String SQL_QUERY = " from User as o where o.userName=? and o.password=?";
			Query query = session.createQuery(SQL_QUERY);
			query.setParameter(0, userName);
			query.setParameter(1, password);
			List list = query.list();

			if ((list != null) && (list.size() > 0)) {
				userFound = true;
			}

			session.close();
			return userFound;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}

}
