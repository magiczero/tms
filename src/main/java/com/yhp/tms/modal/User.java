package com.yhp.tms.modal;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.validator.constraints.NotBlank;

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
	private String username;		//用户名
	@Column
	@JsonIgnore
	private String password;		//密码
	@Column(name="role_name")
	private String role;			//权限名
	@Column(name="real_name")
	private String realname;		//真实姓名
	@Column
	private String department;		//部门
	@Column
	private String duty;			//职务
	@Column(name="insert_time")
	private Date insertTime;	//创建时间
	@Column(name="last_login_time")
	private Timestamp lastTime;			//上次登录时间
	@Column(name="last_login_ip")
	private String ip;				//最后登录IP
	@ManyToOne(targetEntity=Group.class)
	@JoinColumn(name="group_id", referencedColumnName="id")
	private Group group;			//所属机构，公司，部门等
	
	//删除标志
	//private boolean delFlag;
	
	public Group getGroup() {
		return group;
	}
	public void setGroup(Group group) {
		this.group = group;
	}
	public Date getInsertTime() {
		return insertTime;
	}
	public void setInsertTime(Date insertTime) {
		this.insertTime = insertTime;
	}
	public Timestamp getLastTime() {
		return lastTime;
	}
	public void setLastTime(Timestamp lastTime) {
		this.lastTime = lastTime;
	}
	
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getDuty() {
		return duty;
	}
	public void setDuty(String duty) {
		this.duty = duty;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	@NotBlank(message="真实姓名必须填写")  
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	@NotBlank(message="角色必须填写")  
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
	@NotBlank(message="用户名必须填写")  
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@NotBlank(message="密码必须填写")  
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
