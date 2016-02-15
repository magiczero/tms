package com.yhp.tms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yhp.tms.dao.AssessmentDAO;
import com.yhp.tms.service.AssessmentService;

@Service
public class AssessmentServiceImpl implements AssessmentService {

	@Autowired
	private AssessmentDAO assessmentDao;
}
