package com.gh.train.dao;

import java.util.List;

import com.gh.train.model.Passengers;
import com.gh.train.model.Users;

/**
 * 乘客接口
 * @author CaiJianWei
 *
 * 2017-9-7
 */
public interface PassengersDao {
	//添加乘客
	public int  addPassenger(Passengers passenger);
	//查询用户信息
	public Passengers  queryUsers (Users users);
	//查询用户所有乘客
	public List<Passengers>  selectPassengers (Users users);
	//修改乘客
	public int  updPassenger(Passengers passenger);
	//删除乘客
	public int  delPassenger(Passengers passenger);
	//修改电话
	public int  updTel(Passengers passenger,Users users);
	//修改邮箱
	public int  updEmail(Passengers passenger,Users users);
	//查询订单乘客
	public Passengers queryPassenger (Passengers Passengers);
	//查询改签订单乘客
	public Passengers queryPassenger (String username,String realName);
}
