package com.gh.train.model;
/**
 * 账户类
 * @author CaiJianWei
 *
 * 2017-9-7
 */
public class Users {
	private String username;//账户
	private String pass;//密码
	
	public Users(){
		
	}
    public Users(String username,String pass){
		this.username = username;
		this.pass = pass;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	
}
