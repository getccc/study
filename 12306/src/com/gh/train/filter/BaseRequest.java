package com.gh.train.filter;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
/**
 * request装饰类
 * @author CaiJianWei
 *
 * 2017-9-7
 */
public class BaseRequest extends HttpServletRequestWrapper {
	private HttpServletRequest request;
	
	public BaseRequest(HttpServletRequest request) {
		super(request);
		this.request = request;
	}

	
	public String getParameter(String name) {
		String value = request.getParameter(name);
		
		try {
			return new String(value.getBytes(),"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return value;
	}

}
