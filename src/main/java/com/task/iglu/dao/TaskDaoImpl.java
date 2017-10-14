package com.task.iglu.dao;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.task.iglu.model.Task;
import com.task.iglu.model.User;

@Component
@Repository
@Transactional
public class TaskDaoImpl implements TaskDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	@Override
	public void addTask(Task task) {
		Session session = sessionFactory.getCurrentSession();
		try {
			System.out.println("Saving task into database");
			/*
			 * User user = new User(); user.setUserName(userName);
			 * user.setPassword(password);
			 */
			session.saveOrUpdate(task);

		} catch (HibernateException e) {
			e.printStackTrace();
		}

	}

	@Transactional
	@Override
	public void addTask1(String taskName, String objective, String startTime, String endTime, String status) {
		Session session = sessionFactory.getCurrentSession();

		DateFormat df = new SimpleDateFormat("mm/dd/yyyy");
		Date startDate = null;
		Date endDate = null;

		try {
			System.out.println("Saving task into database");
			try {
				startDate = df.parse(startTime);
				endDate = df.parse(endTime);
			} catch (ParseException e) {

				e.printStackTrace();
			}

			Task task = new Task();

			task.setName(taskName);
			task.setObjective(objective);
			task.setStartTime(startDate);
			task.setEndTime(endDate);
			task.setStatus(status);
			session.saveOrUpdate(task);

		} catch (HibernateException e) {
			e.printStackTrace();
		}

	}

	@Transactional
	@Override
	public List<Task> fetchTasks() {
		Session session = sessionFactory.openSession();
		try {
			Query query = session.createQuery("from Task");
			List<Task> tasks = query.list();
			return tasks;
		} catch (HibernateException e) {
			e.printStackTrace();
		}

		return null;
	}

	@Transactional
	@Override
	public Task getTask(String id) {
		Session session = sessionFactory.openSession();
		try {
			Query query = session.createQuery("FROM Task T WHERE T.id =" + id);
			Task task = (Task) query.uniqueResult();
			System.out.println("single task result is" + task.getName());
			return task;
		} catch (HibernateException e) {
			e.printStackTrace();
		}

		return null;
	}

	@Transactional
	@Override
	public List<Task> fetchTasksFilter(String item) {
		Session session = sessionFactory.openSession();
		try {
			List<Task> tasks = null;
			System.out.println("before that" + item);

			Query query = session.createQuery("FROM Task T WHERE T.status= :item").setParameter("item", item);
			// Query query = session.createQuery(");
			tasks = query.list();

			return tasks;
		} catch (HibernateException e) {
			e.printStackTrace();
		}

		return null;
	}

	@Transactional
	@Override
	public void updateTask(String id, String taskName, String objective, String startTime, String endTime,
			String status) {
		Session session = sessionFactory.getCurrentSession();

		DateFormat df = new SimpleDateFormat("mm/dd/yyyy");
		Date startDate = null;
		Date endDate = null;

		try {
			System.out.println("Saving task into database");
			try {
				startDate = df.parse(startTime);
				endDate = df.parse(endTime);
			} catch (ParseException e) {

				e.printStackTrace();
			}

			Query query = session.createQuery("FROM Task T WHERE T.id =" + id);
			Task task = (Task) query.uniqueResult();

			task.setName(taskName);
			task.setObjective(objective);
			task.setStartTime(startDate);
			task.setEndTime(endDate);
			task.setStatus(status);
			session.saveOrUpdate(task);

		} catch (HibernateException e) {
			e.printStackTrace();
		}

	}

	@Transactional
	@Override
	public void deleteTask(String id) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Query query = session.createQuery("DELETE Task T WHERE T.id=" + id);
			query.executeUpdate();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
	}
}
