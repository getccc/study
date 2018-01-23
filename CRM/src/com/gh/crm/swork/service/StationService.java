package com.gh.crm.swork.service;

import com.gh.crm.swork.entity.Station;
import com.gh.crm.utils.PageBean;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public interface StationService {
	
	public PageBean<Station> findByPage(int page);
	
	public void addStation(Station station);
}
