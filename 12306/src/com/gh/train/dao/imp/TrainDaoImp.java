package com.gh.train.dao.imp;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.gh.train.dao.TrainDao;
import com.gh.train.model.Passengers;
import com.gh.train.model.Seat;
import com.gh.train.model.Train;
import com.gh.train.util.JDBCUtil;

/**
 * 车次接口实现类
 * @author CaiJianWei
 *
 * 2017-9-9
 */
public class TrainDaoImp implements TrainDao {
	QueryRunner  queryRunner = new QueryRunner(JDBCUtil.getDataSource());
	
	//查询车次
	public List<Train> selectTrain(Train train){
		String sql = "SELECT trainNo,ticketType,departure,startTime,terminal,endTime,estimatedTime ,MAX(CASE seatType WHEN '商务座' THEN num ELSE 0 END ) businesssSeat,MAX(CASE seatType WHEN '一等座' THEN num ELSE 0 END ) firstSeat,MAX(CASE seatType WHEN '二等座' THEN num ELSE 0 END ) secondSeat,MAX(CASE seatType WHEN '高级软卧' THEN num ELSE 0 END ) advancedSleeper,MAX(CASE seatType WHEN '软卧' THEN num ELSE 0 END ) softSleeper,MAX(CASE seatType WHEN '动卧' THEN num ELSE 0 END ) sleeper,MAX(CASE seatType WHEN '硬卧' THEN num ELSE 0 END ) hardSleeper,MAX(CASE seatType WHEN '软座' THEN num ELSE 0 END ) softSeat,MAX(CASE seatType WHEN '硬座' THEN num ELSE 0 END ) hardSeat, MAX(CASE seatType WHEN '无座' THEN num ELSE 0 END ) noSeat,MAX(CASE seatType WHEN '其他' THEN num ELSE 0 END ) other FROM train t,seat s where departure=? and terminal=? and s.tid=t.id GROUP BY trainNo;";
		try {
			return queryRunner.query(sql, new BeanListHandler<Train>(Train.class),train.getDeparture(),train.getTerminal());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	//查询单次车次
	public Train selTrain(Train train){
		String sql = "SELECT t.id,trainNo,ticketType,departure,startTime,terminal,endTime,estimatedTime ,MAX(CASE seatType WHEN '商务座' THEN num ELSE 0 END ) businesssSeat,MAX(CASE seatType WHEN '一等座' THEN num ELSE 0 END ) firstSeat,MAX(CASE seatType WHEN '二等座' THEN num ELSE 0 END ) secondSeat,MAX(CASE seatType WHEN '高级软卧' THEN num ELSE 0 END ) advancedSleeper,MAX(CASE seatType WHEN '软卧' THEN num ELSE 0 END ) softSleeper,MAX(CASE seatType WHEN '动卧' THEN num ELSE 0 END ) sleeper,MAX(CASE seatType WHEN '硬卧' THEN num ELSE 0 END ) hardSleeper,MAX(CASE seatType WHEN '软座' THEN num ELSE 0 END ) softSeat,MAX(CASE seatType WHEN '硬座' THEN num ELSE 0 END ) hardSeat, MAX(CASE seatType WHEN '无座' THEN num ELSE 0 END ) noSeat,MAX(CASE seatType WHEN '其他' THEN num ELSE 0 END ) other FROM train t,seat s where departure=? and terminal=? and trainNo=? and s.tid=t.id GROUP BY trainNo;";
	
	  	
		try {
			return queryRunner.query(sql, new BeanHandler(Train.class),train.getDeparture(),train.getTerminal(),train.getTrainNo());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return train;
	}
	
	//查询单次车次
	public List<Seat> selSeat(Train train){
		String sql = "select seatType,price,num from seat where tid = (select id from train where trainNo = ? )";
	    try {
			return queryRunner.query(sql, new BeanListHandler<Seat>(Seat.class),train.getTrainNo());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
