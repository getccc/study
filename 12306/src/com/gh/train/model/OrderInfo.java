package com.gh.train.model;
/**
 * 订单详情表
 * @author CaiJianWei
 *
 * 2017-9-10
 */
public class OrderInfo {
	
	private int oid;
	private String pid;
	private int sid;
	private int seatId;
	private String payState;
	
	
	
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getSeatId() {
		return seatId;
	}
	public void setSeatId(int seatId) {
		this.seatId = seatId;
	}
	public String getPayState() {
		return payState;
	}
	public void setPayState(String payState) {
		this.payState = payState;
	}
	
	
}
