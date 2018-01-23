package com.gh.crm.teaching.service.imp;

import java.util.List;

import com.gh.crm.teaching.dao.ClassesDao;
import com.gh.crm.teaching.entity.Classes;
import com.gh.crm.teaching.service.ClassesService;
import com.gh.crm.utils.PageBean;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public class ClassesServiceImp implements ClassesService {
		private ClassesDao classesDao;
		
		public void setClassesDao(ClassesDao classesDao) {
			this.classesDao = classesDao;
		}
		
		public PageBean<Classes> findByPage(int page) {
			
	        PageBean<Classes> pageBean =new PageBean<Classes>();
	        pageBean.setPage(page);
	        int limit=3;
	        pageBean.setLimit(limit);
	        int totalCount = classesDao.findCount();
	        System.out.println(totalCount);
	        pageBean.setTotalCount(totalCount);
	        //总页数
	        int totalpage=(int)Math.ceil(totalCount/limit)+1;
	        
	        pageBean.setTotalPage(totalpage);
	        //每页显示的数据集合
	        int begin=(page-1)*limit;
	        List<Classes> list=classesDao.findByPageId(begin, limit);
	        pageBean.setList(list);
	        return pageBean;
	    }
		
		 public void addClasses(Classes classes){
			 classesDao.addClasses(classes);
		 }
		 
		 public void updateClasses(Classes classes){
			 classesDao.updateClasses(classes);
		 }
		 
		 public List<Classes>  listClasses(Classes classes){
			 
			 return classesDao.listClasses(classes);
		 }
}
