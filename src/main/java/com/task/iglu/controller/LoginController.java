package com.task.iglu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

	@RequestMapping(value = "/")
	public ModelAndView homePage() {
		ModelAndView modelView = new ModelAndView("login");
		return modelView;
	}
	/*
	 * @RequestMapping(value = "/home") public ModelAndView index() {
	 * ModelAndView modelView = new ModelAndView("view"); return modelView; }
	 */
}
