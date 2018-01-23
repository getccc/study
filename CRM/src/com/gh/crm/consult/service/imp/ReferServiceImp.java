package com.gh.crm.consult.service.imp;

import java.util.List;

import com.gh.crm.consult.dao.ReferDao;
import com.gh.crm.consult.entity.Refer;
import com.gh.crm.consult.service.ReferService;
import com.gh.crm.resources.entity.Department;
import com.gh.crm.utils.PageBean;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public class ReferServiceImp implements ReferService {
		
	private ReferDao referDao;
	
	public void setReferDao(ReferDao referDao) {
		this.referDao = referDao;
	}
	
	public PageBean<Refer> findByPage(int page) {
        PageBean<Refer> pageBean =new PageBean<Refer>();
        pageBean.setPage(page);
        int limit=3;
        pageBean.setLimit(limit);
        
        int totalCount=referDao.findReferCount();
        pageBean.setTotalCount(totalCount);
        //总页数
        int totalpage=(int)Math.ceil(totalCount/limit)+1;
        
        pageBean.setTotalPage(totalpage);
        //每页显示的数据集合
        int begin=(page-1)*limit;
        List<Refer> list=referDao.findByPageId(begin, limit);
        pageBean.setList(list);
        return pageBean;
    }
	
	public void addRefer(Refer refer){
		referDao.addRefer(refer);
	}
	
	public Refer getRefer(Refer refer){
		return referDao.getRefer(refer);
	}
}
