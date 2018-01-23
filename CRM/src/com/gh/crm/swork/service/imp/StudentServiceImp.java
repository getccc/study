package com.gh.crm.swork.service.imp;

import java.util.List;

import com.gh.crm.consult.entity.Refer;
import com.gh.crm.swork.dao.StudentDao;
import com.gh.crm.swork.entity.Student;
import com.gh.crm.swork.service.StudentService;
import com.gh.crm.utils.PageBean;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public class StudentServiceImp implements StudentService {
	private StudentDao studentDao;
	
	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}
	
	public PageBean<Student> findByPage(int page) {
        PageBean<Student> pageBean =new PageBean<Student>();
        pageBean.setPage(page);
        int limit=3;
        pageBean.setLimit(limit);
        
        int totalCount=studentDao.findReferCount();
        pageBean.setTotalCount(totalCount);
        //总页数
        int totalpage=(int)Math.ceil(totalCount/limit)+1;
        
        pageBean.setTotalPage(totalpage);
        //每页显示的数据集合
        int begin=(page-1)*limit;
        List<Student> list=studentDao.findByPageId(begin, limit);
        pageBean.setList(list);
        return pageBean;
    }
	
	
	public void addStudent(Student student){
		studentDao.addStudent(student);
	}
}
