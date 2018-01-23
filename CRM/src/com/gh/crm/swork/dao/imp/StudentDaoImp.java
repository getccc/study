package com.gh.crm.swork.dao.imp;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gh.crm.swork.dao.StudentDao;
import com.gh.crm.swork.entity.Student;
import com.gh.crm.utils.PageHibernateCallback;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public class StudentDaoImp extends HibernateDaoSupport implements StudentDao {
	
	 //查询表中总记录数
    public int findReferCount() {
        String hql="select count(*) from Student";
        List<Long> list=(List<Long>) this.getHibernateTemplate().find(hql);
        if(list!=null&&list.size()>0){
            return list.get(0).intValue();
        }
        return 0;
    }

    //查询当前页面的数据
    public List<Student> findByPageId(int begin, int limit) {
        String hql="from Student";
        List<Student> list=(List<Student>) this.getHibernateTemplate().execute((HibernateCallback<Student>) new PageHibernateCallback(hql, new Object[]{}, begin, limit));
        if(list!=null && list.size()>0){
            
            return list;
        }
        return null;
    }
    
    public void addStudent(Student student){
    	this.getHibernateTemplate().save(student);
    }
}
