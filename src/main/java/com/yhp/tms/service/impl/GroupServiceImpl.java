package com.yhp.tms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.googlecode.genericdao.search.Search;
import com.yhp.tms.dao.GroupDAO;
import com.yhp.tms.modal.Group;
import com.yhp.tms.service.GroupService;

@Service
public class GroupServiceImpl implements GroupService {

	@Autowired
	private GroupDAO groupDao;

	@Override
	@Transactional(readOnly=true)
	public List<Group> getAllGroup() {
		// TODO Auto-generated method stub
		return groupDao.findAll();
	}

	@Override
	@Transactional(readOnly=true)
	public Group loadGroupById(Integer id) {
		// TODO Auto-generated method stub
		return groupDao.find(id);
	}

	@Override
	@Transactional(readOnly=true)
	public List<Group> getAllTopLevelGroup() {
		// TODO Auto-generated method stub
		Search search = new Search();
		search.addFilterEmpty("parentGroup");
		
		return groupDao.search(search);
	}

	@Override
	@Transactional
	public boolean saveGroup(Group group) {
		// TODO Auto-generated method stub
		return groupDao.save(group);
	}
}
