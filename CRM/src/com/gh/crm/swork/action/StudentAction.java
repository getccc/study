package com.gh.crm.swork.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.gh.crm.swork.entity.Student;
import com.gh.crm.swork.service.StudentService;
import com.gh.crm.swork.service.imp.StudentServiceImp;
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
public class StudentAction extends ActionSupport implements ModelDriven<Student>,ServletRequestAware {
	
	private Student student = new Student();
	private StudentService studentService = new StudentServiceImp();
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
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	public Student getModel() {
		
		return student;
	}
	
	//分页查询咨询部学生管理
	public String showStudent() {
		PageBean<Student> pageStudent = studentService.findByPage(page);

		ActionContext.getContext().getValueStack().set("pageStudent", pageStudent);

		return SUCCESS;
	}
	
	public String addStudent(){
		student.setStudentId(IDUtils.getCode());
		SimpleDateFormat bartDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date(); 
		student.setInschooltime(bartDateFormat.format(date));
		studentService.addStudent(student);
		return SUCCESS;
	}
	
	

}
