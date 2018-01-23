package com.gh.train.model;

import java.util.Date;

/**
 * 乘客类
 * @author CaiJianWei
 *
 * 2017-9-7
 */
public class Passengers {
	private int id;
	private int uid;
	private int role; //标识符
	private String realName;//真实姓名
	private String cardType;//证件类型
	private String card;//证件号码
	private String sex;//性别
	private String country;//国家
    private Date dateBirth;//出生日期
    private String email;//邮箱
    private String tel;//电话
    private String address;//地址
    private int postcodes;//邮编
    private String passengerType;//乘客类型
    
    public Passengers(){
    	
    }
    public Passengers(int uid,int role,String realName,String cardType,String card,String email,String tel,String passengerType ){
    	this.uid = uid;
    	this.role = role;
    	this.realName = realName;
    	this.cardType = cardType;
    	this.card = card;
    	this.email = email;
    	this.tel = tel;
    	this.passengerType = passengerType;
    }
    
    
    
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getCardType() {
		return cardType;
	}
	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
	public String getCard() {
		return card;
	}
	public void setCard(String card) {
		this.card = card;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public Date getDateBirth() {
		return dateBirth;
	}
	public void setDateBirth(Date dateBirth) {
		this.dateBirth = dateBirth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getPostcodes() {
		return postcodes;
	}
	public void setPostcodes(int postcodes) {
		this.postcodes = postcodes;
	}
	public String getPassengerType() {
		return passengerType;
	}
	public void setPassengerType(String passengerType) {
		this.passengerType = passengerType;
	}
    
    
    
}
