package com.icss.bk.ctl;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.icss.bk.biz.UserBiz;
import com.icss.bk.entity.Tuser;

public class ValidUnameAction {
	private UserBiz userBiz;
	
	public UserBiz getUserBiz() {
		return userBiz;
	}

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public String validUname(){
		String strRet = "validUnameFail";
		HttpServletRequest request = ServletActionContext.getRequest();
		String uname = request.getParameter("uname");
		try {
			Tuser user = userBiz.getUser(uname);
			if(user != null){
				strRet = "用户名已存在！";	
				strRet = "validUnameFail";
			}else{
				strRet = "用户名可用！";
				strRet = "validUnameOK";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			strRet = "validUnameFail";
		}
		return strRet;
	}
}
