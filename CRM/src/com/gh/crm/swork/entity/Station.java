package com.gh.crm.swork.entity;

import com.gh.crm.resources.entity.Staff;
import com.gh.crm.teaching.entity.Classes;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-10-22
 */

public class Station {

	private String stationId;
	private String flag;
	private String createDate;
	
	private Classes ClassByAfterClassId;
	private Classes ClassByBeforeClassId;
	private Staff Staff;
	private Student Student;
	
	
	public Station() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Station(String stationId, String flag, String createDate,
			Classes classByAfterClassId, Classes classByBeforeClassId,
			Staff staff, Student student) {
		super();
		this.stationId = stationId;
		this.flag = flag;
		this.createDate = createDate;
		ClassByAfterClassId = classByAfterClassId;
		ClassByBeforeClassId = classByBeforeClassId;
		Staff = staff;
		Student = student;
	}
	public String getStationId() {
		return stationId;
	}
	public void setStationId(String stationId) {
		this.stationId = stationId;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public Classes getClassByAfterClassId() {
		return ClassByAfterClassId;
	}
	public void setClassByAfterClassId(Classes classByAfterClassId) {
		ClassByAfterClassId = classByAfterClassId;
	}
	public Classes getClassByBeforeClassId() {
		return ClassByBeforeClassId;
	}
	public void setClassByBeforeClassId(Classes classByBeforeClassId) {
		ClassByBeforeClassId = classByBeforeClassId;
	}
	public Staff getStaff() {
		return Staff;
	}
	public void setStaff(Staff staff) {
		Staff = staff;
	}
	public Student getStudent() {
		return Student;
	}
	public void setStudent(Student student) {
		Student = student;
	}
	
	
}