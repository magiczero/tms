package com.yhp.tms.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.yhp.tms.modal.Group;
import com.yhp.tms.modal.User;
import com.yhp.utils.MD5Tools;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-context.xml"})
public class GenericDaoTest {

	private static final Logger logger = LoggerFactory.getLogger(GenericDaoTest.class);
//	@Autowired
//	static ApplicationContext ctx;
	
	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private GroupDAO groupDao;
	
	@BeforeClass
    public static void setUpClass() {
//		userDao = ctx.getBean(UserDAO.class);
	}
	
	@Before
    public void setUp() {
    }
	
	@After
    public void tearDown() {
    }
	
	@AfterClass
    public static void tearDownClass() {
    }
	
	@Test
	@Transactional
	public void testGetAllGroup() {
		List<Group> list = groupDao.findAll();
		
		Group group = list.get(0);
		
		Set<User> users = group.getUsers();

		String usernames = "";
		
		for(User user : users) {
			usernames += user.getUsername() + " ++ ";
		}
		logger.info("所属员工：" + usernames);
		
		assertEquals("办公室", group.getGroupName());
	}
	
	@Test
	@Transactional
	@Ignore
    public void testInsertGroup() {
		Group group = new Group();
		group.setGroupName("办公室");
		group.setExplain("第一个部门");
		group.setParentGroup(null);
		
		groupDao.save(group);
	}
	
	@Test
	@Transactional
	@Ignore
	public void testInsertUser() {
		String username = "wangwu";
		User user = new User();
		user.setUsername(username);
		user.setPassword(MD5Tools.getMd5("123456", username));
		user.setRole("ROLE_USER");
		user.setRealname("王五");
		user.setDepartment("办公室");
		user.setDuty("普通职员");
		user.setIp("127.0.0.1");
		user.setLastTime(new Timestamp(new Date().getTime()));
		
		assertTrue(userDao.save(user));
	}
	
}
