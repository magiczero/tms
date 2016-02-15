package com.yhp.tms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yhp.tms.dao.SchemeDAO;
import com.yhp.tms.service.SchemeService;

@Service
public class SchemeServiceImpl implements SchemeService {

	@Autowired
	private SchemeDAO schemeDao;
}
