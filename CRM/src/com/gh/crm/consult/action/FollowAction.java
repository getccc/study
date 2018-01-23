package com.gh.crm.consult.action;

import com.gh.crm.consult.entity.Follow;
import com.gh.crm.consult.service.FollowService;
import com.gh.crm.consult.service.imp.FollowServiceImp;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public class FollowAction extends ActionSupport implements ModelDriven<Follow> {
	private Follow follow = new Follow();
	private FollowService followService = new FollowServiceImp();
	
	public void setFollowService(FollowService followService) {
		this.followService = followService;
	}
	
	public Follow getModel() {
		
		return follow;
	}

}
