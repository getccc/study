package com.gh.crm.swork.service.imp;

import java.util.List;

import com.gh.crm.swork.dao.OutflowDao;
import com.gh.crm.swork.entity.Outflow;
import com.gh.crm.swork.entity.Station;
import com.gh.crm.swork.service.OutflowService;
import com.gh.crm.utils.PageBean;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public class OutflowServiceImp implements OutflowService {
	
	private OutflowDao outflowDao;
	public void setOutflowDao(OutflowDao outflowDao) {
		this.outflowDao = outflowDao;
	}
	
	public PageBean<Outflow> findByPage(int page) {
        PageBean<Outflow> pageBean =new PageBean<Outflow>();
        pageBean.setPage(page);
        int limit=3;
        pageBean.setLimit(limit);
        
        int totalCount=outflowDao.findReferCount();
        pageBean.setTotalCount(totalCount);
        //总页数
        int totalpage=(int)Math.ceil(totalCount/limit)+1;
        
        pageBean.setTotalPage(totalpage);
        //每页显示的数据集合
        int begin=(page-1)*limit;
        List<Outflow> list=outflowDao.findByPageId(begin, limit);
        pageBean.setList(list);
        return pageBean;
    }
	
	public void addOutflow(Outflow outflow){
		outflowDao.addOutflow(outflow);
	}
}
