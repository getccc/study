package com.gh.train.service;
/**
 * 发信息接口
 * @author CaiJianWei
 *
 * 2017-9-9
 */
public interface SendService {
	//发送邮件验证码
	public void SendMail(String receiveMailAccount);
	
	//发送短信验证
	public  void SendMass(String tel);
}
