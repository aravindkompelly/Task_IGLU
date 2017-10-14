package com.task.iglu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.task.iglu.dao.userDao;
import com.task.iglu.model.User;

@Service
public class userServiceImpl implements userService {
	@Autowired
	private userDao userDao;

	@Override
	public User addUser(User user) {
		return userDao.addUser(user);
	}

	@Override
	public void saveUser(String userName, String password) {
		userDao.saveUser(userName, password);

	}

	@Override
	public boolean validateUser(String userName, String password) {

		boolean user = userDao.validateUser(userName, password);
		return user;

	}

}
