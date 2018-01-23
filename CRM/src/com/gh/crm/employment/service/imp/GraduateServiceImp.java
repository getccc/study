package com.gh.crm.employment.service.imp;

import java.util.List;

import com.gh.crm.employment.dao.GraduateDao;
import com.gh.crm.employment.entity.Graduate;
import com.gh.crm.employment.service.GraduateService;
import com.gh.crm.swork.entity.Student;
import com.gh.crm.utils.PageBean;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public class GraduateServiceImp implements GraduateService{
	private GraduateDao graduateDao;
	
	public void setGraduateDao(GraduateDao graduateDao) {
		this.graduateDao = graduateDao;
	}
	
	public PageBean<Graduate> findByPage(int page) {
        PageBean<Graduate> pageBean =new PageBean<Graduate>();
        pageBean.setPage(page);
        int limit=3;
        pageBean.setLimit(limit);
        
        int totalCount=graduateDao.findCount();
        pageBean.setTotalCount(totalCount);
        //总页数
        int totalpage=(int)Math.ceil(totalCount/limit)+1;
        
        pageBean.setTotalPage(totalpage);
        //每页显示的数据集合
        int begin=(page-1)*limit;
        List<Graduate> list=graduateDao.findByPageId(begin, limit);
        pageBean.setList(list);
        return pageBean;
    }
	
	public void addGraduate(Graduate graduate){
		graduateDao.addGraduate(graduate);
	}
}
