package com.gh.train.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gh.train.model.OrderInfo;
import com.gh.train.model.Orders;
import com.gh.train.model.SelectOrder;
import com.gh.train.model.SelectOrderinfo;
import com.gh.train.model.Users;

/**
 * 订单接口
 * @author CaiJianWei
 *
 * 2017-9-10
 */
public interface OrderDao{
	
	//增加订单
	public int insOrder(Orders orders);
	
	//增加订单详情
	public int insOrderinfo(OrderInfo orderinfo);
	
	//查询用户所有订单
	public List<SelectOrder> selectOrder(int uid,String orderState);
	
	//查询用户状态订单详情
	public List<SelectOrderinfo>  selectOrderinfo(int oid,String payState);
	
	//查询用户所有订单详情
	public List<SelectOrderinfo>  selectOrderinfo(int oid);
	
	//支付订单
	public int payOrder(String oid);
	public int payOrderinfo(String oid);
	
	//取消订单
	public int outOrder(String oid);
	
	//退票
	public int outTicket(String oid,String realName);
	
	//改签
	public int changeTrain(String oid ,String realName,int uid);
	
	//查询用户所有可改签订单详情
	public List<SelectOrderinfo>  canChangeOrderinfo(int oid);
}
