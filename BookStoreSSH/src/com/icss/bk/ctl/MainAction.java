package com.icss.bk.ctl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.icss.bk.biz.BookBiz;
import com.icss.bk.biz.UserBiz;
import com.icss.bk.dto.TurnPagePara;
import com.icss.bk.entity.Buyrecord;
import com.icss.bk.entity.Tbook;
import com.icss.bk.entity.Tcomment;
import com.icss.bk.entity.Tuser;


public class MainAction {
	
	private BookBiz bookBiz;
	private UserBiz userBiz;
	private Buyrecord br;
	
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
	

	public Buyrecord getBr() {
		return br;
	}

	public void setBr(Buyrecord br) {
		this.br = br;
	}

	public String bookList(){
		String strRet = "bklistFail";
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
			tp.OnePageCount = 8;
			tp.CurrentPageNo = pageNo;
			List<Tbook> bookList = bookBiz.getAllBooks(tp);
			strRet = "bklistOK";
			request.setAttribute("bookList", bookList);			
			request.setAttribute("RecordCount", tp.RecordCount);
			request.setAttribute("PageCount", tp.PageCount);
			request.setAttribute("CurrentPageNo", tp.CurrentPageNo);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errMsg", e.getMessage());
			strRet = "bklistFail";
		}
		return strRet;
		
	}
	
	public String bookDetail(){
		String strRet = "bkDetailFail";
		HttpServletRequest request = ServletActionContext.getRequest();
		String bookid = request.getParameter("bookid");
		try {
			int bid = Integer.parseInt(bookid);
			Tbook book = bookBiz.getBook(bid);
			List<Tcomment> cmtList = bookBiz.getComment(bid);
			request.setAttribute("book", book);
			request.setAttribute("cmtList", cmtList);
			strRet = "bkDetailOK";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errMsg", e.getMessage());
			strRet = "bkDetailFail";
		}		
		return strRet;		
	}
	
	@SuppressWarnings("unchecked")
	public String shopAdd(){
		String strRet = "shopAddFail";
		HttpServletRequest request = ServletActionContext.getRequest();
		if(request.getSession().getAttribute("user")!=null){
			String bookid = request.getParameter("bookid");
			int bid = Integer.parseInt(bookid);
			Set<Integer> bkCart;			
			if(request.getSession().getAttribute("bkCart")==null){
				bkCart = new HashSet<Integer>();
				request.getSession().setAttribute("bkCart", bkCart);
			}else{
				bkCart = (Set<Integer>) request.getSession().getAttribute("bkCart");
			}
			bkCart.add(bid);
			strRet = "shopAddOK";
		}else{
			request.setAttribute("msg", "购书前请先登录！");
			strRet = "shopAddFail";
		}
		return strRet;
		
	}
	
	public String shopCart(){
		HttpServletRequest request = ServletActionContext.getRequest();
		@SuppressWarnings("unchecked")
		Set<Integer> bkCart = (Set<Integer>) request.getSession().getAttribute("bkCart");
		if(bkCart!=null && bkCart.size()>0){
			try {
				List<Tbook> books = bookBiz.getShopCartBook(bkCart);
				request.setAttribute("books", books);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else{
			request.setAttribute("books", new ArrayList<Tbook>());
		}
		return "shopCartOK";
		
	}
	
	public String makeOrder(){
		String strRet = "makeOrderFail";
		HttpServletRequest request = ServletActionContext.getRequest();
		if(request.getSession().getAttribute("bkCart")!=null){
			@SuppressWarnings("unchecked")
			Set<Integer> bkCart = (Set<Integer>) request.getSession().getAttribute("bkCart");
			List<Tbook> books = null;
			try {
				books = bookBiz.getShopCartBook(bkCart);
				request.setAttribute("books", books);
				double allMoney = 0;
				for(Tbook bk : books){
					String bnum = request.getParameter("bk"+bk.getBookid());
					int buynum = Integer.parseInt(bnum);
					bk.setBuynum(buynum);
					allMoney += bk.getPrice()*buynum;
				}
				request.setAttribute("allMoney", allMoney);
				request.setAttribute("books", books);
				strRet = "makeOrderOK";
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("errMsg", e.getMessage());
				strRet = "makeOrderFail";
			}		
		}
		return strRet;
	}
	
	public String removeBook(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String bid = request.getParameter("bid");
		int bookid = Integer.parseInt(bid);
		@SuppressWarnings("unchecked")
		Set<Integer> bkCart = (Set<Integer>) request.getSession().getAttribute("bkCart");
		bkCart.remove(bookid);
		request.getSession().setAttribute("bkCart", bkCart);
		return "removeBookOK";
		
	}
	
	public String confirmBuyInfo(){
		String strRet = "confirmBuyInfoOK";
		HttpServletRequest request = ServletActionContext.getRequest();
		@SuppressWarnings("unchecked")
		Set<Integer> bkCart = (Set<Integer>) request.getSession().getAttribute("bkCart");
		try {
			if(bkCart != null){
				double allmoney = 0;
				List<Tbook> books = bookBiz.getShopCartBook(bkCart);
				for(Tbook bk:books){
					String buynum = request.getParameter("bk"+bk.getBookid());
					int bnum = Integer.parseInt(buynum);
					bk.setBuynum(bnum);
					allmoney  += bk.getPrice()*bnum;
				}
				br.setAllmoney(allmoney);
				request.setAttribute("br", br);
				request.setAttribute("books", books);
				strRet = "confirmBuyInfoOK";
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errMsg", e.getMessage());
			strRet = "confirmBuyInfoFail";
		}
		return strRet;
	}
	
	@SuppressWarnings("unchecked")
	public String checkOut(){
		String strRet = "checkOutFail";
		HttpServletRequest request = ServletActionContext.getRequest();
		int allnum = 0;
		double allmoney = 0;
		Set<Integer> bkCart = (Set<Integer>) request.getSession().getAttribute("bkCart");
		List<Tbook> books = null;
		try {
			books = bookBiz.getShopCartBook(bkCart);
			for(Tbook bk:books){
				String buynum = request.getParameter("bk"+bk.getBookid());
				int bnum = Integer.parseInt(buynum);
				
				bk.setBuynum(bnum);
				allnum += bnum;
				allmoney  += bk.getPrice()*bnum;
			}
			Tuser user = (Tuser)request.getSession().getAttribute("user");
			br.setAllmoney(allmoney);
			br.setUname(user.getUname());
			br.setBuyamount(allnum);
			br.setBuydate(new Date());
			userBiz.buyBook(br, books);
			request.setAttribute("msg", "购买成功！");
			strRet = "checkOutOK";
		} catch (Exception e) {
			request.setAttribute("errMsg", e.getMessage());
			strRet = "checkOutFail";
		}
		request.getSession().setAttribute("bkCart", null);
		
		return strRet;
		
	}
	
	public void commentBook(){		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("GBK");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}	
		Tuser user = (Tuser) request.getSession().getAttribute("user");
		
		String bid = request.getParameter("bid");
		String content = request.getParameter("content");
		try {
				
			int bkid = Integer.parseInt(bid);			
			Tcomment cmt = new Tcomment();
			cmt.setBid(bkid);
			cmt.setUname(user.getUname());
			cmt.setContent(content);
			cmt.setCdate(new Date());
			bookBiz.commentBook(cmt);	
			out.println("评论成功！");
		} catch (Exception e) {
			out.println(e.getMessage());
		}			
	}
}
