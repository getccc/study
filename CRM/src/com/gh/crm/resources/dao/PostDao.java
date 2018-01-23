package com.gh.crm.resources.dao;

import java.util.List;

import com.gh.crm.resources.entity.Post;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-10-25
 */
public interface PostDao {
	
	public void addPost(Post post);
	
	public void updatePost(Post post);
	
	public List<Post> allPost();
	
	public int findPostCount();
	
	public List<Post> findByPageId(int begin, int limit);
	
	public List<Post> listPost(String depId);
}
