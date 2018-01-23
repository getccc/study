package com.gh.train.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gh.train.dao.OrderDao;
import com.gh.train.dao.PassengersDao;
import com.gh.train.dao.SeatDao;
import com.gh.train.dao.TrainDao;
import com.gh.train.dao.UserDao;
import com.gh.train.dao.imp.OrderDaoImp;
import com.gh.train.dao.imp.PassengersDaoImp;
import com.gh.train.dao.imp.SeatDaoImp;
import com.gh.train.dao.imp.TrainDaoImp;
import com.gh.train.dao.imp.UserDaoImp;
import com.gh.train.model.OrderInfo;
import com.gh.train.model.Orders;
import com.gh.train.model.Passengers;
import com.gh.train.model.Seat;
import com.gh.train.model.Seating;
import com.gh.train.model.SelectOrder;
import com.gh.train.model.SelectOrderinfo;
import com.gh.train.model.Train;
import com.gh.train.model.Users;
import com.gh.train.util.BaseServlet;

public class OrderServlet extends BaseServlet {
	UserDao userdao = new UserDaoImp();
	OrderDao orderdao = new OrderDaoImp();
	SeatDao seatdao = new SeatDaoImp();
	PassengersDao passengerdao = new PassengersDaoImp();
	Random random = new Random();
   
	//添加订单
	public String inserOrder(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		Users users = new Users();
		Train train = new Train();
		Passengers passenger = new Passengers();
		
		Orders orders = new Orders();
		OrderInfo orderinfo = new OrderInfo();
		Seat seat = new Seat();
		Seating seating = new Seating();

		String username = (String) request.getSession()
				.getAttribute("username");
		users.setUsername(username);
		int uid = userdao.queryUid(users);
		train = (Train) request.getSession().getAttribute("trainBook");
		int tid = train.getId();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String orderTime = df.format(new Date());
		String orderState = "待支付";

		int id = random.nextInt(1000000);
		orders.setId(id);
		orders.setUid(uid);
		orders.setTid(tid);
		orders.setOrderState(orderState);
		orders.setOrderTime(orderTime);
		
		if (orderdao.insOrder(orders) > 0) {
			request.getSession().setAttribute("oid", id);
		}

		// 循环拿出pid,seatType
		String pids = request.getParameter("checkedIdArray");
		String[] pid = pids.split(",");
		String seatTypes = request.getParameter("seatIdArray");
		String[] seatType = seatTypes.split(",");
		
		for (int i = 0; i < pid.length; i++) {
//			System.out.println("pid[" + i + "]=" + pid[i]);
//			System.out.println("seatType[" + i + "]=" + seatType[i]);

			// 拿出对应的座位类型ID
			seat.setTid(tid);
			seat.setSeatType(seatType[i]);
			seat = seatdao.selecSeat(seat);
			int sid = seat.getId();

			// 添加对应座次表
			int carriage = random.nextInt(19);
			int seatingOrder = random.nextInt(130);
			int seatid = random.nextInt(1000000);
			seating.setId(seatid);
			seating.setCarriage(carriage+1);
			seating.setSeatingOrder(seatingOrder);

			orderinfo.setOid(id);
			orderinfo.setPid(pid[i]);
			orderinfo.setSid(sid);
			orderinfo.setSeatId(seatid);
			orderinfo.setPayState("待支付");

				if (seatdao.inSeating(seating) > 0) {
					if (orderdao.insOrderinfo(orderinfo) > 0) {
						
					} 
				}
		}
		
		this.refreshOutOrder(request, response);
		return "redirect:pay.jsp";

		// String seatType = request.getParameter("seatType_select");
		// seat.setTid(tid);
		// seat.setSeatType(seatType);
		// // System.out.println(seatType);
		// seat = seatdao.selecSeat(seat);
		// int sid = seat.getId();
		// // System.out.println(sid);
		//         
		// String card = request.getParameter("passengercard");
		// // String card = (String)
		// request.getSession().getAttribute("passenger");
		// passenger.setCard(card);
		// System.out.println(card);
		// // System.out.println(card);
		// passenger = passengerdao.queryPassenger(passenger);
		// int pid = passenger.getId();

		// int carriage = random.nextInt(19);
		// int seatingOrder = random.nextInt(130);
		// seating.setId(id);
		// seating.setCarriage(carriage);
		// seating.setSeatingOrder(seatingOrder);
		//         
		//         
		// request.getSession().setAttribute("orderSeat",seat);
		// request.getSession().setAttribute("orderSeating",seating);
		// request.getSession().setAttribute("orderPassenger",passenger);
		//         
		// orderinfo.setOid(id);
		// // orderinfo.setPid(pid);
		// // rderinfo.setSid(sid);
		// orderinfo.setSeatId(id);
		// orderinfo.setPayState("待支付");
		//		
		// if (orderdao.insOrder(orders) > 0) {
		// if (seatdao.inSeating(seating) > 0) {
		// if (orderdao.insOrderinfo(orderinfo) > 0) {
		// request.getSession().setAttribute("oid",id);
		// this.refreshOutOrder(request, response);
		// return "redirect:pay.jsp";
		// }else {
		// return "forward:book.jsp";
		// }
		// }else {
		// return "forward:book.jsp";
		// }
		// }else {
//		return "forward:book.jsp";
		// }
	}
	
