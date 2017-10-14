package com.task.iglu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.task.iglu.dao.TaskDao;
import com.task.iglu.dao.userDao;
import com.task.iglu.model.Task;

@Service
public class TaskServiceImpl implements TaskService {
	@Autowired
	private TaskDao taskDao;

	@Override
	public void saveTask(Task task) {

		taskDao.addTask(task);
	}

	@Override
	public void saveTask1(String taskName, String objective, String startTime, String endTime, String status) {

		taskDao.addTask1(taskName, objective, startTime, endTime, status);

	}

	@Override
	public List<Task> taskList() {

		return taskDao.fetchTasks();

	}

	@Override
	public Task getTask(String id) {

		return taskDao.getTask(id);

	}

	@Override
	public List<Task> taskListFilter(String item) {

		return taskDao.fetchTasksFilter(item);

	}

	@Override
	public void updateTask(String id, String taskName, String objective, String startTime, String endTime,
			String status) {

		taskDao.updateTask(id, taskName, objective, startTime, endTime, status);

	}

	@Override
	public void deleteTask(String id) {

		taskDao.deleteTask(id);
	}

}
