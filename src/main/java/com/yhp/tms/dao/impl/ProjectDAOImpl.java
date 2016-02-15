package com.yhp.tms.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.googlecode.genericdao.dao.hibernate.GenericDAOImpl;
import com.yhp.tms.dao.ProjectDAO;
import com.yhp.tms.modal.Project;

@Repository
public class ProjectDAOImpl extends GenericDAOImpl<Project, Integer> implements ProjectDAO {
	@Autowired
	@Override
	public void setSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
}
