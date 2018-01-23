package com.gh.crm.test;

import java.util.LinkedList;
import java.util.List;

import org.junit.Test;

import com.gh.crm.resources.action.PostAction;
import com.gh.crm.resources.dao.PostDao;
import com.gh.crm.resources.dao.imp.PostDaoImp;
import com.gh.crm.resources.entity.Post;
import com.gh.crm.utils.IDUtils;

/**
 * 测试类
 * 
 * @author CaiJianWei
 * 
 *         2017-10-22
 */
public class testUtils {

	@Test
	public void test1() {
		String id = IDUtils.getCode();

		String newpass = IDUtils.getMD5("1234");
		System.out.println(id);
		System.out.println(newpass);
	}

	@Test
	public void test2() {
		PostDao postDao = new PostDaoImp();
		List<Post> posts = postDao.listPost("2c9091c14c78e58b014c78e67de10001");
		for (Post post : posts) {
			System.out.println(post.getPostName());
		}
	
	}
	
	@Test
	public void test3(){
		PostDao postDao = new PostDaoImp();
		List<Post> posts = postDao.allPost();
		for (Post post : posts) {
			System.out.println(post.getPostName());
		}
	}
	
	public void test4() throws Exception{
		PostAction postAction = new PostAction();
		postAction.execute();
	}
}
