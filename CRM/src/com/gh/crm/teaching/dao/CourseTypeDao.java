package com.gh.crm.teaching.dao;

import java.util.List;

import com.gh.crm.teaching.entity.CourseType;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public interface CourseTypeDao {
	
	public int findReferCount();
	
	public List<CourseType> findByPageId(int begin, int limit);
	
	public void addCourseType(CourseType courseType);
	
	public void updateCourseType(CourseType courseType);
	
	public List<CourseType> listCourseType();
}
