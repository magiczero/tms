package com.yhp.tms.service;

import com.yhp.tms.modal.Assessment;

public interface AssessmentService {

	boolean save(Assessment assessment);

	Assessment getById(int assessid);

	boolean delete(Assessment assess);

}
