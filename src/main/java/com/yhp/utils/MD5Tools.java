package com.yhp.utils;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;

public class MD5Tools {

	public static String getMd5(String password, String salt){
		Md5PasswordEncoder md5 = new Md5PasswordEncoder();   
//		String result = "d:/123/456/789.txt".replaceAll("/[^/]+$","");
//		System.out.println(result);
		
		return md5.encodePassword(password, salt);
	}
}
