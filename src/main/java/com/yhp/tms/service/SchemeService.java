package com.yhp.tms.service;

import java.util.List;

import com.yhp.tms.modal.Project;
import com.yhp.tms.modal.Scheme;

public interface SchemeService {

	List<Scheme> getAllByProjectid(int projectid);
	
	List<Scheme> getAllByProject(Project p);
}
