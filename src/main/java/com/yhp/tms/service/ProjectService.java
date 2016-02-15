package com.yhp.tms.service;

import java.util.List;

import com.yhp.tms.modal.Project;
import com.yhp.tms.modal.User;

public interface ProjectService {

	List<Project> getProjectAll();
	
	List<Project> getAllProjectByUser(User user);
}
