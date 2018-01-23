package com.gh.crm.consult.service;

import com.gh.crm.consult.entity.Refer;
import com.gh.crm.utils.PageBean;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public interface ReferService {
	
	public PageBean<Refer> findByPage(int page);
	
	public void addRefer(Refer refer);
	
	public Refer getRefer(Refer refer);
}
