package com.gh.crm.resources.dao.imp;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gh.crm.resources.dao.StaffDao;
import com.gh.crm.resources.entity.Staff;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-10-22
 */
public class StaffDaoImp extends HibernateDaoSupport implements StaffDao {
		
	public Staff getStaff(Staff staff){
		return (Staff) this.getHibernateTemplate().find("from Staff where loginName=?", staff.getLoginName()).get(0);
	}
	
	public Staff getStaffByname(Staff staff){
		return (Staff) this.getHibernateTemplate().find("from Staff where staffName=?", staff.getStaffName()).get(0);
	}
	
	public void updPwd(Staff staff){
		this.getHibernateTemplate().update(staff);
	}
	
	public void addStaff(Staff staff){
		this.getHibernateTemplate().save(staff);
		this.getHibernateTemplate().flush();
	}
	
	public void editStaff(Staff staff){
		this.getHibernateTemplate().update(staff);
	}
	
	public List<Staff> listStaff(String postId){
		return this.getHibernateTemplate().find("from Staff where postId=?",postId);
	}
}	
