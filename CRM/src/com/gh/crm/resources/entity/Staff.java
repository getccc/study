package com.gh.crm.resources.entity;

import java.util.HashSet;
import java.util.Set;

import com.gh.crm.consult.entity.Follow;
import com.gh.crm.consult.entity.Refer;
import com.gh.crm.swork.entity.Outflow;
import com.gh.crm.swork.entity.Station;
/**
 * 
 * @author CaiJianWei
 *
 * 2017-10-22
 */

public class Staff {

	private String staffId;
	private String loginName;
	private String loginPwd;
	private String staffName;
	private String gender;
	private String onDutyDate;
	
	private Post Post;
	
	private Set<Outflow> Outflows = new HashSet<Outflow>();
	private Set<Station> Stations = new HashSet<Station>();
	private Set<Refer> Refers = new HashSet<Refer>();
	private Set<Follow> Follows = new HashSet<Follow>();
	
	public Staff() {
		super();
		
	}
	
	public Staff(String staffId, String loginName, String loginPwd,
			String staffName, String gender, String onDutyDate, Post post,
			Set<Outflow> outflows, Set<Station> stations, Set<Refer> refers,
			Set<Follow> follows) {
		super();
		this.staffId = staffId;
		this.loginName = loginName;
		this.loginPwd = loginPwd;
		this.staffName = staffName;
		this.gender = gender;
		this.onDutyDate = onDutyDate;
		Post = post;
		Outflows = outflows;
		Stations = stations;
		Refers = refers;
		Follows = follows;
	}
	public String getStaffId() {
		return staffId;
	}
	public void setStaffId(String staffId) {
		this.staffId = staffId;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getLoginPwd() {
		return loginPwd;
	}
	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}
	public String getStaffName() {
		return staffName;
	}
	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getOnDutyDate() {
		return onDutyDate;
	}
	public void setOnDutyDate(String onDutyDate) {
		this.onDutyDate = onDutyDate;
	}
	public Post getPost() {
		return Post;
	}
	public void setPost(Post post) {
		Post = post;
	}
	public Set<Outflow> getOutflows() {
		return Outflows;
	}
	public void setOutflows(Set<Outflow> outflows) {
		Outflows = outflows;
	}
	public Set<Station> getStations() {
		return Stations;
	}
	public void setStations(Set<Station> stations) {
		Stations = stations;
	}
	public Set<Refer> getRefers() {
		return Refers;
	}
	public void setRefers(Set<Refer> refers) {
		Refers = refers;
	}
	public Set<Follow> getFollows() {
		return Follows;
	}
	public void setFollows(Set<Follow> follows) {
		Follows = follows;
	}
	
	
	
}