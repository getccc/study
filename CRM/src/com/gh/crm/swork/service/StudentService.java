package com.gh.crm.swork.service;

import com.gh.crm.swork.entity.Student;
import com.gh.crm.utils.PageBean;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public interface StudentService {
	
	public void addStudent(Student student);
	
	public PageBean<Student> findByPage(int page);
}
