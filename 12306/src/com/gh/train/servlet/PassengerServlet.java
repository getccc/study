package com.gh.train.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gh.train.dao.PassengersDao;
import com.gh.train.dao.UserDao;
import com.gh.train.dao.imp.PassengersDaoImp;
import com.gh.train.dao.imp.UserDaoImp;
import com.gh.train.model.Passengers;
import com.gh.train.model.Users;
import com.gh.train.service.SendService;
import com.gh.train.service.imp.SendServiceImp;
import com.gh.train.util.BaseServlet;

public class PassengerServlet extends BaseServlet {
	UserDao userdao = new UserDaoImp();
	PassengersDao passengersdao = new PassengersDaoImp();
	
	//刷新乘客信息
	public void refreshPassenger(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		List<Passengers> passengers = new ArrayList<Passengers>();
		Users users = new Users();
		String username = (String) request.getSession()
				.getAttribute("username");
		users.setUsername(username);
		passengers = passengersdao.selectPassengers(users);
		request.getSession().setAttribute("passengers", passengers);
	}
	
	//添加乘客
	public String addPassenger(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		List<Passengers> passengers = new ArrayList<Passengers>();
		String realName = request.getParameter("passenger_name");
		String sex = request.getParameter("sex_code");
		String cardType = request.getParameter("passenger_id_type_code");
		String card = request.getParameter("passenger_id_no");
		String email = request.getParameter("email");
		String tel = request.getParameter("mobile_no");
		String passengerType = request.getParameter("passenger_type");
		Passengers passenger = new Passengers();
		Users users = new Users();
		passenger.setRealName(realName);
		passenger.setRole(1);
		passenger.setSex(sex);
		passenger.setCardType(cardType);
		passenger.setCard(card);
		passenger.setEmail(email);
		passenger.setTel(tel);
		passenger.setPassengerType(passengerType);
		String username = (String) request.getSession()
				.getAttribute("username");
		users.setUsername(username);
		int uid = userdao.queryUid(users);
		passenger.setUid(uid);
		if (passengersdao.addPassenger(passenger) > 0) {
			this.refreshPassenger(request, response);
			return "redirect:queryPassengers.jsp";
		} else {
			return "forward:addPassengers.jsp";
		}
	}
	
	//删除乘客
	public String delPassenger(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		String card = request.getParameter("card");
		Passengers passenger = new Passengers();
		passenger.setCard(card);
		if (passengersdao.delPassenger(passenger) > 0) {
			this.refreshPassenger(request, response);
			return "redirect:queryPassengers.jsp";
		} else {
			return "forward:queryPassengers.jsp";
		}
	}
	
	//传递要修改乘客信息
	public String updMess(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		        String realName = request.getParameter("realName");
		        realName = new String(realName.getBytes("ISO8859-1"), "UTF-8"); 
				String card = request.getParameter("card");
				Passengers oldpassenger = new Passengers();
				oldpassenger.setRealName(realName);
				oldpassenger.setCard(card);
				request.getSession().setAttribute("oldpassenger", oldpassenger);
		
				return "redirect:updatePassenger.jsp";
		
	}
	
	//修改乘客信息
	public String updPassenger(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		String tel = request.getParameter("mobile_no");
		String email = request.getParameter("email");
		String card = request.getParameter("passenger_id_no");
		Passengers passenger = new Passengers();
		Users users = new Users();
		passenger.setTel(tel);
		passenger.setEmail(email);
		passenger.setCard(card);
		if (passengersdao.updPassenger(passenger) > 0) {
			this.refreshPassenger(request, response);
			return "redirect:queryPassengers.jsp";
		} else {
			return "forward:updatePassengers.jsp";
		}

	}
	
	//修改手机号
	public String updTel(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		Users users = new Users();
		Passengers passenger = new Passengers();
		String pass = request.getParameter("_loginPwd");
		String tel = request.getParameter("mobile_no");
		String username = (String) request.getSession()
				.getAttribute("username");
		users.setUsername(username);
		passenger.setTel(tel);
		passenger.setRole(0);
		if (userdao.queryPass(users).equals(pass)) {
			if (passengersdao.updTel(passenger, users) > 0) {
				this.refreshPassenger(request, response);
				return "redirect:queryPassengers.jsp";
			}else {
				return "forward:securityTel.jsp";
			}
		} else {
			return "forward:securityTel.jsp";
		}

	}
	
	//修改邮箱
	public String updEmail(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		  Users users = new Users();
		  Passengers passenger = new Passengers();
		  String newEmail = request.getParameter("_email");
		  String pass = request.getParameter("_loginPwd");
		  String checkEmail = request.getParameter("mobileRandcode");
		  String username = (String) request.getSession()
			.getAttribute("username");
	     users.setUsername(username);
	     passenger.setEmail(newEmail);
	     passenger.setRole(0);
	     if (userdao.queryPass(users).equals(pass)) {
	    	 if (checkEmail.equals("135165")) {
				if (passengersdao.updEmail(passenger, users) > 0) {
					this.refreshPassenger(request, response);
					return "redirect:queryPassengers.jsp";
				}else {
					return "forward:securityEmail.jsp";
				}
			}else {
				return "forward:securityEmail.jsp";
			}
	     }else {
				return "forward:securityEmail.jsp";
			}
	}
	
	//修改密码
	public String updPass(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		Users users = new Users();
		String pass = request.getParameter("password");
		String newPass = request.getParameter("password_new");
		String username = (String) request.getSession()
		.getAttribute("username");
        users.setUsername(username);
        String mail = request.getParameter("mobileRandcode");
        if (userdao.queryPass(users).equals(pass)) {
        	if (mail.equals("135165")) {
    			users.setPass(newPass);
    			System.out.println(newPass);
    			if (userdao.updPass(users) > 0) {
    				return "redirect:security.jsp";
				}else {
					return "forward:securityPass.jsp";
				}
    		}else {
    			return "forward:securityPass.jsp";
    		}
		}else {
			return "forward:securityPass.jsp";
		}
	}
	
	//发送邮件
	public void sendMail(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		SendService send = new SendServiceImp();
		Passengers passenger = new Passengers();
		passenger = (Passengers) request.getSession().getAttribute("passenger");
//		String tel = passenger.getTel();
//		send.SendMail(tel);
		String mail = passenger.getEmail();
		send.SendMail(mail);
	}
	
	//发送短信
	public void sendTel(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		SendService send = new SendServiceImp();
		Passengers passenger = new Passengers();
		passenger = (Passengers) request.getSession().getAttribute("passenger");
		String tel = passenger.getTel();
		send.SendMass(tel);
	}

}
