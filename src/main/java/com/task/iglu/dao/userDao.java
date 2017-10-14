package com.task.iglu.dao;

import com.task.iglu.model.User;

public interface userDao {

	public User addUser(User user);

	public void saveUser(String userName, String password);

	public boolean validateUser(String userName, String password);
}
