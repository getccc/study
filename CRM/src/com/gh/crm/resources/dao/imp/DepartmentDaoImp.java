package com.gh.crm.resources.dao.imp;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gh.crm.resources.dao.DepartmentDao;
import com.gh.crm.resources.entity.Department;
import com.gh.crm.utils.PageHibernateCallback;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-10-24
 */
public class DepartmentDaoImp extends HibernateDaoSupport implements DepartmentDao {
	
	public void addDepartment(Department department){
		this.getHibernateTemplate().save(department);
	}
	
	 //查询表中总记录数
    public int findDepartmentCount() {
        String hql="select count(*) from Department";
        List<Long> list=(List<Long>) this.getHibernateTemplate().find(hql);
        if(list!=null&&list.size()>0){
            return list.get(0).intValue();
        }
        return 0;
    }

    //查询当前页面的数据
    public List<Department> findByPageId(int begin, int limit) {
        String hql="from Department";
        List<Department> list=(List<Department>) this.getHibernateTemplate().execute((HibernateCallback<Department>) new PageHibernateCallback(hql, new Object[]{}, begin, limit));
        if(list!=null && list.size()>0){
            
            return list;
        }
        return null;
    }
    
    //查询所有的部门
    public List<Department> listDepartment(){
    	
    	return 	this.getHibernateTemplate().find("from Department");
    }
    
    public void updateDept(Department department){
    	this.getHibernateTemplate().update(department);
    }
}
