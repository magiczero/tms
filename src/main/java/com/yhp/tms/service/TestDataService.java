package com.yhp.tms.service;

import java.util.List;

import com.yhp.tms.modal.TestData;

public interface TestDataService {

	List<TestData> getListByProjectId(int projectId);
	
	boolean saveTestdata(TestData data);

	TestData getById(int testdataid);

	boolean delete(TestData testdata);
}
