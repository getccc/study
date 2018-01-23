package com.gh.crm.resources.service;

import java.util.List;

import com.gh.crm.resources.entity.Department;
import com.gh.crm.utils.PageBean;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-10-24
 */
public interface DepartmentService {
	
	public void addDepartment(Department department);
	
	//分页查询department
	public PageBean<Department> findByPage(int page);
	
	//查询所有的部门
	public List<Department> listDepartment();
	
	public void updateDept(Department department);
}
