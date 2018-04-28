package com.icss.bk.ftr;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icss.bk.biz.UserBiz;
import com.icss.bk.entity.Tuser;

public class UserCookieFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		String unamepwdString = getUserCookieString(request,"unamepwdString");
		if(unamepwdString == null){
			chain.doFilter(request, response);
		}else{
			UserBiz biz = new UserBiz();
			String[] unamepwd = biz.getUnamePwd(unamepwdString);
			Tuser user = null;
			try {
				user = biz.login(unamepwd[0], unamepwd[1]);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getSession().setAttribute("user", user);
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}
	private String getUserCookieString(HttpServletRequest request,String cookieName){
		String strRet = null;
		
		Cookie[] cookies = request.getCookies(); 
		if(cookies != null){
			for(int i=0;i<cookies.length;i++){
				Cookie cookie = cookies[i];
				String cm = cookie.getName();			
				if(cm.equals(cookieName)){	
					strRet = cookie.getValue();	
					break;
				}				
			}
		}else{
			strRet = null;
		}
		
		
		return strRet;
	}

}
