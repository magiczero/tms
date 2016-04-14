package com.yhp.tms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yhp.tms.dao.AssessmentDAO;
import com.yhp.tms.modal.Assessment;
import com.yhp.tms.service.AssessmentService;

@Service
public class AssessmentServiceImpl implements AssessmentService {

	@Autowired
	private AssessmentDAO assessmentDao;

	@Override
	@Transactional//(readOnly=true)
	public boolean save(Assessment assessment) {
		// TODO Auto-generated method stub
		return assessmentDao.save(assessment);
	}

	@Override
	@Transactional(readOnly=true)
	public Assessment getById(int assessid) {
		// TODO Auto-generated method stub
		return assessmentDao.find(assessid);
	}

	@Override
	@Transactional
	public boolean delete(Assessment assess) {
		// TODO Auto-generated method stub
		return assessmentDao.remove(assess);
	}
}
