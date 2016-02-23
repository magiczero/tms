package com.yhp.tms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.googlecode.genericdao.search.Search;
import com.yhp.tms.dao.ProjectDAO;
import com.yhp.tms.dao.SchemeDAO;
import com.yhp.tms.modal.Project;
import com.yhp.tms.modal.Scheme;
import com.yhp.tms.service.SchemeService;

@Service
public class SchemeServiceImpl implements SchemeService {

	@Autowired
	private SchemeDAO schemeDao;
	@Autowired
	private ProjectDAO projectDao;

	@Override
	@Transactional(readOnly=true)
	public List<Scheme> getAllByProjectid(int projectid) {
		// TODO Auto-generated method stub
		Project project = projectDao.find(projectid);
		
		Search search = new Search();
		
		search.addFilterEqual("project", project);
		
		search.addSortDesc("createTime");
		
		return schemeDao.search(search);
	}

	@Override
	@Transactional(readOnly=true)
	public List<Scheme> getAllByProject(Project p) {
		// TODO Auto-generated method stub
		Search search = new Search();
		
		search.addFilterEqual("project", p);
		
		search.addSortDesc("createTime");
		
		return schemeDao.search(search);
	}
}
