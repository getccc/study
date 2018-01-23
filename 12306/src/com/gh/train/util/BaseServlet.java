package com.gh.train.util;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * servlet工具类
 * @author CaiJianWei
 *
 * 2017-9-7
 */
public class BaseServlet extends HttpServlet {
	//重写service方法
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		//获得页面请求所要调用方法名称
		String metodname = req.getParameter("method");
		if(metodname == null){
			throw new RuntimeException("你没有传入调用方法的参数");
		}
		//通过反射获得当前类的类对象
		Class clazz = this.getClass();
		//通过类对象得到方法对象
		
			try {
				Method method2 = clazz.getMethod(metodname, HttpServletRequest.class,HttpServletResponse.class);
				String result = (String)method2.invoke(this, req,resp);
				//根据业务方法返回的结果作出相应的响应
				//转发、重定向
				if(result != null){
					//根据结果判断是转发还是重定向
					//redirect:index.jsp
					String opration = result.substring(0, result.indexOf(":"));
					String url = result.substring(result.indexOf(":")+1, result.length());
					System.out.println(url);
					if(opration.equals("redirect")){
						resp.sendRedirect(url);
					}else if(opration.equals("forward")){
						req.getRequestDispatcher(url).forward(req, resp);
					}else{
						throw new RuntimeException("返回的目标地址无法解析");
					}
				}
			} catch (NoSuchMethodException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
}
