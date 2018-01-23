package com.gh.crm.teaching.dao.imp;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gh.crm.swork.entity.Student;
import com.gh.crm.teaching.dao.CourseTypeDao;
import com.gh.crm.teaching.entity.CourseType;
import com.gh.crm.utils.PageHibernateCallback;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public class CourseTypeDaoImp extends HibernateDaoSupport implements CourseTypeDao {
	
	 //查询表中总记录数
    public int findReferCount() {
        String hql="select count(*) from CourseType";
        List<Long> list=(List<Long>) this.getHibernateTemplate().find(hql);
        if(list!=null&&list.size()>0){
            return list.get(0).intValue();
        }
        return 0;
    }

    //查询当前页面的数据
    public List<CourseType> findByPageId(int begin, int limit) {
        String hql="from CourseType";
        List<CourseType> list=(List<CourseType>) this.getHibernateTemplate().execute((HibernateCallback<CourseType>) new PageHibernateCallback(hql, new Object[]{}, begin, limit));
        if(list!=null && list.size()>0){
            
            return list;
        }
        return null;
    }
    
    public void addCourseType(CourseType courseType){
    	this.getHibernateTemplate().save(courseType);
    }
    
    public void updateCourseType(CourseType courseType){
    	
    	this.getHibernateTemplate().update(courseType);
    }
    
    public List<CourseType> listCourseType(){
    	return this.getHibernateTemplate().find("from CourseType");
    }
}