	// 支付订单
	public String payMoney(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		String money = request.getParameter("money");
//		System.out.println(money);
//		int id = random.nextInt(1000000);
		String oid = request.getParameter("oid");
		System.out.println(oid);
		request.getSession().setAttribute("money", money);
		request.getSession().setAttribute("payid", oid);
		

		orderdao.payOrder(oid);
		orderdao.payOrderinfo(oid);
		this.refreshOutOrder(request, response);
		return "redirect:onlinepay.jsp";

	}
	

	// 支付订单
//	public String payOrder(HttpServletRequest request,
//			HttpServletResponse response) throws IOException, ServletException {
//		String oid = request.getParameter("oid");
//
//		orderdao.payOrder(oid);
//		orderdao.payOrderinfo(oid);
//		this.refreshOutOrder(request, response);
//		return "redirect:outOrder.jsp";
//
//	}

	// 取消订单
	public String outOrder(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		String oid = request.getParameter("oid");

		orderdao.outOrder(oid);
		this.refreshOutOrder(request, response);
		return "redirect:outOrder.jsp";

	}

	// 退票
	public String outTicket(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		String realName = request.getParameter("realName");
		realName = new String(realName.getBytes("ISO8859-1"), "UTF-8");
		String id = request.getParameter("id");
		System.out.println(realName);
		
		orderdao.outTicket(id,realName);
		this.refreshCompleteOrder(request, response);
		return "redirect:completeOrder.jsp";

	}
	
	// 换车次
	public String changeTrain(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		TrainDao traindao =new TrainDaoImp();
		String departure = request.getParameter("departure");
		String terminal = request.getParameter("terminal");
//		departure = new String(departure.getBytes("ISO8859-1"), "UTF-8"); 
		request.getSession().setAttribute("ticketDeparture", departure);
//		terminal = new String(terminal.getBytes("ISO8859-1"), "UTF-8"); 
		request.getSession().setAttribute("ticketTerminal", terminal);
		Train train = new Train();
		train.setDeparture(departure);
		train.setTerminal(terminal);
		List<Train> trains = new ArrayList<Train>();
		trains = traindao.selectTrain(train);
		request.getSession().setAttribute("train", train);
		request.getSession().setAttribute("trains", trains);
		
		String oid = request.getParameter("oid");
//		orderdao.changeTrain(oid);
//		System.out.println(departure);
//		System.out.println(terminal);
//		System.out.println(oid);
		String ordersinfoids = request.getParameter("checkedIdArray");
		String[] ordersinfoid = ordersinfoids.split(",");
		for (int i = 0; i < ordersinfoid.length; i++) {
			System.out.println("pid[" + i + "]=" + ordersinfoid[i]);
		}
		
		request.getSession().setAttribute("changeTrainOid", oid);
		request.getSession().setAttribute("changeTrainfoids", ordersinfoids);
		
		return "redirect:changeTicketBook.jsp";

	}
	
