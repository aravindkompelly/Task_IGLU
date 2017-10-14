package com.task.iglu.controller;

import java.util.List;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.task.iglu.model.Task;
import com.task.iglu.service.TaskService;

@Controller

@RequestMapping(value = "/task")
public class TaskController {

	@Autowired
	private TaskService taskService;

	@RequestMapping(value = "/addTask", method = RequestMethod.POST)
	public ModelAndView addTask(@ModelAttribute("taskForm") Task task) {
		ModelAndView modelView = new ModelAndView("login");
		taskService.saveTask(task);

		return modelView;
	}

	@RequestMapping(value = "/addTask1", method = RequestMethod.POST)
	public ModelAndView addTaskInd(@RequestParam(value = "taskName", required = true) String taskName,
			@RequestParam(value = "objective", required = true) String objective,
			@RequestParam(value = "startTime", required = true) String startTime,
			@RequestParam(value = "endTime", required = true) String endTime,
			@RequestParam(value = "status", required = true) String status) {
		ModelAndView modelView = new ModelAndView("view");
		taskService.saveTask1(taskName, objective, startTime, endTime, status);
		List<Task> tasks = taskService.taskList();
		modelView.addObject("tasks", tasks);
		return modelView;

	}

	@RequestMapping(value = "/editTask", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getTask(@RequestParam(value = "id", required = true) String id) {
		ModelAndView modelView = new ModelAndView("edit");
		Task task = taskService.getTask(id);
		modelView.addObject("task", task);
		// System.out.println("Id is::::" + task.getName());
		return modelView;
	}

	@RequestMapping(value = "/filter", method = RequestMethod.GET)
	public ModelAndView filter(@RequestParam(value = "item", required = true) String item) {
		ModelAndView modelView = new ModelAndView("view");
		List<Task> tasks = taskService.taskListFilter(item);
		modelView.addObject("tasks", tasks);
		/*
		 * for (Task t : tasks) { System.out.println("ttttttt list" +
		 * t.getName()); }
		 */
		return modelView;
	}

	@RequestMapping(value = "/updateTask", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView updateTask(@RequestParam(value = "id", required = true) String id,
			@RequestParam(value = "taskName", required = true) String taskName,
			@RequestParam(value = "objective", required = true) String objective,
			@RequestParam(value = "startTime", required = true) String startTime,
			@RequestParam(value = "endTime", required = true) String endTime,
			@RequestParam(value = "status", required = true) String status) throws ParseException {
		ModelAndView modelView = new ModelAndView("view");

		String sdate = startTime.substring(0, 10);
		String edate = endTime.substring(0, 10);
		String s1[] = sdate.split("-");
		String s2[] = edate.split("-");
		System.out.println("bababa" + s1[2] + "/" + s1[1] + "/" + s1[0]);

		taskService.updateTask(id, taskName, objective, s1[2] + "/" + s1[1] + "/" + s1[0],
				s2[2] + "/" + s2[1] + "/" + s2[0], status);
		// sends mail if task completed
		if (status != null && status.equalsIgnoreCase("completed")) {
			sendMail(taskName);
		}
		List<Task> tasks = taskService.taskList();
		modelView.addObject("tasks", tasks);
		return modelView;
	}

	public void sendMail(String taskName) {

		String to = "tasha.jose@iglulabs.com";

		String from = "kompallyaravind@gmail.com";

		String host = "localhost";

		Properties properties = System.getProperties();

		properties.setProperty("mail.smtp.host", host);

		Session session = Session.getDefaultInstance(properties);

		try {

			MimeMessage message = new MimeMessage(session);

			message.setFrom(new InternetAddress(from));

			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			message.setSubject("Regarding Task:" + taskName);

			message.setText(taskName + "Task is completed");

			Transport.send(message);
			System.out.println("Sent message successfully for Tasha Jose-IGLU LABS");
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
	}

	@RequestMapping(value = "/deleteTask", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView deleteTask(@RequestParam(value = "id", required = true) String id) {
		ModelAndView modelView = new ModelAndView("view");
		taskService.deleteTask(id);

		List<Task> tasks = taskService.taskList();
		modelView.addObject("tasks", tasks);
		return modelView;
	}

}
