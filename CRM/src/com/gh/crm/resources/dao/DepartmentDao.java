package com.gh.crm.resources.dao;

import java.util.List;

import com.gh.crm.resources.entity.Department;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-10-24
 */
public interface DepartmentDao {
	
	public void addDepartment(Department department);
	
	//查询表中总记录数
    public int findDepartmentCount();
    
    //查询当前页面的数据
    public List<Department> findByPageId(int begin, int limit);
    
    //查询所有的部门
    public List<Department> listDepartment();
    
    public void updateDept(Department department);

}
