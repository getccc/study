package com.gh.crm.resources.dao.imp;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gh.crm.resources.dao.PostDao;
import com.gh.crm.resources.entity.Department;
import com.gh.crm.resources.entity.Post;
import com.gh.crm.utils.PageHibernateCallback;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-10-25
 */
public class PostDaoImp extends HibernateDaoSupport implements PostDao {
	
	//添加职务
	public void addPost(Post post){
		this.getHibernateTemplate().save(post);
	}
	
	public void updatePost(Post post){
		this.getHibernateTemplate().update(post);
	}
	
	public List<Post> allPost(){
		String hql ="from Post";
		return this.getHibernateTemplate().find(hql);
	}
	
	public List<Post> listPost(String depId){
		String hql ="from Post where depId = ?";
		return this.getHibernateTemplate().find(hql,depId);
	}
	
	//查询表中总记录数
    public int findPostCount() {
        String hql="select count(*) from Post";
        List<Long> list=(List<Long>) this.getHibernateTemplate().find(hql);
        if(list!=null&&list.size()>0){
            return list.get(0).intValue();
        }
        return 0;
    }
    
    //查询当前页面的数据
    public List<Post> findByPageId(int begin, int limit) {
        String hql="from Post";
        List<Post> list=(List<Post>) this.getHibernateTemplate().execute((HibernateCallback<Post>) new PageHibernateCallback(hql, new Object[]{}, begin, limit));
        if(list!=null && list.size()>0){
            
            return list;
        }
        return null;
    }
	
}
