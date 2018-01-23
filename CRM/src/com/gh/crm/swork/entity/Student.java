package com.gh.crm.swork.entity;

import java.util.HashSet;
import java.util.Set;

import com.gh.crm.consult.entity.Refer;
import com.gh.crm.employment.entity.Graduate;
import com.gh.crm.teaching.entity.Classes;
/**
 * 
 * @author CaiJianWei
 *
 * 2017-10-22
 */

public class Student {

	private String studentId;
	private String name;
	private String gender;
	private Integer mustTuition;
	private Integer actualTuition;
	private String telephone;
	private String identity;
	private String qq;
	private String email;
	private String school;
	private String education;
	private String professional;
	private String status;
	private String inschooltime;
	private String address;
	private String remark;
	private String homeTelephone;
	private String homeUser;
	
	private Refer Refer;
	private Classes Classes;
	
	private Set<Station> Stations = new HashSet<Station>();
	private Set<Graduate> Graduates = new HashSet<Graduate>();
	private Set<Outflow> Outflows = new HashSet<Outflow>();
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Student(String studentId, String name, String gender,
			Integer mustTuition, Integer actualTuition, String telephone,
			String identity, String qq, String email, String school,
			String education, String professional, String status,
			String inschooltime, String address, String remark,
			String homeTelephone, String homeUser, Refer refer,
			Classes classes, Set<Station> stations, Set<Graduate> graduates,
			Set<Outflow> outflows) {
		super();
		this.studentId = studentId;
		this.name = name;
		this.gender = gender;
		this.mustTuition = mustTuition;
		this.actualTuition = actualTuition;
		this.telephone = telephone;
		this.identity = identity;
		this.qq = qq;
		this.email = email;
		this.school = school;
		this.education = education;
		this.professional = professional;
		this.status = status;
		this.inschooltime = inschooltime;
		this.address = address;
		this.remark = remark;
		this.homeTelephone = homeTelephone;
		this.homeUser = homeUser;
		Refer = refer;
		Classes = classes;
		Stations = stations;
		Graduates = graduates;
		Outflows = outflows;
	}

	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Integer getMustTuition() {
		return mustTuition;
	}
	public void setMustTuition(Integer mustTuition) {
		this.mustTuition = mustTuition;
	}
	public Integer getActualTuition() {
		return actualTuition;
	}
	public void setActualTuition(Integer actualTuition) {
		this.actualTuition = actualTuition;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getIdentity() {
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getProfessional() {
		return professional;
	}
	public void setProfessional(String professional) {
		this.professional = professional;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	public String getInschooltime() {
		return inschooltime;
	}

	public void setInschooltime(String inschooltime) {
		this.inschooltime = inschooltime;
	}

	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getHomeTelephone() {
		return homeTelephone;
	}
	public void setHomeTelephone(String homeTelephone) {
		this.homeTelephone = homeTelephone;
	}
	public String getHomeUser() {
		return homeUser;
	}
	public void setHomeUser(String homeUser) {
		this.homeUser = homeUser;
	}
	public Refer getRefer() {
		return Refer;
	}
	public void setRefer(Refer refer) {
		Refer = refer;
	}
	
	public Classes getClasses() {
		return Classes;
	}

	public void setClasses(Classes classes) {
		Classes = classes;
	}

	public Set<Station> getStations() {
		return Stations;
	}
	public void setStations(Set<Station> stations) {
		Stations = stations;
	}
	public Set<Graduate> getGraduates() {
		return Graduates;
	}
	public void setGraduates(Set<Graduate> graduates) {
		Graduates = graduates;
	}
	public Set<Outflow> getOutflows() {
		return Outflows;
	}
	public void setOutflows(Set<Outflow> outflows) {
		Outflows = outflows;
	}
	
	
}