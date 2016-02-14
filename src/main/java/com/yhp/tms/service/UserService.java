package com.yhp.tms.service;

import java.util.List;

import com.yhp.tms.modal.User;

public interface UserService {

	User getUserByUsername(String username);
	
	boolean updateUser(User user);
	
	List<User> getAllUser();
	
	boolean saveUser(User user);
}
