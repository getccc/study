package com.gh.crm.employment.dao.imp;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gh.crm.employment.dao.GraduateDao;
import com.gh.crm.employment.entity.Graduate;
import com.gh.crm.swork.entity.Student;
import com.gh.crm.utils.PageHibernateCallback;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public class GraduateDaoImp extends HibernateDaoSupport implements GraduateDao {
	
	 //查询表中总记录数
    public int findCount(){
        String hql="select count(*) from Graduate";
        List<Long> list=(List<Long>) this.getHibernateTemplate().find(hql);
        if(list!=null&&list.size()>0){
            return list.get(0).intValue();
        }
        return 0;
    }

    //查询当前页面的数据
    public List<Graduate> findByPageId(int begin, int limit) {
        String hql="from Graduate";
        List<Graduate> list=(List<Graduate>) this.getHibernateTemplate().execute((HibernateCallback<Graduate>) new PageHibernateCallback(hql, new Object[]{}, begin, limit));
        if(list!=null && list.size()>0){
            
            return list;
        }
        return null;
    }
    
    public void addGraduate(Graduate graduate){
    	this.getHibernateTemplate().save(graduate);
    }
}
