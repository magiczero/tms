package com.yhp.tms.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.googlecode.genericdao.dao.hibernate.GenericDAOImpl;
import com.yhp.tms.dao.GroupDAO;
import com.yhp.tms.modal.Group;

@Repository
public class GroupDAOImpl extends GenericDAOImpl<Group, Integer> implements GroupDAO {

	@Autowired
	@Override
	public void setSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

}
