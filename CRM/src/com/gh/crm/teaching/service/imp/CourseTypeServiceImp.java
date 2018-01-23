package com.gh.crm.teaching.service.imp;

import java.util.List;

import com.gh.crm.swork.entity.Student;
import com.gh.crm.teaching.dao.CourseTypeDao;
import com.gh.crm.teaching.entity.CourseType;
import com.gh.crm.teaching.service.CourseTypeService;
import com.gh.crm.utils.PageBean;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public class CourseTypeServiceImp implements CourseTypeService {
	private CourseTypeDao courseTypeDao;
	public void setCourseTypeDao(CourseTypeDao courseTypeDao) {
		this.courseTypeDao = courseTypeDao;
	}
	
	public PageBean<CourseType> findByPage(int page) {
        PageBean<CourseType> pageBean =new PageBean<CourseType>();
        pageBean.setPage(page);
        int limit=3;
        pageBean.setLimit(limit);
        
        int totalCount=courseTypeDao.findReferCount();
        pageBean.setTotalCount(totalCount);
        //总页数
        int totalpage=(int)Math.ceil(totalCount/limit)+1;
        
        pageBean.setTotalPage(totalpage);
        //每页显示的数据集合
        int begin=(page-1)*limit;
        List<CourseType> list=courseTypeDao.findByPageId(begin, limit);
        pageBean.setList(list);
        return pageBean;
    }
	
	public void addCourseType(CourseType courseType){
		courseTypeDao.addCourseType(courseType);
	}
	
	public void updateCourseType(CourseType courseType){
		courseTypeDao.updateCourseType(courseType);
	}
	
	public List<CourseType> listCourseType(){
		
		return courseTypeDao.listCourseType();
	}
}
