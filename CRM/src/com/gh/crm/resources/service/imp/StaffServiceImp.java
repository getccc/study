package com.gh.crm.resources.service.imp;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.gh.crm.resources.dao.StaffDao;
import com.gh.crm.resources.entity.Staff;
import com.gh.crm.resources.service.StaffService;
import com.gh.crm.utils.IDUtils;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-10-22
 */
public class StaffServiceImp implements StaffService {
	
	private StaffDao staffDao;
	
	public void setStaffDao(StaffDao staffDao) {
		this.staffDao = staffDao;
	}
	
	//登录
	public boolean login(Staff staff){
		Staff staff2 = staffDao.getStaff(staff);
		if (staff2.getLoginPwd().equals(IDUtils.getMD5(staff.getLoginPwd()))) {
			ServletActionContext.getRequest().getSession().setAttribute("staff", staff2);
			SimpleDateFormat bartDateFormat = new SimpleDateFormat("yyyy-MM-dd  EEEE");
			Date date = new Date(); 
			ServletActionContext.getRequest().getSession().setAttribute("date",bartDateFormat.format(date));
			return true;
		}else{
			return false;
		}
	}
	
	//修改密码
	public boolean updPwd(String loginPwd,String newPwd){
		Staff staff = (Staff) ServletActionContext.getRequest().getSession().getAttribute("staff");
//		System.out.println(staff.getLoginPwd());
		String loginPwd1 = IDUtils.getMD5(loginPwd);
//		System.out.println(loginPwd1);
		if (staff.getLoginPwd().equals(loginPwd1)) {
			String pass  = IDUtils.getMD5(newPwd);
			staff.setLoginPwd(pass);
//			System.out.println(pass);
			staffDao.updPwd(staff);
			return true;
		}else{
			return false;
		}
	
	}
	
	public void addStaff(Staff staff){
		staff.setStaffId(IDUtils.getCode());
		String str = IDUtils.getMD5(staff.getLoginPwd());
		staff.setLoginPwd(str);
		
		staffDao.addStaff(staff);
	}
	
	public void listStaff(String postId,Staff staff){
		
		if (staff.getStaffName() == null | staff.getStaffName().equals("")) {
			List<Staff> stafflist = staffDao.listStaff(postId);
			ServletActionContext.getRequest().getSession().setAttribute("stafflist", stafflist);
		}else{
			Staff staff2 = staffDao.getStaffByname(staff);
			ServletActionContext.getRequest().getSession().setAttribute("staffByName", staff2);
		}
	}
	
	public void updateStaff(Staff staff){
		System.out.println(staff.getLoginName());
		Staff updatestaff = staffDao.getStaff(staff);
		System.out.println(updatestaff.getStaffName());
		ServletActionContext.getRequest().getSession().setAttribute("updatestaff", updatestaff);
	}
	
	public void editStaff(Staff staff){
		staffDao.editStaff(staff);
	}

}
