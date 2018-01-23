package com.gh.train.pay;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AlibabaBankServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//订单编号
		String out_trade_no = request.getParameter("out_trade_no");
		//订单金额
		String total_amount = request.getParameter("total_amount");
		//商家支付宝账号id 2088开头
		String seller_id = request.getParameter("seller_id");	
		//开发者的app_id
		String app_id = request.getParameter("app_id");
		
		//此处应该核对订单信息是否跟支付宝反馈一致，否则被人劫持，不应该操作订单
		
		System.out.println(out_trade_no+"-"+total_amount+"-"+seller_id+"-"+app_id);
		
		String result = request.getParameter("trade_status");
		System.out.println("交易结果："+request.getParameter("trade_status"));
		request.getSession().setAttribute("result", result);
		if(request.getParameter("trade_status").equalsIgnoreCase("TRADE_SUCCESS")){
		    
			response.getWriter().print("success");
		}
	}

}
