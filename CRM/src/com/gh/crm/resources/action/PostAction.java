package com.gh.crm.resources.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.gh.crm.resources.entity.Department;
import com.gh.crm.resources.entity.Post;
import com.gh.crm.resources.service.PostService;
import com.gh.crm.resources.service.imp.PostServiceImp;
import com.gh.crm.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 
 * @author CaiJianWei
 * 
 *         2017-10-25
 */
public class PostAction extends ActionSupport implements ModelDriven<Post>,
		ServletRequestAware {

	private Post post = new Post();
	private PostService postService = new PostServiceImp();
	HttpServletRequest request;
	private int page;
	private String depId;
	private String result;
	
	
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getDepId() {
		return depId;
	}

	public void setDepId(String depId) {
		this.depId = depId;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public void setPostService(PostService postService) {
		this.postService = postService;
	}

	public Post getModel() {
		// TODO Auto-generated method stub
		return post;
	}

	public String addPost() {
		Department department = new Department();
		department.setDepId(depId);
		post.setDepartment(department);
		postService.addPost(post);
		return SUCCESS;
	}

	public String allPost() {
		List<Post> posts = postService.allPost();
		for (Post post : posts) {
			System.out.println(post.getDepartment().getDepName());
		}
		ActionContext.getContext().getValueStack().set("posts", posts);
		return SUCCESS;
	}
	
	public String listPost() {
		System.out.println(1);
		List<Post> post = postService.listPost(depId);
		for (Post post2 : post) {
			System.out.println(post2.getPostName());
		}
		ActionContext.getContext().getValueStack().set("post", post);
		
		return SUCCESS;
	}
	
	
	public String execute(){
		 System.out.println(depId);
		 List<Post> post = postService.listPost(depId);
		 
		
		 List<Map<String,String>> lists = new ArrayList<Map<String,String>>();
	       
		 for (int i = 0; i < post.size(); i++) {
			 Map<String,String> map=new HashMap<String,String>();
			 map.put("postId",post.get(i).getPostId());
		     map.put("postName",post.get(i).getPostName());
		     lists.add(map);
		 }
		 
//		 for (Post post2 : post) {
//		     map.put(post2.getPostId(),post2.getPostName());
//		 }
		 
//		 Map<String, Map<String,String>> resultMap = new HashMap<String, Map<String,String>>();
//		 
//		 resultMap.put("map", map);
//		 
//		 result = "[{"+"key"+":"+"2c9091c14c78e58b014c78e6d4510004"+","+"value"+":"+"讲师"+"}]";
		 
//		 JsonConfig jsonConfig = new JsonConfig();
//		 jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
//		 jsonConfig.setExcludes(new String[]{"Staffs"});  
		 JSONArray jArray=JSONArray.fromObject(lists);  
	     result=jArray.toString();  
	     System.out.println(result);
		
		return SUCCESS;
	}

	
	public String showPagePosts() {
		PageBean<Post> pageposts = postService.findByPage(page);

		ActionContext.getContext().getValueStack().set("pageposts", pageposts);
		
//		DepartmentAction departmentAction = new DepartmentAction();
//		departmentAction.AllDept();
		
		return SUCCESS;
	}
	
	public String updatePost(){
		System.out.println(depId);
		System.out.println(post.getPostId());
	    Department department =	new Department();
		department.setDepId(depId);
		post.setDepartment(department);
	    
		postService.updatePost(post);
		
		return SUCCESS;
	}

}
