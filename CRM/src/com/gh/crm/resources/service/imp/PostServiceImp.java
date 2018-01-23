package com.gh.crm.resources.service.imp;

import java.util.List;

import com.gh.crm.resources.dao.PostDao;
import com.gh.crm.resources.entity.Post;
import com.gh.crm.resources.service.PostService;
import com.gh.crm.utils.IDUtils;
import com.gh.crm.utils.PageBean;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-10-25
 */
public class PostServiceImp implements PostService {
	private PostDao postDao;
	
	
	public void setPostDao(PostDao postDao) {
		this.postDao = postDao;
	}

	public void addPost(Post post){
		post.setPostId(IDUtils.getCode());
		postDao.addPost(post);
	}
	
	public void updatePost(Post post){
		postDao.updatePost(post);
	}
	
	//查询所有职务
	public List<Post> allPost(){
		return postDao.allPost();
	}
	
	//查询对应的职务
	public List<Post> listPost(String depId){
		return postDao.listPost(depId);
	}
	
	//分页查询职务
	public PageBean<Post> findByPage(int page) {
        PageBean<Post> pageBean =new PageBean<Post>();
        pageBean.setPage(page);
        int limit=3;
        pageBean.setLimit(limit);
        
        int totalCount=postDao.findPostCount();
        pageBean.setTotalCount(totalCount);
        //总页数
        int totalpage=(int)Math.ceil(totalCount/limit)+1;
        
        pageBean.setTotalPage(totalpage);
        //每页显示的数据集合
        int begin=(page-1)*limit;
        List<Post> list=postDao.findByPageId(begin,limit);
        pageBean.setList(list);
        return pageBean;
    }
}
