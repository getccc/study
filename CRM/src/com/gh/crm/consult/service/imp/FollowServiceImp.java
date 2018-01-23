package com.gh.crm.consult.service.imp;

import com.gh.crm.consult.dao.FollowDao;
import com.gh.crm.consult.service.FollowService;

/**
 * 
 * @author CaiJianWei
 *
 * 2017-11-1
 */
public class FollowServiceImp implements FollowService {
	private FollowDao followDao;
	
	public void setFollowDao(FollowDao followDao) {
		this.followDao = followDao;
	}
}
