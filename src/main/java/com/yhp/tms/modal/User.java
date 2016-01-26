package com.yhp.tms.modal;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="sys_user")
public class User implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6463135219197025248L;

	@Id
	@GeneratedValue
	private Integer id;
	@Column(name="user_name")
	private String username;
	@Column
	private String password;
	@Column(name="role_name")
	private String role;
	
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
