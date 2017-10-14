package com.task.iglu.service;

import java.util.List;

import com.task.iglu.model.Task;

public interface TaskService {

	public void saveTask(Task task);

	public void saveTask1(String taskName, String objective, String startTime, String endTime, String status);

	public List<Task> taskList();

	public Task getTask(String id);

	public List<Task> taskListFilter(String item);

	public void updateTask(String id, String taskName, String objective, String startTime, String endTime,
			String status);

	public void deleteTask(String id);

}
