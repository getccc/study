package com.gh.train.dao;

import java.util.List;

import com.gh.train.model.Seat;
import com.gh.train.model.Train;

/**
 * 车次接口
 * @author CaiJianWei
 *
 * 2017-9-9
 */
public interface TrainDao {
	
	//查询车次
	public List<Train> selectTrain(Train train); 
	//查询单次车次
	public Train selTrain(Train train); 
	//查询车次座次
	public List<Seat> selSeat(Train train); 
}
