package com.gh.crm.employment.dao;

import java.util.List;

import com.gh.crm.employment.entity.Graduate;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public interface GraduateDao {
	
	public int findCount();
	
	public List<Graduate> findByPageId(int begin, int limit);
	
	public void addGraduate(Graduate graduate);
}	
