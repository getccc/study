package com.gh.crm.employment.entity;


import com.gh.crm.swork.entity.Student;
import com.gh.crm.teaching.entity.Classes;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-10-22
 */
public class Graduate{

	private String granduateId;
	private String companyName;
	private String salary;
	private String post;
	private String entryTime;
	private String remark;
	
	private Classes Classes;
	private Student Student;
	
	
	public Graduate() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Graduate(String granduateId, String companyName, String salary,
			String post, String entryTime, String remark, Classes classes,
			Student student) {
		super();
		this.granduateId = granduateId;
		this.companyName = companyName;
		this.salary = salary;
		this.post = post;
		this.entryTime = entryTime;
		this.remark = remark;
		Classes = classes;
		Student = student;
	}
	public String getGranduateId() {
		return granduateId;
	}
	public void setGranduateId(String granduateId) {
		this.granduateId = granduateId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getEntryTime() {
		return entryTime;
	}
	public void setEntryTime(String entryTime) {
		this.entryTime = entryTime;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Classes getClasses() {
		return Classes;
	}
	public void setClasses(Classes classes) {
		Classes = classes;
	}
	public Student getStudent() {
		return Student;
	}
	public void setStudent(Student student) {
		Student = student;
	}	
	
}