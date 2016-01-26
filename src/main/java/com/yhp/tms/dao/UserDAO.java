package com.yhp.tms.dao;

import com.googlecode.genericdao.dao.hibernate.GenericDAO;
import com.yhp.tms.modal.User;

public interface UserDAO extends GenericDAO<User, Integer> {

	User getUserByUsername(String username);
}
