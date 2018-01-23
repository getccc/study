package com.gh.crm.teaching.entity;

import java.util.HashSet;
import java.util.Set;

import com.gh.crm.consult.entity.Refer;
/**
 * 
 * @author CaiJianWei
 *
 * 2017-10-22
 */
public class CourseType {

	private String courseTypeId;
	private Double courseCost;
	private Integer total;
	private String courseName;
	private String remark;
	
	
	private Set<Refer> Refers = new HashSet<Refer>();
	private Set<Classes> Classes = new HashSet<Classes>();
	public CourseType() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CourseType(String courseTypeId, Double courseCost, Integer total,
			String courseName, String remark, Set<Refer> refers,
			Set<Classes> classes) {
		super();
		this.courseTypeId = courseTypeId;
		this.courseCost = courseCost;
		this.total = total;
		this.courseName = courseName;
		this.remark = remark;
		Refers = refers;
		Classes = classes;
	}
	public String getCourseTypeId() {
		return courseTypeId;
	}
	public void setCourseTypeId(String courseTypeId) {
		this.courseTypeId = courseTypeId;
	}
	public Double getCourseCost() {
		return courseCost;
	}
	public void setCourseCost(Double courseCost) {
		this.courseCost = courseCost;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Set<Refer> getRefers() {
		return Refers;
	}
	public void setRefers(Set<Refer> refers) {
		Refers = refers;
	}
	public Set<Classes> getClasses() {
		return Classes;
	}
	public void setClasses(Set<Classes> classes) {
		Classes = classes;
	}
	
	
	
}