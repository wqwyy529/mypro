package com.icss.bk.ctl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icss.bk.biz.UserBiz;
import com.icss.bk.entity.Tuser;

public class ValidUnameSvl extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
			String uname = request.getParameter("uname");
			try {
				UserBiz userBiz = new UserBiz();
				Tuser user = userBiz.getUser(uname);
				if(user != null){
					out.println("用户名已存在！");
				}else{
					out.println("用户名可用！");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				out.println(e.getMessage());
			}
		}

}
