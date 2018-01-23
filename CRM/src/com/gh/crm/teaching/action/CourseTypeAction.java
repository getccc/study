package com.gh.crm.teaching.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.gh.crm.swork.entity.Student;
import com.gh.crm.teaching.entity.CourseType;
import com.gh.crm.teaching.service.CourseTypeService;
import com.gh.crm.teaching.service.imp.CourseTypeServiceImp;
import com.gh.crm.utils.IDUtils;
import com.gh.crm.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public class CourseTypeAction extends ActionSupport implements ModelDriven<CourseType>,ServletRequestAware {
	private CourseType courseType = new CourseType();
	private CourseTypeService courseTypeService = new CourseTypeServiceImp();
	private int page;
	HttpServletRequest request;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}
	public void setCourseTypeService(CourseTypeService courseTypeService) {
		this.courseTypeService = courseTypeService;
	}
	public CourseType getModel() {
		
		return courseType;
	}
	
	
	//分页查询咨询部学生管理
	public String showCourseType() {
		PageBean<CourseType> pageCourseType = courseTypeService.findByPage(page);

		ActionContext.getContext().getValueStack().set("pageCourseType", pageCourseType);

		return SUCCESS;
	}
	
	public String addCourseType(){
		courseType.setCourseTypeId(IDUtils.getCode());
		
		courseTypeService.addCourseType(courseType);
		
		return SUCCESS;
	}
	
	public String updateCourseType(){
		
		courseTypeService.updateCourseType(courseType);
		
		return SUCCESS;
	}
	
	public String AllCourseType(){
		
		List<CourseType> courseTypes = courseTypeService.listCourseType();
		
		ActionContext.getContext().getValueStack().set("courseTypes", courseTypes);
		
		return SUCCESS;
	}
	
	public String listCourseType(){
		
		List<CourseType> courseTypes = courseTypeService.listCourseType();
		
		ActionContext.getContext().getValueStack().set("listCourseType", courseTypes);
		
		return SUCCESS;
	}
	
	

}
