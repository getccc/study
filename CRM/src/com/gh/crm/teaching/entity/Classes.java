package com.gh.crm.teaching.entity;

import java.util.HashSet;
import java.util.Set;

import com.gh.crm.consult.entity.Refer;
import com.gh.crm.employment.entity.Graduate;
import com.gh.crm.swork.entity.Station;
import com.gh.crm.swork.entity.Student;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-10-22
 */

public class Classes {

	private String classId;
	private String name;
	private String beginTime;
	private String endTime;
	private String status;
	private Integer totalCount;
	private Integer upgradeCount;
	private Integer changeCount;
	private Integer runoffCount;
	private String remark;
	private String uploadTime;
	private String uploadPath;
	private String uploadFilename;
	
	private CourseType CourseType;
	
	private Set<Student> Students = new HashSet<Student>();
	private Set<Refer> Refers = new HashSet<Refer>();
	private Set<Station> StationsForBeforeClassId = new HashSet<Station>();
	private Set<Station> StationsForAfterClassId = new HashSet<Station>();
	private Set<Graduate> Graduates = new HashSet<Graduate>();
	public Classes() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Classes(String classId, String name, String beginTime,
			String endTime, String status, Integer totalCount,
			Integer upgradeCount, Integer changeCount, Integer runoffCount,
			String remark, String uploadTime, String uploadPath,
			String uploadFilename, CourseType courseType,
			Set<Student> students, Set<Refer> refers,
			Set<Station> stationsForBeforeClassId,
			Set<Station> stationsForAfterClassId, Set<Graduate> graduates) {
		super();
		this.classId = classId;
		this.name = name;
		this.beginTime = beginTime;
		this.endTime = endTime;
		this.status = status;
		this.totalCount = totalCount;
		this.upgradeCount = upgradeCount;
		this.changeCount = changeCount;
		this.runoffCount = runoffCount;
		this.remark = remark;
		this.uploadTime = uploadTime;
		this.uploadPath = uploadPath;
		this.uploadFilename = uploadFilename;
		CourseType = courseType;
		Students = students;
		Refers = refers;
		StationsForBeforeClassId = stationsForBeforeClassId;
		StationsForAfterClassId = stationsForAfterClassId;
		Graduates = graduates;
	}

	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
	public Integer getUpgradeCount() {
		return upgradeCount;
	}
	public void setUpgradeCount(Integer upgradeCount) {
		this.upgradeCount = upgradeCount;
	}
	public Integer getChangeCount() {
		return changeCount;
	}
	public void setChangeCount(Integer changeCount) {
		this.changeCount = changeCount;
	}
	public Integer getRunoffCount() {
		return runoffCount;
	}
	public void setRunoffCount(Integer runoffCount) {
		this.runoffCount = runoffCount;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(String uploadTime) {
		this.uploadTime = uploadTime;
	}
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	public String getUploadFilename() {
		return uploadFilename;
	}
	public void setUploadFilename(String uploadFilename) {
		this.uploadFilename = uploadFilename;
	}
	public CourseType getCourseType() {
		return CourseType;
	}
	public void setCourseType(CourseType CourseType) {
		this.CourseType = CourseType;
	}
	public Set<Student> getStudents() {
		return Students;
	}
	public void setStudents(Set<Student> students) {
		Students = students;
	}
	public Set<Refer> getRefers() {
		return Refers;
	}
	public void setRefers(Set<Refer> refers) {
		Refers = refers;
	}

	public Set<Station> getStationsForBeforeClassId() {
		return StationsForBeforeClassId;
	}

	public void setStationsForBeforeClassId(Set<Station> stationsForBeforeClassId) {
		StationsForBeforeClassId = stationsForBeforeClassId;
	}

	public Set<Station> getStationsForAfterClassId() {
		return StationsForAfterClassId;
	}

	public void setStationsForAfterClassId(Set<Station> stationsForAfterClassId) {
		StationsForAfterClassId = stationsForAfterClassId;
	}

	public Set<Graduate> getGraduates() {
		return Graduates;
	}

	public void setGraduates(Set<Graduate> graduates) {
		Graduates = graduates;
	}
	
	
	
	
}