package com.gh.crm.resources.service;

import java.util.List;

import com.gh.crm.resources.entity.Staff;

/**
 * 工作人员
 * @author CaiJianWei
 *
 * 2017-10-22
 */
public interface StaffService {
	
	public boolean login(Staff staff);
	
	public boolean updPwd(String loginPwd,String newPwd);
	
	public void addStaff(Staff staff);
	
	public void listStaff(String postId,Staff staff);
	
	public void updateStaff(Staff staff);
	
	public void editStaff(Staff staff);
}
