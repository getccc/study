package com.gh.crm.consult.dao;

import java.util.List;

import com.gh.crm.consult.entity.Refer;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public interface ReferDao {
	
	public List<Refer> listRefer();
	
	public void addRefer(Refer refer);
	
	public int findReferCount();
	 
	public List<Refer> findByPageId(int begin, int limit);
	
	public Refer getRefer(Refer refer);
}
