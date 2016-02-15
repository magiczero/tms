package com.yhp.tms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yhp.tms.dao.TestDataDAO;
import com.yhp.tms.service.TestDataService;

@Service
public class TestDataServiceImpl implements TestDataService {

	@Autowired
	private TestDataDAO testDataDao;
}
