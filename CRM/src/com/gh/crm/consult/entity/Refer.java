package com.gh.crm.consult.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import com.gh.crm.resources.entity.Staff;
import com.gh.crm.swork.entity.Student;
import com.gh.crm.teaching.entity.Classes;
import com.gh.crm.teaching.entity.CourseType;
/**
 * 
 * @author CaiJianWei
 *
 * 2017-10-22
 */
public class Refer {


	private String referId;
	private CourseType CourseType;
	private Staff Staff;
	private Classes Classes;
	private String name;
	private String telephone;
	private String qq;
	private String createDate;
	private String intentionLevel;
	private String source;
	private String status;
	private String remark;
	
	
	
	private Set<Student> Students = new HashSet<Student>();
	private Set<Follow> Follows = new HashSet<Follow>();
	
	
	public Refer() {
		super();
		
	}
	
	public Refer(String referId, CourseType courseType, Staff staff,
			Classes classes, String name, String telephone, String qq,
			String createDate, String intentionLevel, String source,
			String status, String remark, Set<Student> students,
			Set<Follow> follows) {
		super();
		this.referId = referId;
		CourseType = courseType;
		Staff = staff;
		Classes = classes;
		this.name = name;
		this.telephone = telephone;
		this.qq = qq;
		this.createDate = createDate;
		this.intentionLevel = intentionLevel;
		this.source = source;
		this.status = status;
		this.remark = remark;
		Students = students;
		Follows = follows;
	}

	public String getReferId() {
		return referId;
	}


	public void setReferId(String referId) {
		this.referId = referId;
	}


	public CourseType getCourseType() {
		return CourseType;
	}


	public void setCourseType(CourseType courseType) {
		CourseType = courseType;
	}
	

	public Classes getClasses() {
		return Classes;
	}

	public void setClasses(Classes classes) {
		Classes = classes;
	}

	public Staff getStaff() {
		return Staff;
	}


	public void setStaff(Staff staff) {
		Staff = staff;
	}

	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getTelephone() {
		return telephone;
	}


	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}


	public String getQq() {
		return qq;
	}


	public void setQq(String qq) {
		this.qq = qq;
	}


	public String getCreateDate() {
		return createDate;
	}


	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}


	public String getIntentionLevel() {
		return intentionLevel;
	}


	public void setIntentionLevel(String intentionLevel) {
		this.intentionLevel = intentionLevel;
	}


	public String getSource() {
		return source;
	}


	public void setSource(String source) {
		this.source = source;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getRemark() {
		return remark;
	}


	public void setRemark(String remark) {
		this.remark = remark;
	}


	public Set<Student> getStudents() {
		return Students;
	}


	public void setStudents(Set<Student> students) {
		Students = students;
	}


	public Set<Follow> getFollows() {
		return Follows;
	}


	public void setFollows(Set<Follow> follows) {
		Follows = follows;
	}
	
	
}