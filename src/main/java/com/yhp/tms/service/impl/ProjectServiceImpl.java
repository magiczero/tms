package com.yhp.tms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.googlecode.genericdao.search.Search;
import com.yhp.tms.dao.ProjectDAO;
import com.yhp.tms.modal.Project;
import com.yhp.tms.modal.User;
import com.yhp.tms.service.ProjectService;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private ProjectDAO projectDao;

	@Override
	@Transactional(readOnly=true)
	public List<Project> getProjectAll() {
		// TODO Auto-generated method stub
		Search search = new Search();
		
		search.addSortDesc("createTime");
		
		return projectDao.search(search);
	}

	@Override
	@Transactional(readOnly=true)
	public List<Project> getAllProjectByUser(User user) {
		// TODO Auto-generated method stub
		Search search = new Search();
		
		search.addFilterEqual("creator", user);
		search.addSortDesc("createTime");
		
		return projectDao.search(search);
	}

	@Override
	@Transactional
	public boolean saveProject(Project project) {
		// TODO Auto-generated method stub
		return projectDao.save(project);
	}

	@Override
	@Transactional(readOnly=true)
	public Project getById(int projectid) {
		// TODO Auto-generated method stub
		return projectDao.find(projectid);
	}
}
