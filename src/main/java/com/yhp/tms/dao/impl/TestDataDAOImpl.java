package com.yhp.tms.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.googlecode.genericdao.dao.hibernate.GenericDAOImpl;
import com.yhp.tms.dao.TestDataDAO;
import com.yhp.tms.modal.TestData;

@Repository
public class TestDataDAOImpl extends GenericDAOImpl<TestData, Integer> implements
		TestDataDAO {
	@Autowired
	@Override
	public void setSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
}
