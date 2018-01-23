package com.gh.train.dao.imp;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.gh.train.dao.OrderDao;
import com.gh.train.model.OrderInfo;
import com.gh.train.model.Orders;
import com.gh.train.model.Passengers;
import com.gh.train.model.SelectOrder;
import com.gh.train.model.SelectOrderinfo;
import com.gh.train.model.Users;
import com.gh.train.util.JDBCUtil;

/**
 * 订单接口实现类
 * @author CaiJianWei
 *
 * 2017-9-10
 */
public class OrderDaoImp implements OrderDao {
	QueryRunner  queryRunner = new QueryRunner(JDBCUtil.getDataSource());
	
	//增加订单
	public int insOrder(Orders orders){
		String sql = "insert into orders(id,uid,tid,orderState,orderTime) values(?,?,?,?,?)";
		
		try {
			return queryRunner.update(sql,orders.getId(),orders.getUid(),orders.getTid(),orders.getOrderState(),orders.getOrderTime());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	//增加订单详情
	public int insOrderinfo(OrderInfo orderinfo){
		String sql = "insert into order_info(oid,pid,sid,seatId,payState) VALUES (?,?,?,?,?)";
		try {
			return queryRunner.update(sql,orderinfo.getOid(),orderinfo.getPid(),orderinfo.getSid(),orderinfo.getSeatId(),orderinfo.getPayState());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	//支付订单
	public int payOrder(String oid){
		String sql = "update orders set orderState='已支付' where id = ?";
		try {
			return queryRunner.update(sql,oid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	//支付订单
	public int payOrderinfo(String oid){
		String sql = "update order_info set payState='已支付' where oid = ?";
		try {
			return queryRunner.update(sql,oid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	//取消订单
	public int outOrder(String oid){
		String sql = "update orders set orderState='已取消' where id = ?";
		try {
			return queryRunner.update(sql,oid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	//退票
	public int outTicket(String oid,String realName){
		String sql = "update order_info set payState='已退票' where oid = ? and pid = (select id from passengers where realName = ?)";
		try {
			return queryRunner.update(sql,oid,realName);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	//改签
	public int changeTrain(String oid,String realName,int uid){
		String sql = "update order_info set payState='已改签' where oid = ? and pid = (select id from passengers where realName = ? and uid = ?)";
		try {
			return queryRunner.update(sql,oid,realName,uid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	//查询用户所有订单
	public List<SelectOrder> selectOrder(int uid,String orderState){
		String sql = "select o.id,trainNo,departure,startTime,terminal,endTime,orderState,orderTime from orders o,train t where uid = ? and orderState = ? and o.tid=t.id";
		try {
			return queryRunner.query(sql, new BeanListHandler<SelectOrder>(SelectOrder.class),uid,orderState);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	//查询用户所有订单详情
	public List<SelectOrderinfo>  selectOrderinfo(int oid,String payState){
		String sql = "select o.id,realName,card,seatType,price,carriage,seatingOrder,paystate from order_info o,passengers p,seat s,seating se where oid = ? and payState = ? and o.pid=p.id and o.sid=s.id and o.seatId=se.id";
		try {
			return queryRunner.query(sql,new BeanListHandler<SelectOrderinfo>(SelectOrderinfo.class),oid,payState);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	//查询用户所有订单详情
	public List<SelectOrderinfo>  selectOrderinfo(int oid){
		String sql = "select realName,seatType,price,carriage,seatingOrder,paystate from order_info o,passengers p,seat s,seating se where oid = ?  and o.pid=p.id and o.sid=s.id and o.seatId=se.id";
		try {
			return queryRunner.query(sql,new BeanListHandler<SelectOrderinfo>(SelectOrderinfo.class),oid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	//查询用户所有可改签订单详情
	public List<SelectOrderinfo>  canChangeOrderinfo(int oid){
		String sql = "select realName,seatType,price,carriage,seatingOrder,paystate from order_info o,passengers p,seat s,seating se where oid = ? and payState='已支付'  and o.pid=p.id and o.sid=s.id and o.seatId=se.id";
		try {
			return queryRunner.query(sql,new BeanListHandler<SelectOrderinfo>(SelectOrderinfo.class),oid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
