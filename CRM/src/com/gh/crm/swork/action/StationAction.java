package com.gh.crm.swork.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.gh.crm.swork.entity.Station;
import com.gh.crm.swork.entity.Student;
import com.gh.crm.swork.service.StationService;
import com.gh.crm.swork.service.imp.StationServiceImp;
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
public class StationAction extends ActionSupport implements ModelDriven<Station>,ServletRequestAware{
	private Station station = new Station();
	private StationService stationService = new StationServiceImp();
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
	public void setStationService(StationService stationService) {
		this.stationService = stationService;
	}
	
	public Station getModel() {
		
		return station;
	}
	
	//分页查询咨询部学生管理
	public String showStation() {
		PageBean<Station> pageStation = stationService.findByPage(page);

		ActionContext.getContext().getValueStack().set("pageStation", pageStation);

		return SUCCESS;
	}
	
	public String addStation(){
		station.setStationId(IDUtils.getCode());
		stationService.addStation(station);
		
		return SUCCESS;
	}

}
