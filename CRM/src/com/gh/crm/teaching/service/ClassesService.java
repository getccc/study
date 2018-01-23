package com.gh.crm.teaching.service;

import java.util.List;

import com.gh.crm.teaching.entity.Classes;
import com.gh.crm.utils.PageBean;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public interface ClassesService {
	
	public PageBean<Classes> findByPage(int page);
	
	public void addClasses(Classes classes);
	
	public void updateClasses(Classes classes);
	
	public List<Classes>  listClasses(Classes classes);
}	
