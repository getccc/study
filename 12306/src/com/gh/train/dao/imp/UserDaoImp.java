package com.gh.train.dao.imp;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.gh.train.dao.UserDao;
import com.gh.train.model.Users;
import com.gh.train.util.JDBCUtil;

/**
 * 账户接口实现类
 * @author CaiJianWei
 *
 * 2017-9-7
 */
public class UserDaoImp implements UserDao {
	QueryRunner  queryRunner = new QueryRunner(JDBCUtil.getDataSource());
	
	public String queryPass(Users users){
		String sql ="SELECT pass from users where username = ?";
		try {
			return (String) queryRunner.query(sql,users.getUsername(),new ScalarHandler());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public int queryUid(Users users){
		String sql = "select id from users where username = ?";
		try {
			return (Integer) queryRunner.query(sql, users.getUsername(),new ScalarHandler()) ;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	public int updPass(Users users){
		String sql = "update users set pass = ? where username = ?";
		try {
			return queryRunner.update(sql,users.getPass(),users.getUsername());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	public int addUser(Users users) {
		String sql = "insert into users(username,pass) values(?,?)";
		
		try {
			return queryRunner.update(sql,users.getUsername(),users.getPass());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

}
