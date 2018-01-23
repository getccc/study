package com.gh.train.model;
/**
 * 查询订单详情
 * @author CaiJianWei
 *
 * 2017-9-10
 */
public class SelectOrderinfo {
 
	private String id;
	private String realName;
	private String card;
	private String seatType;
	private int carriage;
	private int seatingOrder;
	private double price;
	private String payState;
	
	
	
	
	
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCard() {
		return card;
	}
	public void setCard(String card) {
		this.card = card;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getSeatType() {
		return seatType;
	}
	public void setSeatType(String seatType) {
		this.seatType = seatType;
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
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getPayState() {
		return payState;
	}
	public void setPayState(String payState) {
		this.payState = payState;
	}
	
	
}
