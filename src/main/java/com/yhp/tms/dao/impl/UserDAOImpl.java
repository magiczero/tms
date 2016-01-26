package com.yhp.tms.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.googlecode.genericdao.dao.hibernate.GenericDAOImpl;
import com.googlecode.genericdao.search.Search;
import com.yhp.tms.dao.UserDAO;
import com.yhp.tms.modal.User;

@Repository
public class UserDAOImpl extends GenericDAOImpl<User, Integer> implements UserDAO {

	@Autowired
	@Override
	public void setSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
	
	@Override
	public User getUserByUsername(String username) {
		// TODO Auto-generated method stub
		Search search = new Search();
		search.addFilterEqual("username", username);
		return searchUnique(search);
	}

}
