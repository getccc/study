package com.gh.crm.consult.entity;

import java.sql.Timestamp;

import com.gh.crm.resources.entity.Staff;
/**
 * 
 * @author CaiJianWei
 *
 * 2017-10-22
 */
public class Follow {

	private String followId;
	private Staff Staff;
	private Refer Refer;
	private String followTime;
	private String content;
	
	public Follow() {
		super();
		
	}
	public Follow(String followId, Staff staff, Refer refer, String followTime,
			String content) {
		super();
		this.followId = followId;
		Staff = staff;
		Refer = refer;
		this.followTime = followTime;
		this.content = content;
	}

	public String getFollowId() {
		return followId;
	}

	public void setFollowId(String followId) {
		this.followId = followId;
	}

	public Staff getStaff() {
		return Staff;
	}

	public void setStaff(Staff staff) {
		Staff = staff;
	}

	public Refer getRefer() {
		return Refer;
	}

	public void setRefer(Refer refer) {
		Refer = refer;
	}

	public String getFollowTime() {
		return followTime;
	}

	public void setFollowTime(String followTime) {
		this.followTime = followTime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
}