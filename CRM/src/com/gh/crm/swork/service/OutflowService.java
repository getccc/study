package com.gh.crm.swork.service;

import com.gh.crm.swork.entity.Outflow;
import com.gh.crm.utils.PageBean;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public interface OutflowService {
	
	public PageBean<Outflow> findByPage(int page);
	
	public void addOutflow(Outflow outflow);
}
