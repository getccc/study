package com.gh.train.model;

import java.sql.Time;
import java.util.Date;

public class Train {
	private int id; // 编号
	private String trainNo; // 车次编号
	private String trainType;//车次类型
	private String departure; // 始发站
	private String terminal; // 终点站
	private Date departureDate; // 始发日期
	private Time startTime; // 发车时间
	private Date terminalDate; // 到站日期
	private Time endTime; // 到站时间
	private String estimatedTime; // 耗时
	private String businesssSeat;//商务座
	private String firstSeat;//一等座
	private String secondSeat;//二等座
	private String advancedSleeper;//高级软卧
	private String softSleeper;//软卧
	private String sleeper;//动卧
	private String hardSleeper;//硬卧
	private String softSeat;//软座
	private String hardSeat;//硬座
	private String noSeat;//无座
	private String other;//其他
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBusinesssSeat() {
		return businesssSeat;
	}
	public void setBusinesssSeat(String businesssSeat) {
		this.businesssSeat = businesssSeat;
	}
	public String getFirstSeat() {
		return firstSeat;
	}
	public void setFirstSeat(String firstSeat) {
		this.firstSeat = firstSeat;
	}
	public String getSecondSeat() {
		return secondSeat;
	}
	public void setSecondSeat(String secondSeat) {
		this.secondSeat = secondSeat;
	}
	public String getAdvancedSleeper() {
		return advancedSleeper;
	}
	public void setAdvancedSleeper(String advancedSleeper) {
		this.advancedSleeper = advancedSleeper;
	}
	public String getSoftSleeper() {
		return softSleeper;
	}
	public void setSoftSleeper(String softSleeper) {
		this.softSleeper = softSleeper;
	}
	public String getSleeper() {
		return sleeper;
	}
	public void setSleeper(String sleeper) {
		this.sleeper = sleeper;
	}
	public String getHardSleeper() {
		return hardSleeper;
	}
	public void setHardSleeper(String hardSleeper) {
		this.hardSleeper = hardSleeper;
	}
	public String getSoftSeat() {
		return softSeat;
	}
	public void setSoftSeat(String softSeat) {
		this.softSeat = softSeat;
	}
	public String getHardSeat() {
		return hardSeat;
	}
	public void setHardSeat(String hardSeat) {
		this.hardSeat = hardSeat;
	}
	public String getNoSeat() {
		return noSeat;
	}
	public void setNoSeat(String noSeat) {
		this.noSeat = noSeat;
	}
	public String getOther() {
		return other;
	}
	public void setOther(String other) {
		this.other = other;
	}
	
	public String getTrainNo() {
		return trainNo;
	}
	public void setTrainNo(String trainNo) {
		this.trainNo = trainNo;
	}
	public String getTrainType() {
		return trainType;
	}
	public void setTrainType(String trainType) {
		this.trainType = trainType;
	}
	public String getDeparture() {
		return departure;
	}
	public void setDeparture(String departure) {
		this.departure = departure;
	}
	public String getTerminal() {
		return terminal;
	}
	public void setTerminal(String terminal) {
		this.terminal = terminal;
	}
	public Date getDepartureDate() {
		return departureDate;
	}
	public void setDepartureDate(Date departureDate) {
		this.departureDate = departureDate;
	}
	public Time getStartTime() {
		return startTime;
	}
	public void setStartTime(Time startTime) {
		this.startTime = startTime;
	}
	public Date getTerminalDate() {
		return terminalDate;
	}
	public void setTerminalDate(Date terminalDate) {
		this.terminalDate = terminalDate;
	}
	public Time getEndTime() {
		return endTime;
	}
	public void setEndTime(Time endTime) {
		this.endTime = endTime;
	}
	public String getEstimatedTime() {
		return estimatedTime;
	}
	public void setEstimatedTime(String estimatedTime) {
		this.estimatedTime = estimatedTime;
	}
	
	
}
