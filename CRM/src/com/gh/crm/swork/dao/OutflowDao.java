package com.gh.crm.swork.dao;

import java.util.List;

import com.gh.crm.swork.entity.Outflow;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public interface OutflowDao {
	
	 public int findReferCount();
	 
	 public List<Outflow> findByPageId(int begin, int limit);
	 
	 public void addOutflow(Outflow outflow);
}
