package com.yhp.tms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.googlecode.genericdao.search.Search;
import com.yhp.tms.dao.SchemeTableDAO;
import com.yhp.tms.modal.SchemeTable;
import com.yhp.tms.service.SchemeTableService;

@Service
public class SchemeTableServiceImpl implements SchemeTableService {

	@Autowired
	private SchemeTableDAO schemeTableDao;

	@Override
	@Transactional(readOnly=true)
	public List<SchemeTable> getAllByTypeid(int typeid) {
		// TODO Auto-generated method stub
		Search search = new Search();
		switch(typeid) {
		case 12 :
			search.addFilterIn("type", 1,2);
			break;
		case 31 :
			search.addFilterEqual("type", 3);
			break;
		case 32 :
			search.addFilterEqual("type", 4);
			break;
		case 33 :
			search.addFilterEqual("type", 5);
			break;
		}
		
		return schemeTableDao.search(search);
	}

	@Override
	@Transactional(readOnly=true)
	public List<SchemeTable> getListByProductAndUse(int product, int use) {
		// TODO Auto-generated method stub
		Search search = new Search();
		
		search.addFilterEqual("productor1", product);
		search.addFilterEqual("use1", use);
		search.addFilterIn("type", 1,2);
		
		return schemeTableDao.search(search);
	}
}
