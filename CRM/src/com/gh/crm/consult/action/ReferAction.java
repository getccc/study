package com.gh.crm.consult.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.gh.crm.consult.entity.Refer;
import com.gh.crm.consult.service.ReferService;
import com.gh.crm.consult.service.imp.ReferServiceImp;
import com.gh.crm.resources.entity.Department;
import com.gh.crm.utils.IDUtils;
import com.gh.crm.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 
 * @author CaiJianWei
 * 
 *         2017-11-1
 */
public class ReferAction extends ActionSupport implements ModelDriven<Refer>,
		ServletRequestAware {

	private Refer refer = new Refer();
	private ReferService referService = new ReferServiceImp();
	private int page;
	HttpServletRequest request;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public void setReferService(ReferService referService) {
		this.referService = referService;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;

	}

	public Refer getModel() {

		return refer;
	}
	
	//添加咨询部学生
	public String addRefer() {
		refer.setReferId(IDUtils.getCode());
		referService.addRefer(refer);

		return SUCCESS;
	}
	
	//分页查询咨询部学生管理
	public String showRefer() {
		PageBean<Refer> pageRefer = referService.findByPage(page);

		ActionContext.getContext().getValueStack().set("pageRefer", pageRefer);

		return SUCCESS;
	}
	
	public String getRefer(){
		
		Refer getRefer = referService.getRefer(refer);
		
		ActionContext.getContext().getValueStack().set("getRefer", getRefer);
		
		return SUCCESS;
	}

}