	//改签
	public String changeTrainOrder(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		Train train = new Train();
		TrainDao traindao = new TrainDaoImp();

		Passengers passenger = new Passengers();
		List<Passengers> passengers = new ArrayList<Passengers>();
//		Seat seat = new Seat();
		List<Seat> seat = new ArrayList<Seat>();
		String trainNo = request.getParameter("trainNo");
		System.out.println(trainNo);
		train = (Train) request.getSession().getAttribute("train");
		train.setTrainNo(trainNo);
		seat = traindao.selSeat(train);
		train = traindao.selTrain(train);
		request.getSession().setAttribute("trainBook", train);
		request.getSession().setAttribute("seat", seat);
		
		String ordersinfoids = (String) request.getSession().getAttribute("changeTrainfoids");
		String username = (String) request.getSession().getAttribute("username");
		String[] ordersinfoid = ordersinfoids.split(",");
		for (int i = 0; i < ordersinfoid.length; i++) {
			String realName = ordersinfoid[i];
			System.out.println(realName);
			passenger = passengerdao.queryPassenger(username, realName);
			passengers.add(passenger);
		}
		request.getSession().setAttribute("changePassengers", passengers);
		return "redirect:changeBook.jsp";
		
	}
	
	//改签订单
	public String changeOrder(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		Users users = new Users();
		Train train = new Train();
		Passengers passenger = new Passengers();
		Random random = new Random();
		Orders orders = new Orders();
		OrderInfo orderinfo = new OrderInfo();
		Seat seat = new Seat();
		Seating seating = new Seating();

		String username = (String) request.getSession()
				.getAttribute("username");
		users.setUsername(username);
		int uid = userdao.queryUid(users);
		train = (Train) request.getSession().getAttribute("trainBook");
		int tid = train.getId();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String orderTime = df.format(new Date());
		String orderState = "已支付";

		int id = random.nextInt(1000000);
		orders.setId(id);
		orders.setUid(uid);
		orders.setTid(tid);
		orders.setOrderState(orderState);
		orders.setOrderTime(orderTime);
		if (orderdao.insOrder(orders) > 0) {
			
		}

		String ordersinfoids = (String) request.getSession().getAttribute("changeTrainfoids");
		String[] ordersinfoid = ordersinfoids.split(",");
		String ooid = (String) request.getSession().getAttribute("changeTrainOid");
//		int oid = Integer.parseInt(ooid); 
//		System.out.println(oid);
	
		// 循环拿出pid,seatType

		String seatTypes = request.getParameter("seatIdArray");
		String[] seatType = seatTypes.split(",");
		
		for (int i = 0; i < seatType.length; i++) {
//			System.out.println("pid[" + i + "]=" + pid[i]);
//			System.out.println("seatType[" + i + "]=" + seatType[i]);

			// 拿出对应的座位类型ID
			seat.setTid(tid);
			seat.setSeatType(seatType[i]);
			seat = seatdao.selecSeat(seat);
			int sid = seat.getId();

			// 添加对应座次表
			int carriage = random.nextInt(19);
			int seatingOrder = random.nextInt(130);
			int seatid = random.nextInt(1000000);
			seating.setId(seatid);
			seating.setCarriage(carriage+1);
			seating.setSeatingOrder(seatingOrder);
			
			String realName = ordersinfoid[i];
			passenger = passengerdao.queryPassenger(username, realName);
			int peid = passenger.getId();
			String pid = Integer.toString(peid);
			
			orderdao.changeTrain(ooid, realName,uid);
			
			
			orderinfo.setOid(id);
			orderinfo.setPid(pid);
			orderinfo.setSid(sid);
			orderinfo.setSeatId(seatid);
			orderinfo.setPayState("改签票");

				if (seatdao.inSeating(seating) > 0) {
					if (orderdao.insOrderinfo(orderinfo) > 0) {
						
					} 
				}
		}
		String paystate = "改签票";
		List<SelectOrderinfo> selectOrderinfo = orderdao.selectOrderinfo(id, paystate);
		request.getSession().setAttribute("changeOrderinfo", selectOrderinfo);
		
		return "redirect:changePay.jsp";
	}
	
//	// 改签订单
//	public void refreshChangeOrder(HttpServletRequest request,
//			HttpServletResponse response) throws IOException, ServletException {
//		UserDao userdao = new UserDaoImp();
//		OrderDao orderdao = new OrderDaoImp();
//		// 用户订单概要对应的订单详情
//		HashMap<Integer, List<SelectOrderinfo>> orderinfos = new HashMap<Integer, List<SelectOrderinfo>>();
//
//		Users users = new Users();
//		String username = (String) request.getSession()
//				.getAttribute("username");
//		users.setUsername(username);
//		int uid = userdao.queryUid(users);
//		String orderState = "待支付";
//		String paystate = "改签票";
//		// 用户的所有订单概要
//		List<SelectOrder> selectOrder = orderdao.selectOrder(uid, orderState);
//
//		for (int i = 0; i < selectOrder.size(); i++) {
//			int oid = selectOrder.get(i).getId();
//			List<SelectOrderinfo> selectOrderinfo = orderdao.selectOrderinfo(
//					oid, paystate);
//			orderinfos.put(oid, selectOrderinfo);
////			for (int j = 0; j < selectOrderinfo.size(); j++) {
////				System.out.println(oid+":"+selectOrderinfo.get(j).getId()+"："+selectOrderinfo.get(j).getRealName());
////			}
//			
//		}
		

//		request.getSession().setAttribute("selectOrder", selectOrder);
//		request.getSession().setAttribute("orderinfos", orderinfos);
//	}
	

