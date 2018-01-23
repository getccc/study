package com.gh.train.service.imp;

import com.gh.train.dao.PassengersDao;
import com.gh.train.dao.UserDao;
import com.gh.train.dao.imp.PassengersDaoImp;
import com.gh.train.dao.imp.UserDaoImp;
import com.gh.train.model.Passengers;
import com.gh.train.model.Users;
import com.gh.train.service.UserService;

/**
 * 用户业务实现类
 * @author CaiJianWei
 *
 * 2017-9-7
 */
public class UserServiceImp implements UserService {
	UserDao userdao = new UserDaoImp();
	PassengersDao passengersDao = new PassengersDaoImp();
	public boolean checkUser(Users users) {
		String pass = userdao.queryPass(users);
		if (pass == null) {
			return true;
		}else{
			return false;
		}
		
	}

	
	public boolean login(Users users) {
		String pass = userdao.queryPass(users);
		if (pass.equals(users.getPass())) {
			return true;
		}else{
		   return false;
		}
		
	}

	
	public boolean register(Users users,Passengers passengers) {
		if (userdao.addUser(users) > 0) {
			int uid = userdao.queryUid(users);
			passengers.setUid(uid);
			if (passengersDao.addPassenger(passengers) > 0) {
				return true;
			}else{
				return false;
			}
		}else{
			return false;
		}
	}
	
	//用户信息
	public boolean queryUsers(Users users){
		return false;
		
	}

}
