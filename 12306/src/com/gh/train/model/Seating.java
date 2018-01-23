package com.gh.train.model;
/**
 * 座次表
 * @author CaiJianWei
 *
 * 2017-9-10
 */
public class Seating {
	private int id;
	private int carriage;
	private int seatingOrder;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCarriage() {
		return carriage;
	}
	public void setCarriage(int carriage) {
		this.carriage = carriage;
	}
	public int getSeatingOrder() {
		return seatingOrder;
	}
	public void setSeatingOrder(int seatingOrder) {
		this.seatingOrder = seatingOrder;
	}
	
	
}
