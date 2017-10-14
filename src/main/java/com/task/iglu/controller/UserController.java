package com.task.iglu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.task.iglu.model.Task;
import com.task.iglu.model.User;
import com.task.iglu.service.TaskService;
import com.task.iglu.service.userService;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	@Autowired
	private userService userService;
	@Autowired
	private TaskService taskService;

	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public ModelAndView addUser(@RequestParam(value = "username", required = true) String user,
			@RequestParam(value = "password", required = true) String password) {
		ModelAndView modelView = new ModelAndView("view");
		List<Task> tasks = taskService.taskList();
		modelView.addObject("tasks", tasks);
		System.out.println("In Controller save user called::::::::::");
		userService.saveUser(user, password);

		return modelView;
	}

	@RequestMapping(value = "/validateUser", method = RequestMethod.POST)
	public ModelAndView validateUser(@RequestParam(value = "userName", required = true) String userName,
			@RequestParam(value = "password", required = true) String password) {

		ModelAndView modelView = null;
		boolean user = userService.validateUser(userName, password);
		if (user) {
			modelView = new ModelAndView("view");
			List<Task> tasks = taskService.taskList();
			modelView.addObject("tasks", tasks);
			modelView.addObject("userName",userName);
			/*
			 * for (Task t : tasks) { System.out.println(
			 * "Tasks objectives are::" + t.getObjective()); }
			 */
			System.out.println("User Exists");

		} else {
			System.out.println("User does not exist");
		}
		return modelView;
	}

}
