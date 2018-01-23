package com.gh.crm.swork.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.gh.crm.swork.entity.Outflow;
import com.gh.crm.swork.entity.Station;
import com.gh.crm.swork.service.OutflowService;
import com.gh.crm.swork.service.imp.OutflowServiceImp;
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
public class OutflowAction extends ActionSupport implements ModelDriven<Outflow>,ServletRequestAware {
	private Outflow outflow = new Outflow();
	private OutflowService outflowService = new OutflowServiceImp();
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
	public void setOutflowService(OutflowService outflowService) {
		this.outflowService = outflowService;
	}
	public Outflow getModel() {
		// TODO Auto-generated method stub
		return outflow;
	}
	
	//分页查询咨询部学生管理
	public String showOutflow() {
		PageBean<Outflow> pageOutflow = outflowService.findByPage(page);

		ActionContext.getContext().getValueStack().set("pageOutflow", pageOutflow);

		return SUCCESS;
	}
	
	public String addOutflow(){
		outflow.setRunOffId(IDUtils.getCode());
		outflowService.addOutflow(outflow);
		
		return SUCCESS;
		
	}

}
