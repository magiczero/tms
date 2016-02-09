package com.yhp.tms.security;

import java.io.IOException;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.util.StringUtils;

import com.yhp.tms.service.UserService;

public class AuthenticationSuccessHandlerImpl implements
		AuthenticationSuccessHandler, InitializingBean {

	private static final Logger logger = LoggerFactory.getLogger(AuthenticationSuccessHandlerImpl.class);
	
	private boolean forwardToDestination = false; 
	
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();  

	private String defaultTargetUrl; 
	
	@Resource
	private UserService userService;
	
	@Override
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
		if(StringUtils.isEmpty(defaultTargetUrl)) {
			logger.debug("未设置defaultTargetUrl属性");
			throw new Exception("必须设置defaultTargetUrl属性");
		}
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request,
			HttpServletResponse response, Authentication authentication) throws IOException,
			ServletException {
		// TODO Auto-generated method stub
		String username = ((User)authentication.getPrincipal()).getUsername();
		String ip = this.getIpAddress(request); 
		Date date = new Date();  
		
		com.yhp.tms.modal.User currentUser = userService.getUserByUsername(username);
		
		currentUser.setIp(ip);
		currentUser.setLastTime(new java.sql.Timestamp(date.getTime()));
		
		userService.updateUser(currentUser);
		//
		logger.info("登录用户是：" + username + "，ip地址是：" + ip + "，登录时间：" + date);
		
		if(this.forwardToDestination){  
            logger.info("Login success,Forwarding to "+this.defaultTargetUrl);  
              
            request.getRequestDispatcher(this.defaultTargetUrl).forward(request, response);  
        }else{  
            logger.info("Login success,Redirecting to "+this.defaultTargetUrl);  
              
            this.redirectStrategy.sendRedirect(request, response, this.defaultTargetUrl);  
        }  
	}
	
	private String getIpAddress(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
	
	public void setForwardToDestination(boolean forwardToDestination) {
		this.forwardToDestination = forwardToDestination;
	}

	public void setDefaultTargetUrl(String defaultTargetUrl) {
		this.defaultTargetUrl = defaultTargetUrl;
	}

}