	// 未完成订单
	public void refreshOutOrder(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		UserDao userdao = new UserDaoImp();
		OrderDao orderdao = new OrderDaoImp();
		// 用户订单概要对应的订单详情
		HashMap<Integer, List<SelectOrderinfo>> orderinfos = new HashMap<Integer, List<SelectOrderinfo>>();

		Users users = new Users();
		String username = (String) request.getSession()
				.getAttribute("username");
		users.setUsername(username);
		int uid = userdao.queryUid(users);
		String orderState = "待支付";
		String paystate = "待支付";
		// 用户的所有订单概要
		List<SelectOrder> selectOrder = orderdao.selectOrder(uid, orderState);

		for (int i = 0; i < selectOrder.size(); i++) {
			int oid = selectOrder.get(i).getId();
			List<SelectOrderinfo> selectOrderinfo = orderdao.selectOrderinfo(
					oid, paystate);
			orderinfos.put(oid, selectOrderinfo);
//			for (int j = 0; j < selectOrderinfo.size(); j++) {
//				System.out.println(oid+":"+selectOrderinfo.get(j).getId()+"："+selectOrderinfo.get(j).getRealName());
//			}
			
		}
		

		request.getSession().setAttribute("selectOrder", selectOrder);
		request.getSession().setAttribute("orderinfos", orderinfos);
	}

	// 已支付订单
	public String refreshCompleteOrder(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		UserDao userdao = new UserDaoImp();
		OrderDao orderdao = new OrderDaoImp();
		// 用户订单概要对应的订单详情
		HashMap<Integer, List<SelectOrderinfo>> orderinfos = new HashMap<Integer, List<SelectOrderinfo>>();

		Users users = new Users();
		String username = (String) request.getSession()
				.getAttribute("username");
		users.setUsername(username);
		int uid = userdao.queryUid(users);
		String orderState = "已支付";
		// 用户的所有订单概要
		List<SelectOrder> selectOrder = orderdao.selectOrder(uid, orderState);

		for (int i = 0; i < selectOrder.size(); i++) {
			int oid = selectOrder.get(i).getId();
			List<SelectOrderinfo> selectOrderinfo = orderdao
					.selectOrderinfo(oid);
			orderinfos.put(oid, selectOrderinfo);
		}

		request.getSession().setAttribute("completeOrder", selectOrder);
		request.getSession().setAttribute("completeOrderinfos", orderinfos);
		return "redirect:completeOrder.jsp";
	}
	
	// 可改签订单
	public String canChangeOrder(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		UserDao userdao = new UserDaoImp();
		OrderDao orderdao = new OrderDaoImp();
		// 用户订单概要对应的订单详情
		HashMap<Integer, List<SelectOrderinfo>> orderinfos = new HashMap<Integer, List<SelectOrderinfo>>();

		Users users = new Users();
		String username = (String) request.getSession()
				.getAttribute("username");
		users.setUsername(username);
		int uid = userdao.queryUid(users);
		String orderState = "已支付";
		// 用户的所有订单概要
		List<SelectOrder> selectOrder = orderdao.selectOrder(uid, orderState);

		for (int i = 0; i < selectOrder.size(); i++) {
			int oid = selectOrder.get(i).getId();
			List<SelectOrderinfo> selectOrderinfo = orderdao.canChangeOrderinfo(oid);
					
			orderinfos.put(oid, selectOrderinfo);
		}

		request.getSession().setAttribute("completeOrder", selectOrder);
		request.getSession().setAttribute("completeOrderinfos", orderinfos);
		return "redirect:completeOrder.jsp";
	}

}
