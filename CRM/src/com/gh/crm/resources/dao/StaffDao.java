package com.gh.crm.resources.dao;

import java.util.List;

import com.gh.crm.resources.entity.Staff;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-10-22
 */
public interface StaffDao {
	
	public Staff getStaff(Staff staff);
	
	public Staff getStaffByname(Staff staff);
	
	public void updPwd(Staff staff);
	
	public void addStaff(Staff staff);
	
	public void editStaff(Staff staff);
	
	public List<Staff> listStaff(String postId);
}
