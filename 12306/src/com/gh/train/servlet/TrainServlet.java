package com.gh.train.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gh.train.dao.TrainDao;
import com.gh.train.dao.imp.TrainDaoImp;
import com.gh.train.model.Seat;
import com.gh.train.model.Train;
import com.gh.train.util.BaseServlet;
/**
 * 车次
 * @author CaiJianWei
 *
 * 2017-9-9
 */
public class TrainServlet extends BaseServlet {
	TrainDao traindao = new TrainDaoImp();
    
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.service(req, resp);
	}	
	
	public String selectTrain(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String departure = request.getParameter("homecity_name");
		String terminal = request.getParameter("getcity_name");
		String trainDate = request.getParameter("leftTicketDTO.train_date");
		Train train = new Train();
		train.setDeparture(departure);
		train.setTerminal(terminal);
		List<Train> trains = new ArrayList<Train>();
		trains = traindao.selectTrain(train);
		request.getSession().setAttribute("train", train);
		request.getSession().setAttribute("trains", trains);
		request.getSession().setAttribute("trainDate", trainDate);
		return "redirect:ticketBook.jsp";
	
	}
	
	
	public String selectTrainInfo(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Train train = new Train();
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
		return "redirect:book.jsp";
		
	}
}
