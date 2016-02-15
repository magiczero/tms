package com.yhp.tms.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.googlecode.genericdao.dao.hibernate.GenericDAOImpl;
import com.yhp.tms.dao.AssessmentDAO;
import com.yhp.tms.modal.Assessment;

@Repository
public class AssessmentDAOImpl extends GenericDAOImpl<Assessment, Integer> implements
		AssessmentDAO {

	@Autowired
	@Override
	public void setSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
}
