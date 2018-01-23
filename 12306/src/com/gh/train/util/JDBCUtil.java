package com.gh.train.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.naming.Context;
import javax.sql.DataSource;
import com.mchange.v2.c3p0.ComboPooledDataSource;
/**
 * 连接数据库工具类
 * @author CaiJianWei
 *
 * 2017-9-7
 */
public class JDBCUtil {
	static ComboPooledDataSource dataSource = new ComboPooledDataSource();
	
	//打开管道
	public static Connection getCon(){
		try {
			return dataSource.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//退换管道
	public static DataSource getDataSource(){
		return dataSource;
	}
}
