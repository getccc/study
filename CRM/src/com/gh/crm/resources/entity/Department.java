package com.gh.crm.resources.entity;

import java.util.HashSet;
import java.util.Set;
/**
 * 
 * @author CaiJianWei
 *
 * 2017-10-22
 */
public class Department {

	private String depId;
	private String depName;
	
	
	private Set<Post> Posts = new HashSet<Post>();

	public Department() {
		super();
		
	}

	public Department(String depId, String depName, Set<Post> posts) {
		super();
		this.depId = depId;
		this.depName = depName;
		Posts = posts;
	}

	public String getDepId() {
		return depId;
	}

	public void setDepId(String depId) {
		this.depId = depId;
	}

	public String getDepName() {
		return depName;
	}

	public void setDepName(String depName) {
		this.depName = depName;
	}

	public Set<Post> getPosts() {
		return Posts;
	}

	public void setPosts(Set<Post> posts) {
		Posts = posts;
	}
	
}