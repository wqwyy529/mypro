package com.icss.bk.ctl;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.icss.bk.biz.UserBiz;
import com.icss.bk.entity.Tuser;


public class UserAction {
	
	private UserBiz userBiz;
	private Tuser user;

	public UserBiz getUserBiz() {
		return userBiz;
	}

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}
	
	
	public Tuser getUser() {
		return user;
	}

	public void setUser(Tuser user) {
		this.user = user;
	}

	public String login(){
		String strRet = "loginFail";
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String uname = request.getParameter("uname");
		String pwd = request.getParameter("pwd");
		if(uname != null && pwd != null && !uname.equals("") && !pwd.equals("")){
			try {
				Tuser user = userBiz.login(uname, pwd);
				request.getSession().setAttribute("user", user);
				String unamepwd = uname + "," + pwd;
				Cookie ckNew = new Cookie("unamepwdString",unamepwd);
				ckNew.setMaxAge(60*60*24*7);                                           //Ĭ��Ϊ-1��������رպ�cookie��ʧ���˴�����Ϊ100s����ʧ				
				response.addCookie(ckNew);
				strRet = "loginOK";
			} catch (Exception e) {
				e.printStackTrace();
				strRet="loginFail";
				request.setAttribute("msg", "�û������ڻ��������");
			}			
		}else{
			request.setAttribute("msg", "�û��������벻��Ϊ�գ�");
			strRet = "loginFail";
		}
		return strRet;
		
	}
	
	public String logOut(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.getSession().invalidate();
		return "logoutOk";		
	}
	
	public String reg(){
		String strRet = "regFail";
		HttpServletRequest request = ServletActionContext.getRequest();
		user.setRole("c");
		user.setAccount(1000D);				
		try {
			userBiz.addUser(user);
			request.setAttribute("msg", "ע��ɹ������¼��");
			strRet = "regOK";
		} catch (Exception e) {
			strRet = "regFail";
			request.setAttribute("msg", e.getMessage());	
		}
		return strRet;		
	}
	
	
	public String updateUser(){
		HttpServletRequest request = ServletActionContext.getRequest();		
		try {
			userBiz.updateUser(user);
			request.setAttribute("msg", "�����û��ɹ���");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errMsg", e.getMessage());
		}
		return "updateUserOK";		
	}
	
	public String allUser(){
		HttpServletRequest request = ServletActionContext.getRequest();
		List<Tuser> allUser = null;
		try {
			allUser = userBiz.getAllUser();
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("allUser", allUser);
		return "allUserOK";		
	}
	
	public String userInfo(){
		String strRet = "userInfoFail";
		HttpServletRequest request = ServletActionContext.getRequest();
		String uname = request.getParameter("uname");
		try {
			Tuser user = userBiz.getUser(uname);
			request.setAttribute("user", user);
			strRet = "userInfoOK";
		} catch (Exception e) {
			strRet = "userInfoFail";
			request.setAttribute("errMsg", e.getMessage());			
		}
		return strRet;		
	}
	
	public String deletUser(){
		String strRet = null;
		HttpServletRequest request = ServletActionContext.getRequest();
		String uname = request.getParameter("uname");
		try {
			userBiz.deletUser(uname);
			strRet = "deletUserOK";
		} catch (Exception e) {
			request.setAttribute("errMsg", e.getMessage());
			strRet = "deletUserFail";
		}
		return strRet;		
	}
	
}
