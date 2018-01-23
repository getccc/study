package com.gh.crm.swork.dao;

import java.util.List;

import com.gh.crm.swork.entity.Student;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public interface StudentDao {
	
	public int findReferCount();
	
    public List<Student> findByPageId(int begin, int limit);
    
    public void addStudent(Student student);
}
