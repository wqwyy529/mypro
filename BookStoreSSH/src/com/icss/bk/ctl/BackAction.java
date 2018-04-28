package com.icss.bk.ctl;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.icss.bk.biz.BookBiz;
import com.icss.bk.biz.UserBiz;
import com.icss.bk.dto.BuyRecAll;
import com.icss.bk.dto.TurnPagePara;
import com.icss.bk.entity.Tbook;
import com.icss.bk.entity.Tcomment;


public class BackAction {
	private Tbook bk;
	private File pic;
	private BookBiz bookBiz;
	private UserBiz userBiz;
	
	public Tbook getBk() {
		return bk;
	}

	public void setBk(Tbook bk) {
		this.bk = bk;
	}
	

	public File getPic() {
		return pic;
	}

	public void setPic(File pic) {
		this.pic = pic;
	}	

	public BookBiz getBookBiz() {
		return bookBiz;
	}

	public void setBookBiz(BookBiz bookBiz) {
		this.bookBiz = bookBiz;
	}

	public UserBiz getUserBiz() {
		return userBiz;
	}

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public String addBook(){
		HttpServletRequest request = ServletActionContext.getRequest();
		if(bk != null){
			try {
				if(pic != null){
					bk.setPic(FileUtils.readFileToByteArray(pic));
				}
				bk.setPubdate(new Date());
				bookBiz.addBook(bk);
				request.setAttribute("msg", "新书录入成功！");
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("msg", e.getMessage());
			}			
		}
		return "addBookOK";		
	}
	
	
	public String allBook(){
		String strRet = "allBookFail";
		HttpServletRequest request = ServletActionContext.getRequest();
		String strPageNo = request.getParameter("page");
		int pageNo = 1;
		try {
			if(strPageNo != null && !strPageNo.equals("")){
				pageNo = Integer.parseInt(strPageNo);
				if(pageNo<1)
					pageNo = 1;
			}
			TurnPagePara tp = new TurnPagePara();
			tp.OnePageCount = 10;
			tp.CurrentPageNo = pageNo;
			List<Tbook> booklist = bookBiz.getAllBooks(tp);
			if(booklist != null){
				request.setAttribute("booklist", booklist);
				request.setAttribute("RecordCount", tp.RecordCount);
				request.setAttribute("PageCount", tp.PageCount);
				request.setAttribute("CurrentPageNo", tp.CurrentPageNo);
				strRet = "allBookOK";
			}
		} catch (Exception e) {	
			e.printStackTrace();
			strRet = "allBookFail";
			request.setAttribute("errMsg", e.getMessage());
		}		
		return strRet;		
	}
	
	public String updateBook(){
		String strRet = "allBookFail";
		HttpServletRequest request = ServletActionContext.getRequest();
		String bkid = request.getParameter("bookid");
		int bookid = 0;
		try {
			bookid = Integer.parseInt(bkid);
			Tbook bk = bookBiz.getBook(bookid);
			request.setAttribute("bk", bk);
			strRet = "updateBookOK";
		} catch (Exception e) {
			request.setAttribute("errMsg", e.getMessage());
			strRet = "updateBookFail";
		}
		return strRet;		
	}
	
	public String updateBookSub(){
		HttpServletRequest request = ServletActionContext.getRequest();
		if(bk != null){
			try {
				if(pic != null){
					bk.setPic(FileUtils.readFileToByteArray(pic));
				}
				bk.setPubdate(new Date());
				bookBiz.updateBook(bk);
				request.setAttribute("msg", "更新图书成功！");
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("msg", e.getMessage());
			}			
		}
		return "updateBookSubOK";		
	}
	
	public String deletBook(){
		String strRet = "allBookFail";
		HttpServletRequest request = ServletActionContext.getRequest();
		String bkid = request.getParameter("bookid");
		try {
			int bookid = Integer.parseInt(bkid);
			bookBiz.deletBook(bookid);
			strRet = "deletBookOK";
		} catch (Exception e) {
			request.setAttribute("errMsg", e.getMessage());
			strRet = "deletBookFail";
		}
		return strRet;		
	}
	
	public String buyInfo(){
		String strRet = "buyInfoFail";
		HttpServletRequest request = ServletActionContext.getRequest();
		String strPageNo = request.getParameter("page");
		int pageNo = 1;
		try {
			if(strPageNo != null && !strPageNo.equals("")){
				pageNo = Integer.parseInt(strPageNo);
				if(pageNo<1)
					pageNo = 1;
			}
			TurnPagePara tp = new TurnPagePara();
			tp.OnePageCount = 15;
			tp.CurrentPageNo = pageNo;			
			List<BuyRecAll> buyinfoList = userBiz.getRecInfo(tp);
			if(buyinfoList != null){
				request.setAttribute("buyinfoList", buyinfoList);			
				request.setAttribute("RecordCount", tp.RecordCount);
				request.setAttribute("PageCount", tp.PageCount);
				request.setAttribute("CurrentPageNo", tp.CurrentPageNo);
				strRet = "buyInfoOK";
			}
		} catch (Exception e) {
			request.setAttribute("errMsg", e.getMessage());
			strRet = "buyInfoFail";
		}		
		return strRet;		
	}
	
	public String selectByAuthor(){
		String strRet = "selectBookFail";
		HttpServletRequest request = ServletActionContext.getRequest();
		String author = request.getParameter("author");
		try {
			List<Tbook> bkList = bookBiz.selectByAuthor(author);
			request.setAttribute("bkList", bkList);
			strRet = "selectBookOK";
		} catch (Exception e) {
			strRet = "selectBookFail";
			request.setAttribute("errMsg", e.getMessage());
		}
		return strRet;		
	}
	
	public String selectByPress(){
		String strRet = "selectBookFail";
		HttpServletRequest request = ServletActionContext.getRequest();
		String press = request.getParameter("press");
		try {
			List<Tbook> bkList = bookBiz.selectByPress(press);
			request.setAttribute("bkList", bkList);
			strRet = "selectBookOK";
		} catch (Exception e) {
			strRet = "selectBookFail";
			request.setAttribute("errMsg", e.getMessage());
		}
		return strRet;		
	}
	
	public String selectByPrice(){
		String strRet = "selectBookFail";
		HttpServletRequest request = ServletActionContext.getRequest();
		String price1 = request.getParameter("price1");
		String price2 = request.getParameter("price2");
		try {
			double pri1 = Double.parseDouble(price1);
			double pri2 = Double.parseDouble(price2);
			List<Tbook> bkList = bookBiz.selectByPrice(pri1, pri2);
			request.setAttribute("bkList", bkList);
			strRet = "selectBookOK";
		} catch (Exception e) {
			e.printStackTrace();
			strRet = "selectBookFail";
			request.setAttribute("errMsg", e.getMessage());
		}
		return strRet;		
	}
	
	public String getAllComment(){
		String strRet = "getAllCommentFail";
		HttpServletRequest request = ServletActionContext.getRequest();
		try {
			List<Tcomment> cmtList = bookBiz.getAllComment();
			request.setAttribute("cmtList", cmtList);
			strRet = "getAllCommentOK";
		} catch (Exception e) {
			strRet = "getAllCommentFail";
			e.printStackTrace();
		}
		return strRet;
	}
	
}
