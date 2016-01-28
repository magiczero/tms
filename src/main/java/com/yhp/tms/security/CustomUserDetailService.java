package com.yhp.tms.security;

import java.util.ArrayList;
import java.util.Collection;

import javax.annotation.Resource;

import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityMessageSource;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.yhp.tms.modal.User;
import com.yhp.tms.service.UserService;

public class CustomUserDetailService implements UserDetailsService {

	protected MessageSourceAccessor messages = SpringSecurityMessageSource
            .getAccessor();
	@Resource
	private UserService userService;
	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		User user = userService.getUserByUsername(username);
		
		if(user == null) {
			throw new UsernameNotFoundException(messages.getMessage(
                    "User.notFound", new Object[] { username },
                    "用户名 {0} 不存在"));
		}
		
		Collection<GrantedAuthority> auths = new ArrayList<GrantedAuthority>();
		
		auths.add(new SimpleGrantedAuthority(user.getRole()));
		
		org.springframework.security.core.userdetails.User userdetail = new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), true, true, true, true, auths);
		
		return userdetail;
	}

}
