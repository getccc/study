package com.gh.crm.swork.dao.imp;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gh.crm.swork.dao.StationDao;
import com.gh.crm.swork.entity.Station;
import com.gh.crm.swork.entity.Student;
import com.gh.crm.utils.PageHibernateCallback;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public class StationDaoImp extends HibernateDaoSupport implements StationDao {
	
	 //查询表中总记录数
    public int findReferCount() {
        String hql="select count(*) from Station";
        List<Long> list=(List<Long>) this.getHibernateTemplate().find(hql);
        if(list!=null&&list.size()>0){
            return list.get(0).intValue();
        }
        return 0;
    }

    //查询当前页面的数据
    public List<Station> findByPageId(int begin, int limit) {
        String hql="from Station";
        List<Station> list=(List<Station>) this.getHibernateTemplate().execute((HibernateCallback<Station>) new PageHibernateCallback(hql, new Object[]{}, begin, limit));
        if(list!=null && list.size()>0){
            
            return list;
        }
        return null;
    }
    
    public void addStation(Station station){
    	this.getHibernateTemplate().save(station);
    }
}		
