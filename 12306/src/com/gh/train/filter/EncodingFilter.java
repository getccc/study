package com.gh.train.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 解决乱码工具类
 * @author CaiJianWei
 *
 * 2017-9-7
 */
public class EncodingFilter implements Filter {
	private String charset = "utf-8";
	
	public void destroy() {
		
	}

	
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse reps = (HttpServletResponse)response;
		//获取请求方法
		if(req.getMethod().equalsIgnoreCase("post")){
			req.setCharacterEncoding("utf-8");
			//携带包装过后的request
		}else{
			req = new BaseRequest(req);
			//携带包装过后的request
		}
		chain.doFilter(req, reps);
	}

	
	public void init(FilterConfig filterConfig) throws ServletException {
		charset = filterConfig.getInitParameter("charset");
	}

}
