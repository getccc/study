package com.gh.crm.resources.service;

import java.util.List;

import com.gh.crm.resources.entity.Post;
import com.gh.crm.utils.PageBean;



/**
 * 
 * @author CaiJianWei
 *
 * 2017-10-25
 */
public interface PostService {
	
	public void addPost(Post post);
	
	public void updatePost(Post post);
	
	public List<Post> allPost();
	
	//分页查询职务
	public PageBean<Post> findByPage(int page);
	
	//查询对应的职务
	public List<Post> listPost(String depId);
}
