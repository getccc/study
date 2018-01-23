package com.gh.train.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gh.train.dao.OrderDao;
import com.gh.train.dao.PassengersDao;
import com.gh.train.dao.UserDao;
import com.gh.train.dao.imp.OrderDaoImp;
import com.gh.train.dao.imp.PassengersDaoImp;
import com.gh.train.dao.imp.UserDaoImp;
import com.gh.train.model.Passengers;
import com.gh.train.model.SelectOrder;
import com.gh.train.model.SelectOrderinfo;
import com.gh.train.model.Users;
import com.gh.train.service.UserService;
import com.gh.train.service.imp.UserServiceImp;
import com.gh.train.util.BaseServlet;

public class UserServlet extends BaseServlet {
	UserService userservice = new UserServiceImp();
	PassengersDao passengersdao = new PassengersDaoImp();
	public String addUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String username = request.getParameter("loginUserDTO.user_name");
		String pass = request.getParameter("userDTO.password");
		String realName = request.getParameter("loginUserDTO.name");
		String cardType = request.getParameter("loginUserDTO.id_type_code");
		String card = request.getParameter("loginUserDTO.id_no");
		String email = request.getParameter("userDTO.email");
		String tel = request.getParameter("userDTO.mobile_no");
		String passengerType = request.getParameter("passenger_type");
		
		Users users = new Users();
		Passengers passenger = new Passengers();
		users.setUsername(username);
		users.setPass(pass);
		passenger.setRole(0);
		passenger.setRealName(realName);
		passenger.setCardType(cardType);
		passenger.setCard(card);
		passenger.setEmail(email);
		passenger.setTel(tel);
		passenger.setPassengerType(passengerType);
		List<Passengers> passengers = new ArrayList<Passengers>();
		if (userservice.checkUser(users)) {
			if (userservice.register(users, passenger)) {
				passengers = passengersdao.selectPassengers(users);
				request.getSession().setAttribute("passenger",passenger);
				request.getSession().setAttribute("passengers", passengers);
				request.getSession().setAttribute("username", username);
				return "redirect:myMenu.jsp";
			}
		}else{
			return "forward:register.html";
		}
		return null;
	}
	
	public String queryUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		List<Passengers> passengers = new ArrayList<Passengers>();
	    Passengers passenger = new Passengers();
		String username = request.getParameter("loginUserDTO.user_name");
		String pass = request.getParameter("userDTO.password");
		Users users = new Users();
		users.setUsername(username);
		users.setPass(pass);
		
		UserDao userdao = new UserDaoImp();
		OrderDao orderdao = new OrderDaoImp();
		//用户订单概要对应的订单详情
//		HashMap<Integer, List<SelectOrderinfo>>  orderinfos = new HashMap<Integer, List<SelectOrderinfo>>();
//		int uid = userdao.queryUid(users);
//		String orderState = "待支付";
//		String payState = "待支付";
//        List<SelectOrder> selectOrder = orderdao.selectOrder(uid,orderState);
		
//		for (int i = 0; i < selectOrder.size(); i++) {
//			int oid = selectOrder.get(i).getId();
//			List<SelectOrderinfo> selectOrderinfo = orderdao.selectOrderinfo(oid,payState);
//			orderinfos.put(oid, selectOrderinfo);
//		}
		if (userservice.checkUser(users)) {
			return "forward:login.html";
		}else{
			if (userservice.login(users)) {
				passenger = passengersdao.queryUsers(users);
				passengers = passengersdao.selectPassengers(users);
				request.getSession().setAttribute("passenger",passenger);
				request.getSession().setAttribute("username", username);
				request.getSession().setAttribute("passengers", passengers);
//				request.getSession().setAttribute("selectOrder", selectOrder);
//				request.getSession().setAttribute("orderinfos", orderinfos);
				OrderServlet orderServlet = new OrderServlet();
				orderServlet.refreshOutOrder(request, response);
				return "redirect:myMenu.jsp";
			}
		}
		return "forward:login.html";
		
	}
	
	//退出登录
	public String outUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
//		session.invalidate();
		session.removeAttribute("passenger");
		session.removeAttribute("username");
		session.removeAttribute("passengers");
		session.removeAttribute("selectOrder");
		session.removeAttribute("orderinfos");
		session.removeAttribute("completeOrderinfos");
		session.removeAttribute("completeOrder");
		session.removeAttribute("train");
		session.removeAttribute("trains");
		return "redirect:login.html";
		
	}

	
}
