package com.icss.bk.ctl;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.icss.bk.biz.BookBiz;

public class ImgAction {
	BookBiz bookBiz;		

	public BookBiz getBookBiz() {
		return bookBiz;
	}

	public void setBookBiz(BookBiz bookBiz) {
		this.bookBiz = bookBiz;
	}


	public InputStream getInputStream() {
		InputStream stream = null;
		
		HttpServletRequest request = ServletActionContext.getRequest();
		String bid = request.getParameter("bid");
		int id = 0;
		try {
			id = Integer.parseInt(bid);
			byte[] pic = bookBiz.getPic(id);
			
			if(pic != null){
				stream = new ByteArrayInputStream(pic); 			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return stream;		
	}
	
	 public String execute(){
         return "success";
	 }
	

}
