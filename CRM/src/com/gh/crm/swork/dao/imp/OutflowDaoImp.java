package com.gh.crm.swork.dao.imp;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gh.crm.swork.dao.OutflowDao;
import com.gh.crm.swork.entity.Outflow;
import com.gh.crm.swork.entity.Station;
import com.gh.crm.utils.PageHibernateCallback;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public class OutflowDaoImp extends HibernateDaoSupport implements OutflowDao {
	
	//查询表中总记录数
    public int findReferCount() {
        String hql="select count(*) from Outflow";
        List<Long> list=(List<Long>) this.getHibernateTemplate().find(hql);
        if(list!=null&&list.size()>0){
            return list.get(0).intValue();
        }
        return 0;
    }

    //查询当前页面的数据
    public List<Outflow> findByPageId(int begin, int limit) {
        String hql="from Outflow";
        List<Outflow> list=(List<Outflow>) this.getHibernateTemplate().execute((HibernateCallback<Outflow>) new PageHibernateCallback(hql, new Object[]{}, begin, limit));
        if(list!=null && list.size()>0){
            
            return list;
        }
        return null;
    }
    
    public void addOutflow(Outflow outflow){
    	this.getHibernateTemplate().save(outflow);
    }
}	
