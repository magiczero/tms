package com.yhp.tms.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.googlecode.genericdao.dao.hibernate.GenericDAOImpl;
import com.yhp.tms.dao.SchemeTableDAO;
import com.yhp.tms.modal.SchemeTable;

@Repository
public class SchemeTableDAOImpl extends GenericDAOImpl<SchemeTable, Integer> implements
		SchemeTableDAO {

	@Autowired
	@Override
	public void setSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
}
