package com.gh.crm.resources.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.gh.crm.resources.entity.Department;
import com.gh.crm.resources.service.DepartmentService;
import com.gh.crm.resources.service.imp.DepartmentServiceImp;
import com.gh.crm.utils.IDUtils;
import com.gh.crm.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-10-24
 */
public class DepartmentAction extends ActionSupport implements ModelDriven<Department>,ServletRequestAware {
	
	private Department department = new Department();
	private DepartmentService departmentService = new DepartmentServiceImp();
	private int page;
	HttpServletRequest request;
			
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
	}
	
	public Department getModel() {
		// TODO Auto-generated method stub
		return department;
	}
	
	public String addDepartment(){
		String depId = IDUtils.getCode();
		department.setDepId(depId);
		System.out.println(department.getDepName());
		departmentService.addDepartment(department);
		return SUCCESS;
	}
	
	 public String showAll(){
	    PageBean<Department> pagebean=departmentService.findByPage(page);
	      
	    ActionContext.getContext().getValueStack().set("pagebean", pagebean);
	    
	    return SUCCESS;
	 }
	 
	 public String AllDepartment(){
	
		 List<Department> departments = departmentService.listDepartment();
		 
		 ActionContext.getContext().getValueStack().set("departments", departments);
		
		 return SUCCESS;
	 }
	 
	 public String AllDept(){
		 
		 List<Department> departments = departmentService.listDepartment();
		 
		 ActionContext.getContext().getValueStack().set("sdepartments", departments);
		
		 return SUCCESS;
	 }
	 
	 public String AllDepts(){
		 
		 List<Department> departments = departmentService.listDepartment();
		 
		 ActionContext.getContext().getValueStack().set("sdepartments", departments);
		
		 return SUCCESS;
	 }
	 
	 public String updateDept(){
		 
		 departmentService.updateDept(department);
		 
		 return SUCCESS;
	 }

	
}
