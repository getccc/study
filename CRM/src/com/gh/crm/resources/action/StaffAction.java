package com.gh.crm.resources.action;

import org.apache.struts2.ServletActionContext;

import com.gh.crm.resources.entity.Post;
import com.gh.crm.resources.entity.Staff;
import com.gh.crm.resources.service.StaffService;
import com.gh.crm.resources.service.imp.StaffServiceImp;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-10-22
 */
public class StaffAction extends ActionSupport implements ModelDriven<Staff>{
	private Staff staff = new Staff();
	private StaffService staffService = new StaffServiceImp();
	private String newpwd;	
	private String newTwoPwd;
	private String postId;
	
		
	
	public String getPostId() {
		return postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}

	public String getNewpwd() {
		return newpwd;
	}

	public void setNewpwd(String newpwd) {
		this.newpwd = newpwd;
	}

	public String getNewTwoPwd() {
		return newTwoPwd;
	}

	public void setNewTwoPwd(String newTwoPwd) {
		this.newTwoPwd = newTwoPwd;
	}

	public void setStaffService(StaffService staffService) {
		this.staffService = staffService;
	}

	public Staff getModel() {
		// TODO Auto-generated method stub
		return staff;
	}
	
	//登录
	public String login(){
		if (staffService.login(staff)) {
			
			return SUCCESS;
		}else{
			return ERROR;
		}
	}
	
	//修改密码
	public String updatePasswd(){
		String loginPwd = staff.getLoginPwd();
//		String newPwd = ServletActionContext.getRequest().getParameter("newpwd");
//		System.out.println(loginPwd);
//		System.out.println(newpwd);
		if (staffService.updPwd(loginPwd, newpwd)) {
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	public String addStaff(){
		System.out.println(postId);
		Post post = new Post();
		post.setPostId(postId);
		staff.setPost(post);
//		staff.getPost().setPostId(postId);
		staffService.addStaff(staff);
		
		return SUCCESS;
	}
	
	public String listStaff(){
		System.out.println(postId);
		
		staffService.listStaff(postId,staff);
		
		return SUCCESS;
	}
	
	public String updateStaff(){
		
		staffService.updateStaff(staff);
		
		return SUCCESS;
	}
	
	public String editStaff(){
		staffService.editStaff(staff);
		
		return SUCCESS;
	}

}
