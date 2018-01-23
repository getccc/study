package com.gh.train.dao.imp;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.gh.train.dao.SeatDao;
import com.gh.train.model.Passengers;
import com.gh.train.model.Seat;
import com.gh.train.model.Seating;
import com.gh.train.util.JDBCUtil;

/**
 * 订单接口实现类
 * @author CaiJianWei
 *
 * 2017-9-10
 */
public class SeatDaoImp implements SeatDao{
	QueryRunner  queryRunner = new QueryRunner(JDBCUtil.getDataSource());
	
	public Seat selecSeat(Seat seat){
		String sql = "select * from seat where tid=? and seatType=?";
		try {
			return queryRunner.query(sql, new BeanHandler(Seat.class),seat.getTid(),seat.getSeatType());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public int inSeating(Seating seating){
		String sql = "insert into seating values(?,?,?)";
		try {
			return queryRunner.update(sql,seating.getId(),seating.getCarriage(),seating.getSeatingOrder());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
}
