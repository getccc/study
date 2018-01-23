package com.gh.crm.swork.entity;

import com.gh.crm.resources.entity.Staff;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-10-22
 */
public class Outflow {

	private String runOffId;
	private String createDate;
	private String isRefund;
	private String refundAmount;
	private String remark;
	
	private Staff Staff;
	private Student Student;
	public Outflow() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Outflow(String runOffId, String createDate, String isRefund,
			String refundAmount, String remark, Staff staff, Student student) {
		super();
		this.runOffId = runOffId;
		this.createDate = createDate;
		this.isRefund = isRefund;
		this.refundAmount = refundAmount;
		this.remark = remark;
		Staff = staff;
		Student = student;
	}
	public String getRunOffId() {
		return runOffId;
	}
	public void setRunOffId(String runOffId) {
		this.runOffId = runOffId;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getIsRefund() {
		return isRefund;
	}
	public void setIsRefund(String isRefund) {
		this.isRefund = isRefund;
	}
	public String getRefundAmount() {
		return refundAmount;
	}
	public void setRefundAmount(String refundAmount) {
		this.refundAmount = refundAmount;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
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