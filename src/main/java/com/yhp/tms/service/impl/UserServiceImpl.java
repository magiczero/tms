package com.yhp.tms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yhp.tms.dao.UserDAO;
import com.yhp.tms.modal.User;
import com.yhp.tms.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDao;

	@Override
	@Transactional(readOnly=true)
	public User getUserByUsername(String username) {
		// TODO Auto-generated method stub
		return userDao.getUserByUsername(username);
	}

	@Override
	@Transactional
	public boolean updateUser(User user) {
		// TODO Auto-generated method stub
		return userDao.save(user);
	}

	@Override
	@Transactional(readOnly=true)
	public List<User> getAllUser() {
		// TODO Auto-generated method stub
		return userDao.findAll();
	}

	@Override
	@Transactional
	public boolean saveUser(User user) {
		// TODO Auto-generated method stub
		return userDao.save(user);
	}
	
	
}
