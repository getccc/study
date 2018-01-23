package com.gh.crm.teaching.dao;

import java.util.List;

import com.gh.crm.teaching.entity.Classes;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public interface ClassesDao {
	
	 public int findCount();
	 
	 public List<Classes> findByPageId(int begin, int limit);
	 
	 public void addClasses(Classes classes);
	 
	 public void updateClasses(Classes classes);
	 
	 public List<Classes>  listClasses(Classes classes);
}
