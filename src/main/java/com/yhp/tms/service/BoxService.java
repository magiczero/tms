package com.yhp.tms.service;

import java.util.List;

import com.yhp.tms.modal.Box;

public interface BoxService {

	List<Box> getAllBox();
	
	boolean saveBox(Box box);
}
