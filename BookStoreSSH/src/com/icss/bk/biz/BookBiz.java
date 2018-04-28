package com.icss.bk.biz;

import java.util.List;
import java.util.Set;

import com.icss.bk.dao.IBookDao;
import com.icss.bk.dto.TurnPagePara;
import com.icss.bk.entity.Tbook;
import com.icss.bk.entity.Tcomment;

public class BookBiz {	
	private IBookDao bookDao;	
	
	public IBookDao getBookDao() {
		return bookDao;
	}

	public void setBookDao(IBookDao bookDao) {
		this.bookDao = bookDao;
	}

	public void addBook(Tbook bk)throws Exception{
		bookDao.addBook(bk);
	}
	
	public Tbook getBook(int bookid) throws Exception{
		return bookDao.getBook(bookid);
		
		
	}
	
	public List<Tbook> getAllBooks(TurnPagePara tp) throws Exception{		
		return	bookDao.getAllBooks(tp);
		
	}
	
	public byte[] getPic(int bookid) throws Exception{
		return bookDao.getPic(bookid);
		
	}
	
	public List<Tbook> getShopCartBook(Set<Integer> bkCart) throws Exception{
		return bookDao.getShopCartBook(bkCart);		
		
	}
	
	public void updateBook(Tbook bk) throws Exception{
		bookDao.updateBook(bk);
	}
	
	public void deletBook(int bookid) throws Exception{
			bookDao.deletBook(bookid);
	}
	
	public List<Tbook> selectByAuthor(String author) throws Exception{
		return bookDao.selectByAuthor(author);
	}
	
	public List<Tbook> selectByPress(String press) throws Exception{
		return bookDao.selectByPress(press);
	}
	
	public List<Tbook> selectByPrice(double price1,double price2) throws Exception{
		return bookDao.selectByPrice(price1,price2);
	}
	
	public void commentBook(Tcomment cmt) throws Exception{
		bookDao.commentBook(cmt);
	}
	
	public List<Tcomment> getComment(int bid)throws Exception{
		return bookDao.getComment(bid);		
	}
	
	public List<Tcomment> getAllComment()throws Exception{
		return bookDao.getAllComment();
	}
}
