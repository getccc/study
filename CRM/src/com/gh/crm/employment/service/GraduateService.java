package com.gh.crm.employment.service;

import com.gh.crm.employment.entity.Graduate;
import com.gh.crm.utils.PageBean;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public interface GraduateService {
	
	public PageBean<Graduate> findByPage(int page);
	
	public void addGraduate(Graduate graduate);
}
