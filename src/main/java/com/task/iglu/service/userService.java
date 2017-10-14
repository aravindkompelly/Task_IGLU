package com.task.iglu.service;

import com.task.iglu.model.User;

public interface userService {

	public User addUser(User user);

	public void saveUser(String userName, String password);

	public boolean validateUser(String userName, String password);

}
