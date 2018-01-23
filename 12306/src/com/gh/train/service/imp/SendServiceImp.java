package com.gh.train.service.imp;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

import com.gh.train.service.SendService;
/**
 * 发信息接口实现
 * @author CaiJianWei
 *
 * 2017-9-9
 */
public class SendServiceImp implements SendService {
	public static String myEmailAccount = "810581139@qq.com";//safttdrkkgfabdba
	public static String myEmailPassword = "qbcyyscdsemrbfjh";//qbcyyscdsemrbfjh
	 public static String myEmailSMTPHost = "smtp.qq.com";
//	public static String myEmailSMTPHost = "smtp.163.com";

	// public static String receiveMailAccount = "810581139@qq.com";

	public static MimeMessage createMimeMessage(Session session,
			String sendMail, String receiveMail) throws Exception {
		// 1. 创建一封邮件
		MimeMessage message = new MimeMessage(session);

		// 2. From: 发件人
		message.setFrom(new InternetAddress(sendMail, "中国铁路客户服务中心网站", "UTF-8"));

		// 3. To: 收件人（可以增加多个收件人、抄送、密送）
		message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(
				receiveMail, "尊敬的用户", "UTF-8"));

		// 4. Subject: 邮件主题
		message.setSubject("验证码", "UTF-8");

		// 5. Content: 邮件正文（可以使用html标签）
		message.setContent(
				"【中国铁路客户服务中心网站】您的验证码是135165，请勿告知他人。工作人员不会向您索取。",
				"text/html;charset=UTF-8");

		// 6. 设置发件时间
		message.setSentDate(new Date());

		// 7. 保存设置
		message.saveChanges();

		return message;
	}

	public void SendMail(String receiveMailAccount) {
		// 1. 创建参数配置, 用于连接邮件服务器的参数配置
		Properties props = new Properties(); // 参数配置
		props.setProperty("mail.transport.protocol", "smtp"); // 使用的协议（JavaMail规范要求）
		props.setProperty("mail.smtp.host", myEmailSMTPHost); // 发件人的邮箱的 SMTP
		// 服务器地址
		props.setProperty("mail.smtp.auth", "true"); // 需要请求认证
//
		final String smtpPort = "465";
		props.setProperty("mail.smtp.port", smtpPort);
		props.setProperty("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.setProperty("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.socketFactory.port", smtpPort);

		// 2. 根据配置创建会话对象, 用于和邮件服务器交互
		Session session = Session.getDefaultInstance(props); // session网络会话
		session.setDebug(true); // 设置为debug模式, 可以查看详细的发送 log

		// 3. 创建一封邮件
		MimeMessage message;
		try {
			message = createMimeMessage(session, myEmailAccount,
					receiveMailAccount);
			// 4. 根据 Session 获取邮件传输对象
			Transport transport = session.getTransport();

			transport.connect(myEmailAccount, myEmailPassword);

			// 6. 发送邮件, 发到所有的收件地址, message.getAllRecipients()
			// 获取到的是在创建邮件对象时添加的所有收件人,
			// 抄送人, 密送人
			transport.sendMessage(message, message.getAllRecipients());

			// 7. 关闭连接
			transport.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void SendMass(String tel) {

		HttpClient client = new HttpClient();
		PostMethod post = new PostMethod("http://gbk.api.smschinese.cn");
		post.addRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=gbk");// 在头文件中设置转码
		NameValuePair[] data = { new NameValuePair("Uid", "caijianwei"),
				new NameValuePair("Key", "3e541ffb7e3cfbf321a6"),
				new NameValuePair("smsMob", tel),
				new NameValuePair("smsText", "您的验证码是135165，仅用于登录校验，请勿告知他人。工作人员不会向您索取。") };
		post.setRequestBody(data);

		try {
			client.executeMethod(post);

			Header[] headers = post.getResponseHeaders();
			int statusCode = post.getStatusCode();
			System.out.println("statusCode:" + statusCode);
			for (Header h : headers) {
				System.out.println(h.toString());
			}
			String result = new String(post.getResponseBodyAsString().getBytes(
					"gbk"));
			System.out.println(result); // 打印返回消息状态

			post.releaseConnection();
		} catch (HttpException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
