package com.yhp.tms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.googlecode.genericdao.search.Search;
import com.yhp.tms.dao.ProjectDAO;
import com.yhp.tms.dao.TestDataDAO;
import com.yhp.tms.modal.TestData;
import com.yhp.tms.service.TestDataService;

@Service
public class TestDataServiceImpl implements TestDataService {

	@Autowired
	private TestDataDAO testDataDao;
	@Autowired
	private ProjectDAO projectDao;

	@Override
	@Transactional(readOnly=true)
	public List<TestData> getListByProjectId(int projectId) {
		// TODO Auto-generated method stub
		Search search = new Search();
		search.addFilterEqual("project.id", projectId);
		
		return testDataDao.search(search);
	}

	@Override
	@Transactional
	public boolean saveTestdata(TestData data) {
		// TODO Auto-generated method stub
		return testDataDao.save(data);
	}

	@Override
	@Transactional(readOnly=true)
	public TestData getById(int testdataid) {
		// TODO Auto-generated method stub
		return testDataDao.find(testdataid);
	}

	@Override
	@Transactional
	public boolean delete(TestData testdata) {
		// TODO Auto-generated method stub
		return testDataDao.remove(testdata);
	}
}
