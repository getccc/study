package com.gh.crm.teaching.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.gh.crm.teaching.entity.Classes;
import com.gh.crm.teaching.entity.CourseType;
import com.gh.crm.teaching.service.ClassesService;
import com.gh.crm.teaching.service.imp.ClassesServiceImp;
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
public class ClassesAction extends ActionSupport implements ModelDriven<Classes>,ServletRequestAware {
	private Classes classes = new Classes();
	private ClassesService classesService = new ClassesServiceImp();
	private int page;
	HttpServletRequest request;
	private String courseTypeId;
	private String result;
	
	
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getCourseTypeId() {
		return courseTypeId;
	}
	public void setCourseTypeId(String courseTypeId) {
		this.courseTypeId = courseTypeId;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}
	public void setClassesService(ClassesService classesService) {
		this.classesService = classesService;
	}
	public Classes getModel() {
		// TODO Auto-generated method stub
		return classes;
	}
	
	//分页查询咨询部学生管理
	public String showClasses() {
		PageBean<Classes> pageClasses = classesService.findByPage(page);

		ActionContext.getContext().getValueStack().set("pageClasses", pageClasses);

		return SUCCESS;
	}
	
	public String addClasses(){
		classes.setClassId(IDUtils.getCode());
		
		CourseType courseType = new CourseType();
		courseType.setCourseTypeId(courseTypeId);
		classes.setCourseType(courseType);
		
		
		classesService.addClasses(classes);
		
		return SUCCESS;
	}
	
	public String updateClasses(){
		
		classesService.updateClasses(classes);
		
		return SUCCESS;
	}
	
	public String listClasses(){
		System.out.println(courseTypeId);
		CourseType courseType = new CourseType();
		courseType.setCourseTypeId(courseTypeId);
		classes.setCourseType(courseType);
		
		List<Classes> cla = classesService.listClasses(classes);
		
		 List<Map<String,String>> lists = new ArrayList<Map<String,String>>();
		
		for (int i = 0; i < cla.size(); i++) {
			Map<String, String> maps = new HashMap<String, String>();
			maps.put("classId", cla.get(i).getClassId());
			maps.put("name", cla.get(i).getName());
			lists.add(maps);
		}
		
		JSONArray jArray=JSONArray.fromObject(lists);  
	    result=jArray.toString();  
	    System.out.println(result);
		
		return SUCCESS;
	}

}
