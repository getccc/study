package com.gh.crm.resources.service.imp;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.gh.crm.resources.dao.DepartmentDao;
import com.gh.crm.resources.entity.Department;
import com.gh.crm.resources.service.DepartmentService;
import com.gh.crm.utils.PageBean;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-10-24
 */
public class DepartmentServiceImp implements DepartmentService {
	private DepartmentDao departmentDao;
	

	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}

	public void addDepartment(Department department){
		departmentDao.addDepartment(department);
	}
	
	
	public PageBean<Department> findByPage(int page) {
        PageBean<Department> pageBean =new PageBean<Department>();
        pageBean.setPage(page);
        int limit=3;
        pageBean.setLimit(limit);
        
        int totalCount=departmentDao.findDepartmentCount();
        pageBean.setTotalCount(totalCount);
        //总页数
        int totalpage=(int)Math.ceil(totalCount/limit)+1;
        
        pageBean.setTotalPage(totalpage);
        //每页显示的数据集合
        int begin=(page-1)*limit;
        List<Department> list=departmentDao.findByPageId(begin,limit);
        pageBean.setList(list);
        return pageBean;
    }
	
	//查询所有的部门
	public List<Department> listDepartment(){
		return departmentDao.listDepartment();
	}
	
	public void updateDept(Department department){
		departmentDao.updateDept(department);
	}
}
