package com.yhp.tms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.googlecode.genericdao.search.Search;
import com.yhp.tms.dao.BoxDAO;
import com.yhp.tms.modal.Box;
import com.yhp.tms.service.BoxService;

@Service
public class BoxServiceImpl implements BoxService {

	@Autowired
	private BoxDAO boxDao;

	@Override
	@Transactional(readOnly=true)
	public List<Box> getAllBox() {
		// TODO Auto-generated method stub
		Search search =new Search();
		
		search.addSortDesc("insertTime");
		
		return boxDao.search(search);
	}

	@Override
	public boolean saveBox(Box box) {
		// TODO Auto-generated method stub
		return boxDao.save(box);
	}
	
	
}
