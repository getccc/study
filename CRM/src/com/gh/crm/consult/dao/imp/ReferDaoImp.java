package com.gh.crm.consult.dao.imp;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gh.crm.consult.dao.ReferDao;
import com.gh.crm.consult.entity.Refer;
import com.gh.crm.resources.entity.Department;
import com.gh.crm.utils.PageHibernateCallback;
/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public class ReferDaoImp extends HibernateDaoSupport implements ReferDao {
	
	
	public List<Refer> listRefer(){
		return this.getHibernateTemplate().find("from Refer");
	}
	
	 //查询表中总记录数
    public int findReferCount() {
        String hql="select count(*) from Refer";
        List<Long> list=(List<Long>) this.getHibernateTemplate().find(hql);
        if(list!=null&&list.size()>0){
            return list.get(0).intValue();
        }
        return 0;
    }

    //查询当前页面的数据
    public List<Refer> findByPageId(int begin, int limit) {
        String hql="from Refer";
        List<Refer> list=(List<Refer>) this.getHibernateTemplate().execute((HibernateCallback<Refer>) new PageHibernateCallback(hql, new Object[]{}, begin, limit));
        if(list!=null && list.size()>0){
            
            return list;
        }
        return null;
    }
	
    //添加
	public void addRefer(Refer refer){
		this.getHibernateTemplate().save(refer);
	}
	
	//查看
	public Refer getRefer(Refer refer){
		return (Refer) this.getHibernateTemplate().find("from Refer where referId=?",refer.getReferId()).get(0);
	}
}
