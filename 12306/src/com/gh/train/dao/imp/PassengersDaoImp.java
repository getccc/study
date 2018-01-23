package com.gh.train.dao.imp;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.gh.train.dao.PassengersDao;
import com.gh.train.model.Passengers;
import com.gh.train.model.Users;
import com.gh.train.util.JDBCUtil;

/**
 * 乘客接口实现类
 * @author CaiJianWei
 *
 * 2017-9-7
 */
public class PassengersDaoImp implements PassengersDao {
	QueryRunner  queryRunner = new QueryRunner(JDBCUtil.getDataSource());
	
	public int  addPassenger(Passengers passenger){
		String sql ="insert into passengers(uid,role,realName,cardType,card,email,tel,passengerType) values(?,?,?,?,?,?,?,?)";
		try {
			return  queryRunner.update(sql,passenger.getUid(),passenger.getRole(),passenger.getRealName(),passenger.getCardType(),passenger.getCard(),passenger.getEmail(),passenger.getTel(),passenger.getPassengerType());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	public Passengers queryUsers (Users users){
		String sql = "select role,realName,cardType,card,email,tel,passengerType from passengers where uid = (select id from users where username =? ) and role = 0";
		
		try {
			Passengers pa = queryRunner.query(sql, new BeanHandler(Passengers.class),users.getUsername());
			return pa;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	//所有乘客
	public List<Passengers>  selectPassengers (Users users){
		String sql = "select id,role,realName,cardType,card,email,tel,passengerType from passengers where uid = (select id from users where username =? )";
		try {
			return queryRunner.query(sql, new BeanListHandler<Passengers>(Passengers.class),users.getUsername());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public int  updPassenger(Passengers passenger){
		String sql = "update passengers set tel=?,email=?  where card=?";
		try {
			return queryRunner.update(sql,passenger.getTel(),passenger.getEmail(),passenger.getCard());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	public int  delPassenger(Passengers passenger){
		String sql = "delete from passengers where card = ?";
		
		try {
			return queryRunner.update(sql,passenger.getCard());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	//修改电话
	public int  updTel(Passengers passenger,Users users){
		String sql = "update passengers set tel =? where uid = (select id from users where username =? ) and role = ?";
		try {
			
			return queryRunner.update(sql,passenger.getTel(),users.getUsername(),passenger.getRole());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
		
	}
	//修改邮箱
	public int  updEmail(Passengers passenger,Users users){
		String sql = "update passengers set email =? where uid = (select id from users where username =? ) and role = ?";
		try {
			return queryRunner.update(sql,passenger.getEmail(),users.getUsername(),passenger.getRole());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
		
	}
	
	public Passengers queryPassenger (Passengers passengers){
		String sql = "select * from passengers where card = ?";
		
		try {
			Passengers pa = queryRunner.query(sql, new BeanHandler(Passengers.class),passengers.getCard());
			System.out.println(pa.getId());
			return pa;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	//查询改签订单乘客
	public Passengers queryPassenger (String username,String realName){
      String sql = "select * from passengers where realName = ? and uid=(select id from users where username = ?)";
		
		try {
			Passengers pa = queryRunner.query(sql, new BeanHandler(Passengers.class),realName,username);
			System.out.println(pa.getId());
			return pa;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
}
