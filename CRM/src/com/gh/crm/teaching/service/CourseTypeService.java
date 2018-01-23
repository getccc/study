package com.gh.crm.teaching.service;

import java.util.List;

import com.gh.crm.teaching.entity.CourseType;
import com.gh.crm.utils.PageBean;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public interface CourseTypeService {
	
	public PageBean<CourseType> findByPage(int page);
	
	public void addCourseType(CourseType courseType);
	
	public void updateCourseType(CourseType courseType);
	
	public List<CourseType> listCourseType();
}
