package com.icss.bk.dao;

import java.util.List;
import java.util.Set;

import com.icss.bk.dto.TurnPagePara;
import com.icss.bk.entity.Tbook;
import com.icss.bk.entity.Tcomment;

public interface IBookDao extends IBaseDao{
	public void addBook(Tbook bk) throws Exception;
	public Tbook getBook(int bookid) throws Exception;
	public List<Tbook> getAllBooks(TurnPagePara tp)throws Exception;
	public byte[] getPic(int bookid)throws Exception;
	public List<Tbook> getShopCartBook(Set<Integer> bkCart)throws Exception;
	public void updateBook(Tbook bk)throws Exception;
	public void deletBook(int bookid)throws Exception;
	public void commentBook(Tcomment comment)throws Exception;
	public List<Tcomment> getComment(int bid)throws Exception;
	public List<Tcomment> getAllComment()throws Exception;
	public List<Tbook> selectByAuthor(String author)throws Exception;
	public List<Tbook> selectByPress(String press)throws Exception;
	public List<Tbook> selectByPrice(double price1, double price2)throws Exception;

}
