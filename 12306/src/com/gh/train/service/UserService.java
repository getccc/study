package com.gh.train.service;

import com.gh.train.model.Passengers;
import com.gh.train.model.Users;

/**
 * 用户业务接口
 * @author CaiJianWei
 *
 * 2017-9-7
 */
public interface UserService {
	//验证账户
	public boolean checkUser(Users users);
    //登录
	public boolean login(Users users);
	//注册
	public boolean register(Users users,Passengers passengers);
	//用户信息
	public boolean queryUsers(Users users);
}
