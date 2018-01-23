package com.gh.train.dao;

import com.gh.train.model.Seat;
import com.gh.train.model.Seating;

/**
 * 座位接口
 * @author CaiJianWei
 *
 * 2017-9-10
 */
public interface SeatDao {
	
	public Seat selecSeat(Seat seat);
	
	//座次
	public int inSeating(Seating seating);
}
