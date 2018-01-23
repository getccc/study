package com.gh.crm.resources.entity;

import java.util.HashSet;
import java.util.Set;
/**
 * 
 * @author CaiJianWei
 *
 * 2017-10-22
 */

public class Post {

	private String postId;
	private String postName;
	
	private Department Department;
	
	private Set<Staff> Staffs = new HashSet<Staff>();

	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Post(String postId, String postName, Department department,
			Set<Staff> staffs) {
		super();
		this.postId = postId;
		this.postName = postName;
		Department = department;
		Staffs = staffs;
	}

	public String getPostId() {
		return postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}

	public String getPostName() {
		return postName;
	}

	public void setPostName(String postName) {
		this.postName = postName;
	}

	public Department getDepartment() {
		return Department;
	}

	public void setDepartment(Department department) {
		Department = department;
	}

	public Set<Staff> getStaffs() {
		return Staffs;
	}

	public void setStaffs(Set<Staff> staffs) {
		Staffs = staffs;
	}
	
	
	
}