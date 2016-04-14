package com.yhp.tms.service;

import java.util.List;

import com.yhp.tms.modal.SchemeTable;

public interface SchemeTableService {

	List<SchemeTable> getAllByTypeid(int typeid);

	List<SchemeTable> getListByProductAndUse(int product, int use);
	
	List<SchemeTable> getList(int type, Double productor, Double user, Double diffratio, Integer truncation);
}
