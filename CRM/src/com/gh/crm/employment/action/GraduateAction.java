package com.gh.crm.employment.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.gh.crm.employment.entity.Graduate;
import com.gh.crm.employment.service.GraduateService;
import com.gh.crm.employment.service.imp.GraduateServiceImp;
import com.gh.crm.swork.entity.Student;
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
public class GraduateAction extends ActionSupport implements ModelDriven<Graduate>,ServletRequestAware {
	
	private Graduate graduate = new Graduate();
	private GraduateService graduateService = new GraduateServiceImp();
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
	
	public void setGraduateService(GraduateService graduateService) {
		this.graduateService = graduateService;
	}
	
	public Graduate getModel() {
		// TODO Auto-generated method stub
		return graduate;
	}
	
	//分页查询咨询部学生管理
	public String showGraduate() {
		PageBean<Graduate> pageGraduate = graduateService.findByPage(page);

		ActionContext.getContext().getValueStack().set("pageGraduate", pageGraduate);

		return SUCCESS;
	}
	
	public String addGraduate(){
		
		graduate.setGranduateId(IDUtils.getCode());
		graduateService.addGraduate(graduate);
		
		return SUCCESS;
	}
}
