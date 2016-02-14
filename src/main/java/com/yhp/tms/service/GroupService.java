package com.yhp.tms.service;

import java.util.List;

import com.yhp.tms.modal.Group;

public interface GroupService {

	List<Group> getAllGroup();
	
	/**
	 * 获取所有第一层部门，也可理解为公司
	 * @return
	 */
	List<Group> getAllTopLevelGroup();

	Group loadGroupById(Integer id);
	
	boolean saveGroup(Group group);
}
