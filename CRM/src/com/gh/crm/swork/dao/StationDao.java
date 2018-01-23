package com.gh.crm.swork.dao;

import java.util.List;

import com.gh.crm.swork.entity.Station;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public interface StationDao {
	
	 public int findReferCount();
	 
	 public List<Station> findByPageId(int begin, int limit);
	 
	 public void addStation(Station station);
}
