package com.gh.train.dao;

import com.gh.train.model.Users;

/**
 * 账户接口
 * @author CaiJianWei
 *
 * 2017-9-7
 */
public interface UserDao {
	
	public String queryPass(Users users);
	
	public int updPass(Users users);
	
	public int queryUid(Users users);
	
	public int addUser(Users users);
}
