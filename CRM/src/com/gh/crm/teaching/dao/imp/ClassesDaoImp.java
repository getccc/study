package com.gh.crm.teaching.dao.imp;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gh.crm.teaching.dao.ClassesDao;
import com.gh.crm.teaching.entity.Classes;
import com.gh.crm.teaching.entity.CourseType;
import com.gh.crm.utils.PageHibernateCallback;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public class ClassesDaoImp extends HibernateDaoSupport implements ClassesDao {
	
	 //查询表中总记录数
    public int findCount() {
    	 System.out.println(11);
        String hql="select count(*) from Classes";
       
        List<Long> list=(List<Long>) this.getHibernateTemplate().find(hql);
        if(list!=null&&list.size()>0){
            return list.get(0).intValue();
        }
        return 0;
    }

    //查询当前页面的数据
    public List<Classes> findByPageId(int begin, int limit) {
        String hql="from Classes";
        List<Classes> list=(List<Classes>) this.getHibernateTemplate().execute((HibernateCallback<Classes>) new PageHibernateCallback(hql, new Object[]{}, begin, limit));
        if(list!=null && list.size()>0){
            
            return list;
        }
        return null;
    }
    
    public void addClasses(Classes classes){
    	this.getHibernateTemplate().save(classes);
    }
    
    public void updateClasses(Classes classes){
    	this.getHibernateTemplate().update(classes);
    }
    
    public List<Classes>  listClasses(Classes classes){
    	
    	return this.getHibernateTemplate().find("from Classes where courseTypeId = ?",classes.getCourseType().getCourseTypeId());
    }
}
