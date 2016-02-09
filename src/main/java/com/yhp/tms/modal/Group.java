package com.yhp.tms.modal;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

@Entity
@Table(name="sys_group")
public class Group implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6954390597814656693L;
	
	private int id;
	private String groupName;
	private Group parentGroup;
	private Set<Group> child = new HashSet<Group>();
	private String explain;
	private Set<User> users = new HashSet<User>();
	
	//@OneToMany(targetEntity=User.class)
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "group")  
    @NotFound(action = NotFoundAction.IGNORE)
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="group_name")
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	
	@ManyToOne(targetEntity=Group.class)
	@JoinColumn(name = "parent_id")
	public Group getParentGroup() {
		return parentGroup;
	}
	public void setParentGroup(Group parentGroup) {
		this.parentGroup = parentGroup;
	}
	
	@OneToMany(targetEntity=Group.class)
	public Set<Group> getChild() {
		return child;
	}
	public void setChild(Set<Group> child) {
		this.child = child;
	}
	
	@Column(name="remark_")
	public String getExplain() {
		return explain;
	}
	public void setExplain(String explain) {
		this.explain = explain;
	}
	
}
