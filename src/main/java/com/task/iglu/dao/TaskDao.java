package com.task.iglu.dao;

import java.util.List;

import com.task.iglu.model.Task;

public interface TaskDao {

	public void addTask(Task task);

	public void addTask1(String taskName, String objective, String startTime, String endTime, String status);

	public List<Task> fetchTasks();

	public Task getTask(String id);

	public List<Task> fetchTasksFilter(String item);

	public void updateTask(String id, String taskName, String objective, String startTime, String endTime,
			String status);

	public void deleteTask(String id);
}
